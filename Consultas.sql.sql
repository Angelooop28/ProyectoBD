-- CONSULTA 1 HISTORICO EMPLEADOS
select 
empleado.id_empleado as empleado,
empleado.nombre_empleado as nombre,
empleado.apellido_empleado as apellido,
empleado.departamento_empleado as departamento,
empleado.contrato_empleado as contrato
from empleado
order by empleado.contrato_empleado asc 


-- CONSULTA 2 EMPLEADOS MOSTRAR SUS RANGOS
select
departamento.id_departamento as id_departamento,
departamento.cargo as cargo,
empleado.nombre_empleado as nombre,
contrato.fecha_contrato as fecha_decontrato,
contrato.sueldo_contrato as sueldo_contrato
from contrato
inner join departamento on departamento.id_departamento = departamento.id_departamento
inner join empleado on empleado.nombre_empleado = empleado.nombre_empleado
order by departamento.id_departamento asc

-- CONSULTA 3 PERSONAL TALENTO HUMANO 
select 
personal_Th.nombre, 
personal_th.apellido, 
horario.entrada as horario_entrada,
horario.salida as horario_salida,
horario.retraso as retraso
from horario
inner join personal_th on personal_th.id_personalth = personal_th.id_personalth


-- CONSULTA 4 SERVICIO PERMISOS
select
empleado.id_departamento as id_departamento,
empleado.nombre_empleado as nombre,
empleado.apellido_empleado as apellido,
servicio.permiso as permiso,
servicio.accidente_laboral as accidente_laboral,
servicio.enfermedad as enfermedad
from empleado
inner join servicio on servicio.enfermedad = servicio.enfermedad
order by servicio.enfermedad asc