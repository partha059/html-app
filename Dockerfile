# Use Node.js image instead of Nginx
FROM node:alpine

# Set working directory
WORKDIR /app

# Copy application files
COPY . .

# Install dependencies (if applicable)
RUN npm install

# Run tests
CMD ["npm", "test"]
