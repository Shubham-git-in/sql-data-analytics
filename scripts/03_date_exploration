--DATE EXPLORATION

	--Find the date of the first and the last order
		SELECT MIN(order_date), MAX(order_date)
		FROM gold.fact_sales

	--Find the youngest and the oldest customer
		SELECT MIN(birthdate), MAX(birthdate),
		DATEDIFF(year, MIN(birthdate), GETDATE()) AS oldest_age,
		DATEDIFF(year, MAX(birthdate), GETDATE()) AS youngest_age
		FROM gold.dim_customers
