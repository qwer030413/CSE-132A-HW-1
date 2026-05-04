SELECT co.origin AS coff_origin, COALESCE(SUM(c.pricePerPound * s.pounds * (1.0 - s.discount/100.0)), 0) AS revenue
FROM Coffee co 
LEFT JOIN Sales s ON c.name = s.coffee
GROUP BY c.origin