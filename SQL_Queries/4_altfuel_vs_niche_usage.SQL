-- Highlight which alternative fuels (biodiesel, ethanol, hydrogen) have meaningful presence vs. niche usage.

WITH total_summary AS
	(SELECT 
		SUM(biodiesel) biodiesel_total,
		SUM(e85) AS e85_total,
		SUM(hydrogen) AS hydrogen_total,
		SUM(electric + phev + hev + biodiesel + e85 + cng + propane + hydrogen + methanol + gasoline + diesel + unknown_fuel) AS total_vehicles
	FROM ev_regdata)
SELECT 
	biodiesel_total,
    ROUND((biodiesel_total*1.0/total_vehicles)*100.0,2) AS biodiesel_perc,
    e85_total,
    ROUND((e85_total*1.0/total_vehicles)*100.0,2) AS e85_perc,
    hydrogen_total,
    ROUND((hydrogen_total*1.0/total_vehicles)*100.0,2) AS hydrogen_perc
FROM total_summary;
