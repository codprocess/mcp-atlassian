FROM python:3.10-slim

WORKDIR /app

# Install pip and upgrade it
RUN pip install --no-cache-dir --upgrade pip

# Install mcp-atlassian directly
RUN pip install --no-cache-dir mcp-atlassian

# Expose the port for SSE transport
EXPOSE 8000

# Set environment variables (these will be overridden by Railway variables)
ENV TRANSPORT=sse
ENV PORT=8000

# Run the server
ENTRYPOINT ["mcp-atlassian"]
CMD ["--transport", "sse", "--port", "8000"]
