# =====================
# Stage 1 – Build stage
# =====================
FROM python:3.10-slim AS builder

WORKDIR /app

# Install dependencies
COPY app/requirements.txt .
RUN pip install --upgrade pip && \
    pip install --user -r requirements.txt

# ========================
# Stage 2 – Final image
# ========================
FROM python:3.10-slim

WORKDIR /app

# Copy only needed files
COPY --from=builder /root/.local /root/.local
COPY app/ .

# Set environment path for user packages
ENV PATH=/root/.local/bin:$PATH

EXPOSE 5000

CMD ["python", "main.py"]
