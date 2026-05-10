import base64
import json
import requests
from google.cloud import pubsub_v1
import datetime  # <--- Importación corregida

# Configuración - Reemplaza con tu ID de proyecto de GCP
PROJECT_ID = "gcp-crypto-pipeline" 
TOPIC_NAME = "crypto-raw-data"

publisher = pubsub_v1.PublisherClient()
topic_path = publisher.topic_path(PROJECT_ID, TOPIC_NAME)

def fetch_crypto_data(request):
    url = "https://api.coingecko.com/api/v3/simple/price?ids=bitcoin,ethereum,solana&vs_currencies=usd&include_24hr_vol=true"
    
    try:
        response = requests.get(url)
        response.raise_for_status()
        data = response.json()
        
        # Añadimos metadata útil con datetime estándar
        payload = {
            "data": data,
            "source": "coingecko_api",
            "ingestion_time": datetime.datetime.now().isoformat() # <--- Línea corregida
        }
        
        message_json = json.dumps(payload)
        message_bytes = message_json.encode("utf-8")
        
        future = publisher.publish(topic_path, message_bytes)
        message_id = future.result()
        
        return f"Éxito: Mensaje {message_id} publicado en {TOPIC_NAME}", 200
        
    except Exception as e:
        print(f"Error: {str(e)}")
        return f"Error en la ingesta: {str(e)}", 500