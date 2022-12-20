-- 1. Overall Performance by Year
SELECT
  YEAR(order_date) AS years,
  SUM(sales) AS sales,
  COUNT(order_quantity) AS number_of_order
FROM dqlab_sales_store
WHERE order_status = 'Order Finished'
GROUP BY years
ORDER BY years;

-- 2. Overall Performance by Product Sub Category
SELECT
  YEAR(order_date) AS years,
  product_sub_category,
  SUM(sales) AS sales
FROM dqlab_sales_Store
WHERE order_status = 'order finished'
AND YEAR(order_date) > 2010
GROUP BY YEAR(order_date),
         product_sub_category
ORDER BY YEAR(order_date), sales DESC;

-- 3. Promotion Effectiveness and Efficiency by Years
SELECT
  YEAR(order_date) AS years,
  SUM(sales) AS sales,
  SUM(discount_value) AS promotion_value,
  ROUND((SUM(discount_value) / SUM(sales)) * 100, 2) AS burn_rate_percentage
FROM dqlab_sales_store
WHERE order_status = 'order finished'
GROUP BY years
ORDER BY years;

-- 4. Promotion Effectiveness and Efficiency by Product Sub Category
SELECT
  YEAR(order_date) AS years,
  product_sub_category,
  product_category,
  SUM(sales) AS sales,
  SUM(discount_value) AS promotion_value,
  ROUND((SUM(discount_value) / SUM(sales)) * 100, 2) AS burn_rate_percentage
FROM dqlab_sales_store
WHERE order_status = 'order finished'
AND YEAR(order_date) > 2011
GROUP BY years,
         product_sub_category,
         product_category
ORDER BY sales DESC;

-- 5. Customers Transactions per Year
SELECT
  YEAR(order_date) AS years,
  COUNT(DISTINCT customer) AS number_of_customer
FROM dqlab_sales_store
WHERE order_status = 'Order Finished'
GROUP BY years
ORDER BY years;