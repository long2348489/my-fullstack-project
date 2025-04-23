FROM node:18-alpine

# Set environment variables for security and performance
ENV NODE_ENV=production \
    PORT=3000

# Create non-root user and group
RUN addgroup -S appgroup && adduser -S appuser -G appgroup

# Install dependencies first for better layer caching
WORKDIR /app
COPY package*.json ./
RUN npm install --production

# Copy the rest of the application files
COPY --chown=appuser:appgroup . .

# Set proper permissions
RUN chown -R appuser:appgroup /app && \
    chmod -R 755 /app && \
    mkdir -p /app/node_modules && \
    chown -R appuser:appgroup /app/node_modules

# Switch to non-root user
USER appuser

# Expose the application port
EXPOSE ${PORT}

# Health check
HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 \
    CMD node healthcheck.js || exit 1

# Start the application
CMD ["node", "server.js"]