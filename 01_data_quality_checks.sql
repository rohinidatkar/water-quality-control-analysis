-- Data quality checks (SQLite syntax; works with minor changes on SQL Server / MySQL)

-- 1. duplicate order ids
SELECT order_id, COUNT(*) AS n FROM sales GROUP BY order_id HAVING COUNT(*) > 1;

-- 2. missing or invalid values
SELECT * FROM sales
WHERE order_id IS NULL OR order_date IS NULL OR amount IS NULL OR amount <= 0 OR quantity <= 0;

-- 3. refunds with no matching sale (orphans)
SELECT r.* FROM refunds r LEFT JOIN sales s ON s.order_id = r.order_id WHERE s.order_id IS NULL;

-- 4. refund amount greater than the original sale
SELECT r.refund_id, r.order_id, r.refund_amount, s.amount
FROM refunds r JOIN sales s ON s.order_id = r.order_id
WHERE r.refund_amount > s.amount;

-- 5. refund dated before the sale
SELECT r.refund_id, r.order_id, r.refund_date, s.order_date
FROM refunds r JOIN sales s ON s.order_id = r.order_id
WHERE r.refund_date < s.order_date;
