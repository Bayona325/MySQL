CREATE DATABASE IF NOT EXISTS `ecommerce_zapatos`;

USE `ecommerce_zapatos`;

CREATE TABLE `Usuarios` (
    `usuario_id` int NOT NULL AUTO_INCREMENT,
    `nombre` varchar(50) DEFAULT NULL,
    `apellido` varchar(50) DEFAULT NULL,
    `correo` varchar(50) DEFAULT NULL,
    PRIMARY KEY (`usuario_id`)
);

CREATE TABLE `Pedidos` (
    `pedido_id` int NOT NULL AUTO_INCREMENT,
    `usuario_id` int DEFAULT NULL,
    `fecha_pedido` date DEFAULT NULL,
    `total` decimal(10,2) DEFAULT NULL,
    PRIMARY KEY (`pedido_id`),
    KEY `usuario_id` (`usuario_id`),
    CONSTRAINT `Pedidos_idfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `Usuarios` (`usuario_id`)
);


INSERT INTO `Usuarios`(`correo`,`apellido`,`nombre`) VALUES
('adrian@gmail.com', 'Bayona', 'Adrian'),
('daniel@gmail.com', 'Torres', 'Daniel'),
('alexa@gmail.com', 'Gimenez', 'Alexa'),
('sebastian@gmail.com', 'Larrota', 'Sebastian'),
('camila@gmail.com', 'Duarte', 'Camila');

SELECT * FROM `Usuarios`;

INSERT INTO `Pedidos`(`usuario_id`,`fecha_pedido`,`total`) VALUES
(1, '2023-10-01', 150.00),
(3, '2023-10-02', 200.00),
(2, '2023-10-03', 50.25),
(4, '2023-10-04', 300.40),
(5, '2023-10-05', 120.00),
(6, '2023-10-06', 80.90);

SELECT * FROM `Pedidos`;

CREATE TABLE `Productos`(
    `producto_id` INT AUTO_INCREMENT,
    `nombre` VARCHAR(50) NOT NULL,
    `precio_unitario` DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    `precio_venta` DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    PRIMARY KEY (`producto_id`)
);

CREATE TABLE `PedidoProducto`(
    `id` INT NOT NULL AUTO_INCREMENT,
    `pedido_id` INT NOT NULL,
    `producto_id` INT NOT NULL,
    `cantidad` INT NOT NULL DEFAULT 1,
    PRIMARY KEY(`id`)
);

ALTER TABLE `PedidoProducto` ADD FOREIGN KEY(`pedido_id`) REFERENCES `Pedidos`(`pedido_id`);
ALTER TABLE `PedidoProducto` ADD FOREIGN KEY(`producto_id`) REFERENCES `Productos`(`producto_id`);

ALTER TABLE `PedidoProducto` ADD CONSTRAINT `Productos_producto_id_fk` FOREIGN KEY(`producto_id`) REFERENCES `Productos`(`producto_id`);

INSERT INTO `Productos`(`nombre`, `precio_unitario`, `precio_venta`) VALUES
('Zapato Deportivo', 75.00, 90.00),
('Zapato Casual', 60.00, 75.00),
('Bota de Cuero', 120.00, 150.00),
('Sandalia', 40.00, 55.00),
('Zapato Formal', 100.00, 130.00),
('Tenis', 80.00, 100.00),
('Mocasin', 70.00, 85.00),
('Botin', 110.00, 140.00),
('Zapatilla', 50.00, 65.00),
('Alpargata', 30.00, 45.00);

SELECT * FROM `Productos`;