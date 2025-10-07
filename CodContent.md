# LINEAS Y EXPLICACIONES PARA SQL
## DETIENE EL CONTENEDOR
- docker stop mysql_container

## BORRA UN CONTENEDOR PERO EL CONTENEDOR DEBE ESTAR EN ESTADO STOP
- docker rm mysql_container

## CREA UN NUEVO CONTENEDOR
- docker run -e MYSQL_ROOT_PASSWORD=camper mysql:8.4.3
- docker run --name mysql_container -e MYSQL_ROOT_PASSWORD=camper -p 3309:3306 -d mysql:8.4.3
- --docker run --name (nombre_contenedor) -e MYSQL_ROOT_PASSWORD=(definir contraseña) -p (puertos del computador) -d (version de mysql)

## VER CONTENEDORES ACTIVOS
- docker ps
## VER TODOS LOS CONTENEDORES
- docker ps --all

## INICIO DE SESION DEL DOCKER
- docker login

## INICIALIZACION DE CONTENEDOR
- docker start mysql_container

## INGRESO AL CONTENEDOR
- docker exec -it mysql_container bash
- docker exec -it mysql_container mysql -u root -p
- docker exec -it mysql_container mysql -h localhost -u root -P 3309 -p
- --docker exec -it (nombre_contenedor) mysql -h localhost -u root -P 3309 -p

## TIPO DE RESTRICCION
- CHECK = CONDICIONAL >=<
- NULL = PUEDE TENER VALORES NULOS O SIN VALOR
- NOT NULL = NO PUEDE TENER VALORES NULOS O SIN VALOR
- UNIQUE = EL DATO ES UNICO Y NO SE PUEDE REPETIR

## INDICES
TIENDEN A SER DATOS UNICOS O LLAVES PRIMARIAS
### CREAR
- CREATE INDEX idx_nombretabla_atributo ON `NombreTabla`(atributo);
### BORRAR
- DROP INDEX idx_nombretabla_atributo ON `NombreTabla`;