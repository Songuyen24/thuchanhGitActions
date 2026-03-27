# ----- Giai đoạn 1: Build -----
FROM maven:3.9.11-eclipse-temurin-21 AS builder
WORKDIR /app

# Chỉ copy file pom.xml vào trước để tải thư viện
COPY pom.xml .
# Tải toàn bộ thư viện (bước này sẽ được Docker lưu cache nếu pom.xml không đổi)
RUN mvn dependency:go-offline -B

# Copy thư mục source code vào sau
COPY src ./src
# Biên dịch code thành file .jar
RUN mvn package -DskipTests

# ----- Giai đoạn 2: Chạy -----
# Sử dụng alpine thay vì jammy để kích thước image nhỏ nhất có thể
FROM eclipse-temurin:21-jre-alpine
WORKDIR /app

# Chỉ lấy file .jar từ builder (GĐ1)
COPY --from=builder /app/target/*.jar app.jar

# Khai báo cổng ứng dụng (Đảm bảo CONTAINER_PORT trong GitHub Actions cũng là 8080)
EXPOSE 8080

# Lệnh chạy ứng dụng
ENTRYPOINT ["java", "-jar", "app.jar"]