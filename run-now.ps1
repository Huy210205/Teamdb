# Script chạy HomieHotel ngay lập tức
Write-Host "🚀 Running HomieHotel Now" -ForegroundColor Green
Write-Host "=========================" -ForegroundColor Green

# Dừng container cũ
Write-Host "🛑 Stopping old containers..." -ForegroundColor Yellow
docker stop homiehotel-app 2>$null
docker rm homiehotel-app 2>$null

# Chạy container với cấu hình đúng
Write-Host "🚀 Starting container..." -ForegroundColor Yellow
docker run -d `
    --name homiehotel-app `
    -p 9596:9596 `
    -e TZ=Asia/Ho_Chi_Minh `
    -e SPRING_PROFILES_ACTIVE=default `
    -e SPRING_DATASOURCE_URL="jdbc:mysql://host.docker.internal:3306/hotel?serverTimezone=Asia/Ho_Chi_Minh&allowPublicKeyRetrieval=true&useSSL=false" `
    -e SPRING_DATASOURCE_USERNAME=root `
    -e SPRING_DATASOURCE_PASSWORD="" `
    -e SPRING_JPA_HIBERNATE_DDL_AUTO=update `
    --restart unless-stopped `
    --add-host host.docker.internal:host-gateway `
    homiehotel:latest

if ($LASTEXITCODE -eq 0) {
    Write-Host "✅ Container started successfully" -ForegroundColor Green
    Write-Host "🌐 Access: http://localhost:9596" -ForegroundColor Cyan
    Write-Host "📋 View logs: docker logs -f homiehotel-app" -ForegroundColor White
} else {
    Write-Host "❌ Failed to start container" -ForegroundColor Red
} 