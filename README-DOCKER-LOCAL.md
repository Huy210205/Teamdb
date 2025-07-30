# 🏨 HomieHotel - Docker Local Development

Hướng dẫn chạy HomieHotel với Docker Desktop và XAMPP database.

## 📋 Yêu cầu hệ thống

- ✅ Docker Desktop
- ✅ XAMPP (MySQL)
- ✅ Git
- ✅ Java 8+ (cho development)

## 🚀 Cách chạy nhanh

### Bước 1: Chuẩn bị XAMPP

1. **Cài đặt XAMPP** (nếu chưa có)
2. **Khởi động XAMPP Control Panel**
3. **Start MySQL service**
4. **Tạo database `hotel`**:
   ```sql
   CREATE DATABASE hotel;
   ```

### Bước 2: Chạy ứng dụng

#### Windows:
```powershell
# Chạy script tự động
powershell -ExecutionPolicy Bypass -File run-local.ps1
```

#### Linux/Mac:
```bash
# Cấp quyền thực thi
chmod +x run-local.sh

# Chạy script
./run-local.sh
```

#### Manual (nếu không dùng script):
```bash
# Build Docker image
docker build -t homiehotel:latest .

# Chạy container
docker run -d \
  --name homiehotel-app \
  -p 9596:9596 \
  -e TZ=Asia/Ho_Chi_Minh \
  -e SPRING_PROFILES_ACTIVE=local \
  -e SPRING_DATASOURCE_URL="jdbc:mysql://host.docker.internal:3306/hotel?serverTimezone=Asia/Ho_Chi_Minh" \
  -e SPRING_DATASOURCE_USERNAME=root \
  -e SPRING_DATASOURCE_PASSWORD="" \
  --restart unless-stopped \
  --add-host host.docker.internal:host-gateway \
  homiehotel:latest
```

## 🌐 Truy cập ứng dụng

- **URL**: http://localhost:9596
- **Database**: XAMPP MySQL (localhost:3306)
- **Database Name**: hotel

## 📊 Quản lý container

### Xem logs:
```bash
# Xem logs real-time
docker logs -f homiehotel-app

# Xem logs cuối cùng
docker logs homiehotel-app --tail 50
```

### Dừng/khởi động lại:
```bash
# Dừng container
docker stop homiehotel-app

# Khởi động lại
docker restart homiehotel-app

# Xóa container
docker rm -f homiehotel-app
```

### Kiểm tra trạng thái:
```bash
# Xem container đang chạy
docker ps

# Xem tất cả container
docker ps -a
```

## 🔧 Cấu hình

### Environment Variables:
- `SPRING_PROFILES_ACTIVE=local` - Sử dụng cấu hình local
- `SPRING_DATASOURCE_URL` - URL kết nối database
- `SPRING_DATASOURCE_USERNAME` - Username database
- `SPRING_DATASOURCE_PASSWORD` - Password database
- `TZ=Asia/Ho_Chi_Minh` - Timezone
- `JAVA_OPTS` - JVM options

### Ports:
- **9596** - Application port
- **3306** - MySQL port (XAMPP)

## 🗄️ Database Setup

### Tạo database:
```sql
CREATE DATABASE hotel;
USE hotel;
```

### Import dữ liệu (nếu có):
```sql
-- Import từ file hotel.sql
SOURCE /path/to/hotel.sql;
```

## 🐛 Troubleshooting

### Lỗi kết nối database:
1. Kiểm tra XAMPP MySQL đã start chưa
2. Kiểm tra port 3306 có bị block không
3. Kiểm tra firewall settings

### Lỗi Docker:
1. Kiểm tra Docker Desktop đã chạy chưa
2. Kiểm tra Docker daemon
3. Restart Docker Desktop

### Lỗi ứng dụng:
1. Xem logs: `docker logs homiehotel-app`
2. Kiểm tra database connection
3. Kiểm tra port 9596 có bị sử dụng không

## 📁 File cấu hình

- `docker-compose-local.yml` - Docker Compose cho local
- `application-local.properties` - Cấu hình Spring Boot cho local
- `run-local.ps1` - Script PowerShell cho Windows
- `run-local.sh` - Script Bash cho Linux/Mac

## 🎯 Development Workflow

1. **Code changes** → Edit source code
2. **Rebuild image** → `docker build -t homiehotel:latest .`
3. **Restart container** → `docker restart homiehotel-app`
4. **Check logs** → `docker logs -f homiehotel-app`

## 📞 Support

Nếu gặp vấn đề, hãy kiểm tra:
1. Docker Desktop status
2. XAMPP MySQL status
3. Application logs
4. Database connection 