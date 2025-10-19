-- Calculate the percentage of EVs, PHEVs, HEVs, and Gasoline vehicles for each state.

WITH sum_calc AS 
(SELECT
    state,
    electric,
    phev,
    hev,
    gasoline,
    (electric + phev + hev + biodiesel + e85 + cng + propane + hydrogen + methanol + gasoline + diesel + unknown_fuel) AS total_vehicles
FROM  ev_regdata
)
SELECT
    state,
    electric,
    ROUND((electric*1.0/total_vehicles)*100,2) AS ev_percentage,
    phev,
    ROUND((phev*1.0/total_vehicles)*100,2) AS phev_percentage,
    hev,
    ROUND((hev*1.0/total_vehicles)*100,2) AS hev_percentage,
    gasoline,
    ROUND((gasoline*1.0/total_vehicles)*100,2) AS gas_percentage
FROM sum_calc;

