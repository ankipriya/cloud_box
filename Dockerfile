# Start from the nginx image
FROM nginx:alpine

# Remove the default nginx static site
RUN rm -rf /usr/share/nginx/html/*

# Copy your HTML into nginx's web root
COPY index.html /usr/share/nginx/html/index.html

# Expose port 80 (for web traffic)
EXPOSE 80

# Start nginx when the container starts
CMD ["nginx", "-g", "daemon off;"]
