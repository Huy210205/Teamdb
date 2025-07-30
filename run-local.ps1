# Script để chạy HomieHotel với Docker và XAMPP
Write-Host "🚀 HomieHotel Local Development Setup" -ForegroundColor Green
Write-Host "=====================================" -ForegroundColor Green

# Kiểm tra Docker
Write-Host "🐳 Checking Docker..." -ForegroundColor Yellow
try {
    docker --version | Out-Null
    Write-Host "✅ Docker is running" -ForegroundColor Green
} catch {
    Write-Host "❌ Docker is not running. Please start Docker Desktop first." -ForegroundColor Red
    exit 1
}

# Kiểm tra XAMPP MySQL
Write-Host "🗄️  Checking XAMPP MySQL..." -ForegroundColor Yellow
try {
    $response = Invoke-WebRequest -Uri "http://localhost:3306" -TimeoutSec 5 -ErrorAction SilentlyContinue
    Write-Host "✅ MySQL is running on port 3306" -ForegroundColor Green
} catch {
    Write-Host "⚠️  MySQL might not be running. Please start XAMPP MySQL." -ForegroundColor Yellow
    Write-Host "   Start XAMPP Control Panel and start MySQL service" -ForegroundColor Cyan
}

# Build Docker image
Write-Host "📦 Building Docker image..." -ForegroundColor Yellow
docker build -t homiehotel:latest .
if ($LASTEXITCODE -eq 0) {
    Write-Host "✅ Docker image built successfully" -ForegroundColor Green
} else {
    Write-Host "❌ Docker build failed" -ForegroundColor Red
    exit 1
}

# Stop existing container if running
Write-Host "🛑 Stopping existing container..." -ForegroundColor Yellow
docker stop homiehotel-app 2>$null
docker rm homiehotel-app 2>$null

# Run container with XAMPP database
Write-Host "🚀 Starting container with XAMPP database..." -ForegroundColor Yellow
docker run -d `
    --name homiehotel-app `
    -p 9596:9596 `
    -e TZ=Asia/Ho_Chi_Minh `
    -e JAVA_OPTS="-Xmx512m -Xms256m" `
    -e SPRING_PROFILES_ACTIVE=local `
    -e SPRING_DATASOURCE_URL="jdbc:mysql://host.docker.internal:3306/hotel?serverTimezone=Asia/Ho_Chi_Minh" `
    -e SPRING_DATASOURCE_USERNAME=root `
    -e SPRING_DATASOURCE_PASSWORD="" `
    --restart unless-stopped `
    --add-host host.docker.internal:host-gateway `
    homiehotel:latest

if ($LASTEXITCODE -eq 0) {
    Write-Host "✅ Container started successfully" -ForegroundColor Green
} else {
    Write-Host "❌ Failed to start container" -ForegroundColor Red
    exit 1
}

# Wait for application to start
Write-Host "⏳ Waiting for application to start..." -ForegroundColor Yellow
Start-Sleep -Seconds 10

# Check container status
Write-Host "📊 Container status:" -ForegroundColor Yellow
docker ps --filter name=homiehotel-app

# Show logs
Write-Host "📋 Application logs:" -ForegroundColor Yellow
docker logs homiehotel-app --tail 20

Write-Host ""
Write-Host "🎉 HomieHotel is now running!" -ForegroundColor Green
Write-Host "🌐 Access the application at: http://localhost:9596" -ForegroundColor Cyan
Write-Host "🗄️  Database: XAMPP MySQL (localhost:3306)" -ForegroundColor Cyan
Write-Host ""
Write-Host "📋 Useful commands:" -ForegroundColor Yellow
Write-Host "  View logs: docker logs -f homiehotel-app" -ForegroundColor White
Write-Host "  Stop app: docker stop homiehotel-app" -ForegroundColor White
Write-Host "  Restart: docker restart homiehotel-app" -ForegroundColor White
Write-Host "  Remove: docker rm -f homiehotel-app" -ForegroundColor White 