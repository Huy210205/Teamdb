# Multi-stage build để tối ưu kích thước image
FROM maven:3.9.4-eclipse-temurin-17 AS build

# Thiết lập thư mục làm việc
WORKDIR /app

# Copy pom.xml trước để tận dụng cache layer
COPY pom.xml .

# Tải dependencies
RUN mvn dependency:go-offline -B

# Copy source code vào
COPY src ./src

# Build ứng dụng
RUN mvn clean package -DskipTests

# Runtime stage
FROM eclipse-temurin:17-jre-alpine

# Cài đặt các package cần thiết
RUN apk add --no-cache tzdata wget

# Thiết lập timezone
ENV TZ=Asia/Ho_Chi_Minh

# Tạo user không phải root để chạy ứng dụng
RUN addgroup -g 1001 -S appgroup && \
    adduser -u 1001 -S appuser -G appgroup

# Thiết lập thư mục làm việc
WORKDIR /app

# Copy WAR file từ stage trước
COPY --from=build /app/target/HomieHotel-v1.0.war app.war

# Phân quyền cho user appuser
RUN chown -R appuser:appgroup /app

# Chuyển sang user không phải root
USER appuser

# Expose port ứng dụng (sửa theo port thực tế nếu khác)
EXPOSE 9596

# Health check (chạy mỗi 30s)
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
  CMD wget --no-verbose --tries=1 --spider http://localhost:9596/ || exit 1

# Command để chạy ứng dụng
ENTRYPOINT ["java", "-jar", "app.war"]
