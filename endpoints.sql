
USE marketplaces;

-- Tabla temporal con la misma estructura que endpoints_v2
CREATE TEMPORARY TABLE tmp_endpoints LIKE endpoints_v2;

INSERT INTO tmp_endpoints (marketplace, endpoint, method, description, params, body, source_url) VALUES
('shopify', '/admin/api/2024-01/products.json', 'GET', 'Listar productos', 'limit, since_id, fields, vendor', '', 'https://shopify.dev/docs/api/admin-rest/latest/resources/product'),
('shopify', '/admin/api/2024-01/products.json', 'POST', 'Crear producto', '', '{\n  \"product\": {\n    \"title\": \"Burton Custom Freestyle 151\",\n    \"body_html\": \"<strong>Excelente tabla de snowboard!</strong>\",\n    \"vendor\": \"Burton\",\n    \"product_type\": \"Snowboard\"\n  }\n}', 'https://shopify.dev/docs/api/admin-rest/latest/resources/product'),
('shopify', '/admin/api/2024-01/products/{id}.json', 'PUT', 'Actualizar producto', '', '{\n  \"product\": {\n    \"id\": 632910392,\n    \"title\": \"Nuevo titulo del producto\"\n  }\n}', 'https://shopify.dev/docs/api/admin-rest/latest/resources/product'),
('shopify', '/admin/api/2024-01/orders.json', 'GET', 'Listar órdenes', 'limit, status, financial_status', '', 'https://shopify.dev/docs/api/admin-rest/latest/resources/product'),
('shopify', '/admin/api/2024-01/orders/{id}.json', 'GET', 'Obtener orden específica', '', '', 'https://shopify.dev/docs/api/admin-rest/latest/resources/product'),
('shopify', '/admin/api/2024-01/customers.json', 'GET', 'Listar clientes', 'limit, fields', '', 'https://shopify.dev/docs/api/admin-rest/latest/resources/product'),
('shopify', '/admin/api/2024-01/inventory_items.json', 'GET', 'Consultar artículos de inventario', '', '', 'https://shopify.dev/docs/api/admin-rest/latest/resources/product'),
('shopify', '/admin/api/2024-01/inventory_levels.json', 'GET', 'Consultar niveles de inventario', 'inventory_item_ids', '', 'https://shopify.dev/docs/api/admin-rest/latest/resources/product'),
('shopify', '/admin/api/2024-01/shop.json', 'GET', 'Datos de la tienda', 'fields', '', 'https://shopify.dev/docs/api/admin-rest/latest/resources/product'),
('walmart', '/v3/items', 'GET', 'Listar productos', 'limit, offset, lifecycleStatus', '', 'https://developer.walmart.com/doc/us/mp/items'),
('walmart', '/v3/items/{id}', 'GET', 'Obtener producto por ID', '', '', 'https://developer.walmart.com/doc/us/mp/items'),
('walmart', '/v3/inventory', 'GET', 'Consultar inventario por SKU', 'sku', '', 'https://developer.walmart.com/doc/us/mp/items'),
('walmart', '/v3/prices', 'PUT', 'Actualizar precio', '', '{\n  \"PriceHeader\": { \"version\": \"1.7\" },\n  \"Price\": [\n    {\n      \"sku\": \"SKU12345\",\n      \"pricing\": [\n        { \"currentPrice\": { \"amount\": 24.99, \"currency\": \"USD\" }, \"currentPriceType\": \"BASE\" }\n      ]\n    }\n  ]\n}', 'https://developer.walmart.com/doc/us/mp/items'),
('walmart', '/v3/orders', 'GET', 'Listar órdenes', 'limit, status, createdStartDate', '', 'https://developer.walmart.com/doc/us/mp/items'),
('walmart', '/v3/orders/{purchaseOrderId}/acknowledge', 'POST', 'Confirmar recepción de orden', '', '', 'https://developer.walmart.com/doc/us/mp/items'),
('walmart', '/v3/orders/{purchaseOrderId}/shipping', 'POST', 'Registrar envío de orden', '', '{\n  \"orderShipment\": {\n    \"orderLines\": {\n      \"orderLine\": [\n        {\n          \"lineNumber\": \"1\",\n          \"orderLineStatuses\": {\n            \"orderLineStatus\": [\n              {\n                \"status\": \"Shipped\",\n                \"statusQuantity\": { \"unitOfMeasurement\": \"EACH\", \"amount\": \"1\" },\n                \"trackingInfo\": {\n                  \"carrierName\": { \"carrier\": \"UPS\" },\n                  \"trackingNumber\": \"1Z999AA10123456784\"\n                }\n              }\n            ] \n          }\n        }\n      ]\n    }\n  }\n}', 'https://developer.walmart.com/doc/us/mp/items'),
('walmart', '/v3/orders/{purchaseOrderId}/cancel', 'POST', 'Cancelar líneas de orden', '', '{\n  \"orderLines\": {\n    \"orderLine\": [\n      {\n        \"lineNumber\": \"1\",\n        \"orderLineStatuses\": {\n          \"orderLineStatus\": [\n            { \"status\": \"Cancelled\", \"cancellationReason\": \"CUSTOMER_REQUESTED_CANCEL\" }\n          ]\n        }\n      }\n    ]\n  }\n}', 'https://developer.walmart.com/doc/us/mp/items'),
('walmart', '/v3/returns', 'GET', 'Listar devoluciones', 'limit, status', '', 'https://developer.walmart.com/doc/us/mp/items'),
('amazon', '/catalog/2022-04-01/items', 'GET', 'Buscar productos en catálogo', 'keywords, marketplaceIds', '', 'https://developer-docs.amazon.com/sp-api/docs/catalog-items-api-v2022-04-01-reference'),
('amazon', '/catalog/2022-04-01/items/{asin}', 'GET', 'Obtener producto por ASIN', 'marketplaceIds, includedData', '', 'https://developer-docs.amazon.com/sp-api/docs/catalog-items-api-v2022-04-01-reference'),
('amazon', '/listings/2021-08-01/items/{sellerId}/{sku}', 'GET', 'Obtener listing por SKU', 'marketplaceIds', '', 'https://developer-docs.amazon.com/sp-api/docs/catalog-items-api-v2022-04-01-reference'),
('amazon', '/fba/inventory/v1/summaries', 'GET', 'Resumen de inventario FBA', 'granularityType, marketplaceIds', '', 'https://developer-docs.amazon.com/sp-api/docs/catalog-items-api-v2022-04-01-reference'),
('amazon', '/orders/v0/orders', 'GET', 'Listar órdenes', 'CreatedAfter, OrderStatuses, MarketplaceIds', '', 'https://developer-docs.amazon.com/sp-api/docs/catalog-items-api-v2022-04-01-reference'),
('amazon', '/orders/v0/orders/{orderId}', 'GET', 'Obtener orden por ID', '', '', 'https://developer-docs.amazon.com/sp-api/docs/catalog-items-api-v2022-04-01-reference'),
('amazon', '/orders/v0/orders/{orderId}/orderItems', 'GET', 'Obtener ítems de una orden', 'NextToken', '', 'https://developer-docs.amazon.com/sp-api/docs/catalog-items-api-v2022-04-01-reference'),
('amazon', '/products/pricing/v0/price', 'GET', 'Consultar precio competitivo', 'MarketplaceId, ItemType', '', 'https://developer-docs.amazon.com/sp-api/docs/catalog-items-api-v2022-04-01-reference'),
('amazon', '/reports/2021-06-30/reports', 'POST', 'Crear reporte', '', '{\n  \"reportType\": \"GET_MERCHANT_LISTINGS_ALL_DATA\",\n  \"marketplaceIds\": [\"A1AM78C64UM0Y8\"],\n  \"dataStartTime\": \"2026-07-01T00:00:00Z\",\n  \"dataEndTime\": \"2026-07-22T00:00:00Z\"\n}', 'https://developer-docs.amazon.com/sp-api/docs/catalog-items-api-v2022-04-01-reference'),
('amazon', '/feeds/2021-06-30/feeds', 'POST', 'Enviar feed de datos masivos', '', '{\n  \"feedType\": \"POST_PRODUCT_DATA\",\n  \"marketplaceIds\": [\"A1AM78C64UM0Y8\"],\n  \"inputFeedDocumentId\": \"amzn1.tortuga.3.xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx\"\n}', 'https://developer-docs.amazon.com/sp-api/docs/catalog-items-api-v2022-04-01-reference'),
('amazon', '/sellers/v1/marketplaceParticipations', 'GET', 'Ver marketplaces del vendedor', '', '', 'https://developer-docs.amazon.com/sp-api/docs/catalog-items-api-v2022-04-01-reference'),
('vtex', '/api/catalog/pvt/product', 'GET', 'Listar productos por página', '_from, _to', '', 'https://developers.vtex.com/docs/api-reference/catalog-api'),
('vtex', '/api/catalog/pvt/product/{productId}', 'PUT', 'Actualizar producto', '', '{\n  \"Name\": \"Producto actualizado\",\n  \"IsActive\": true,\n  \"Description\": \"Descripcion actualizada del producto\"\n}', 'https://developers.vtex.com/docs/api-reference/catalog-api'),
('vtex', '/api/catalog/pvt/stockkeepingunit', 'POST', 'Crear SKU', '', '{\n  \"ProductId\": 123,\n  \"IsActive\": true,\n  \"Name\": \"SKU nuevo\",\n  \"RefId\": \"SKU-001\"\n}', 'https://developers.vtex.com/docs/api-reference/catalog-api'),
('vtex', '/api/logistics/pvt/inventory/skus/{skuId}', 'GET', 'Consultar inventario por SKU', '', '', 'https://developers.vtex.com/docs/api-reference/catalog-api'),
('vtex', '/api/logistics/pvt/inventory/skus/{skuId}/warehouses/{warehouseId}', 'PUT', 'Actualizar inventario en bodega', '', '{\n  \"unlimitedQuantity\": false,\n  \"quantity\": 50\n}', 'https://developers.vtex.com/docs/api-reference/catalog-api'),
('vtex', '/api/pricing/prices/{itemId}', 'GET', 'Consultar precio de producto', '', '', 'https://developers.vtex.com/docs/api-reference/catalog-api'),
('vtex', '/api/oms/pvt/orders', 'GET', 'Listar órdenes', 'f_status, orderBy', '', 'https://developers.vtex.com/docs/api-reference/catalog-api'),
('vtex', '/api/oms/pvt/orders/{orderId}/cancel', 'POST', 'Cancelar orden', '', '{\n  \"reason\": \"Solicitud del cliente\"\n}', 'https://developers.vtex.com/docs/api-reference/catalog-api'),
('vtex', '/api/catalog_system/pub/products/search', 'GET', 'Buscar productos (pública)', 'fq, ft, map', '', 'https://developers.vtex.com/docs/api-reference/catalog-api'),
('vtex', '/api/oms/pvt/orders/{orderId}/invoice', 'POST', 'Enviar factura de orden', '', '{\n  \"type\": \"Output\",\n  \"invoiceNumber\": \"12345\",\n  \"invoiceValue\": 199.90,\n  \"issuanceDate\": \"2026-07-22T00:00:00\",\n  \"items\": [\n    { \"id\": \"1\", \"price\": 199.90 }\n  ]\n}', 'https://developers.vtex.com/docs/api-reference/catalog-api');

-- Pasar a endpoints_v2 solo los que no existan todavía
INSERT INTO endpoints_v2 (marketplace, endpoint, method, description, params, body, source_url)
SELECT t.marketplace, t.endpoint, t.method, t.description, t.params, t.body, t.source_url
FROM tmp_endpoints t
WHERE NOT EXISTS (
    SELECT 1 FROM endpoints_v2 e
    WHERE e.marketplace = t.marketplace
      AND e.method = t.method
      AND e.endpoint = t.endpoint
);

DROP TEMPORARY TABLE tmp_endpoints;

