# Real-Time Crypto Analytics Pipeline on GCP 🚀

Este proyecto implementa una arquitectura de datos de extremo a extremo (End-to-End) en Google Cloud Platform para el procesamiento de datos de criptomonedas en tiempo real, aplicando una arquitectura Medallón.

## 🏗️ Arquitectura
El flujo de datos se diseñó de la siguiente manera:

1.  **Ingesta (Bronze):** Cloud Function en Python consumiendo APIs de mercado (CoinGecko/Binance).
2.  **Transporte:** Google Pub/Sub como sistema de mensajería desacoplado.
3.  **Procesamiento (Silver):** Cloud Dataflow para la limpieza y normalización de esquemas.
4.  **Almacenamiento & Transformación (Gold):** BigQuery como Data Warehouse, utilizando dbt para el modelado de datos.
5.  **Orquestación:** Cloud Composer (Apache Airflow).
6.  **Visualización:** Looker Studio.

## 🛠️ Tecnologías utilizadas
*   **Lenguajes:** Python, SQL.
*   **Nube:** Google Cloud Platform (GCP).
*   **Servicios:** Cloud Functions, Pub/Sub, Dataflow, BigQuery, Cloud Storage.
*   **Herramientas DE:** dbt, Apache Airflow, Terraform.

## 📈 Roadmap del Proyecto
- [X] Fase 1: Configuración de entorno y Cloud Function de ingesta.
- [ ] Fase 2: Configuración de Pub/Sub y triggers.
- [ ] Fase 3: Pipeline de Dataflow para streaming a BigQuery.
- [ ] Fase 4: Modelado de datos con dbt.
- [ ] Fase 5: Dashboard final en Looker Studio.

---
* Proyecto en desarrollo
---
Autor: [Francisco arjonilla](https://github.com/frnarjonilla)

[Linkedin](https://www.linkedin.com/in/francisco-arjonilla)
