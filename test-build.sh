#!/bin/bash

echo "🚀 Testing HomieHotel CI/CD Pipeline"
echo "======================================"

# Test 1: Maven Build
echo "📦 Test 1: Maven Build"
mvn clean compile
if [ $? -eq 0 ]; then
    echo "✅ Maven compile successful"
else
    echo "❌ Maven compile failed"
    exit 1
fi

# Test 2: Package Build
echo "📦 Test 2: Package Build"
mvn clean package -DskipTests
if [ $? -eq 0 ]; then
    echo "✅ Package build successful"
    echo "📁 WAR file created: target/HomieHotel-v1.0.war"
else
    echo "❌ Package build failed"
    exit 1
fi

# Test 3: Check WAR file
echo "📦 Test 3: Check WAR file"
if [ -f "target/HomieHotel-v1.0.war" ]; then
    echo "✅ WAR file exists"
    ls -la target/HomieHotel-v1.0.war
else
    echo "❌ WAR file not found"
    exit 1
fi

# Test 4: Dockerfile check
echo "🐳 Test 4: Dockerfile check"
if [ -f "Dockerfile" ]; then
    echo "✅ Dockerfile exists"
    echo "📋 Dockerfile content preview:"
    head -10 Dockerfile
else
    echo "❌ Dockerfile not found"
    exit 1
fi

# Test 5: GitHub Actions check
echo "🔧 Test 5: GitHub Actions check"
if [ -f ".github/workflows/ci-cd.yml" ]; then
    echo "✅ CI/CD workflow exists"
else
    echo "❌ CI/CD workflow not found"
    exit 1
fi

if [ -f ".github/workflows/deploy.yml" ]; then
    echo "✅ Deploy workflow exists"
else
    echo "❌ Deploy workflow not found"
    exit 1
fi

# Test 6: Docker Compose check
echo "🐳 Test 6: Docker Compose check"
if [ -f "docker-compose.yml" ]; then
    echo "✅ Docker Compose file exists"
else
    echo "❌ Docker Compose file not found"
    exit 1
fi

echo ""
echo "🎉 All tests passed! CI/CD pipeline is ready."
echo "📋 Next steps:"
echo "1. Set up Docker Hub credentials in GitHub Secrets"
echo "2. Push code to trigger GitHub Actions"
echo "3. Deploy with: docker-compose up -d" 