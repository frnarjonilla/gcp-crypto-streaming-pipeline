{{ config(materialized='table') }}

with source_data as (
    select * from {{ source('crypto_raw', 'raw_prices') }}
)

select
    publish_time as fecha_ingesta,
    message_id,
    -- Accedemos a data -> bitcoin -> usd
    safe_cast(json_extract_scalar(data, '$.data.bitcoin.usd') as float64) as btc_price_usd,
    -- Accedemos a data -> ethereum -> usd
    safe_cast(json_extract_scalar(data, '$.data.ethereum.usd') as float64) as eth_price_usd,
    -- Accedemos a data -> solana -> usd (por si quieres añadirla)
    safe_cast(json_extract_scalar(data, '$.data.solana.usd') as float64) as sol_price_usd,
    -- Extraemos la fuente que está fuera de la llave interna data
    json_extract_scalar(data, '$.source') as fuente
from source_data
where data is not null