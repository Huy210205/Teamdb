#!/bin/bash

echo "🚀 HomieHotel Local Development Setup"
echo "====================================="

# Kiểm tra Docker
echo "🐳 Checking Docker..."
if command -v docker &> /dev/null; then
    echo "✅ Docker is available"
else
    echo "❌ Docker is not installed. Please install Docker first."
    exit 1
fi

# Kiểm tra Docker daemon
if docker info &> /dev/null; then
    echo "✅ Docker daemon is running"
else
    echo "❌ Docker daemon is not running. Please start Docker Desktop."
    exit 1
fi

# Kiểm tra XAMPP MySQL
echo "🗄️  Checking XAMPP MySQL..."
if nc -z localhost 3306 2>/dev/null; then
    echo "✅ MySQL is running on port 3306"
else
    echo "⚠️  MySQL might not be running. Please start XAMPP MySQL."
    echo "   Start XAMPP Control Panel and start MySQL service"
fi

# Build Docker image
echo "📦 Building Docker image..."
docker build -t homiehotel:latest .
if [ $? -eq 0 ]; then
    echo "✅ Docker image built successfully"
else
    echo "❌ Docker build failed"
    exit 1
fi

# Stop existing container if running
echo "🛑 Stopping existing container..."
docker stop homiehotel-app 2>/dev/null
docker rm homiehotel-app 2>/dev/null

# Run container with XAMPP database
echo "🚀 Starting container with XAMPP database..."
docker run -d \
    --name homiehotel-app \
    -p 9596:9596 \
    -e TZ=Asia/Ho_Chi_Minh \
    -e JAVA_OPTS="-Xmx512m -Xms256m" \
    -e SPRING_PROFILES_ACTIVE=local \
    -e SPRING_DATASOURCE_URL="jdbc:mysql://host.docker.internal:3306/hotel?serverTimezone=Asia/Ho_Chi_Minh" \
    -e SPRING_DATASOURCE_USERNAME=root \
    -e SPRING_DATASOURCE_PASSWORD="" \
    --restart unless-stopped \
    --add-host host.docker.internal:host-gateway \
    homiehotel:latest

if [ $? -eq 0 ]; then
    echo "✅ Container started successfully"
else
    echo "❌ Failed to start container"
    exit 1
fi

# Wait for application to start
echo "⏳ Waiting for application to start..."
sleep 10

# Check container status
echo "📊 Container status:"
docker ps --filter name=homiehotel-app

# Show logs
echo "📋 Application logs:"
docker logs homiehotel-app --tail 20

echo ""
echo "🎉 HomieHotel is now running!"
echo "🌐 Access the application at: http://localhost:9596"
echo "🗄️  Database: XAMPP MySQL (localhost:3306)"
echo ""
echo "📋 Useful commands:"
echo "  View logs: docker logs -f homiehotel-app"
echo "  Stop app: docker stop homiehotel-app"
echo "  Restart: docker restart homiehotel-app"
echo "  Remove: docker rm -f homiehotel-app" 