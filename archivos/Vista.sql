use covid19;
drop view Alumno2172002801;    
create view Alumno2172002801 as
	select idRegistro,idPaciente as "paciente", pacienteEdad as "Edad",sexo,paisNombre as 'PaisdeOrigen',nacionalidadNombre as 'Nacionalidad', 
	entidad.entidadNombre as 'EntidadNacimiento', e.entidadNombre as 'EntidadResidencia', municipioNombre as 'MunicipioResidencia',
	migrante.opcionNombre as 'Migrante', indigena.opcionNombre as 'LenguaIndigena', 
    neu.opcionNombre as 'Neumonia', dia.opcionNombre as 'Diabetes', epoc.opcionNombre'EPOC', asma.opcionNombre as 'Asma',
    inmu.opcionNombre as 'Inmunosupresion', hiper.opcionNombre as 'Hipertension', cro.opcionNombre as 'EnfermedadesCronicasOtras',
    card.opcionNombre as 'EnfermedadesCardiovasculares', obs.opcionNombre as 'Obesidad', ins.opcionNombre as 'InsuficienciaRenalCronica', tab.opcionNombre as 'Tabaquismo',
    tipoPacienteNombre as 'TipodePaciente', fechaActualizacion, FechaIngreso,FechaSintomas,FechaDefuncion, origenRegistroNombre as 'Origen',
    intu.opcionNombre as 'Intubado', contacto.opcionNombre as 'ContactoConOtrosCasos', cuin.opcionNombre as 'CuidadoaIntensivos',
    resultadoDescripcion as 'ResultadoPrueba',sectorNombre as 'Sector', um.entidadNombre as 'EntidadUnidadMedica'
    from registro
		inner join paciente
			using(idPaciente)
		inner join sexo 
			using(idSexo)
		inner join pais
			on pais.idPais = paciente.idPaisOrigen
		inner join nacionalidad 
			using(idNacionalidad)
		inner join entidad 
			on entidad.idEntidad = paciente.idEntidadNacimiento
		inner join entidad e
			on e.idEntidad = paciente.idEntidadResidencia
		inner join municipio 
			on municipio.idMunicipio = paciente.idMunicipioResidencia
		inner join opcion migrante
			on migrante.idOpcion = paciente.idMigrante
		inner join opcion indigena
			on indigena.idOpcion = paciente.idLenguaIndigena
		inner join padecimientos
			using(idPaciente)
		inner join opcion neu
			on neu.idOpcion = padecimientos.idNeumonia
		inner join opcion dia
			on dia.idOpcion = padecimientos.idDiabetes
		inner join opcion epoc
			on epoc.idOpcion = padecimientos.idEPOC
		inner join opcion asma
			on asma.idOpcion = padecimientos.idAsma
		inner join opcion inmu
			on inmu.idOpcion = padecimientos.idInmunosupresion
		inner join opcion hiper
			on hiper.idOpcion = padecimientos.idHipertension
		inner join opcion cro
			on cro.idOpcion = padecimientos.idEnfermedadesCronicasOtras
		inner join opcion card
			on card.idOpcion = padecimientos.idEnfermedadesCardiovasculares
		inner join opcion obs
			on obs.idOpcion = padecimientos.idObesidad
		inner join opcion ins
			on ins.idOpcion = padecimientos.idInsuficienciaRenalCronica
		inner join opcion tab
			on tab.idOpcion = padecimientos.idTabaquismo
		inner join tipopaciente
			on tipopaciente.idTipoPaciente = registro.idTipoPaciente
		inner join origenregistro
			on origenregistro.idOrigenRegistro = registro.idOrigenRegistro
		inner join opcion intu
			on intu.idOpcion = registro.idIntubado
		inner join opcion contacto
			on contacto.idOpcion = registro.idContactoConOtroCaso
		inner join opcion cuin
			on cuin.idOpcion = registro.idIngresoCuidadosIntensivos
		inner join resultadoprueba
			on resultadoprueba.idResultadoPrueba = registro.idResultadoPrueba
		inner join sector
			on sector.idSector = registro.idSectorProveniente
		inner join entidad um
			on um.idEntidad = registro.idEntidadUnidadMedica;