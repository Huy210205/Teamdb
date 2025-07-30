# Test HomieHotel CI/CD Pipeline
Write-Host "🚀 Testing HomieHotel CI/CD Pipeline" -ForegroundColor Green
Write-Host "======================================" -ForegroundColor Green

# Test 1: Maven Build
Write-Host "📦 Test 1: Maven Build" -ForegroundColor Yellow
mvn clean compile
if ($LASTEXITCODE -eq 0) {
    Write-Host "✅ Maven compile successful" -ForegroundColor Green
} else {
    Write-Host "❌ Maven compile failed" -ForegroundColor Red
    exit 1
}

# Test 2: Package Build
Write-Host "📦 Test 2: Package Build" -ForegroundColor Yellow
mvn clean package -DskipTests
if ($LASTEXITCODE -eq 0) {
    Write-Host "✅ Package build successful" -ForegroundColor Green
    Write-Host "📁 WAR file created: target/HomieHotel-v1.0.war" -ForegroundColor Cyan
} else {
    Write-Host "❌ Package build failed" -ForegroundColor Red
    exit 1
}

# Test 3: Check WAR file
Write-Host "📦 Test 3: Check WAR file" -ForegroundColor Yellow
if (Test-Path "target/HomieHotel-v1.0.war") {
    Write-Host "✅ WAR file exists" -ForegroundColor Green
    Get-ChildItem "target/HomieHotel-v1.0.war" | Format-Table Name, Length, LastWriteTime
} else {
    Write-Host "❌ WAR file not found" -ForegroundColor Red
    exit 1
}

# Test 4: Dockerfile check
Write-Host "🐳 Test 4: Dockerfile check" -ForegroundColor Yellow
if (Test-Path "Dockerfile") {
    Write-Host "✅ Dockerfile exists" -ForegroundColor Green
    Write-Host "📋 Dockerfile content preview:" -ForegroundColor Cyan
    Get-Content "Dockerfile" | Select-Object -First 10
} else {
    Write-Host "❌ Dockerfile not found" -ForegroundColor Red
    exit 1
}

# Test 5: GitHub Actions check
Write-Host "🔧 Test 5: GitHub Actions check" -ForegroundColor Yellow
if (Test-Path ".github/workflows/ci-cd.yml") {
    Write-Host "✅ CI/CD workflow exists" -ForegroundColor Green
} else {
    Write-Host "❌ CI/CD workflow not found" -ForegroundColor Red
    exit 1
}

if (Test-Path ".github/workflows/deploy.yml") {
    Write-Host "✅ Deploy workflow exists" -ForegroundColor Green
} else {
    Write-Host "❌ Deploy workflow not found" -ForegroundColor Red
    exit 1
}

# Test 6: Docker Compose check
Write-Host "🐳 Test 6: Docker Compose check" -ForegroundColor Yellow
if (Test-Path "docker-compose.yml") {
    Write-Host "✅ Docker Compose file exists" -ForegroundColor Green
} else {
    Write-Host "❌ Docker Compose file not found" -ForegroundColor Red
    exit 1
}

# Test 7: Check if Docker is available
Write-Host "🐳 Test 7: Docker availability" -ForegroundColor Yellow
try {
    docker --version | Out-Null
    Write-Host "✅ Docker is available" -ForegroundColor Green
} catch {
    Write-Host "⚠️  Docker not available (optional for local testing)" -ForegroundColor Yellow
}

Write-Host ""
Write-Host "🎉 All tests passed! CI/CD pipeline is ready." -ForegroundColor Green
Write-Host "📋 Next steps:" -ForegroundColor Cyan
Write-Host "1. Set up Docker Hub credentials in GitHub Secrets" -ForegroundColor White
Write-Host "2. Push code to trigger GitHub Actions" -ForegroundColor White
Write-Host "3. Deploy with: docker-compose up -d" -ForegroundColor White 