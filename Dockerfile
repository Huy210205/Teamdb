# Multi-stage build để tối ưu kích thước image
FROM maven:3.8.4-openjdk-8 AS build

# Thiết lập thư mục làm việc
WORKDIR /app

# Copy pom.xml trước để tận dụng cache layer
COPY pom.xml .

# Download dependencies (sẽ được cache nếu pom.xml không thay đổi)
RUN mvn dependency:go-offline -B

# Copy source code
COPY src ./src

# Build application
RUN mvn clean package -DskipTests

# Runtime stage
FROM openjdk:8-jre-alpine

# Cài đặt các package cần thiết
RUN apk add --no-cache tzdata

# Thiết lập timezone
ENV TZ=Asia/Ho_Chi_Minh

# Tạo user không phải root để chạy ứng dụng
RUN addgroup -g 1001 -S appgroup && \
    adduser -u 1001 -S appuser -G appgroup

# Thiết lập thư mục làm việc
WORKDIR /app

# Copy JAR file từ build stage
COPY --from=build /app/target/HomieHotel-v1.0.war app.war

# Thay đổi ownership cho user appuser
RUN chown -R appuser:appgroup /app

# Chuyển sang user không phải root
USER appuser

# Expose port
EXPOSE 9596

# Health check
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
  CMD wget --no-verbose --tries=1 --spider http://localhost:9596/ || exit 1

# Command để chạy ứng dụng
ENTRYPOINT ["java", "-jar", "app.war"] 