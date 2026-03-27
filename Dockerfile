<<<<<<< HEAD
# Sử dụng Nginx để serve file HTML tĩnh
FROM nginx:alpine

# Xoá trang mặc định của Nginx
RUN rm -rf /usr/share/nginx/html/*

# Copy file HTML vào thư mục serve của Nginx
COPY src/main/resources/index.html /usr/share/nginx/html/index.html

# Khai báo cổng 80 (mặc định của Nginx)
EXPOSE 80

# Nginx sẽ tự khởi động theo mặc định
CMD ["nginx", "-g", "daemon off;"]
=======
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
>>>>>>> 4fe36161b1188376b68cceb01c732e4e3a97f531
