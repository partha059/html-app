# Use Nginx to serve static HTML
FROM nginx:alpine

# Copy your HTML files into the Nginx web server directory
COPY index.html /usr/share/nginx/html/index.html

# Expose port 80 for web traffic
EXPOSE 80

# Start Nginx server
CMD ["nginx", "-g", "daemon off;"]
