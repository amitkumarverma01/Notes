# Use nginx base image
FROM nginx:alpine

# Remove default nginx static files
RUN rm -rf /usr/share/nginx/html/*

# Copy your website files into nginx's public folder
COPY . /usr/share/nginx/html

# Expose port 80
EXPOSE 80

# Start nginx (by default nginx image does this)
CMD ["nginx", "-g", "daemon off;"]
