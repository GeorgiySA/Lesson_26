FROM python:3.12-slim

WORKDIR /code

# Устанавливаем системные зависимости
RUN apt-get update && apt-get install -y \
    gcc \
    python3-dev \
    libpq-dev \
    && rm -rf /var/lib/apt/lists/*

COPY requirements.txt .
RUN pip install --no-cache-dir --upgrade pip
RUN pip install --no-cache-dir -r requirements.txt

# Для отладки - покажем что в файле
RUN cat requirements.txt

# Пробуем установить с подробным выводом
RUN pip install --no-cache-dir --verbose -r requirements.txt

COPY app.py .
COPY migrations migrations
COPY docker_config.py default_config.py

CMD ["flask", "run", "--host=0.0.0.0", "--port=80"]