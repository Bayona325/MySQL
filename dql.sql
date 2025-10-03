USE `ecommerce_zapatos`;
SELECT `pedido_id`, `producto_id`, `cantidad` FROM `PedidoProductoCompuesta`
WHERE `pedido_id` = 1;

SELECT * FROM `Usuarios`;
SELECT * FROM `Pedidos`;
SELECT * FROM `PedidoProducto`
WHERE `pedido_id` = 1;

SELECT `pedido_id`, `producto_id`, `cantidad` FROM `PedidoProducto`
WHERE `pedido_id` = 1;



SELECT u.*, p.*
FROM `Usuarios` as u, `Pedidos` p
WHERE u.usuario_id = p.usuario_id;

SELECT u.correo, p.fecha_pedido, p.pedido_id, pr.nombre, pr.precio_unitario, pr.precio_venta, pp.cantidad
FROM `Usuarios` as u
INNER JOIN `Pedidos` p ON u.usuario_id = p.usuario_id
INNER JOIN `PedidoProducto` pp ON pp.pedido_id = pp.pedido_id
INNER JOIN `Productos` pr ON pr.producto_id = pr.producto_id;