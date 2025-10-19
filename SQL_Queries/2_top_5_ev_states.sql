-- Identify the top 5 states with the highest EV adoption rate (EVs as a % of all registered vehicles).

WITH total_ev_reg_calc AS 
(
SELECT
    state,
    electric,
    (electric + phev + hev + biodiesel + e85 + cng + propane + hydrogen + methanol + gasoline + diesel + unknown_fuel) AS total_reg
FROM ev_regdata
)
SELECT 
    state,
    electric,
    ROUND((electric*1.0/total_reg)*100,2) AS percentage_share
FROM total_ev_reg_calc
ORDER BY percentage_share DESC;