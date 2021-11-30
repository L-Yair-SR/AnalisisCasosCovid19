/*Luis Yaír Sánchez Rodríguez
 2172002801
*/
alter table registro change FechaDefuncion Defuncion int;
update registro set Defuncion = 1 where Defuncion !=0;  

Drop view Al2172002801;
create view Al2172002801 as
select pacienteEdad as "Edad",idSexo as "Sexo",idPaisOrigen as 'PaisdeOrigen',idNacionalidad as 'Nacionalidad', 
	idEntidadNacimiento as 'EntidadNacimiento', idEntidadResidencia as 'EntidadResidencia', idMunicipioResidencia as 'MunicipioResidencia',
	idMigrante as 'Migrante', idLenguaIndigena as 'LenguaIndigena', 
    idNeumonia as 'Neumonia', idDiabetes as 'Diabetes', idEPOC as'EPOC', idAsma as 'Asma',
    idInmunosupresion as 'Inmunosupresion', idHipertension as 'Hipertension', idEnfermedadesCronicasOtras as 'EnfermedadesCronicasOtras',
    idEnfermedadesCardiovasculares as 'EnfermedadesCardiovasculares', idObesidad as 'Obesidad', idInsuficienciaRenalCronica as 'InsuficienciaRenalCronica', idTabaquismo as 'Tabaquismo',
    idTipoPaciente as 'TipodePaciente', Defuncion, idOrigenRegistro as 'Origen',
    idIntubado as 'Intubado', idContactoConOtroCaso as 'ContactoConOtrosCasos', idIngresoCuidadosIntensivos as 'CuidadoaIntensivos',
    idResultadoPrueba as 'ResultadoPrueba',idSectorProveniente as 'Sector', idEntidadUnidadMedica as 'EntidadUnidadMedica'
    from registro
		inner join paciente
			using(idPaciente)
		inner join padecimientos
			using(idPaciente);

Drop view muertos;                      
create view muertos as
Select pacienteEdad as "Edad",idSexo as "Sexo", 
idNeumonia as 'Neumonia', idDiabetes as 'Diabetes', idEPOC as'EPOC', idAsma as 'Asma',
idInmunosupresion as 'Inmunosupresion', idHipertension as 'Hipertension', idEnfermedadesCronicasOtras as 'EnfermedadesCronicasOtras',
idEnfermedadesCardiovasculares as 'EnfermedadesCardiovasculares', idObesidad as 'Obesidad', idInsuficienciaRenalCronica as 'InsuficienciaRenalCronica', idTabaquismo as 'Tabaquismo'
from registro
		inner join paciente
			using(idPaciente)
		inner join padecimientos
			using(idPaciente)
where Defuncion = 1;

Drop view IntensoPositivo;
create view IntensoPositivo as
select pacienteEdad as "Edad",idSexo as "Sexo",idPaisOrigen as 'PaisdeOrigen',idNacionalidad as 'Nacionalidad', 
	idEntidadNacimiento as 'EntidadNacimiento', idEntidadResidencia as 'EntidadResidencia', idMunicipioResidencia as 'MunicipioResidencia',
	idMigrante as 'Migrante', idLenguaIndigena as 'LenguaIndigena'
    from registro
		inner join paciente
			using(idPaciente)
	where idIngresoCuidadosIntensivos = (select idOpcion from opcion where opcionNombre = "Si")
    and  idResultadoPrueba = (select idResultadoPrueba from resultadoprueba where resultadoDescripcion = "Positivo");

drop function entidadMortal;
Delimiter //
create function entidadMortal() returns varchar(100)
begin
	declare mortal varchar(100);
    declare maximo int;
    SELECT idEntidadResidencia into maximo 
	FROM registro
        inner join paciente
			using(idPaciente)
	where Defuncion = 1 group by idEntidadResidencia
	having count(*) = (
	select MAX(casos) max_casos
    from (select idEntidadResidencia, COUNT(idEntidadResidencia) casos
    FROM registro
        inner join paciente
			using(idPaciente)
	where Defuncion = 1 group by idEntidadResidencia) T
	);
    Select entidadNombre into mortal from Entidad where idEntidad = maximo;
    return mortal;
end 
//

select entidadMortal();
