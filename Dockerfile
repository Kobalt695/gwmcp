FROM python:3.12-slim
WORKDIR /app
RUN pip install --no-cache-dir uv
COPY pyproject.toml ./
RUN uv pip install --system --no-cache .
COPY . .
EXPOSE 8888
CMD ["python", "main.py", "--transport", "streamable-http", "--single-user"]
