WITH infos AS
(
    SELECT
        parcel_id
        , count(DISTINCT model_name) AS nb_models
        , sum(quantity) AS quantity
    FROM {{ref("stg_raw__parcel_product")}}
    GROUP BY parcel_id
)
        SELECT
            *,
            EXTRACT(MONTH FROM date_purchase) AS month_purchase
        FROM {{ref("stg_raw__parcel")}}
        JOIN infos USING(parcel_id)