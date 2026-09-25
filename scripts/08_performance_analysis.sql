 --Performace analysis: Compare the current value to the target value (USING CTE)

	--Analyse the yearly performace of products by
	--comparing each product sales to its average sales performance and previous years sales
	WITH yearly_product_sales AS(
	SELECT YEAR(f.order_date) AS order_date,
	p.product_name AS product_name,
	SUM(f.sales_amount) AS total
	FROM gold.fact_sales f
	LEFT JOIN gold.dim_products p
	ON f.product_key = p.product_key
	WHERE f.order_date IS NOT NULL
	GROUP BY YEAR(f.order_date), p.product_name
	)

	SELECT 
	order_date,
	product_name,
	total,
	AVG(total) OVER(PARTITION BY product_name) AS yearly_avg,
	total - AVG(total) OVER(PARTITION BY product_name) AS deviation_avg,
	CASE 
        WHEN total - AVG(total) OVER (PARTITION BY product_name) > 0 THEN 'Above Avg'
        WHEN total - AVG(total) OVER (PARTITION BY product_name) < 0 THEN 'Below Avg'
        ELSE 'Avg'
    END AS avg_change,
	LAG(total) OVER (PARTITION BY product_name ORDER BY order_date) AS py_sales,
	total - LAG(total) OVER (PARTITION BY product_name ORDER BY order_date) AS py_deviation,
	CASE 
        WHEN total - LAG(total) OVER (PARTITION BY product_name ORDER BY order_date) > 0 THEN 'Increase'
        WHEN total - LAG(total) OVER (PARTITION BY product_name ORDER BY order_date) < 0 THEN 'Decrease'
        ELSE 'No Change'
    END AS py_change
	FROM yearly_product_sales
	ORDER BY product_name, order_date 
