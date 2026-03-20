FROM mcr.microsoft.com/mssql/server:2022-latest

# Chuyển sang root để cài đặt
USER root

# Tạo thư mục chứa script khởi tạo
RUN mkdir -p /docker-entrypoint-initdb.d

# Sao chép script khởi tạo DB (nếu có)
# COPY init.sql /docker-entrypoint-initdb.d/

# Biến môi trường mặc định
ENV SA_PASSWORD="YourStrong@123"
ENV ACCEPT_EULA="Y"
ENV MSSQL_PID="Express"

# Expose cổng SQL Server
EXPOSE 1433

# Quay lại user mssql
USER mssql
