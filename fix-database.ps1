# Script fix lỗi kết nối database
Write-Host "🔧 Fixing Database Connection Issues" -ForegroundColor Green
Write-Host "===================================" -ForegroundColor Green

# Kiểm tra MySQL
Write-Host "🗄️  Checking MySQL..." -ForegroundColor Yellow
$mysqlRunning = netstat -an | findstr :3306
if ($mysqlRunning) {
    Write-Host "✅ MySQL is running on port 3306" -ForegroundColor Green
} else {
    Write-Host "❌ MySQL is not running. Please start MySQL/XAMPP first!" -ForegroundColor Red
    exit 1
}

# Dừng container cũ
Write-Host "🛑 Stopping old containers..." -ForegroundColor Yellow
docker stop $(docker ps -q --filter name=homiehotel) 2>$null
docker rm $(docker ps -aq --filter name=homiehotel) 2>$null

# Tạo database nếu chưa có
Write-Host "🗄️  Creating database if not exists..." -ForegroundColor Yellow
Write-Host "   Please run this SQL in your MySQL client:" -ForegroundColor Cyan
Write-Host "   CREATE DATABASE IF NOT EXISTS hotel;" -ForegroundColor White
Write-Host "   USE hotel;" -ForegroundColor White

# Build Docker image
Write-Host "📦 Building Docker image..." -ForegroundColor Yellow
docker build -t homiehotel:latest .
if ($LASTEXITCODE -ne 0) {
    Write-Host "❌ Docker build failed" -ForegroundColor Red
    exit 1
}

# Chạy container với cấu hình đúng
Write-Host "🚀 Starting container with correct database config..." -ForegroundColor Yellow
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
} else {
    Write-Host "❌ Failed to start container" -ForegroundColor Red
    exit 1
}

# Chờ ứng dụng khởi động
Write-Host "⏳ Waiting for application to start..." -ForegroundColor Yellow
Start-Sleep -Seconds 20

# Hiển thị logs
Write-Host "📋 Application logs:" -ForegroundColor Yellow
docker logs homiehotel-app --tail 30

Write-Host ""
Write-Host "🎉 HomieHotel should be running now!" -ForegroundColor Green
Write-Host "🌐 Access: http://localhost:9596" -ForegroundColor Cyan
Write-Host "🗄️  Database: host.docker.internal:3306/hotel" -ForegroundColor Cyan
Write-Host ""
Write-Host "📋 Commands:" -ForegroundColor Yellow
Write-Host "  View logs: docker logs -f homiehotel-app" -ForegroundColor White
Write-Host "  Stop app: docker stop homiehotel-app" -ForegroundColor White
Write-Host "  Restart: docker restart homiehotel-app" -ForegroundColor White 