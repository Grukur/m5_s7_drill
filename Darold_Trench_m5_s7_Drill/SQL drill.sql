
create table empresas(
	run  varchar(10) not null primary key,
	nombre varchar(120) not null,
	direccion varchar(120) not null,
	telefono varchar(15) not null,
	correo varchar(80) not null, 
	web varchar(50)	
);

create table clientes(
	run  varchar(10) not null primary key,
	nombre varchar(120) not null,
	correo varchar(80) not null, 
	direccion varchar(120) not null,
	telefono varchar(15) not null
);

create table herramientas(
	id numeric(12) not null primary key,
	nombre varchar(120) not null,
	precio_dia numeric(12) not null check(precio_dia >=0)
);

create table arriendos(
	folio numeric(12) not null primary key,
	fecha date default now(),
	dias numeric(5) not null, 
	valor_dia numeric(12) not null check(valor_dia >=0),
	garantia varchar(30) not null,
	id_herramienta numeric(12) not null references herramientas(id),
	id_cliente varchar(10) not null references clientes(run)
);

insert into empresas(run, nombre, direccion, telefono, correo, web)
values
('25555555-4', 
 'Alameda', 
 'calle juanco 21', 
 '912345678', 
 'soporte@alameda.cl', 
 'www.alameda.cl');
 
 insert into herramientas(id, nombre, precio_dia)
 values (1, 'martillo', 1000),
 (2, 'sierra', 1500),
 (3, 'taladro', 10000),
 (4, 'caladora', 15000),
 (5, 'rotomartillo', 25000);
 
 insert into clientes(run, nombre, correo, direccion, telefono)
 values ('10111222-3', 'Adolfo', 'adolfo@mail.com', 'calle 1', '211112222'),
 ('10111333-4', 'Bruno', 'bruno@mail.com', 'calle 2', '233332222'),
 ('10111444-5', 'Hugo', 'hugo@mail.com', 'calle 3', '244441111');

select * from clientes;
delete from clientes where run = '10111444-5';

delete from herramientas where id = 1;

insert into arriendos(folio, dias, valor_dia, garantia, id_herramienta, id_cliente)
values (1, 10, 25000, 'cheque por 100.000', 5, '10111444-5'),
(2, 15, 10000, 'tarjeta credito por 60000', 3, '10111444-5');

insert into arriendos(folio, dias, valor_dia, garantia, id_herramienta, id_cliente)
values (3, 15, 10000, 'tarjeta credito por 60000', 3, '10111222-3'),
(4, 15, 10000, 'tarjeta credito por 60000', 3, '10111222-3'),
(5, 10, 25000, 'cheque por 100.000', 5, '10111444-5'),
(6, 15, 10000, 'tarjeta credito por 60000', 3, '10111444-5');

update clientes set correo = 'adolfo_no_SS@mail.com' where run = '10111222-3';

select * from herramientas;

select * from arriendos where id_cliente = '10111333-4';

select * from clientes where nombre like 'A%';




-- 1. Listar los clientes sin arriendos por medio de una subconsulta.
select nombre from clientes where run not in (select id_cliente from arriendos)

--2. Listar todos los arriendos con las siguientes columnas: 
--   Folio, Fecha, Dias, valor_dia, NombreCliente, RutCliente. 
select folio, fecha, dias, valor_dia,
(select nombre from clientes 
 	where run = arriendos.id_cliente) as nombre, id_cliente as rut_cliente 
from arriendos

select * from arriendos a 
join clientes c
on c.run = a.id_cliente


-- 3. Clasificar los clientes según la siguiente tabla:
-- cant arriendos mensuales - clasificacion
-- 0 y 1 - bajo
-- 1 y 3 - medio
-- 3 o mas - alto
select * from clientes c
left join arriendos a
on a.id_cliente = c.run

-- resolvemos
select c.run, count(folio) as cantidad,

case
when count(folio) between 0 and 1 then 'bajo'
when count(folio) between 2 and 3 then 'medio'
when count(folio) > 3 then 'alto'
else 'sin clasificacion' 
end as clasificacion

from clientes c
left join arriendos a
on a.id_cliente = c.run
group by c.run


-- 4. Por medio de una subconsulta, listar los clientes con el nombre de la herramienta más 
--    arrendada.
select * from herramientas
select * from arriendos


select folio, fecha,
(select nombre from clientes c
 	where c.run = a.id_cliente) as nombre, 
(select nombre from herramientas h
 	where h.id = a.id_herramienta) as herramienta
from arriendos a
order by herramienta desc

select id_herramienta from arriendos
group by id_herramienta
order by count(*) desc limit 1

-- resolvemos
select folio, fecha,
(select nombre from clientes c
 	where c.run = a.id_cliente) as nombre, 
(select nombre from herramientas h
 	where h.id = a.id_herramienta) as herramienta
from arriendos a
where id_herramienta = (select id_herramienta from arriendos
group by id_herramienta
order by count(*) desc limit 1)


