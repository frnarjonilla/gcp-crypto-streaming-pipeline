{{ config(materialized='view') }}

with prices as (
    select * from {{ ref('stg_crypto_prices') }}
),

calculations as (
    select 
        fecha_ingesta,
        fuente,
        -- Bitcoin
        btc_price_usd,
        lag(btc_price_usd) over (order by fecha_ingesta) as prev_btc,
        -- Ethereum
        eth_price_usd,
        lag(eth_price_usd) over (order by fecha_ingesta) as prev_eth,
        -- Solana
        sol_price_usd,
        lag(sol_price_usd) over (order by fecha_ingesta) as prev_sol
    from prices
)

select
    fecha_ingesta,
    fuente,
    -- Columnas finales para Bitcoin
    btc_price_usd,
    round(btc_price_usd - prev_btc, 2) as btc_diff,
    -- Columnas finales para Ethereum
    eth_price_usd,
    round(eth_price_usd - prev_eth, 2) as eth_diff,
    -- Columnas finales para Solana
    sol_price_usd,
    round(sol_price_usd - prev_sol, 2) as sol_diff
from calculations