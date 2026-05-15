# 1. Usamos una imagen ligera de Python oficial
FROM python:3.9-slim

# 2. Evitamos que Python escriba archivos .pyc y forzamos logs en tiempo real
ENV PYTHONUNBUFFERED=True

# 3. Establecemos el directorio de trabajo dentro del contenedor
WORKDIR /usr/app

# 4. Copiamos los archivos de configuración y dependencias primero (para optimizar la caché de Docker)
COPY requirements.txt .

# 5. Instalamos dbt con el adaptador de BigQuery
RUN pip install --no-cache-dir -r requirements.txt

# 6. Copiamos todo el resto de tu proyecto de dbt al contenedor
COPY . .

# 7. El comando que ejecutará Cloud Run cuando reciba el aviso de Pub/Sub
# Usamos dbt build porque ejecuta 'run' y además pasa los 'tests' automáticamente
ENTRYPOINT ["dbt", "build", "--profiles-dir", "."]