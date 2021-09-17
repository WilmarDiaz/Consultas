use Consultas
GO

/* Llenar catalogos */

delete from especialistas
delete from tipoconsulta
delete from estadoconsulta

insert estadoconsulta(id,estado)
values(1,'Ocupada')
insert estadoconsulta(id,estado)
values(2,'Desocupada')
insert estadoconsulta(id,estado)
values(3,'En espera de atención')

insert tipoconsulta(id,tipo)
values(1,'Pediatría')
insert tipoconsulta(id,tipo)
VALUES(2,'Urgencias')
insert tipoconsulta(id,tipo)
VALUES(3,'Medicina integral MI')

insert especialistas(id,idtipoconsulta,nombre)
values(1,1,'Esp. pediatría')
insert especialistas(id,idtipoconsulta,nombre)
values(2,2,'Esp. urgencias')
insert especialistas(id,idtipoconsulta,nombre)
values(3,3,'Esp. medicina integral')



