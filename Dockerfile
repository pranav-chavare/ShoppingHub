FROM python:3.11-slim
WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
RUN apt-get update -y && apt-get install -y git
RUN git clone https://github.com/Team-Backendops/ecommerce-project.git
WORKDIR /app/E-commerce
ENV PATH="/usr/local/bin:$PATH"
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
