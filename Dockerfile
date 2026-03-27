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
