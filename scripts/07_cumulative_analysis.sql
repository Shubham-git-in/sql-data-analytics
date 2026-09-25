--CUMULATIVE ANALYSIS : Total sales of each month and running total of sales for each year over time
	SELECT order_date,
		total_sales,
		AVG(avg_price) OVER(PARTITION BY YEAR(order_date) ORDER BY order_date) AS moving_avg, --Calculate moving Average
		SUM(total_sales) OVER(PARTITION BY YEAR(order_date) ORDER BY order_date) AS running_total_sales --Calculate running total
		FROM(
			SELECT DATETRUNC(month, order_date) AS order_date, 
			SUM(sales_amount) AS total_sales,
			AVG(sales_amount) AS avg_price
			FROM gold.fact_sales
			WHERE order_date IS NOT NULL
			GROUP BY DATETRUNC(month, order_date)
		)t
