--PART TO WHOLE ANALYSIS: analyse how individual part is performing compared to the overall, allowing to understand which category has the greatest impact on business 

	--Analyse the contribution of all the categories to the total sales(USING CTE)
	WITH category_total AS(
	SELECT
	p.category AS category,
	SUM(f.sales_amount) AS cat_tot
	FROM gold.fact_sales as f
	LEFT JOIN gold.dim_products as p
	ON f.product_key = p.product_key
	GROUP BY 
	p.category
	)

	SELECT	
	category,
	cat_tot,
	SUM(cat_tot) OVER() AS total,
	CONCAT(ROUND((CAST (cat_tot AS FLOAT)/SUM(cat_tot) OVER()) * 100, 2), '%') AS perc_contribution
	FROM category_total
	ORDER BY cat_tot DESC
