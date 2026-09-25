	-- Find the Total Sales
		SELECT SUM(sales_amount) AS total_sales 
		FROM gold.fact_sales

	-- Find how many items are sold
		SELECT SUM(quantity)
		FROM gold.fact_sales

	-- Find the average selling price
		SELECT AVG(sales_amount) AS average_sales
		FROM gold.fact_sales

	-- Find the Total number of Orders
		SELECT COUNT(DISTINCT order_number) --Removes the case of multiple items ordered in 1 single order
		FROM gold.fact_sales

	-- Find the total number of products
		SELECT DISTINCT COUNT(product_name)
		FROM gold.dim_products

	-- Find the total number of customers
		SELECT DISTINCT COUNT(customer_number)
		FROM gold.dim_customers
		
	-- Find the total number of customers that has placed an order
		SELECT COUNT(DISTINCT fs.customer_key)
		FROM gold.fact_sales fs
		INNER JOIN gold.dim_customers dc
		ON fs.customer_key = dc.customer_key

		--OR

		SELECT COUNT(DISTINCT fs.customer_key)
		FROM gold.fact_sales fs

	-- Generate a Report that shows all key metrics of the business
		SELECT 'Total Sales' AS measure_name, SUM(sales_amount) AS measure_value FROM gold.fact_sales
		UNION ALL
		SELECT 'Total Quantity', SUM(quantity) FROM gold.fact_sales
		UNION ALL
		SELECT 'Average Price', AVG(price) FROM gold.fact_sales
		UNION ALL
		SELECT 'Total Orders', COUNT(DISTINCT order_number) FROM gold.fact_sales
		UNION ALL
		SELECT 'Total Products', COUNT(DISTINCT product_name) FROM gold.dim_products
		UNION ALL
		SELECT 'Total Customers', COUNT(customer_key) FROM gold.dim_customers;
