{{ config(materialized='table') }}

with source_data as (
    select * from {{ source('crypto_raw', 'raw_prices') }}
)

select
    extraction_date as fecha_ingesta,
    -- Acceso directo con el operador punto para JSON nativo
    safe_cast(json_value(data.bitcoin.usd) as float64) as btc_price_usd,
    safe_cast(json_value(data.ethereum.usd) as float64) as eth_price_usd,
    safe_cast(json_value(data.solana.usd) as float64) as sol_price_usd,
    -- Extraemos la fuente que está fuera de la llave interna data
    source as fuente
from source_data
where data is not null