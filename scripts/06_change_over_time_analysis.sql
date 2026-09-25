--Analyse sales performance over time

	SELECT DATETRUNC(month, order_date) AS order_month, 
	SUM(sales_amount) AS total_sales, 
	COUNT(DISTINCT customer_key) AS customers,
	COUNT(quantity) AS quantity
	FROM gold.fact_sales
	WHERE order_date IS NOT NULL
	GROUP BY DATETRUNC(month, order_date)
	ORDER BY DATETRUNC(month, order_date)
