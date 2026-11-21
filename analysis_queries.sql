-- 1. Analytical View: Sales, Net Profit & Product Refunds
CREATE OR REPLACE VIEW vw_sales_performance AS
SELECT 
    DATE(o.created_at) AS order_date,
    p.product_name,
    COUNT(DISTINCT o.order_id) AS total_orders,
    SUM(oi.price_usd) AS gross_revenue,
    SUM(oi.price_usd - oi.cogs_usd) AS net_profit,
    COALESCE(SUM(r.refund_amount_usd), 0) AS total_refunds
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
LEFT JOIN order_item_refunds r ON oi.order_item_id = r.order_item_id
GROUP BY 1, 2;

-- 2. Analytical View: Marketing Funnel & Channel Conversion
CREATE OR REPLACE VIEW vw_marketing_sessions AS
SELECT 
    DATE(ws.created_at) AS session_date,
    COALESCE(ws.utm_source, 'direct_or_organic') AS utm_source,
    ws.device_type,
    COUNT(DISTINCT ws.website_session_id) AS total_sessions,
    COUNT(DISTINCT o.order_id) AS converted_orders
FROM website_sessions ws
LEFT JOIN orders o ON ws.website_session_id = o.website_session_id
GROUP BY 1, 2, 3;

-- 3. Executive KPI Validation Check
SELECT 
    SUM(total_orders) AS total_orders,
    ROUND(SUM(gross_revenue), 2) AS gross_revenue,
    ROUND(SUM(net_profit), 2) AS net_profit,
    ROUND(SUM(total_refunds), 2) AS total_refunds
FROM vw_sales_performance;