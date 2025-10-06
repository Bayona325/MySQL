CREATE TABLE productos (
    id_producto INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    categoria VARCHAR(50),
    precio DECIMAL(10,2)
);

CREATE TABLE bodegas (
    id_bodega INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    ubicacion VARCHAR(100)
);

CREATE TABLE movimientos (
    id_movimiento INT AUTO_INCREMENT PRIMARY KEY,
    id_producto INT,
    id_bodega INT,
    tipo_movimiento ENUM('ENTRADA','SALIDA') NOT NULL,
    cantidad INT NOT NULL,
    fecha DATE NOT NULL,
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto),
    FOREIGN KEY (id_bodega) REFERENCES bodegas(id_bodega)
);

INSERT INTO productos (nombre, categoria, precio) VALUES
('Laptop HP', 'Tecnología', 3200000),
('Mouse Logitech', 'Accesorios', 80000),
('Monitor Samsung', 'Pantallas', 950000),
('Teclado Genius', 'Accesorios', 60000),
('Silla ergonómica', 'Muebles', 480000),
('Cable HDMI', 'Accesorios', 25000),
('Disco SSD 1TB', 'Tecnología', 420000),
('Impresora Epson', 'Oficina', 600000),
('Parlantes JBL', 'Audio', 380000),
('Webcam Logitech', 'Accesorios', 120000);

INSERT INTO bodegas (nombre, ubicacion) VALUES
('Central', 'Aguachica'),
('Norte', 'Bucaramanga'),
('Sur', 'Cúcuta'),
('Backup', 'Valledupar');

INSERT INTO movimientos (id_producto, id_bodega, tipo_movimiento, cantidad, fecha) VALUES
(1, 1, 'ENTRADA', 10, '2025-09-01'),
(1, 1, 'SALIDA', 3, '2025-09-03'),
(1, 2, 'ENTRADA', 5, '2025-09-04'),
(2, 1, 'ENTRADA', 20, '2025-09-01'),
(2, 1, 'SALIDA', 4, '2025-09-03'),
(3, 1, 'ENTRADA', 15, '2025-09-05'),
(3, 3, 'ENTRADA', 10, '2025-09-06'),
(3, 3, 'SALIDA', 2, '2025-09-10'),
(4, 1, 'ENTRADA', 12, '2025-09-02'),
(5, 2, 'ENTRADA', 8, '2025-09-03'),
(6, 1, 'ENTRADA', 15, '2025-09-04'),
(7, 1, 'ENTRADA', 6, '2025-09-02'),
(8, 3, 'ENTRADA', 7, '2025-09-05'),
(9, 1, 'ENTRADA', 5, '2025-09-02'),
(10, 2, 'ENTRADA', 10, '2025-09-06');

DESC productos;
create index idx_producto_nombre on productos(nombre);
select * from productos where nombre like 'Lap%';
DESC movimientos;
create index idx_mov_t on movimientos(tipo_movimiento, fecha);
select * from movimientos where tipo_movimiento-'ENTRADA' and fecha between '2025-09-01' and '2025-09-06';

create index idx_pro_nom_cat on productos(nombre, categoria);
select * from productos where nombre='Laptop HP' and categoria='Tecnología';

DESC bodegas;
create unique index idx_bodega_nombre on bodegas(nombre);

alter table productos add fulltext(nombre, categoria);

fulltext --solo sirve para campos de texto
select * from productos where nombre='Laptop HP' and categoria='Tecnología';

select * from productos where match(nombre, categoria) against('accesorios');
select * from bodegas where match(nombre, ubicacion) against('Aguachica');
alter table bodegas add fulltext(nombre, ubicacion);

show indexes;

change fulltext --(cambio)
modify
add
drop
notnull

create index idx_mov_tipo_fecha on movimientos(tipo_movimiento, fecha);

DESC productos;
DESC bodegas;
DESC movimientos;

select m.id_movimiento, p.nombre as productos, b.nombre as bodegas, m.tipo_movimiento, m.cantidad, m.fecha 
from movimientos m 
inner join productos p on m.id_producto = p.id_producto
inner join bodegas b on m.id_bodega = b.id_bodega
order by b.nombre;

select b.nombre, m.id_movimiento, m.tipo_movimiento as bodegas
from movimientos m  
left join bodegas b on m.id_bodega = b.id_bodega;

select p.nombre as productos, m.tipo_movimiento, m.cantidad
from movimientos m  
right join productos p on m.id_producto = p.id_producto;

select p.nombre as productos, b.nombre as bodegas, m.tipo_movimiento
from movimientos m  
left join productos p on m.id_producto = p.id_producto
left join bodegas b on m.id_bodega = b.id_bodega
UNION select p.nombre as productos, b.nombre as bodegas, m.tipo_movimiento
from movimientos m
right join productos p on m.id_producto = p.id_producto
right join bodegas b on m.id_bodega = b.id_bodega;
