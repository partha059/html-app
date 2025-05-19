# Use the latest stable Nginx image from Debian
FROM nginx:latest

# Update package lists and install security patches
RUN apt update && apt upgrade -y

# Install the latest fixed version of libxml2 to resolve vulnerabilities
RUN apt install -y libxml2

# Remove unnecessary packages to keep the image lightweight
RUN apt clean && rm -rf /var/lib/apt/lists/*

# Copy HTML files into the Nginx web server directory
COPY index.html /usr/share/nginx/html/index.html

# Expose port 80 for web traffic
EXPOSE 80

# Start Nginx server
CMD ["nginx", "-g", "daemon off;"]
