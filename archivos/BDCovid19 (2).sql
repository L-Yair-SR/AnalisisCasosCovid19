drop schema covid19;

-- BASE DE DATOS
create database COVID19;
use COVID19;

-- TABLA OrigenRegistro
create table OrigenRegistro (
	idOrigenRegistro int auto_increment not null, 
    origenRegistroNombre varchar(250),
    primary key(idOrigenRegistro)    
);

-- TABLA Sector
create table Sector(
	idSector int auto_increment not null, 
    sectorNombre varchar(250),
    primary key(idSector)    
);

-- TABLA Entidad
create table Entidad (
	idEntidad int auto_increment not null, 
    entidadNombre varchar(250),
    primary key(idEntidad)    
);

-- TABLA Municipio
create table Municipio (
	idMunicipio int auto_increment not null, 
    municipioNombre varchar(50),
    entidad int,
    primary key(idMunicipio),
    constraint fkEntidad foreign key (entidad) references Entidad (idEntidad)
);

-- TABLA Sexo
create table Sexo (
	idSexo int auto_increment not null, 
    sexo char,
    sexoDescripcion varchar(255) default 'Sexo o genero ',
    primary key(idSexo)    
);

-- TABLA TipoPaciente
create table TipoPaciente (
	idTipoPaciente int auto_increment not null, 
    tipoPacienteNombre varchar(30),
    primary key(idTipoPaciente)    
);

-- TABLA Opciones
create table Opcion (
	idOpcion int auto_increment not null, 
    opcionNombre varchar(15),
    opcionDescripcion varchar(150),
    primary key(idOpcion)    
);

-- ResultadoPrueba
create table ResultadoPrueba (
	idResultadoPrueba int auto_increment not null, 
    resultadoDescripcion varchar(100),
    primary key(idResultadoPrueba)    
);

-- TABLA Nacionalidad
create table Nacionalidad (
	idNacionalidad int auto_increment not null, 
    nacionalidadNombre varchar(250),
    primary key(idNacionalidad)    
);

-- TABLA Pais
create table Pais (
	idPais int auto_increment not null, 
    paisNombre varchar(255),
    primary key(idPais)    
);

-- TABLA Paciente
create table Paciente (
	idPaciente int auto_increment not null, 
	pacienteEdad int,
    -- FK
    idSexo int,
    idEntidadNacimiento int,
	idEntidadResidencia int,
    idMunicipioResidencia int,
    idNacionalidad int,
    idMigrante int,
    idPaisOrigen int,
    idLenguaIndigena int,
    -- LLAVE PRIMARIA 
    primary key (idPaciente),
    -- LLAVES FORANEAS
    constraint FkSexo foreign key (idSexo) references Sexo(idSexo),
    constraint FkEntidadNacimiento foreign key (idEntidadNacimiento) references Entidad(idEntidad),
    constraint FkEntidadResidencia foreign key (idEntidadResidencia) references Entidad(idEntidad),
    constraint FkMunicipioResidencia foreign key (idMunicipioResidencia) references Municipio(idMunicipio),
    constraint FkNacionalidad foreign key (idNacionalidad) references Nacionalidad(idNacionalidad),
    constraint FkMigrante foreign key (idMigrante) references Opcion(idOpcion),
    constraint FkPaisOrigen foreign key (idPaisOrigen) references Pais(idPais),
    constraint FkLenguaIndigena foreign key (idLenguaIndigena) references Opcion(idOpcion)
);



-- LA TABLA Padecimientos
create table Padecimientos (
	idPadecimientos int auto_increment not null, 
    -- Las que seran FK
    idPaciente int,
    idNeumonia int,
    idDiabetes int,
    idEPOC int,
	idAsma int,
    idInmunosupresion int,
    idHipertension int,
    idEnfermedadesCronicasOtras int,
    idEnfermedadesCardiovasculares int,
    idObesidad int,
    idInsuficienciaRenalCronica int,
    idTabaquismo int,
    -- LLAVE PRIMARIA 
    primary key (idPadecimientos),
    -- LLAVES FORANEAS
    constraint FkPacientePadecimiento foreign key (idPaciente) references Paciente(idPaciente),
    constraint FkNeumonia foreign key (idNeumonia) references Opcion(idOpcion),
    constraint FkDiabetes foreign key (idDiabetes) references Opcion(idOpcion),
    constraint FKEPOC foreign key (idEPOC) references Opcion(idOpcion),
    constraint FkAsma foreign key (idAsma) references Opcion(idOpcion),
    constraint FkInmunopresion foreign key (idInmunosupresion) references Opcion(idOpcion),
    constraint FkHipertension foreign key (idHipertension) references Opcion(idOpcion),
    constraint FkEnfermedadesCronicasOtras foreign key (idEnfermedadesCronicasOtras) references Opcion(idOpcion),
    constraint FkEnfermedadesCardiovasculares foreign key (idEnfermedadesCardiovasculares) references Opcion(idOpcion),
	constraint FkObesidad foreign key (idObesidad) references Opcion(idOpcion),
    constraint FkInsuficienciaRenalCronica foreign key (idInsuficienciaRenalCronica) references Opcion(idOpcion),
    constraint FkTabaquismo foreign key (idTabaquismo) references Opcion(idOpcion)
);






-- TABLA Registro
create table Registro (
	idRegistro int auto_increment not null, 
    -- FK de paciente
    idPaciente int,
    idTipoPaciente int,			
    -- fechas
    FechaActualizacion date,
    FechaIngreso date,
    FechaSintomas date,
    FechaDefuncion date,
    -- FK
    idOrigenRegistro int,
    idIntubado int,
    idContactoConOtroCaso int,
	idIngresoCuidadosIntensivos int,
    idResultadoPrueba int,
    idSectorProveniente int,
    idEntidadUnidadMedica int,
    -- LLAVE PRIMARIA 
    primary key (idRegistro),
    -- LLAVES FORANEAS
    constraint FkDatosCasoPaciente foreign key (idPaciente) references Paciente(idPaciente),
    constraint FkTipoPaciente foreign key (idTipoPaciente) references TipoPaciente(idTipoPaciente),
    constraint FkOrigenRegistro foreign key (idOrigenRegistro) references OrigenRegistro(idOrigenRegistro),
    constraint FkIntubado foreign key (idIntubado) references Opcion(idOpcion),
    constraint FkContactoConOtroCaso foreign key (idContactoConOtroCaso) references Opcion(idOpcion),
    constraint FkIngresoCuidadosIntensivos foreign key (idIngresoCuidadosIntensivos) references Opcion(idOpcion),
    constraint FkResultadoPrueba foreign key (idResultadoPrueba) references ResultadoPrueba(idResultadoPrueba),
    constraint FkSectorProveniente foreign key (idSectorProveniente) references Sector(idSector),
    constraint FkEntidadUnidadMedica foreign key (idEntidadUnidadMedica) references Entidad(idEntidad)
);




-- Llenado Tabla Origen

INSERT INTO OrigenRegistro (origenRegistroNombre) VALUES ('USMER'),('NO USMER');
INSERT INTO OrigenRegistro VALUES (99,'NO ESPECIFICADO');

-- select * from OrigenRegistro;
-- Tabla sector 
INSERT INTO Sector(sectorNombre) VALUES('CRUZ ROJA');
INSERT INTO Sector(sectorNombre) VALUES('DIF');
INSERT INTO Sector(sectorNombre) VALUES('ESTATAL');
INSERT INTO Sector(sectorNombre) VALUES('IMSS');
INSERT INTO Sector(sectorNombre) VALUES('IMSS BIENESTAR');
INSERT INTO Sector(sectorNombre) VALUES('ISSSTE');
INSERT INTO Sector(sectorNombre) VALUES('MUNICIPAL');
INSERT INTO Sector(sectorNombre) VALUES('PEMEX.');
INSERT INTO Sector(sectorNombre) VALUES('PRIVADA');
INSERT INTO Sector(sectorNombre) VALUES('SEDENA');
INSERT INTO Sector(sectorNombre) VALUES('SEMAR');
INSERT INTO Sector(sectorNombre) VALUES('SSA');
INSERT INTO Sector(sectorNombre) VALUES('UNIVERSITARIO');
INSERT INTO Sector VALUES (99,'NO ESPECIFICADO');

-- Tablas resultado Prueba
insert into ResultadoPrueba  (idResultadoPrueba, resultadoDescripcion) values (null,'Positivo'),(null,'No positivo'),(null,'Resultado Pendiente');

-- Tabla nacionaclidad
insert into nacionalidad values(NULL, "MEXICANA");
insert into nacionalidad values(NULL, "EXTRANJERA");
insert into nacionalidad values(99, "NO ESPECIFICADO");


-- Tabla TipoPaciente
INSERT INTO TipoPaciente(tipoPacienteNombre) VALUE ("AMBULATORIO");
INSERT INTO TipoPaciente(tipoPacienteNombre) VALUE ("HOSPITALIZADO");
INSERT INTO TipoPaciente(tipoPacienteNombre) VALUE ("NO ESPECIFICADO (99)");

-- Tabla opcion
-- SENTENCIA PARA CAMBIAR TAMAÑO DE COLUMNA PORQUE NO CABE UN NOMBRE

ALTER TABLE Opcion MODIFY opcionNombre VARCHAR(20);


-- SENTENCIA PARA INSERTAR REGISTROS

insert into Opcion (opcionNombre, opcionDescripcion) values  ('SI','LA INFORMACIÓN RECABADA DEL PACIENTE DEMUESTRA QUE SI PRESENTA ESTA CONDICIÓN.'),  
('NO','LA INFORMACIÓN RECABADA DEL PACIENTE DEMUESTRA QUE NO PRESENTA ESTA CONDICIÓN.');
insert into opcion values (97,'NO APLICA ','EL PACIENTE NO APLICA PARA ESTA CONDICIÓN.'),  
					(98,'SE IGNORA','SE DESCONOCE LA INFORMACIÓN ACERCA DEL PACIENTE PARA DETERMINAR SI PRESENTA ESTA CONDICIÓN.'), 
                    (99,'NO ESPECIFICADO','EL PACIENTE NO PRESENTA INFORMACIÓN ACERCA DE ESTA CONDICIÓN.');


select * from sexo;
-- Sexo

insert into sexo values  (NULL,'M',"Mujer"),(NULL, 'H',"Hombre"),(99, 'N',"Se distinguen solo dos generos para fines de registro");


-- ------------------------------------Pais 
-- 1-10
insert into pais values (null, 'México');
insert into pais values (null, 'Estados Unidos');
insert into pais values (null, 'Canada');
insert into pais values (null, 'Alemania');
insert into pais values (null, 'Hungría');
insert into pais values (null, 'España');
insert into pais values (null, 'Republica de panama');
insert into pais values (null, 'Colombia');
insert into pais values (null, 'Venezuela');
insert into pais values (null, 'Francia');


-- 11-20
INSERT INTO pais(idpais, paisNombre) VALUES (null,"Cuba");
INSERT INTO pais(idpais, paisNombre) VALUES (null,"Ecuador");
INSERT INTO pais(idpais, paisNombre) VALUES (null,"Bolivia");
INSERT INTO pais(idpais, paisNombre) VALUES (null,"Nicaragua");
INSERT INTO pais(idpais, paisNombre) VALUES (null,"Peru");
INSERT INTO pais(idpais, paisNombre) VALUES (null,"Gran Bretaña");
INSERT INTO pais(idpais, paisNombre) VALUES (null,"Japon");
INSERT INTO pais(idpais, paisNombre) VALUES (null,"Macao");
INSERT INTO pais(idpais, paisNombre) VALUES (null,"Australia");
INSERT INTO pais(idpais, paisNombre) VALUES (null,"Hati"); 
-- 21 a 30
-- Inserción pais a covid19
insert into pais values (NULL, "Italia");
insert into pais values (NULL, "Chile");
insert into pais values (NULL, "El Salvador");
insert into pais values (NULL, "Argentina");
insert into pais values (NULL, "Republica de Honduras");
insert into pais values (NULL, "Guatemala");
insert into pais values (NULL, "Rusia");
insert into pais values (NULL, "China");
insert into pais values (NULL, "Egipto");
insert into pais values (NULL, "Brasil");

-- 31 a 40
insert into pais values (NULL, "Camerun");
insert into pais values (NULL, "Israel");
insert into pais values (NULL, "Suizar");
insert into pais values (NULL, "Libia");
insert into pais values (NULL, "Dinamarca");
insert into pais values (NULL, "India");
insert into pais values (NULL, "Respublica democratica del congo");
insert into pais values (NULL, "Republica de corea");
insert into pais values (NULL, "Filipinas");
insert into pais values (NULL, "Republica de costa rica");

-- 41--50
insert into pais values (NULL, "Malasia");
insert into pais values (NULL, "Zona Neutral");
insert into pais values (NULL, "Belice");
insert into pais values (NULL, "Republica Dominicana");
insert into pais values (NULL, "Indonesia");
insert into pais values (NULL, "Bosnia y Herzegovina");
insert into pais values (NULL, "Suecia");
insert into pais values (NULL, "Nueva Zelanda");
insert into pais values (NULL, "Argelia");
insert into pais values (NULL, "Grecia");


-- 51-60

INSERT INTO Pais VALUES (NULL,'Ghana'), (NULL,'Republica oriental del Uruguay'), (NULL,'Archipielago de Svalbard'), (NULL,'Ucrania'), (NULL,'Letonia'), (NULL,'Irlanda'), (NULL,'Commonwealth de Dominica'), (NULL,'Eslovaquia'), (NULL,'Republica de Angola'), (NULL,'Eslovenia');

-- 61 70
insert into pais values (NULL, "Eritrea");
insert into pais values (NULL, "Holanda");
insert into pais values (NULL, "Polonia");
insert into pais values (NULL, "Noruega");
insert into pais values (NULL, "Micronesia");
insert into pais values (NULL, "Rumania");
insert into pais values (NULL, "Finlandia");
insert into pais values (NULL, "Turquia");
insert into pais values (NULL, "Belgica");
insert into pais values (NULL, "Islas virgenes");


-- 71-80
insert into Pais(PaisNombre) values ("Republica de Guyana"), ("Congo"), ("Iran"), ("Bangladesh"), ("Islandia"), ("Trieste"), ("Costa de Marfil"), ("Portugal"), ("Republica Checa"), ("Zimbabwe"); 

-- 81 -90
insert into pais values (Null, "Ascension");
insert into pais values (Null, "República democrática de Corea");
insert into pais values (Null, "Austria");
insert into pais values (Null, "Libano");
insert into pais values (Null, "Paraguay");
insert into pais values (Null, "República de Mauricio");
insert into pais values (Null, "Principado de Mónaco");
insert into pais values (Null, "Pakistán");
insert into pais values (Null, "Taiwan");
insert into pais values (Null, "Jamaica");

-- 91 a 99

INSERT INTO `covid19`.`pais` (`paisNombre`) VALUES ('Vietnam');-- 91
INSERT INTO `covid19`.`pais` (`paisNombre`) VALUES ('Siria');-- 92
INSERT INTO `covid19`.`pais` VALUES (98,'Se desconoce');-- 98
INSERT INTO `covid19`.`pais` VALUES (99,'Otro');-- 99

-- Tabla entidad 
-- 1 a 10
insert into entidad (entidadNombre) values ('AGUASCALIENTES');
insert into entidad (entidadNombre) values ('BAJA CALIFORNIA');
insert into entidad (entidadNombre) values ('BAJA CALIFORNIA SUR');
insert into entidad (entidadNombre) values ('CAMPECHE');
insert into entidad (entidadNombre) values ('COAHUILA DE ZARAGOZA');
insert into entidad (entidadNombre) values ('COLIMA');
insert into entidad (entidadNombre) values ('CHIAPAS');
insert into entidad (entidadNombre) values ('CHIHUAHUA');
insert into entidad (entidadNombre) values ('CIUDAD DE MÉXICO');
insert into entidad (entidadNombre) values ('DURANGO');


-- 11-20

insert into entidad (entidadNombre) values ('Guanajuato');
insert into entidad (entidadNombre) values ('Guerrero');
insert into entidad (entidadNombre) values ('Hidalgo');
insert into entidad (entidadNombre) values ('Jalisco');
insert into entidad (entidadNombre) values ('México');
insert into entidad (entidadNombre) values ('Michoacán de Ocampo');
insert into entidad (entidadNombre) values ('Morelos');
insert into entidad (entidadNombre) values ('Nayarit');
insert into entidad (entidadNombre) values ('Nuevo León');
insert into entidad (entidadNombre) values ('Oaxaca');
-- 21-30
insert into entidad (idEntidad,entidadNombre) values (null,'Puebla'),(null,'Queretaro'),(null,'Quintana Roo'),(null,'San Luis Potosi'),(null,'Sinaloa'),(null,'Sonora'),(null,'Tabasco'),(null,'Tamaulipas'),(null,'Tlaxcala'),(null,'Veracruz de Ignacio de la llave'),(null,'Yucatan'),(null,'Zacatecas');
insert into entidad values (36,'Estados Unidos Mexicanos');
-- 97,98 y 99
INSERT INTO Entidad values (97,'NO APLICA'); 
INSERT INTO Entidad values (98,'SE IGNORA');
INSERT INTO Entidad values (99,'NO ESPECIFICADO');

-- Municipios 
-- 1 al 113
INSERT INTO Municipio(municipioNombre,entidad) VALUES
('AGUASCALIENTES',1),
('ASIENTOS',1),
('CALVILLO',1),
('COSÍO',1),
('JESÚS MARÍA',1),
('PABELLÓN DE ARTEAGA',1),
('RINCÓN DE ROMOS',1),
('SAN JOSÉ DE GRACIA',1),
('TEPEZALÁ',1),
('EL LLANO',1),
('SAN FRANCISCO DE LOS ROMO',1),
('NO ESPECIFICADO',1),
('ENSENADA',2),
('MEXICALI',2),
('TECATE',2),
('TIJUANA',2),
('PLAYAS DE ROSARITO',2),
('NO ESPECIFICADO',2),
('COMONDÚ',3),
('MULEGÉ',3),
('LA PAZ',3),
('LOS CABOS',3),
('LORETO',3),
('NO ESPECIFICADO',3),
('CALKINÍ',4),
('CAMPECHE',4),
('CARMEN',4),
('CHAMPOTÓN',4),
('HECELCHAKÁN',4),
('HOPELCHÉN',4),
('PALIZADA',4),
('TENABO',4),
('ESCÁRCEGA',4),
('CALAKMUL',4),
('CANDELARIA',4),
('NO ESPECIFICADO',4),
('ABASOLO',5),
('ACUÑA',5),
('ALLENDE',5),
('ARTEAGA',5),
('CANDELA',5),
('CASTAÑOS',5),
('CUATRO CIÉNEGAS',5),
('ESCOBEDO',5),
('FRANCISCO I. MADERO',5),
('FRONTERA',5),
('GENERAL CEPEDA',5),
('GUERRERO',5),
('HIDALGO',5),
('JIMÉNEZ',5),
('JUÁREZ',5),
('LAMADRID',5),
('MATAMOROS',5),
('MONCLOVA',5),
('MORELOS',5),
('MÚZQUIZ',5),
('NADADORES',5),
('NAVA',5),
('OCAMPO',5),
('PARRAS',5),
('PIEDRAS NEGRAS',5),
('PROGRESO',5),
('RAMOS ARIZPE',5),
('SABINAS',5),
('SACRAMENTO',5),
('SALTILLO',5),
('SAN BUENAVENTURA',5),
('SAN JUAN DE SABINAS',5),
('SAN PEDRO',5),
('SIERRA MOJADA',5),
('TORREÓN',5),
('VIESCA',5),
('VILLA UNIÓN',5),
('ZARAGOZA',5),
('NO ESPECIFICADO',5),
('ARMERÍA',6),
('COLIMA',6),
('COMALA',6),
('COQUIMATLÁN',6),
('CUAUHTÉMOC',6),
('IXTLAHUACÁN',6),
('MANZANILLO',6),
('MINATITLÁN',6),
('TECOMÁN',6),
('VILLA DE ÁLVAREZ',6),
('NO ESPECIFICADO',6),
('ACACOYAGUA',7),
('ACALA',7),
('ACAPETAHUA',7),
('ALTAMIRANO',7),
('AMATÁN',7),
('AMATENANGO DE LA FRONTERA',7),
('AMATENANGO DEL VALLE',7),
('ANGEL ALBINO CORZO',7),
('ARRIAGA',7),
('BEJUCAL DE OCAMPO',7),
('BELLA VISTA',7),
('BERRIOZÁBAL',7),
('BOCHIL',7),
('EL BOSQUE',7),
('CACAHOATÁN',7),
('CATAZAJÁ',7),
('CINTALAPA',7),
('COAPILLA',7),
('COMITÁN DE DOMÍNGUEZ',7),
('LA CONCORDIA',7),
('COPAINALÁ',7),
('CHALCHIHUITÁN',7),
('CHAMULA',7),
('CHANAL',7),
('CHAPULTENANGO',7),
('CHENALHÓ',7),
('CHIAPA DE CORZO',7);

-- 114 al 226
INSERT INTO Municipio(municipioNombre, entidad) VALUES('CHIAPILLA', 7);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('CHICOASÉN', 7);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('CHICOMUSELO', 7);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('CHILÓN', 7);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('ESCUINTLA', 7);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('FRANCISCO LEON', 7);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('FRONTERA COMALAPA', 7);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('FRONTERA HIDALGO', 7);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('LA GRANDEZA', 7);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('HUEHUETÁN', 7);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('HUIXTÁN', 7);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('HUITIUPÁN', 7);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('HUIXTLA', 7);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('LA INDEPENDENCIA', 7);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('IXHUATÁN ', 7);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('IXTACOMITÁN', 7);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('IXTAPA', 7);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('IXTAPANGAJOYA', 7);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('JIQUIPILAS', 7);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('JITOTOL', 7);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('JUÁREZ', 7);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('LARRÁINZAR', 7);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('LA LIBERTAD', 7);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('MAPASTEPEC', 7);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('LAS MARGARITAS', 7);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('MAZAPA DE MADERO', 7);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('MAZATÁN', 7);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('METAPA', 7);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('MITONTIC ', 7);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('MOTOZINTLA', 7);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('NICOLÁS RUÍZ', 7);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('OCOSINGO', 7);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('OCOTEPEC', 7);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('OCOZOCOAUTLA DE ESPINOSA', 7);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('OSTUACÁN', 7);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('OSUMACINTA', 7);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('OXCHUC', 7);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('PALENQUE', 7);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('PANTELHÓ', 7);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('PANTEPEC', 7);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('PICHUCALCO', 7);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('PIJIJIAPAN', 7);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('EL PORVENIR', 7);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('VILLA COMALTITLÁN', 7);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('PUEBLO NUEVO SOLISTAHUACÁN', 7);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('RAYÓN', 7);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('REFORMA', 7);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('LAS ROSAS', 7);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('SABANILLA', 7);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('SALTO DE AGUA', 7);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('SAN CRISTÓBAL DE LAS CASAS', 7);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('SAN FERNANDO', 7);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('SILTEPEC', 7);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('SIMOJOVEL', 7);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('SITALÁ', 7);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('SOCOLTENANGO', 7);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('SOLOSUCHIAPA', 7);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('SOYALÓ', 7);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('SUCHIAPA', 7);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('SUCHIAT', 7);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('SUNUAPA', 7);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('TAPACHULA', 7);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('TAPALAPA', 7);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('TAPILULA', 7);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('TECPATÁN', 7);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('TENEJAPA', 7);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('TEOPISCA', 7);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('TILA', 7);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('TONALÁ', 7);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('TOTOLAPA', 7);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('LA TRINITARIA', 7);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('TUMBALÁ', 7);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('TUXTLA GUTIÉRREZ', 7);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('TUXTLA CHICO', 7);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('TUZANTÁN', 7);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('TZIMOL', 7);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('UNIÓN JUÁREZ', 7);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('VENUSTIANO CARRANZA', 7);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('VILLA CORZO', 7);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('VILLAFLORES', 7);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('YAJALÓN', 7);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('SAN LUCAS', 7);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('ZINACANTÁN', 7);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('SAN JUAN CANCUC', 7);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('ALDAMA', 7);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('BENEMÉRITO DE LAS AMÉRICAS', 7);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('MARAVILLA TENEJAPA', 7);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('MARQUÉS DE COMILLAS', 7);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('MONTECRISTO DE GUERRERO', 7);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('SAN ANDRÉS DURAZNAL', 7);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('SANTIAGO EL PINAR', 7);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('CAPITÁN LUIS ÁNGEL VIDAL', 7);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('RINCÓN CHAMULA SAN PEDRO', 7);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('EL PARRAL', 7);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('EMILIANO ZAPATA', 7);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('MEZCALAPA', 7);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('NO ESPECIFICADO', 7);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('AHUMADA', 8);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('ALDAMA', 8);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('ALLENDE', 8);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('AQUILES SERDÁN', 8);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('ASCENSIÓN', 8);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('BACHÍNIVA', 8);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('BALLEZA', 8);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('BATOPILAS DE MANUEL GÓMEZ MORÍN', 8);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('BOCOYNA', 8);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('BUENAVENTURA', 8);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('CAMARGO', 8);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('CARICHÍ', 8);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('CASAS GRANDES', 8);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('CORONADO', 8);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('COYAME DEL SOTOL', 8);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('LA CRUZ', 8);

-- 227 al 452 
insert into municipio values ( null,"LA CRUZ",08),(null,"CUAUHTÉMOC",08),(null,"CUSIHUIRIACHI",08),(null,"CHIHUAHUA",08),(null,"CHÍNIPAS",08),(null,"DELICIAS",08),(null,"DR. BELISARIO DOMÍNGUEZ",08),(null,"GALEANA",08),(null,"SANTA ISABEL",08),(null,"GÓMEZ FARÍAS",08),(null,"GRAN MORELOS",08),(null,"GUACHOCHI",08),(null,"GUADALUPE",08),(null,"GUADALUPE Y CALVO",08),(null,"GUAZAPARES",08),(null,"GUERRERO",08),(null,"HIDALGO DEL PARRAL",08),(null,"HUEJOTITÁN",08),(null,"IGNACIO ZARAGOZA",08),(null,"JANOS",08),(null,"JIMÉNEZ",08),(null,"JUÁREZ",08),(null,"JULIMES",08),(null,"LÓPEZ",08),(null,"MADERA",08),(null,"MAGUARICHI",08),(null,"MANUEL BENAVIDES",08),(null,"MATACHÍ",08),(null,"MATAMOROS",08),(null,"MEOQUI",08),(null,"MORELOS",08),(null,"MORIS",08),(null,"NAMIQUIPA",08),(null,"NONOAVA",08),(null,"NUEVO CASAS GRANDES",08),(null,"OCAMPO",08),(null,"OJINAGA",08),(null,"PRAXEDIS G. GUERRERO",08),(null,"RIVA PALACIO",08),(null,"ROSALES",08),(null,"ROSARIO",08),(null,"SAN FRANCISCO DE BORJA",08),(null,"SAN FRANCISCO DE CONCHOS",08),(null,"SAN FRANCISCO DEL ORO",08),(null,"SANTA BÁRBARA",08),(null,"SATEVÓ",08),(null,"SAUCILLO",08),(null,"TEMÓSACHIC",08),(null,"EL TULE",08),(null,"URIQUE",08),(null,"URUACHI",08),(null,"VALLE DE ZARAGOZA",08),(null,"NO ESPECIFICADO",08),(null,"AZCAPOTZALCO",09),(null,"COYOACÁN",09),(null,"CUAJIMALPA DE MORELOS",09),(null,"GUSTAVO A. MADERO",09),(null,"IZTACALCO",09),(null,"IZTAPALAPA",09),(null,"LA MAGDALENA CONTRERAS",09),(null,"MILPA ALTA",09),(null,"ÁLVARO OBREGÓN",09),(null,"TLÁHUAC",09),(null,"TLALPAN",09),(null,"XOCHIMILCO",09),(null,"BENITO JUÁREZ",09),(null,"CUAUHTÉMOC",09),(null,"MIGUEL HIDALGO",09),(null,"VENUSTIANO CARRANZA",09),(null,"NO ESPECIFICADO",09),(null,"CANATLÁN",10),(null,"CANELAS",10),(null,"CONETO DE COMONFORT",10),(null,"CUENCAMÉ",10),(null,"DURANGO",10),(null,"GENERAL SIMÓN BOLÍVAR",10),(null,"GÓMEZ PALACIO",10),(null,"GUADALUPE VICTORIA",10),(null,"GUANACEVÍ",10),(null,"HIDALGO",10),(null,"INDÉ",10),(null,"LERDO",10),(null,"MAPIMÍ",10),(null,"MEZQUITAL",10),(null,"NAZAS",10),(null,"NOMBRE DE DIOS",10),(null,"OCAMPO",10),(null,"EL ORO",10),(null,"OTÁEZ",10),(null,"PÁNUCO DE CORONADO",10),(null,"PEÑÓN BLANCO",10),(null,"POANAS",10),(null,"PUEBLO NUEVO",10),(null,"RODEO",10),(null,"SAN BERNARDO",10),(null,"SAN DIMAS",10),(null,"SAN JUAN DE GUADALUPE",10),(null,"SAN JUAN DEL RÍO",10),(null,"SAN LUIS DEL CORDERO",10),(null,"SAN PEDRO DEL GALLO",10),(null,"SANTA CLARA",10),(null,"SANTIAGO PAPASQUIARO",10),(null,"SÚCHIL",10),(null,"TAMAZULA",10),(null,"TEPEHUANES",10),(null,"TLAHUALILO",10),(null,"TOPIA",10),(null,"VICENTE GUERRERO",10),(null,"NUEVO IDEAL",10),(null,"NO ESPECIFICADO",10),(null,"ABASOLO",11),(null,"ACÁMBARO",11),(null,"SAN MIGUEL DE ALLENDE",11),(null,"APASEO EL ALTO",11),(null,"APASEO EL GRANDE",11),(null,"ATARJEA",11),(null,"CELAYA",11),(null,"MANUEL DOBLADO",11),(null,"COMONFORT",11),(null,"CORONEO",11),(null,"CORTAZAR",11),(null,"CUERÁMARO",11),(null,"DOCTOR MORA",11),(null,"DOLORES HIDALGO CUNA DE LA INDEPENDENCIA NACIONAL",11),(null,"GUANAJUATO",11),(null,"HUANÍMARO",11),(null,"IRAPUATO",11),(null,"JARAL DEL PROGRESO",11),(null,"JERÉCUARO",11),(null,"LEÓN",11),(null,"MOROLEÓN",11),(null,"OCAMPO",11),(null,"PÉNJAMO",11),(null,"PUEBLO NUEVO",11),(null,"PURÍSIMA DEL RINCÓN",11),(null,"ROMITA",11),(null,"SALAMANCA",11),(null,"SALVATIERRA",11),(null,"SAN DIEGO DE LA UNIÓN",11),(null,"SAN FELIPE",11),(null,"SAN FRANCISCO DEL RINCÓN",11),(null,"SAN JOSÉ ITURBIDE",11),(null,"SAN LUIS DE LA PAZ",11),(null,"SANTA CATARINA",11),(null,"SANTA CRUZ DE JUVENTINO ROSAS",11),(null,"SANTIAGO MARAVATÍO",11),(null,"SILAO DE LA VICTORIA",11),(null,"TARANDACUAO",11),(null,"TARIMORO",11),(null,"TIERRA BLANCA",11),(null,"URIANGATO",11),(null,"VALLE DE SANTIAGO",11),(null,"VICTORIA",11),(null,"VILLAGRÁN",11),(null,"XICHÚ",11),(null,"YURIRIA",11),(null,"NO ESPECIFICADO",11),(null,"ACAPULCO DE JUÁREZ",12),(null,"AHUACUOTZINGO",12),(null,"AJUCHITLÁN DEL PROGRESO",12),(null,"ALCOZAUCA DE GUERRERO",12),(null,"ALPOYECA",12),(null,"APAXTLA",12),(null,"ARCELIA",12),(null,"ATENANGO DEL RÍO",12),(null,"ATLAMAJALCINGO DEL MONTE",12),(null,"ATLIXTAC",12),(null,"ATOYAC DE ÁLVAREZ",12),(null,"AYUTLA DE LOS LIBRES",12),(null,"AZOYÚ",12),(null,"BENITO JUÁREZ",12),(null,"BUENAVISTA DE CUÉLLAR",12),(null,"COAHUAYUTLA DE JOSÉ MARÍA IZAZAGA",12),(null,"COCULA",12),(null,"COPALA",12),(null,"COPALILLO",12),(null,"COPANATOYAC",12),(null,"COYUCA DE BENÍTEZ",12),(null,"COYUCA DE CATALÁN",12),(null,"CUAJINICUILAPA",12),(null,"CUALÁC",12),(null,"CUAUTEPEC",12),(null,"CUETZALA DEL PROGRESO",12),(null,"CUTZAMALA DE PINZÓN",12),(null,"CHILAPA DE ÁLVAREZ",12),(null,"CHILPANCINGO DE LOS BRAVO",12),(null,"FLORENCIO VILLARREAL",12),(null,"GENERAL CANUTO A. NERI",12),(null,"GENERAL HELIODORO CASTILLO",12),(null,"HUAMUXTITLÁN",12),(null,"HUITZUCO DE LOS FIGUEROA",12),(null,"IGUALA DE LA INDEPENDENCIA",12),(null,"IGUALAPA",12),(null,"IXCATEOPAN DE CUAUHTÉMOC",12),(null,"ZIHUATANEJO DE AZUETA",12),(null,"JUAN R. ESCUDERO",12),(null,"LEONARDO BRAVO",12),(null,"MALINALTEPEC",12),(null,"MÁRTIR DE CUILAPAN",12),(null,"METLATÓNOC",12),(null,"MOCHITLÁN",12),(null,"OLINALÁ",12),(null,"OMETEPEC",12),(null,"PEDRO ASCENCIO ALQUISIRAS",12),(null,"PETATLÁN",12),(null,"PILCAYA",12),(null,"PUNGARABATO",12),(null,"QUECHULTENANGO",12),(null,"SAN LUIS ACATLÁN",12),(null,"SAN MARCOS",12),(null,"SAN MIGUEL TOTOLAPAN",12),(null,"TAXCO DE ALARCÓN",12),(null,"TECOANAPA",12),(null,"TÉCPAN DE GALEANA",12),(null,"TELOLOAPAN",12),(null,"TEPECOACUILCO DE TRUJANO",12),(null,"TETIPAC",12),(null,"TIXTLA DE GUERRERO",12),(null,"TLACOACHISTLAHUACA",12),(null,"TLACOAPA",12),(null,"TLALCHAPA",12),(null,"TLALIXTAQUILLA DE MALDONADO",12),(null,"TLAPA DE COMONFORT",12),(null,"TLAPEHUALA",12),(null,"LA UNIÓN DE ISIDORO MONTES DE OCA",12),(null,"XALPATLÁHUAC",12);

-- 453 al 565

insert into Municipio values (NULL,'XOCHISTLAHUACA','12'),(NULL,'ZAPOTITLAN TABLAS','12'),(NULL,'ZIRANDARO','12'),(NULL,'ZITLALA','12'),(NULL,'EDUARDO NERI','12'),(NULL,'ACATEPEC','12'),(NULL,'MARQUELLA','12'),(NULL,'COCHOAPA EL GRANDE','12'),(NULL,'JOSE JOAQUIN DE HERRERA','12'),(NULL,'JUCHITAN','12'),

    (NULL,'ILIATENCO','12'),(NULL,'NO ESPECIFICADO','12'),(NULL,'ACATLAN','13'),(NULL,'ACAXOCHITLAN','13'),(NULL,'ACTOPAN','13'),(NULL,'AGUA BLANCA DE ITURBIDE','13'),(NULL,'AJACUBA','13'),(NULL,'ALFAJAYUCAN','13'),(NULL,'ALMOLOYA','13'),(NULL,'APAN','13'),

    (NULL,'EL ARENAL','13'),(NULL,'ATITALAQUIA','13'),(NULL,'ATLAPEXCO','13'),(NULL,'ATOTONILCO EL GRANDE','13'),(NULL,'ATOTONILCO DE TULA','13'),(NULL,'CALNALI','13'),(NULL,'CARDONAL','13'),(NULL,'CUAUTEPEC DE HINOJOSA','13'),(NULL,'CHAPANTONGO','13'),(NULL,'CHAPALHUACAN','13'),

    (NULL,'CHILCUATLA','13'),(NULL,'ELOXOCHITLAN','13'),(NULL,'EMILIANO ZAPATA','13'),(NULL,'EPAZOYUCAN','13'),(NULL,'FRANCISCO I. MADERO','13'),(NULL,'HUASCA DE OCAMPO','13'),(NULL,'HUAUTLA','13'),(NULL,'HUAZALINGO','13'),(NULL,'HUEHUETLA','13'),(NULL,'HUEJUTLA DE REYES','13'),

    (NULL,'HUICHAPAN','13'),(NULL,'IXMIQUILPAN','13'),(NULL,'JACALA DE LEDEZMA','13'),(NULL,'JALTOCAN','13'),(NULL,'JUAREZ HIDALGO','13'),(NULL,'LOLOTLA','13'),(NULL,'METEPEC','13'),(NULL,'SAN AGUSTIN METZQUITITLAN','13'),(NULL,'METZITITLAN','13'),(NULL,'MINERAL DEL CHICO','13'),

    (NULL,'MINERAL DEL MONTE','13'),(NULL,'LA MISION','13'),(NULL,'MIXQUIAHUALA DE JUAREZ','13'),(NULL,'MOLANGO DE ESCAMILLA','13'),(NULL,'NICOLAS FLORES','13'),(NULL,'NOPALA DE VILLAGRAN','13'),(NULL,'OMITLAN DE JUAREZ','13'),(NULL,'SAN FELIPE ORIZATLAN','13'),(NULL,'PACULA','13'),(NULL,'PACHUCA DE SOTO','13'),

    (NULL,'PISAFLORES','13'),(NULL,'PROGRESO OBREGON','13'),(NULL,'MINERAL DE LA REFORMA','13'),(NULL,'SAN AGUSTIN TLAXCALA','13'),(NULL,'SAN BARTOLO TUTOTEPEC','13'),(NULL,'SAN SALVADOR','13'),(NULL,'SANTIAGO DE ANAYA','13'),(NULL,'SANTIAGO TULANTEPEC DE LUGO GUERRERO','13'),(NULL,'SINGUILUCAN','13'),(NULL,'TASQUILLO','13'),

    (NULL,'TECOZAUTLA','13'),(NULL,'TENANGO DE DORIA','13'),(NULL,'TEPEAPULCO','13'),(NULL,'TEPEHUACAN DE GUERRERO','13'),(NULL,'TEPEJI DEL RIO OCAMPO','13'),(NULL,'TEPETITLAN','13'),(NULL,'TETEPANGO','13'),(NULL,'VILLA DE TEZONTEPEC','13'),(NULL,'TEZONTEPEC DE ALDAMA','13'),(NULL,'TIANGUISTENGO','13'),

    (NULL,'TIZAYUCA','13'),(NULL,'TLAHUELILPAN','13'),(NULL,'TLAHUILTEPA','13'),(NULL,'TLANALAPA','13'),(NULL,'TLANCHINOL','13'),(NULL,'TLAXCOAPAN','13'),(NULL,'TOLCAYUCA','13'),(NULL,'TULA DE ALLENDE','13'),(NULL,'TULANCINGO DE BRAVO','13'),(NULL,'XOCHIATIPAN','13'),

    (NULL,'XOCHICOATLAN','13'),(NULL,'YAHUALICA','13'),(NULL,'ZACUALTIPAN DE ANGELES','13'),(NULL,'ZAPOTLAN DE JUAREZ','13'),(NULL,'ZEMPOALA','13'),(NULL,'ZIMAPAN','13'),(NULL,'NO ESPECIFICADO','13'),(NULL,'ACATIC','14'),(NULL,'ACATLAN DE JUAREZ','14'),(NULL,'AHUALULCO DE MERCADO','14'),

    (NULL,'AMACUECA','14'),(NULL,'AMATITAN','14'),(NULL,'AMECA','14'),(NULL,'SAN JUANITO DE ESCOBEDO','14'),(NULL,'ARANDAS','14'),(NULL,'EL ARENAL','14'),(NULL,'ATEMAJAC DE BRIZUELA','14'),(NULL,'ATENGO','14'),(NULL,'ATENGUILLO','14'),(NULL,'ATOTONILCO EL ALTO','14'),

    (NULL,'ATOYAC','14'),(NULL,'AUTLAN DE NAVARRO','14'),(NULL,'AYOTLAN','14');
    
-- 566 al 687
INSERT INTO Municipio(municipioNombre,entidad) 

values 

	('AYUTLA',14),

    ('LA BARCA',14),

    ('BOLAÑOS',14),

    ('CABO CORRIENTES',14),

    ('CASIMIRO CASTILLO',14),

    ('CIHUATLÁN',14),

    ('ZAPOTLÁN EL GRANDE',14),

    ('COCULA',14),

    ('COLOTLÁN',14),

    ('CONCEPCIÓN DE BUENOS AIRES',14),

    ('CUAUTITLÁN DE GARCÍA BARRAGÁN',14),

    ('CUAUTLA',14),

    ('CUQUÍO',14),

    ('CHAPALA',14),

    ('CHIMALTITÁN',14),

    ('CHIQUILISTLÁN',14),

    ('ENCARNACIÓN DE DÍAZ',14),

    ('ETZATLÁN',14),

    ('EL GRULLO',14),

    ('GUACHINANGO',14),

    ('GUADALAJARA',14),

    ('HOSTOTIPAQUILLO',14),

    ('HUEJÚCAR',14),

    ('HUEJUQUILLA EL ALTO',14),

    ('LA HUERTA',14),

    ('IXTLAHUACÁN DE LOS MEMBRILLOS',14),

    ('IXTLAHUACÁN DEL RÍO',14),

    ('JALOSTOTITLÁN',14),

    ('JAMAY',14),

    ('JESÚS MARÍA',14),

     ('JILOTLÁN DE LOS DOLORES',14),

    ('JOCOTEPEC',14),

    ('JUANACATLÁN',14),

    ('JUCHITLÁN',14),

    ('LAGOS DE MORENO',14),

    ('EL LIMÓN',14),

    ('MAGDALENA',14),

    ('SANTA MARÍA DEL ORO',14),

    ('LA MANZANILLA DE LA PAZ',14),

    ('MASCOTA',14),

     ('MAZAMITLA',14),

    ('MEXTICACÁN',14),

    ('MEZQUITIC',14),

    ('MIXTLÁN',14),

    ('OCOTLÁN',14),

    ('OJUELOS DE JALISCO',14),

    ('PIHUAMO',14),

    ('PONCITLÁN',14),

    ('PUERTO VALLARTA',14),

    ('VILLA PURIFICACIÓN',14),

     ('QUITUPAN',14),

    ('EL SALTO',14),

    ('SAN CRISTÓBAL DE LA BARRANCA',14),

    ('SAN DIEGO DE ALEJANDRÍA',14),

    ('SAN JUAN DE LOS LAGOS',14),

    ('SAN JULIÁN',14),

    ('SAN MARCOS',14),

    ('SAN MARTÍN DE BOLAÑOS',14),

    ('SAN MARTÍN HIDALGO',14),

    ('SAN MIGUEL EL ALTO',14),

	('GÓMEZ FARÍAS',14),

    ('SAN SEBASTIÁN DEL OESTE',14),

    ('SANTA MARÍA DE LOS ÁNGELES',14),

    ('SAYULA',14),

    ('TALA',14),

    ('TALPA DE ALLENDE',14),

    ('TAMAZULA DE GORDIANO',14),

    ('TAPALPA',14),

    ('TECALITLÁN',14),

    ('TECOLOTLÁN',14),

     ('TECHALUTA DE MONTENEGRO',14),

    ('TENAMAXTLÁN',14),

    ('TEOCALTICHE',14),

    ('TEOCUITATLÁN DE CORONA',14),

    ('TEPATITLÁN DE MORELOS',14),

    ('TEQUILA',14),

    ('TEUCHITLÁN',14),

    ('TIZAPÁN EL ALTO',14),

    ('TLAJOMULCO DE ZÚÑIGA',14),

    ('SAN PEDRO TLAQUEPAQUE',14),

     ('TOLIMÁN',14),

    ('TOMATLÁN',14),

    ('TONALÁ',14),

    ('TONAYA',14),

    ('TONILA',14),

    ('TOTATICHE',14),

    ('TOTOTLÁN',14),

    ('TUXCACUESCO',14),

    ('TUXCUECA',14),

    ('TUXPAN',14),

     ('UNIÓN DE SAN ANTONIO',14),

    ('UNIÓN DE TULA',14),

    ('VALLE DE GUADALUPE',14),

    ('VALLE DE JUÁREZ',14),

    ('SAN GABRIEL',14),

    ('VILLA CORONA',14),

    ('VILLA GUERRERO',14),

    ('VILLA HIDALGO',14),

    ('CAÑADAS DE OBREGÓN',14),

    ('YAHUALICA DE GONZÁLEZ GALLO',14),

     ('ZACOALCO DE TORRES',14),

    ('ZAPOPAN',14),

    ('ZAPOTILTIC',14),

    ('ZAPOTITLÁN DE VADILLO',14),

    ('ZAPOTLÁN DEL REY',14),

    ('ZAPOTLANEJO',14),

    ('SAN IGNACIO CERRO GORDO',14),

    ('NO ESPECIFICADO',14),

    ('ACAMBAY DE RUÍZ CASTAÑEDA',15),

    ('ACOLMAN',15),

     ('ACULCO',15);
     
-- 679 al 991
insert into Municipio (idMunicipio, municipioNombre, entidad) values (null, 'ALMOLOYA DE ALQUISIRAS', 1);

insert into Municipio (idMunicipio, municipioNombre, entidad) values (null, 'ALMOLOYA DE JUEÁREZ', 1);

insert into Municipio (idMunicipio, municipioNombre, entidad) values (null, 'ALMOLOYA DEL RÍO', 1);

insert into Municipio (idMunicipio, municipioNombre, entidad) values (null, 'AMANALCO', 1);

insert into Municipio (idMunicipio, municipioNombre, entidad) values (null, 'AMATEPEC', 1);

insert into Municipio (idMunicipio, municipioNombre, entidad) values (null, 'AMECAMECA', 1);

insert into Municipio (idMunicipio, municipioNombre, entidad) values (null, 'APAXCO', 1);

insert into Municipio (idMunicipio, municipioNombre, entidad) values (null, 'ATENCO', 1);

insert into Municipio (idMunicipio, municipioNombre, entidad) values (null, 'ATIZAPÁN', 1);

insert into Municipio (idMunicipio, municipioNombre, entidad) values (null, 'ATIZAPÁN DE ZARAGOZA', 1);

insert into Municipio (idMunicipio, municipioNombre, entidad) values (null, 'ATLACOMULCO', 1);

insert into Municipio (idMunicipio, municipioNombre, entidad) values (null, 'ATLAUTLA', 1);

insert into Municipio (idMunicipio, municipioNombre, entidad) values (null, 'AXAPUSCO', 1);

insert into Municipio (idMunicipio, municipioNombre, entidad) values (null, 'AYAPANGO', 1);

insert into Municipio (idMunicipio, municipioNombre, entidad) values (null, 'CALIMAYA', 1);

insert into Municipio (idMunicipio, municipioNombre, entidad) values (null, 'CAPULHUAC', 1);

insert into Municipio (idMunicipio, municipioNombre, entidad) values (null, 'COACALCO DE BERRIOZÁBAL', 1);

insert into Municipio (idMunicipio, municipioNombre, entidad) values (null, 'COATEPEC HARINAS', 1);

insert into Municipio (idMunicipio, municipioNombre, entidad) values (null, 'COCOTITLÁN', 1);

insert into Municipio (idMunicipio, municipioNombre, entidad) values (null, 'COYOTEPEC', 1);

insert into Municipio (idMunicipio, municipioNombre, entidad) values (null, 'CUAUTITLÁN', 1);

insert into Municipio (idMunicipio, municipioNombre, entidad) values (null, 'CHALCO', 1);

insert into Municipio (idMunicipio, municipioNombre, entidad) values (null, 'CHAPA DE MOTA', 1);

insert into Municipio (idMunicipio, municipioNombre, entidad) values (null, 'CHAPULTEPEC', 1);

insert into Municipio (idMunicipio, municipioNombre, entidad) values (null, 'CHIAUTLA', 1);

insert into Municipio (idMunicipio, municipioNombre, entidad) values (null, 'CHICOLOAPAN', 1);

insert into Municipio (idMunicipio, municipioNombre, entidad) values (null, 'CHICONCUAC', 1);

insert into Municipio (idMunicipio, municipioNombre, entidad) values (null, 'CHIMALHUACÁN', 1);

insert into Municipio (idMunicipio, municipioNombre, entidad) values (null, 'DONATO GUERRA', 1);

insert into Municipio (idMunicipio, municipioNombre, entidad) values (null, 'ECATEPEC DE MORELOS', 1);

insert into Municipio (idMunicipio, municipioNombre, entidad) values (null, 'ECATZINGO', 1);

insert into Municipio (idMunicipio, municipioNombre, entidad) values (null, 'HUEHUETOCA', 1);

insert into Municipio (idMunicipio, municipioNombre, entidad) values (null, 'HUEYPOXTLA', 1);

insert into Municipio (idMunicipio, municipioNombre, entidad) values (null, 'HUIXQUILUCAN', 1);

insert into Municipio (idMunicipio, municipioNombre, entidad) values (null, 'ISIDRO FABELA', 1);

insert into Municipio (idMunicipio, municipioNombre, entidad) values (null, 'IXTAPALUCA', 1);

insert into Municipio (idMunicipio, municipioNombre, entidad) values (null, 'IXTAPAN DE LA SAL', 1);

insert into Municipio (idMunicipio, municipioNombre, entidad) values (null, 'IXTAPAN DEL ORO', 1);

insert into Municipio (idMunicipio, municipioNombre, entidad) values (null, 'IXTLAHUACA', 1);

insert into Municipio (idMunicipio, municipioNombre, entidad) values (null, 'XALATLACO', 1);

insert into Municipio (idMunicipio, municipioNombre, entidad) values (null, 'JALTENCO', 1);

insert into Municipio (idMunicipio, municipioNombre, entidad) values (null, 'JILOTEPEC', 1);

insert into Municipio (idMunicipio, municipioNombre, entidad) values (null, 'JILOTZINGO', 1);

insert into Municipio (idMunicipio, municipioNombre, entidad) values (null, 'JIQUIPILCO', 1);

insert into Municipio (idMunicipio, municipioNombre, entidad) values (null, 'JOCOTITLÁN', 1);

insert into Municipio (idMunicipio, municipioNombre, entidad) values (null, 'JOQUICINGO', 1);

insert into Municipio (idMunicipio, municipioNombre, entidad) values (null, 'JUCHITEPEC', 1);

insert into Municipio (idMunicipio, municipioNombre, entidad) values (null, 'LERMA', 1);

insert into Municipio (idMunicipio, municipioNombre, entidad) values (null, 'MALINALCO', 1);

insert into Municipio (idMunicipio, municipioNombre, entidad) values (null, 'MELCHOR OCAMPO', 1);

insert into Municipio (idMunicipio, municipioNombre, entidad) values (null, 'METEPEC', 1);

insert into Municipio (idMunicipio, municipioNombre, entidad) values (null, 'MEXICALTZINGO', 1);

insert into Municipio (idMunicipio, municipioNombre, entidad) values (null, 'MORELOS', 1);

insert into Municipio (idMunicipio, municipioNombre, entidad) values (null, 'NAUCALPAN DE JUÁREZ', 1);

insert into Municipio (idMunicipio, municipioNombre, entidad) values (null, 'NEZAHUALCÓYOLT', 1);

insert into Municipio (idMunicipio, municipioNombre, entidad) values (null, 'NEXTLALPAN', 1);

insert into Municipio (idMunicipio, municipioNombre, entidad) values (null, 'NICOLÁS ROMERO', 1);

insert into Municipio (idMunicipio, municipioNombre, entidad) values (null, 'NOPALTEPEC', 1);

insert into Municipio (idMunicipio, municipioNombre, entidad) values (null, 'OCOYOACAC', 1);

insert into Municipio (idMunicipio, municipioNombre, entidad) values (null, 'OCUILAN', 1);

insert into Municipio (idMunicipio, municipioNombre, entidad) values (null, 'EL ORO', 1);

insert into Municipio (idMunicipio, municipioNombre, entidad) values (null, 'OTUMBA', 1);

insert into Municipio (idMunicipio, municipioNombre, entidad) values (null, 'OTZOLOAPAN', 1);

insert into Municipio (idMunicipio, municipioNombre, entidad) values (null, 'OTZOLOTEPEC', 1);

insert into Municipio (idMunicipio, municipioNombre, entidad) values (null, 'OZUMBA', 1);

insert into Municipio (idMunicipio, municipioNombre, entidad) values (null, 'PAPALOTLA', 1);

insert into Municipio (idMunicipio, municipioNombre, entidad) values (null, 'LA PAZ', 1);

insert into Municipio (idMunicipio, municipioNombre, entidad) values (null, 'POLOTITLÁN', 1);

insert into Municipio (idMunicipio, municipioNombre, entidad) values (null, 'RAYÓN', 1);

insert into Municipio (idMunicipio, municipioNombre, entidad) values (null, 'SAN ANTONIO LA ISLA', 1);

insert into Municipio (idMunicipio, municipioNombre, entidad) values (null, 'SAN FELIPE DEL PROGESO', 1);

insert into Municipio (idMunicipio, municipioNombre, entidad) values (null, 'SAN MARTÍN DE LAS PIRÁMIDES', 1);

insert into Municipio (idMunicipio, municipioNombre, entidad) values (null, 'SAN MATEO ATENCO', 1);

insert into Municipio (idMunicipio, municipioNombre, entidad) values (null, 'SAN SIMÓN DE GUERRERO', 1);

insert into Municipio (idMunicipio, municipioNombre, entidad) values (null, 'SANTO TOMÁS', 1);

insert into Municipio (idMunicipio, municipioNombre, entidad) values (null, 'SOYANIQUILPAN DE JUÁREZ', 1);

insert into Municipio (idMunicipio, municipioNombre, entidad) values (null, 'SULTEPEC', 1);

insert into Municipio (idMunicipio, municipioNombre, entidad) values (null, 'TECÁMAC', 1);

insert into Municipio (idMunicipio, municipioNombre, entidad) values (null, 'TEJUPILCO', 1);

insert into Municipio (idMunicipio, municipioNombre, entidad) values (null, 'TEMAMATLA', 1);

insert into Municipio (idMunicipio, municipioNombre, entidad) values (null, 'TEMASCALAPA', 1);

insert into Municipio (idMunicipio, municipioNombre, entidad) values (null, 'TEMASCALCINGO', 1);

insert into Municipio (idMunicipio, municipioNombre, entidad) values (null, 'TEMASCALTEPEC', 1);

insert into Municipio (idMunicipio, municipioNombre, entidad) values (null, 'TEMOAYA', 1);

insert into Municipio (idMunicipio, municipioNombre, entidad) values (null, 'TENANCINGO', 1);

insert into Municipio (idMunicipio, municipioNombre, entidad) values (null, 'TENANGO DEL AIRE', 1);

insert into Municipio (idMunicipio, municipioNombre, entidad) values (null, 'TENANGO DEL VALLE', 1);

insert into Municipio (idMunicipio, municipioNombre, entidad) values (null, 'TEOLOYUCAN', 1);

insert into Municipio (idMunicipio, municipioNombre, entidad) values (null, 'TEOTIHUACÁN', 1);

insert into Municipio (idMunicipio, municipioNombre, entidad) values (null, 'TEPETLAOXTOC', 1);

insert into Municipio (idMunicipio, municipioNombre, entidad) values (null, 'TEPETLIXPA', 1);

insert into Municipio (idMunicipio, municipioNombre, entidad) values (null, 'TEPOTZOTLÁN', 1);

insert into Municipio (idMunicipio, municipioNombre, entidad) values (null, 'TEQUIXQUIAC', 1);

insert into Municipio (idMunicipio, municipioNombre, entidad) values (null, 'TEXCALTITLÁN', 1);

insert into Municipio (idMunicipio, municipioNombre, entidad) values (null, 'TEXCALYACAC', 1);

insert into Municipio (idMunicipio, municipioNombre, entidad) values (null, 'TEXCOCO', 1);

insert into Municipio (idMunicipio, municipioNombre, entidad) values (null, 'TEZOYUCA', 1);

insert into Municipio (idMunicipio, municipioNombre, entidad) values (null, 'TIANGUISTENCO', 1);

insert into Municipio (idMunicipio, municipioNombre, entidad) values (null, 'TIMILPAN', 1);

insert into Municipio (idMunicipio, municipioNombre, entidad) values (null, 'TLALMANALCO', 1);

insert into Municipio (idMunicipio, municipioNombre, entidad) values (null, 'TLALNEPANTLA DE BAZ', 1);

insert into Municipio (idMunicipio, municipioNombre, entidad) values (null, 'TLATLAYA', 1);

insert into Municipio (idMunicipio, municipioNombre, entidad) values (null, 'TOLUCA', 1);

insert into Municipio (idMunicipio, municipioNombre, entidad) values (null, 'TONATICO', 1);

insert into Municipio (idMunicipio, municipioNombre, entidad) values (null, 'TULTEPEC', 1);

insert into Municipio (idMunicipio, municipioNombre, entidad) values (null, 'TULTITLÁN', 1);

insert into Municipio (idMunicipio, municipioNombre, entidad) values (null, 'VALLE DE BRAVO', 1);

insert into Municipio (idMunicipio, municipioNombre, entidad) values (null, 'VILLA DE ALLENDE', 1);

insert into Municipio (idMunicipio, municipioNombre, entidad) values (null, 'VILLA DEL CARBÓN', 1);

insert into Municipio (idMunicipio, municipioNombre, entidad) values (null, 'VILLA GUERRERO', 1);

insert into Municipio (idMunicipio, municipioNombre, entidad) values (null, 'VILLA VICTORIA', 1);

insert into Municipio (idMunicipio, municipioNombre, entidad) values (null, 'XONACATLÁN', 1);

insert into Municipio (idMunicipio, municipioNombre, entidad) values (null, 'ZACAZONAPAN', 1);

-- 792 al 904
INSERT INTO Municipio VALUE ( NULL , "ZACUALPAN" , "15" );
INSERT INTO Municipio VALUE ( NULL , "ZINACANTEPEC" , "15" );
INSERT INTO Municipio VALUE ( NULL , "ZUMPAHUACÁN" , "15" );
INSERT INTO Municipio VALUE ( NULL , "ZUMPANGO" , "15" );
INSERT INTO Municipio VALUE ( NULL , "CUAUTITLÁN IZCALLI" , "15" );
INSERT INTO Municipio VALUE ( NULL , "VALLE DE CHALCO SOLIDARIDAD" , "15" );
INSERT INTO Municipio VALUE ( NULL , "LUVIANOS" , "15" );
INSERT INTO Municipio VALUE ( NULL , "SAN JOSÉ DEL RINCÓN" , "15" );
INSERT INTO Municipio VALUE ( NULL , "TONANITLAC" , "15" );
INSERT INTO Municipio VALUE ( NULL , "NO ESPECIFICADO" , "15" );
INSERT INTO Municipio VALUE ( NULL , "ACUITZIO" , "16" );
INSERT INTO Municipio VALUE ( NULL , "AGUILILLA" , "16" );
INSERT INTO Municipio VALUE ( NULL , "ÁLVARO OBREGÓN" , "16" );
INSERT INTO Municipio VALUE ( NULL , "ANGAMACUTIRO" , "16" );
INSERT INTO Municipio VALUE ( NULL , "ANGANGUEO" , "16" );
INSERT INTO Municipio VALUE ( NULL , "APATZINGÁN" , "16" );
INSERT INTO Municipio VALUE ( NULL , "APORO" , "16" );
INSERT INTO Municipio VALUE ( NULL , "AQUILA" , "16" );
INSERT INTO Municipio VALUE ( NULL , "ARIO" , "16" );
INSERT INTO Municipio VALUE ( NULL , "ARTEAGA" , "16" );
INSERT INTO Municipio VALUE ( NULL , "BRISEÑAS" , "16" );
INSERT INTO Municipio VALUE ( NULL , "BUENAVISTA" , "16" );
INSERT INTO Municipio VALUE ( NULL , "CARÁCUARO" , "16" );
INSERT INTO Municipio VALUE ( NULL , "COAHUAYANA" , "16" );
INSERT INTO Municipio VALUE ( NULL , "COALCOMÁN DE VÁZQUEZ PALLARES" , "16" );
INSERT INTO Municipio VALUE ( NULL , "COENEO" , "16" );
INSERT INTO Municipio VALUE ( NULL , "CONTEPEC" , "16" );
INSERT INTO Municipio VALUE ( NULL , "COPÁNDARO" , "16" );
INSERT INTO Municipio VALUE ( NULL , "COTIJA" , "16" );
INSERT INTO Municipio VALUE ( NULL , "CUITZEO" , "16" );
INSERT INTO Municipio VALUE ( NULL , "CHARAPAN" , "16" );
INSERT INTO Municipio VALUE ( NULL , "CHARO" , "16" );
INSERT INTO Municipio VALUE ( NULL , "CHAVINDA" , "16" );
INSERT INTO Municipio VALUE ( NULL , "CHERÁN" , "16" );
INSERT INTO Municipio VALUE ( NULL , "CHILCHOTA" , "16" );
INSERT INTO Municipio VALUE ( NULL , "CHINICUILA" , "16" );
INSERT INTO Municipio VALUE ( NULL , "CHUCÁNDIRO" , "16" );
INSERT INTO Municipio VALUE ( NULL , "CHURINTZIO" , "16" );
INSERT INTO Municipio VALUE ( NULL , "CHURUMUCO" , "16" );
INSERT INTO Municipio VALUE ( NULL , "ECUANDUREO" , "16" );
INSERT INTO Municipio VALUE ( NULL , "EPITACIO HUERTA" , "16" );
INSERT INTO Municipio VALUE ( NULL , "ERONGARÍCUARO" , "16" );
INSERT INTO Municipio VALUE ( NULL , "GABRIEL ZAMORA" , "16" );
INSERT INTO Municipio VALUE ( NULL , "HIDALGO" , "16" );
INSERT INTO Municipio VALUE ( NULL , "LA HUACANA" , "16" );
INSERT INTO Municipio VALUE ( NULL , "HUANDACAREO" , "16" );
INSERT INTO Municipio VALUE ( NULL , "HUANIQUEO" , "16" );
INSERT INTO Municipio VALUE ( NULL , "HUETAMO" , "16" );
INSERT INTO Municipio VALUE ( NULL , "HUIRAMBA" , "16" );
INSERT INTO Municipio VALUE ( NULL , "INDAPARAPEO" , "16" );
INSERT INTO Municipio VALUE ( NULL , "IRIMBO" , "16" );
INSERT INTO Municipio VALUE ( NULL , "IXTLÁN" , "16" );
INSERT INTO Municipio VALUE ( NULL , "JACONA" , "16" );
INSERT INTO Municipio VALUE ( NULL , "JIMÉNEZ" , "16" );
INSERT INTO Municipio VALUE ( NULL , "JIQUILPAN" , "16" );
INSERT INTO Municipio VALUE ( NULL , "JUÁREZ" , "16" );
INSERT INTO Municipio VALUE ( NULL , "JUNGAPEO" , "16" );
INSERT INTO Municipio VALUE ( NULL , "LAGUNILLAS" , "16" );
INSERT INTO Municipio VALUE ( NULL , "MADERO" , "16" );
INSERT INTO Municipio VALUE ( NULL , "MARAVATÍO" , "16" );
INSERT INTO Municipio VALUE ( NULL , "MARCOS CASTELLANOS" , "16" );
INSERT INTO Municipio VALUE ( NULL , "LÁZARO CÁRDENAS" , "16" );
INSERT INTO Municipio VALUE ( NULL , "MORELIA" , "16" );
INSERT INTO Municipio VALUE ( NULL , "MORELOS" , "16" );
INSERT INTO Municipio VALUE ( NULL , "MÚGICA" , "16" );
INSERT INTO Municipio VALUE ( NULL , "NAHUATZEN" , "16" );
INSERT INTO Municipio VALUE ( NULL , "NOCUPÉTARO" , "16" );
INSERT INTO Municipio VALUE ( NULL , "NUEVO PARANGARICUTIRO" , "16" );
INSERT INTO Municipio VALUE ( NULL , "NUEVO URECHO" , "16" );
INSERT INTO Municipio VALUE ( NULL , "NUMARÁN" , "16" );
INSERT INTO Municipio VALUE ( NULL , "OCAMPO" , "16" );
INSERT INTO Municipio VALUE ( NULL , "PAJACUARÁN" , "16" );
INSERT INTO Municipio VALUE ( NULL , "PANINDÍCUARO" , "16" );
INSERT INTO Municipio VALUE ( NULL , "PARÁCUARO" , "16" );
INSERT INTO Municipio VALUE ( NULL , "PARACHO" , "16" );
INSERT INTO Municipio VALUE ( NULL , "PÁTZCUARO" , "16" );
INSERT INTO Municipio VALUE ( NULL , "PENJAMILLO" , "16" );
INSERT INTO Municipio VALUE ( NULL , "PERIBÁN" , "16" );
INSERT INTO Municipio VALUE ( NULL , "LA PIEDAD", "16" );
INSERT INTO Municipio VALUE ( NULL , "PURÉPERO" , "16" );
INSERT INTO Municipio VALUE ( NULL , "PURUÁNDIRO" , "16" );
INSERT INTO Municipio VALUE ( NULL , "QUERÉNDARO" , "16" );
INSERT INTO Municipio VALUE ( NULL , "QUIROG" , "16" );
INSERT INTO Municipio VALUE ( NULL , "COJUMATLÁN DE RÉGULES" , "16" );
INSERT INTO Municipio VALUE ( NULL , "LOS REYES" , "16" );
INSERT INTO Municipio VALUE ( NULL , "SAHUAYO" , "16" );
INSERT INTO Municipio VALUE ( NULL , "SAN LUCAS" , "16" );
INSERT INTO Municipio VALUE ( NULL , "SANTA ANA MAYA" , "16" );
INSERT INTO Municipio VALUE ( NULL , "SALVADOR ESCALANTE" , "16" );
INSERT INTO Municipio VALUE ( NULL , "SENGUIO" , "16" );
INSERT INTO Municipio VALUE ( NULL , "SUSUPUATO" , "16" );
INSERT INTO Municipio VALUE ( NULL , "TACÁMBARO" , "16" );
INSERT INTO Municipio VALUE ( NULL , "TANCÍTARO" , "16" );
INSERT INTO Municipio VALUE ( NULL , "TANGAMANDAPIO" , "16" );
INSERT INTO Municipio VALUE ( NULL , "TANGANCÍCUARO" , "16" );
INSERT INTO Municipio VALUE ( NULL , "TANHUATO" , "16" );
INSERT INTO Municipio VALUE ( NULL , "TARETAN" , "16" );
INSERT INTO Municipio VALUE ( NULL , "TARÍMBARO" , "16" );
INSERT INTO Municipio VALUE ( NULL , "TEPALCATEPEC" , "16" );
INSERT INTO Municipio VALUE ( NULL , "TINGAMBATO" , "16" );
INSERT INTO Municipio VALUE ( NULL , "TINGÜINDÍN" , "16" );
INSERT INTO Municipio VALUE ( NULL , "TIQUICHEO DE NICOLÁS ROMERO" , "16" );
INSERT INTO Municipio VALUE ( NULL , "TLALPUJAHUA" , "16" );
INSERT INTO Municipio VALUE ( NULL , "TLAZAZALCA" , "16" );
INSERT INTO Municipio VALUE ( NULL , "TOCUMBO" , "16" );
INSERT INTO Municipio VALUE ( NULL , "TUMBISCATÍO" , "16" );
INSERT INTO Municipio VALUE ( NULL , "TURICATO" , "16" );
INSERT INTO Municipio VALUE ( NULL , "TUXPAN" , "16" );
INSERT INTO Municipio VALUE ( NULL , "TUZANTLA" , "16" );
INSERT INTO Municipio VALUE ( NULL , "TZINTZUNTZAN" , "16" );
INSERT INTO Municipio VALUE ( NULL , "TZITZIO" , "16" );
INSERT INTO Municipio VALUE ( NULL , "URUAPAN" , "16" );
INSERT INTO Municipio VALUE ( NULL , "VENUSTIANO CARRANZA" , "16" );

-- 905 al 1017
-- INSERTAR MUNICIPIOS 905-1017 

-- MICHOACAN DE OCAMPO 16

insert into Municipio (municipioNombre,entidad) values

('VILLAMAR', 16),('VISTA HERMOSA',16),('YURÉCUARO ',16),('ZACAPU ',16),('ZAMORA ',16),

('ZINÁPARO ',16),('ZINAPÉCUARO ',16),('ZIRACUARETIRO ',16),('ZITÁCUARO ',16),('JOSÉ SIXTO VERDUZCO',16),

('NO ESPECIFICADO ',16);-- 915


-- MORELOS 17

insert into Municipio (municipioNombre,entidad) values

('AMACUZAC ', 17),('ATLATLAHUCAN ',17),('AXOCHIAPAN  ',17),('AYALA  ',17),('COATLÁN DEL RÍO ',17), 

('CUAUTLA ',17),('CUERNAVACA ',17),('EMILIANO ZAPATA',17),('HUITZILAC',17),('JANTETELCO ',17),

('JIUTEPEC',17),('JOJUTLA', 17),('JONACATEPEC DE LEANDRO VALLE ',17),('MAZATEPEC ',17),('MIACATLÁN ',17), 

('OCUITUCO ',17),('PUENTE DE IXTLA',17),('TEMIXCO ',17),('TEPALCINGO ',17),('TEPOZTLÁN',17),

('TETECALA ',17),('TETELA DEL VOLCÁN',17),('TLALNEPANTLA', 17),('TLALTIZAPÁN DE ZAPATA',17),('TLAQUILTENANGO',17), 

('TLAYACAPAN',17),('TOTOLAPAN',17),('XOCHITEPEC',17),('YAUTEPEC',17),('YECAPIXTLA',17),

('ZACATEPEC',17),('ZACUALPAN DE AMILPAS',17),('TEMOAC',17),('COATETELCO',17),('XOXOCOTLA',17),-- 950

('NO ESPECIFICADO',17);-- 951


-- NAYARIT 18

insert into Municipio (municipioNombre,entidad) values

('ACAPONETA', 18),('AHUACATLÁN', 18),('AMATLÁN DE CAÑAS', 18),('COMPOSTELA', 18),('HUAJICORI', 18), 

('IXTLÁN DEL RÍO', 18),('JALA', 18),('XALISCO', 18),('DEL NAYAR', 18),('ROSAMORADA ', 18), 

('RUÍZ', 18),('SAN BLAS', 18),('SAN PEDRO LAGUNILLAS', 18),('SANTA MARÍA DEL ORO', 18),('SANTIAGO IXCUINTLA', 18), 

('TECUALA', 18),('TEPIC', 18), ('TUXPAN', 18), ('LA YESCA', 18), ('BAHÍA DE BANDERAS', 18),

('NO ESPECIFICADO', 18);-- 972


-- NUEVO LEÓN 19

insert into Municipio (municipioNombre,entidad) values

('ABASOLO', 19), ('AGUALEGUAS', 19), ('LOS ALDAMAS', 19), ('ALLENDE', 19), ('ANÁHUAC', 19),  

('APODACA', 19), ('ARAMBERRI', 19), ('BUSTAMANTE', 19),('CADEREYTA JIMÉNEZ', 19),('EL CARMEN', 19),  

('CERRALVO', 19),('CIÉNEGA DE FLORES', 19),('CHINA', 19), ('DOCTOR ARROYO', 19), ('DOCTOR COSS', 19),  

('DOCTOR GONZÁLEZ', 19),('GALEANA', 19),('GARCÍA', 19), ('SAN PEDRO GARZA GARCIA', 19),('GENERAL BRAVO', 19),  

('GENERAL ESCOBEDO', 19),('GENERAL TERÁN', 19), ('GENERAL TREVIÑO', 19),('GENERAL ZARAGOZA', 19),('GENERAL ZUAZUA', 19),  

('GUADALUPE', 19),('LOS HERRERAS', 19),('HIGUERAS', 19),('HUALAHUISES', 19),('ITURBIDE', 19),  

('JUÁREZ', 19),('LAMPAZOS DE NARANJO', 19),('LINARES', 19),('MARÍN', 19),('MELCHOR OCAMPO', 19), 

('MIER Y NORIEGA', 19),('MINA', 19),('MONTEMORELOS', 19),('MONTERREY', 19),('PARÁS', 19),  

('PESQUERÍA', 19),('LOS RAMONES', 19),('RAYONES', 19),('SABINAS HIDALGO', 19),('SALINAS VICTORIA', 19);  -- 1017

-- 1018 al 1130
-- insert municipios 1018 - 1130

insert into Municipio (idMunicipio,municipioNombre,entidad)

values(null,'SAN NICOLÁS DE LOS GARZA',19),

	(null,'HIDALGO',19),

    (null,'SANTA CATARINA',19),

    (null,'SANTIAGO',19),

    (null,'VALLECILLO',19),

    (null,'VILLALDAMA',19),

    (null,'NO ESPECIFICADO',19),

    (null,'ABEJONES',20),

    (null,'ACATLÁN DE PÉREZ FIGUEROA',20),

    (null,'ASUNCIÓN CACALOTEPEC',20),  -- 10

    

	(null,'ASUNCIÓN CUYOTEPEJI',20),	

    (null,'ASUNCIÓN IXTALTEPEC',20),

    (null,'ASUNCIÓN NOCHIXTLÁN',20),

	(null,'ASUNCIÓN OCOTLÁN',20),

    (null,'ASUNCIÓN TLACOLULITA',20),

    (null,'AYOTZINTEPEC',20),

	(null,'EL BARRIO DE LA SOLEDAD',20),

    (null,'CALIHUALÁ',20),

    (null,'CANDELARIA LOXICHA',20),

	(null,'CIÉNEGA DE ZIMATLÁN',20),   -- 20


  	(null,'CIUDAD IXTEPEC',20),

    (null,'COATECAS ALTAS',20),

    (null,'COICOYÁN DE LAS FLORES',20),

	(null,'LA COMPAÑÍA',20),

    (null,'CONCEPCIÓN BUENAVISTA',20),

    (null,'CONCEPCIÓN PÁPALO',20),

	(null,'CONSTANCIA DEL ROSARIO',20),

    (null,'COSOLAPA',20),

    (null,'COSOLTEPEC',20),

	(null,'CUILÁPAM DE GUERRERO',20),   -- 30


	(null,'CUYAMECALCO VILLA DE ZARAGOZA',20),

    (null,'CHAHUITES',20),

    (null,'CHALCATONGO DE HIDALGO',20),

	(null,'CHIQUIHUITLÁN DE BENITO JUÁREZ',20),

    (null,'HEROICA CIUDAD DE EJUTLA DE CRESPO',20),

    (null,'ELOXOCHITLÁN DE FLORES MAGÓN',20),

	(null,'EL ESPINAL',20),

    (null,'TAMAZULÁPAM DEL ESPÍRITU SANTO',20),

    (null,'FRESNILLO DE TRUJANO',20),

	(null,'GUADALUPE ETLA',20),   -- 40


	(null,'GUADALUPE DE RAMÍREZ',20),

    (null,'GUELATAO DE JUÁREZ',20),

    (null,'GUEVEA DE HUMBOLDT',20),

	(null,'MESONES HIDALGO',20),

    (null,'VILLA HIDALGO',20),

    (null,'HEROICA CIUDAD DE HUAJUAPAN DE LEÓN',20),

	(null,'HUAUTEPEC',20),

    (null,'HUAUTLA DE JIMÉNEZ',20),

    (null,'IXTLÁN DE JUÁREZ',20),

	(null,'JUCHITÁN DE ZARAGOZA',20),   -- 50


	(null,'LOMA BONITA',20),

    (null,'MAGDALENA APASCO',20),

    (null,'MAGDALENA JALTEPEC',20),

	(null,'SANTA MAGDALENA JICOTLÁN',20),

    (null,'MAGDALENA MIXTEPEC',20),

    (null,'MAGDALENA OCOTLÁN',20),

	(null,'MAGDALENA PEÑASCO',20),

    (null,'MAGDALENA TEITIPAC',20),

    (null,'MAGDALENA TEQUISISTLÁN',20),

	(null,'MAGDALENA TLACOTEPEC',20),   -- 60


	(null,'MAGDALENA ZAHUATLÁN',20),

    (null,'MARISCALA DE JUÁREZ',20),

    (null,'MÁRTIRES DE TACUBAYA',20),

	(null,'MATÍAS ROMERO AVENDAÑO',20),

    (null,'MAZATLÁN VILLA DE FLORES',20),

    (null,'MIAHUATLÁN DE PORFIRIO DÍAZ',20),

	(null,'MIXISTLÁN DE LA REFORMA',20),

    (null,'MONJAS',20),

    (null,'NATIVIDAD',20),

	(null,'NAZARENO ETLA',20),   -- 70


	(null,'NEJAPA DE MADERO',20),

    (null,'IXPANTEPEC NIEVES',20),

    (null,'SANTIAGO NILTEPEC',20),

	(null,'OAXACA DE JUÁREZ',20),

    (null,'OCOTLÁN DE MORELOS',20),

    (null,'LA PE',20),

	(null,'PINOTEPA DE DON LUIS',20),

    (null,'PLUMA HIDALGO',20),

    (null,'SAN JOSÉ DEL PROGRESO',20),

	(null,'PUTLA VILLA DE GUERRERO',20),   -- 80


	(null,'SANTA CATARINA QUIOQUITANI',20),

    (null,'REFORMA DE PINEDA',20),

    (null,'LA REFORMA',20),

	(null,'REYES ETLA',20),

    (null,'ROJAS DE CUAUHTÉMOC',20),

    (null,'SALINA CRUZ',20),

	(null,'SAN AGUSTÍN AMATENGO',20),

    (null,'SAN AGUSTÍN ATENANGO',20),

    (null,'SAN AGUSTÍN CHAYUCO',20),

	(null,'SAN AGUSTÍN DE LAS JUNTAS',20),   -- 90


	(null,'SAN AGUSTÍN ETLA',20),

    (null,'SAN AGUSTÍN LOXICHA',20),

    (null,'SAN AGUSTÍN TLACOTEPEC',20),

	(null,'SAN AGUSTÍN YATARENI',20),

    (null,'SAN ANDRÉS CABECERA NUEVA',20),

    (null,'SAN ANDRÉS DINICUITI',20),

	(null,'SAN ANDRÉS HUAXPALTEPEC',20),

    (null,'SAN ANDRÉS HUAYÁPAM',20),

    (null,'SAN ANDRÉS IXTLAHUACA',20),

	(null,'SAN ANDRÉS LAGUNAS',20),   -- 100


	(null,'SAN ANDRÉS NUXIÑO',20),

    (null,'SAN ANDRÉS PAXTLÁN',20),

    (null,'SAN ANDRÉS SINAXTLA',20),

	(null,'SAN ANDRÉS SOLAGA',20),

    (null,'SAN ANDRÉS TEOTILÁLPAM',20),

    (null,'SAN ANDRÉS TEPETLAPA',20),

	(null,'SAN ANDRÉS YAÁ',20),

    (null,'SAN ANDRÉS ZABACHE',20),

    (null,'SAN ANDRÉS ZAUTLA',20),

	(null,'SAN ANTONINO CASTILLO VELASCO',20),   -- 110

    

    (null,'SAN ANTONINO EL ALTO',20),

    (null,'SAN ANTONINO MONTE VERDE',20),

    (null,'SAN ANTONIO ACUTLA',20); -- 113
    
-- 1131 al 1243
insert into municipio values(NULL,"SAN ANTONIO DE LA CAL",20);

insert into municipio values(NULL,"SAN ANTONIO HUITEPEC",20);

insert into municipio values(NULL,"SAN ANTONIO NANAHUATÍPAM",20);

insert into municipio values(NULL,"SAN ANTONIO SINICAHUA ",20);

insert into municipio values(NULL,"SAN ANTONIO TEPETLAPA",20);

insert into municipio values(NULL,"SAN BALTAZAR CHICHICÁPAM",20);

insert into municipio values(NULL,"SAN BALTAZAR LOXICHA",20);

insert into municipio values(NULL,"SAN BALTAZAR YATZACHI EL BAJO",20);

insert into municipio values(NULL,"SAN BARTOLO COYOTEPEC",20);

insert into municipio values(NULL,"SAN BARTOLOMÉ AYAUTLA",20);

insert into municipio values(NULL,"SAN BARTOLOMÉ LOXICHA",20);

insert into municipio values(NULL,"SAN BARTOLOMÉ QUIALANA",20);

insert into municipio values(NULL,"SAN BARTOLOMÉ YUCUAÑE",20);

insert into municipio values(NULL,"SAN BARTOLOMÉ ZOOGOCHO",20);

insert into municipio values(NULL,"SAN BARTOLO SOYALTEPEC",20);

insert into municipio values(NULL,"SAN BARTOLO YAUTEPEC",20);

insert into municipio values(NULL,"SAN BERNARDO MIXTEPEC",20);

insert into municipio values(NULL,"SAN BLAS ATEMPA" ,20);

insert into municipio values(NULL,"SAN CARLOS YAUTEPEC",20);

insert into municipio values(NULL,"SAN CRISTÓBAL AMATLÁN",20);

insert into municipio values(NULL,"SAN CRISTÓBAL AMOLTEPEC",20);

insert into municipio values(NULL,"SAN CRISTÓBAL LACHIRIOAG",20);

insert into municipio values(NULL,"SAN CRISTÓBAL SUCHIXTLAHUACA",20);

insert into municipio values(NULL,"SAN DIONISIO DEL MAR" ,20);

insert into municipio values(NULL,"SAN DIONISIO OCOTEPEC",20);

insert into municipio values(NULL,"SAN DIONISIO OCOTLÁN",20);

insert into municipio values(NULL,"SAN ESTEBAN ATATLAHUCA",20);

insert into municipio values(NULL,"SAN FELIPE JALAPA DE DÍAZ",20);

insert into municipio values(NULL,"SAN FELIPE TEJALÁPAM",20);

insert into municipio values(NULL,"SAN FELIPE USILA",20);

insert into municipio values(NULL,"SAN FRANCISCO CAHUACUÁ",20);

insert into municipio values(NULL,"SAN FRANCISCO CAJONOS",20);

insert into municipio values(NULL,"SAN FRANCISCO CHAPULAPA",20);

insert into municipio values(NULL,"SAN FRANCISCO CHINDÚA",20);

insert into municipio values(NULL,"SAN FRANCISCO DEL MAR",20);

insert into municipio values(NULL,"SAN FRANCISCO HUEHUETLÁN",20);

insert into municipio values(NULL,"SAN FRANCISCO IXHUATÁN",20);

insert into municipio values(NULL,"SAN FRANCISCO JALTEPETONGO",20);

insert into municipio values(NULL,"SAN FRANCISCO LACHIGOLÓ",20);

insert into municipio values(NULL,"SAN FRANCISCO LOGUECHE",20);

insert into municipio values(NULL,"SAN FRANCISCO NUXAÑO",20);

insert into municipio values(NULL,"SAN FRANCISCO OZOLOTEPEC",20);

insert into municipio values(NULL,"SAN FRANCISCO SOLA" ,20);

insert into municipio values(NULL,"SAN FRANCISCO TELIXTLAHUACA",20);

insert into municipio values(NULL,"SAN FRANCISCO TEOPAN" ,20);

insert into municipio values(NULL,"SAN FRANCISCO TLAPANCINGO",20);

insert into municipio values(NULL,"SAN GABRIEL MIXTEPEC" ,20);

insert into municipio values(NULL,"SAN ILDEFONSO AMATLÁN",20);

insert into municipio values(NULL,"SAN ILDEFONSO SOLA" ,20);

insert into municipio values(NULL,"SAN ILDEFONSO VILLA ALTA",20);

insert into municipio values(NULL,"SAN JACINTO AMILPAS",20);

insert into municipio values(NULL,"SAN JACINTO TLACOTEPEC",20);

insert into municipio values(NULL,"SAN JERÓNIMO COATLÁN",20);

insert into municipio values(NULL,"SAN JERÓNIMO SILACAYOAPILLA",20);

insert into municipio values(NULL,"SAN JERÓNIMO SOSOLA",20);

insert into municipio values(NULL,"SAN JERÓNIMO TAVICHE",20);

insert into municipio values(NULL,"SAN JERÓNIMO TECÓATL",20);

insert into municipio values(NULL,"SAN JORGE NUCHITA",20);

insert into municipio values(NULL,"SAN JOSÉ AYUQUILA",20);

insert into municipio values(NULL,"SAN JOSÉ CHILTEPEC",20);

insert into municipio values(NULL,"SAN JOSÉ DEL PEÑASCO",20);

insert into municipio values(NULL,"SAN JOSÉ ESTANCIA GRANDE",20);

insert into municipio values(NULL,"SAN JOSÉ INDEPENDENCIA",20);

insert into municipio values(NULL,"SAN JOSÉ LACHIGUIRI",20);

insert into municipio values(NULL,"SAN JOSÉ TENANGO" ,20);

insert into municipio values(NULL,"SAN JUAN ACHIUTLA",20);

insert into municipio values(NULL,"SAN JUAN ATEPEC",20);

insert into municipio values(NULL,"ÁNIMAS TRUJANO",20);

insert into municipio values(NULL,"SAN JUAN BAUTISTA ATATLAHUCA",20);

insert into municipio values(NULL,"SAN JUAN BAUTISTA COIXTLAHUACA",20);

insert into municipio values(NULL,"SAN JUAN BAUTISTA CUICATLÁN",20);

insert into municipio values(NULL,"SAN JUAN BAUTISTA GUELACHE",20);

insert into municipio values(NULL,"SAN JUAN BAUTISTA JAYACATLÁN",20);

insert into municipio values(NULL,"SAN JUAN BAUTISTA LO DE SOTO",20);

insert into municipio values(NULL,"SAN JUAN BAUTISTA SUCHITEPEC",20);

insert into municipio values(NULL,"SAN JUAN BAUTISTA TLACOATZINTEPEC",20);

insert into municipio values(NULL,"SAN JUAN BAUTISTA TLACHICHILCO",20);

insert into municipio values(NULL,"SAN JUAN BAUTISTA TUXTEPEC",20);

insert into municipio values(NULL,"SAN JUAN CACAHUATEPEC",20);

insert into municipio values(NULL,"SAN JUAN CIENEGUILLA" ,20);

insert into municipio values(NULL,"SAN JUAN COATZÓSPAM",20);

insert into municipio values(NULL,"SAN JUAN COLORADO",20);

insert into municipio values(NULL,"SAN JUAN COMALTEPEC",20);

insert into municipio values(NULL,"SAN JUAN COTZOCÓN",20);

insert into municipio values(NULL,"SAN JUAN CHICOMEZÚCHIL",20);

insert into municipio values(NULL,"SAN JUAN CHILATECA",20);

insert into municipio values(NULL,"SAN JUAN DEL ESTADO",20);

insert into municipio values(NULL,"SAN JUAN DEL RÍO",20);

insert into municipio values(NULL,"SAN JUAN DIUXI",20);

insert into municipio values(NULL,"SAN JUAN EVANGELISTA ANALCO",20);

insert into municipio values(NULL,"SAN JUAN GUELAVÍA",20);

insert into municipio values(NULL,"SAN JUAN GUICHICOVI",20);

insert into municipio values(NULL,"SAN JUAN IHUALTEPEC",20);

insert into municipio values(NULL,"SAN JUAN JUQUILA MIXES",20);

insert into municipio values(NULL,"SAN JUAN JUQUILA VIJANOS",20);

insert into municipio values(NULL,"SAN JUAN LACHAO",20);

insert into municipio values(NULL,"SAN JUAN LACHIGALLA" ,20);

insert into municipio values(NULL,"SAN JUAN LAJARCIA" ,20);

insert into municipio values(NULL,"SAN JUAN LALANA" ,20);

insert into municipio values(NULL,"SAN JUAN DE LOS CUÉS" ,20);

insert into municipio values(NULL,"SAN JUAN MAZATLÁN" ,20);

insert into municipio values(NULL,"SAN JUAN MIXTEPEC" ,20);

insert into municipio values(NULL,"SAN JUAN MIXTEPEC" ,20);

insert into municipio values(NULL,"SAN JUAN ÑUMÍ" ,20);

insert into municipio values(NULL,"SAN JUAN OZOLOTEPEC" ,20);

insert into municipio values(NULL,"SAN JUAN PETLAPA",20);

insert into municipio values(NULL,"SAN JUAN QUIAHIJE",20);

insert into municipio values(NULL,"SAN JUAN QUIOTEPEC",20);

insert into municipio values(NULL,"SAN JUAN SAYULTEPEC",20);

insert into municipio values(NULL,"SAN JUAN TABAÁ",20);

insert into municipio values(NULL,"SAN JUAN TAMAZOLA",20);

insert into municipio values(NULL,"SAN JUAN TEITA",20);

insert into municipio values(NULL,"SAN JUAN TEITIPAC",20);

-- 1244 al 1356
-- Oaxaca id 20


-- 1244-1356

insert into municipio values (null, 'SAN JUAN TEPEUXILA', 20); -- 1244

insert into municipio values (null, 'SAN JUAN TEPOSCOLULA', 20);

insert into municipio values (null, 'SAN JUAN YAEÉ', 20);

insert into municipio values (null, 'SAN JUAN YATZONA', 20);

insert into municipio values (null, 'SAN JUAN YUCUITA', 20);

insert into municipio values (null, 'SAN LORENZO', 20);

insert into municipio values (null, 'SAN LORENZO ALBARRADAS', 20);

insert into municipio values (null, 'SAN LORENZO CACAOTEPEC', 20);

insert into municipio values (null, 'SAN LORENZO CUAUNECUILTITLA', 20);

insert into municipio values (null, 'SAN LORENZO TEXMELÚCAN', 20);  

insert into municipio values (null, 'SAN LORENZO VICTORIA', 20);  -- 1254

insert into municipio values (null, 'SAN LUCAS CAMOTLÁN', 20); 

insert into municipio values (null, 'SAN LUCAS OJITLÁN', 20);

insert into municipio values (null, 'SAN LUCAS QUIAVINÍ', 20);

insert into municipio values (null, 'SAN LUCAS ZOQUIÁPAM', 20);

insert into municipio values (null, 'SAN LUIS AMATLÁN', 20);

insert into municipio values (null, 'SAN MARCIAL OZOLOTEPEC', 20);

insert into municipio values (null, 'SAN MARCOS ARTEAGA', 20);

insert into municipio values (null, 'SAN MARTÍN DE LOS CANSECOS', 20);

insert into municipio values (null, 'SAN MARTÍN HUAMELÚLPAM', 20); 

insert into municipio values (null, 'SAN MARTÍN ITUNYOSO', 20); -- 1264

insert into municipio values (null, 'SAN MARTÍN LACHILÁ', 20);

insert into municipio values (null, 'SAN MARTÍN PERAS', 20);

insert into municipio values (null, 'SAN MARTÍN TILCAJETE', 20);

insert into municipio values (null, 'SAN MARTÍN TOXPALAN', 20);

insert into municipio values (null, 'SAN MARTÍN ZACATEPEC', 20);

insert into municipio values (null, 'SAN MATEO CAJONOS', 20);

insert into municipio values (null, 'CAPULÁLPAM DE MÉNDEZ', 20);

insert into municipio values (null, 'SAN MATEO DEL MAR', 20);

insert into municipio values (null, 'SAN MATEO YOLOXOCHITLÁN', 20);

insert into municipio values (null, 'SAN MATEO ETLATONGO', 20); -- 1274

insert into municipio values (null, 'SAN MATEO NEJÁPAM', 20);

insert into municipio values (null, 'SAN MATEO PEÑASCO', 20);

insert into municipio values (null, 'SAN MATEO PIÑAS', 20);

insert into municipio values (null, 'SAN MATEO RÍO HONDO', 20);

insert into municipio values (null, 'SAN MATEO SINDIHUI', 20);

insert into municipio values (null, 'SAN MATEO TLAPILTEPEC', 20);

insert into municipio values (null, 'SAN MELCHOR BETAZA', 20);

insert into municipio values (null, 'SAN MIGUEL ACHIUTLA', 20);

insert into municipio values (null, 'SAN MIGUEL AHUEHUETITLÁN', 20);

insert into municipio values (null, 'SAN MIGUEL ALOÁPAM', 20); -- 1284

insert into municipio values (null, 'SAN MIGUEL AMATITLÁN', 20);

insert into municipio values (null, 'SAN MIGUEL AMATLÁN', 20);

insert into municipio values (null, 'SAN MIGUEL COATLÁN', 20);

insert into municipio values (null, 'SAN MIGUEL CHICAHUA', 20);

insert into municipio values (null, 'SAN MIGUEL CHIMALAPA', 20);

insert into municipio values (null, 'SAN MIGUEL DEL PUERTO', 20);

insert into municipio values (null, 'SAN MIGUEL DEL RÍO', 20);

insert into municipio values (null, 'SAN MIGUEL EJUTLA', 20);

insert into municipio values (null, 'SAN MIGUEL EL GRANDE', 20);

insert into municipio values (null, 'SAN MIGUEL HUAUTLA', 20); -- 1294

insert into municipio values (null, 'SAN MIGUEL MIXTEPEC', 20);

insert into municipio values (null, 'SAN MIGUEL PANIXTLAHUACA', 20);

insert into municipio values (null, 'SAN MIGUEL PERAS', 20);

insert into municipio values (null, 'SAN MIGUEL PIEDRAS', 20);

insert into municipio values (null, 'SAN MIGUEL QUETZALTEPEC', 20);

insert into municipio values (null, 'SAN MIGUEL SANTA FLOR', 20);

insert into municipio values (null, 'VILLA SOLA DE VEGA', 20);

insert into municipio values (null, 'SAN MIGUEL SOYALTEPEC', 20);

insert into municipio values (null, 'SAN MIGUEL SUCHIXTEPEC', 20);

insert into municipio values (null, 'VILLA TALEA DE CASTRO', 20); -- 1304

insert into municipio values (null, 'SAN MIGUEL TECOMATLÁN', 20);

insert into municipio values (null, 'SAN MIGUEL TENANGO', 20);

insert into municipio values (null, 'SAN MIGUEL TEQUIXTEPEC', 20);

insert into municipio values (null, 'SAN MIGUEL TILQUIÁPAM', 20);

insert into municipio values (null, 'SAN MIGUEL TLACAMAMA', 20);

insert into municipio values (null, 'SAN MIGUEL TLACOTEPEC', 20);

insert into municipio values (null, 'SAN MIGUEL TULANCINGO', 20);

insert into municipio values (null, 'SAN MIGUEL YOTAO', 20);

insert into municipio values (null, 'SAN NICOLÁS', 20);

insert into municipio values (null, 'SAN NICOLÁS HIDALGO', 20); -- 1314

insert into municipio values (null, 'SAN PABLO COATLÁN', 20);

insert into municipio values (null, 'SAN PABLO CUATRO VENADOS', 20);

insert into municipio values (null, 'SAN PABLO ETLA', 20);

insert into municipio values (null, 'SAN PABLO HUITZO', 20);

insert into municipio values (null, 'SAN PABLO HUIXTEPEC', 20);

insert into municipio values (null, 'SAN PABLO MACUILTIANGUIS', 20);

insert into municipio values (null, 'SAN PABLO TIJALTEPEC', 20);

insert into municipio values (null, 'SAN PABLO VILLA DE MITLA', 20);

insert into municipio values (null, 'SAN PABLO YAGANIZA', 20);

insert into municipio values (null, 'SAN PEDRO AMUZGOS', 20); -- 1324

insert into municipio values (null, 'SAN PEDRO APÓSTOL', 20);

insert into municipio values (null, 'SAN PEDRO ATOYAC', 20);

insert into municipio values (null, 'SAN PEDRO CAJONOS', 20);

insert into municipio values (null, 'SAN PEDRO COXCALTEPEC CÁNTAROS', 20);

insert into municipio values (null, 'SAN PEDRO COMITANCILLO', 20);

insert into municipio values (null, 'SAN PEDRO EL ALTO', 20);

insert into municipio values (null, 'SAN PEDRO HUAMELULA', 20);

insert into municipio values (null, 'SAN PEDRO HUILOTEPEC', 20);

insert into municipio values (null, 'SAN PEDRO IXCATLÁN', 20);

insert into municipio values (null, 'SAN PEDRO IXTLAHUACA', 20); -- 1334

insert into municipio values (null, 'SAN PEDRO JALTEPETONGO', 20);

insert into municipio values (null, 'SAN PEDRO JICAYÁN', 20);

insert into municipio values (null, 'SAN PEDRO JOCOTIPAC', 20);

insert into municipio values (null, 'SAN PEDRO JUCHATENGO', 20);

insert into municipio values (null, 'SAN PEDRO MÁRTIR', 20);

insert into municipio values (null, 'SAN PEDRO MÁRTIR QUIECHAPA', 20);

insert into municipio values (null, 'SAN PEDRO MÁRTIR YUCUXACO', 20);

insert into municipio values (null, 'SAN PEDRO MIXTEPEC', 20);

insert into municipio values (null, 'SAN PEDRO MIXTEPEC', 20);  -- <-- este se repetía en la tabla, es el 1343

insert into municipio values (null, 'SAN PEDRO MOLINOS', 20); -- 1344

insert into municipio values (null, 'SAN PEDRO NOPALA', 20);

insert into municipio values (null, 'SAN PEDRO OCOPETATILLO', 20);

insert into municipio values (null, 'SAN PEDRO OCOTEPEC', 20);

insert into municipio values (null, 'SAN PEDRO POCHUTLA', 20);

insert into municipio values (null, 'SAN PEDRO QUIATONI', 20);

insert into municipio values (null, 'SAN PEDRO SOCHIÁPAM', 20);

insert into municipio values (null, 'SAN PEDRO TAPANATEPEC', 20);

insert into municipio values (null, 'SAN PEDRO TAVICHE', 20);

insert into municipio values (null, 'SAN PEDRO TEOZACOALCO', 20);

insert into municipio values (null, 'SAN PEDRO TEUTILA', 20); -- 1354

insert into municipio values (null, 'SAN PEDRO TIDAÁ', 20);

insert into municipio values (null, 'SAN PEDRO TOPILTEPEC', 20); -- 1356

-- 1357 al 1469 falta

insert into municipio values (null,"SAN PEDRO TOPILTEPEC",20),(null,"SAN PEDRO TOTOLÁPAM",20),(null,"VILLA DE TUTUTEPEC",20),(null,"SAN PEDRO YANERI",20),(null,"SAN PEDRO YÓLOX",20),(null,"SAN PEDRO Y SAN PABLO AYUTLA",20),(null,"VILLA DE ETLA",20),(null,"SAN PEDRO Y SAN PABLO TEPOSCOLULA",20),(null,"SAN PEDRO Y SAN PABLO TEQUIXTEPEC",20),(null,"SAN PEDRO YUCUNAMA",20),(null,"SAN RAYMUNDO JALPAN",20),(null,"SAN SEBASTIÁN ABASOLO",20),(null,"SAN SEBASTIÁN COATLÁN",20),(null,"SAN SEBASTIÁN IXCAPA",20),(null,"SAN SEBASTIÁN NICANANDUTA",20),(null,"SAN SEBASTIÁN RÍO HONDO",20),(null,"SAN SEBASTIÁN TECOMAXTLAHUACA",20),(null,"SAN SEBASTIÁN TEITIPAC",20),(null,"SAN SEBASTIÁN TUTLA",20),(null,"SAN SIMÓN ALMOLONGAS",20),(null,"SAN SIMÓN ZAHUATLÁN",20),(null,"SANTA ANA",20),(null,"SANTA ANA ATEIXTLAHUACA",20),(null,"SANTA ANA CUAUHTÉMOC",20),(null,"SANTA ANA DEL VALLE",20),(null,"SANTA ANA TAVELA",20),(null,"SANTA ANA TLAPACOYAN",20),(null,"SANTA ANA YARENI",20),(null,"SANTA ANA ZEGACHE",20),(null,"SANTA CATALINA QUIERÍ",20),(null,"SANTA CATARINA CUIXTLA",20),(null,"SANTA CATARINA IXTEPEJI",20),(null,"SANTA CATARINA JUQUILA",20),(null,"SANTA CATARINA LACHATAO",20),(null,"SANTA CATARINA LOXICHA",20),(null,"SANTA CATARINA MECHOACÁN",20),(null,"SANTA CATARINA MINAS",20),(null,"SANTA CATARINA QUIANÉ",20),(null,"SANTA CATARINA TAYATA",20),(null,"SANTA CATARINA TICUÁ",20),(null,"SANTA CATARINA YOSONOTÚ",20),(null,"SANTA CATARINA ZAPOQUILA",20),(null,"SANTA CRUZ ACATEPEC",20),(null,"SANTA CRUZ AMILPAS",20),(null,"SANTA CRUZ DE BRAVO",20),(null,"SANTA CRUZ ITUNDUJIA",20),(null,"SANTA CRUZ MIXTEPEC",20),(null,"SANTA CRUZ NUNDACO",20),(null,"SANTA CRUZ PAPALUTLA",20),(null,"SANTA CRUZ TACACHE DE MINA",20),(null,"SANTA CRUZ TACAHUA",20),(null,"SANTA CRUZ TAYATA",20),(null,"SANTA CRUZ XITLA",20),(null,"SANTA CRUZ XOXOCOTLÁN",20),(null,"SANTA CRUZ ZENZONTEPEC",20),(null,"SANTA GERTRUDIS",20),(null,"SANTA INÉS DEL MONTE",20),(null,"SANTA INÉS YATZECHE",20),(null,"SANTA LUCÍA DEL CAMINO",20),(null,"SANTA LUCÍA MIAHUATLÁN",20),(null,"SANTA LUCÍA MONTEVERDE",20),(null,"SANTA LUCÍA OCOTLÁN",20),(null,"SANTA MARÍA ALOTEPEC",20),(null,"SANTA MARÍA APAZCO",20),(null,"SANTA MARÍA LA ASUNCIÓN",20),(null,"HEROICA CIUDAD DE TLAXIACO",20),(null,"AYOQUEZCO DE ALDAMA",20),(null,"SANTA MARÍA ATZOMPA",20),(null,"SANTA MARÍA CAMOTLÁN",20),(null,"SANTA MARÍA COLOTEPEC",20),(null,"SANTA MARÍA CORTIJO",20),(null,"SANTA MARÍA COYOTEPEC",20),(null,"SANTA MARÍA CHACHOÁPAM",20),(null,"VILLA DE CHILAPA DE DÍAZ",20),(null,"SANTA MARÍA CHILCHOTLA",20),(null,"SANTA MARÍA CHIMALAPA",20),(null,"SANTA MARÍA DEL ROSARIO",20),(null,"SANTA MARÍA DEL TULE",20),(null,"SANTA MARÍA ECATEPEC",20),(null,"SANTA MARÍA GUELACÉ",20),(null,"SANTA MARÍA GUIENAGATI",20),(null,"SANTA MARÍA HUATULCO",20),(null,"SANTA MARÍA HUAZOLOTITLÁN",20),(null,"SANTA MARÍA IPALAPA",20),(null,"SANTA MARÍA IXCATLÁN",20),(null,"SANTA MARÍA JACATEPEC",20),(null,"SANTA MARÍA JALAPA DEL MARQUÉS",20),(null,"SANTA MARÍA JALTIANGUIS",20),(null,"SANTA MARÍA LACHIXÍO",20),(null,"SANTA MARÍA MIXTEQUILLA",20),(null,"SANTA MARÍA NATIVITAS",20),(null,"SANTA MARÍA NDUAYACO",20),(null,"SANTA MARÍA OZOLOTEPEC",20),(null,"SANTA MARÍA PÁPALO",20),(null,"SANTA MARÍA PEÑOLES",20),(null,"SANTA MARÍA PETAPA",20),(null,"SANTA MARÍA QUIEGOLANI",20),(null,"SANTA MARÍA SOLA",20),(null,"SANTA MARÍA TATALTEPEC",20),(null,"SANTA MARÍA TECOMAVACA",20),(null,"SANTA MARÍA TEMAXCALAPA",20),(null,"SANTA MARÍA TEMAXCALTEPEC",20),(null,"SANTA MARÍA TEOPOXCO",20),(null,"SANTA MARÍA TEPANTLALI",20),(null,"SANTA MARÍA TEXCATITLÁN",20),(null,"SANTA MARÍA TLAHUITOLTEPEC",20),(null,"SANTA MARÍA TLALIXTAC",20),(null,"SANTA MARÍA TONAMECA",20),(null,"SANTA MARÍA TOTOLAPILLA",20),(null,"SANTA MARÍA XADANI",20),(null,"SANTA MARÍA YALINA",20),(null,"SANTA MARÍA YAVESÍA",20),(null,"SANTA MARÍA YOLOTEPEC",20);


-- 1470 al 1582
insert into municipio values (1470, "SANTA MARÍA YUCUHITI", 20);

insert into municipio values (1471, "SANTA MARÍA ZACATEPEC", 20);

insert into municipio values (1472, "SANTA MARÍA ZANIZA", 20);

insert into municipio values (1473, "SANTA MARÍA ZOQUITLÁN", 20);

insert into municipio values (1474, "SANTIAGO AMOLTEPEC", 20);

insert into municipio values (1475, "SANTIAGO APOALA", 20);

insert into municipio values (1476, "SANTIAGO APÓSTOL", 20);

insert into municipio values (1477, "SANTIAGO ASTATA", 20);

insert into municipio values (1478, "SANTIAGO ATITLÁN", 20);

insert into municipio values (1479, "SANTIAGO AYUQUILILLA", 20);

insert into municipio values (1480, "SANTIAGO CACALOXTEPEC", 20);

insert into municipio values (1481, "SANTIAGO CAMOTLÁN", 20);

insert into municipio values (1482, "SANTIAGO COMALTEPEC", 20);

insert into municipio values (1483, "VILLA DE SANTIAGO CHAZUMBA", 20);

insert into municipio values (1484, "SANTIAGO CHOÁPAM", 20);

insert into municipio values (1485, "SANTIAGO DEL RÍO", 20);

insert into municipio values (1486, "SANTIAGO HUAJOLOTITLÁN", 20);

insert into municipio values (1487, "SANTIAGO HUAUCLILLA", 20);

insert into municipio values (1488, "SANTIAGO IHUITLÁN PLUMAS", 20);

insert into municipio values (1489, "SANTIAGO IXCUINTEPEC", 20);

insert into municipio values (1490, "SANTIAGO IXTAYUTLA", 20);

insert into municipio values (1491, "SANTIAGO JAMILTEPEC", 20);

insert into municipio values (1492, "SANTIAGO JOCOTEPEC", 20);

insert into municipio values (1493, "SANTIAGO JUXTLAHUACA", 20);

insert into municipio values (1494, "SANTIAGO LACHIGUIRI", 20);

insert into municipio values (1495, "SANTIAGO LALOPA", 20);

insert into municipio values (1496, "SANTIAGO LAOLLAGA", 20);

insert into municipio values (1497, "SANTIAGO LAXOPA", 20);

insert into municipio values (1498, "SANTIAGO LLANO GRANDE", 20);

insert into municipio values (1499, "SANTIAGO MATATLÁN", 20);

insert into municipio values (1500, "SANTIAGO MILTEPEC", 20);

insert into municipio values (1501, "SANTIAGO MINAS", 20);

insert into municipio values (1502, "SANTIAGO NACALTEPEC", 20);

insert into municipio values (1503, "SANTIAGO NEJAPILLA", 20);

insert into municipio values (1504, "SANTIAGO NUNDICHE", 20);

insert into municipio values (1505, "SANTIAGO NUYOÓ", 20);

insert into municipio values (1506, "SANTIAGO PINOTEPA NACIONAL", 20);

insert into municipio values (1507, "SANTIAGO SUCHILQUITONGO", 20);

insert into municipio values (1508, "SANTIAGO TAMAZOLA", 20);

insert into municipio values (1509, "SANTIAGO TAPEXTLA", 20);

insert into municipio values (1510, "VILLA TEJÚPAM DE LA UNIÓN", 20);

insert into municipio values (1511, "SANTIAGO TENANGO", 20);

insert into municipio values (1512, "SANTIAGO TEPETLAPA", 20);

insert into municipio values (1513, "SANTIAGO TETEPEC", 20);

insert into municipio values (1514, "SANTIAGO TEXCALCINGO", 20);

insert into municipio values (1515, "SANTIAGO TEXTITLÁN", 20);

insert into municipio values (1516, "SANTIAGO TILANTONGO", 20);

insert into municipio values (1517, "SANTIAGO TILLO", 20);

insert into municipio values (1518, "SANTIAGO TLAZOYALTEPEC", 20);

insert into municipio values (1519, "SANTIAGO XANICA", 20);

insert into municipio values (1520, "SANTIAGO XIACUÍ", 20);

insert into municipio values (1521, "SANTIAGO YAITEPEC", 20);

insert into municipio values (1522, "SANTIAGO YAVEO", 20);

insert into municipio values (1523, "SANTIAGO YOLOMÉCATL", 20);

insert into municipio values (1524, "SANTIAGO YOSONDÚA", 20);

insert into municipio values (1525, "SANTIAGO YUCUYACHI", 20);

insert into municipio values (1526, "SANTIAGO ZACATEPEC", 20);

insert into municipio values (1527, "SANTIAGO ZOOCHILA", 20);

insert into municipio values (1528, "NUEVO ZOQUIÁPAM", 20);

insert into municipio values (1529, "SANTO DOMINGO INGENIO", 20);

insert into municipio values (1530, "SANTO DOMINGO ALBARRADAS", 20);

insert into municipio values (1531, "SANTO DOMINGO ARMENTA", 20);

insert into municipio values (1532, "SANTO DOMINGO CHIHUITÁN", 20);

insert into municipio values (1533, "SANTO DOMINGO DE MORELOS", 20);

insert into municipio values (1534, "SANTO DOMINGO IXCATLÁN", 20);

insert into municipio values (1535, "SANTO DOMINGO NUXAÁ", 20);

insert into municipio values (1536, "SANTO DOMINGO OZOLOTEPEC", 20);

insert into municipio values (1537, "SANTO DOMINGO PETAPA", 20);

insert into municipio values (1538, "SANTO DOMINGO ROAYAGA", 20);

insert into municipio values (1539, "SANTO DOMINGO TEHUANTEPEC", 20);

insert into municipio values (1540, "SANTO DOMINGO TEOJOMULCO", 20);

insert into municipio values (1541, "SANTO DOMINGO TEPUXTEPEC", 20);

insert into municipio values (1542, "SANTO DOMINGO TLATAYÁPAM", 20);

insert into municipio values (1543, "SANTO DOMINGO TOMALTEPEC", 20);

insert into municipio values (1544, "SANTO DOMINGO TONALÁ", 20);

insert into municipio values (1545, "SANTO DOMINGO TONALTEPEC", 20);

insert into municipio values (1546, "SANTO DOMINGO XAGACÍA", 20);

insert into municipio values (1547, "SANTO DOMINGO YANHUITLÁN", 20);

insert into municipio values (1548, "SANTO DOMINGO YODOHINO", 20);

insert into municipio values (1549, "SANTO DOMINGO ZANATEPEC", 20);

insert into municipio values (1550, "SANTOS REYES NOPALA", 20);

insert into municipio values (1551, "SANTOS REYES PÁPALO", 20);

insert into municipio values (1552, "SANTOS REYES TEPEJILLO", 20);

insert into municipio values (1553, "SANTOS REYES YUCUNÁ", 20);

insert into municipio values (1554, "SANTO TOMÁS JALIEZA", 20);

insert into municipio values (1555, "SANTO TOMÁS MAZALTEPEC", 20);

insert into municipio values (1556, "SANTO TOMÁS OCOTEPEC", 20);

insert into municipio values (1557, "SANTO TOMÁS TAMAZULAPAN", 20);

insert into municipio values (1558, "SAN VICENTE COATLÁN", 20);

insert into municipio values (1559, "SAN VICENTE LACHIXÍO", 20);

insert into municipio values (1560, "SAN VICENTE NUÑÚ", 20);

insert into municipio values (1561, "SILACAYOÁPAM", 20);

insert into municipio values (1562, "SITIO DE XITLAPEHUA", 20);

insert into municipio values (1563, "SOLEDAD ETLA", 20);

insert into municipio values (1564, "VILLA DE TAMAZULÁPAM DEL PROGRESO", 20);

insert into municipio values (1565, "TANETZE DE ZARAGOZA", 20);

insert into municipio values (1566, "TANICHE", 20);

insert into municipio values (1567, "TATALTEPEC DE VALDÉS", 20);

insert into municipio values (1568, "TEOCOCUILCO DE MARCOS PÉREZ", 20);

insert into municipio values (1569, "TEOTITLÁN DE FLORES MAGÓN", 20);

insert into municipio values (1570, "TEOTITLÁN DEL VALLE", 20);

insert into municipio values (1571, "TEOTONGO", 20);

insert into municipio values (1572, "TEPELMEME VILLA DE MORELOS", 20);

insert into municipio values (1573, "HEROICA VILLA TEZOATLÁN DE SEGURA Y LUNA", 20);

insert into municipio values (1574, "SAN JERÓNIMO TLACOCHAHUAYA", 20);

insert into municipio values (1575, "TLACOLULA DE MATAMOROS", 20);

insert into municipio values (1576, "TLACOTEPEC PLUMAS", 20);

insert into municipio values (1577, "TLALIXTAC DE CABRERA", 20);

insert into municipio values (1578, "TOTONTEPEC VILLA DE MORELOS", 20);

insert into municipio values (1579, "TRINIDAD ZAACHILA", 20);

insert into municipio values (1580, "LA TRINIDAD VISTA HERMOSA", 20);

insert into municipio values (1581, "UNIÓN HIDALGO", 20);

insert into municipio values (1582, "VALERIO TRUJANO", 20);

-- 1583 al 1695
insert into Municipio values (null,"SAN JUAN BAUTISTA VALLE NACIONAL",20);

insert into Municipio values (null,"VILLA DÍAZ ORDAZ",20);

insert into Municipio values (null,"YAXE",20);

insert into Municipio values (null,"MAGDALENA YODOCONO DE PORFIRIO DÍAZ",20);

insert into Municipio values (null,"YOGANA",20);

insert into Municipio values (null,"YUTANDUCHI DE GUERRERO",20);

insert into Municipio values (null,"VILLA DE ZAACHILA",20);

insert into Municipio values (null,"SAN MATEO YUCUTINDOO",20);

insert into Municipio values (null,"ZAPOTITLÁN LAGUNAS",20);

insert into Municipio values (null,"ZAPOTITLÁN PALMAS",20);

insert into Municipio values (null,"SANTA INÉS DE ZARAGOZA",20);

insert into Municipio values (null,"ZIMATLÁN DE ÁLVAREZ",20);

insert into Municipio values (null,"NO ESPECIFICADO",20);

insert into Municipio values (null,"ACAJETE",21);

insert into Municipio values (null,"ACATENO",21);

insert into Municipio values (null,"ACATLÁN",21);

insert into Municipio values (null,"ACATZINGO",21);

insert into Municipio values (null,"ACTEOPAN",21);

insert into Municipio values (null,"AHUACATLÁN",21);

insert into Municipio values (null,"AHUATLÁN",21);

insert into Municipio values (null,"AHUAZOTEPEC",21);

insert into Municipio values (null,"AHUEHUETITLA",21);

insert into Municipio values (null,"AJALPAN",21);

insert into Municipio values (null,"ALBINO ZERTUCHE",21);

insert into Municipio values (null,"ALJOJUCA",21);

insert into Municipio values (null,"ALTEPEXI",21);

insert into Municipio values (null,"AMIXTLÁN",21);

insert into Municipio values (null,"AMOZOC",21);

insert into Municipio values (null,"AQUIXTLA",21);

insert into Municipio values (null,"ATEMPAN",21);

insert into Municipio values (null,"ATEXCAL",21);

insert into Municipio values (null,"ATLIXCO",21);

insert into Municipio values (null,"ATOYATEMPAN",21);

insert into Municipio values (null,"ATZALA",21);

insert into Municipio values (null,"ATZITZIHUACÁN",21);

insert into Municipio values (null,"ATZITZINTLA",21);

insert into Municipio values (null,"AXUTLA",21);

insert into Municipio values (null,"AYOTOXCO DE GUERRERO",21);

insert into Municipio values (null,"CALPAN",21);

insert into Municipio values (null,"CALTEPEC",21);

insert into Municipio values (null,"CAMOCUAUTLA",21);

insert into Municipio values (null,"CAXHUACAN",21);

insert into Municipio values (null,"COATEPEC",21);

insert into Municipio values (null,"COATZINGO",21);

insert into Municipio values (null,"COHETZALA",21);

insert into Municipio values (null,"COHUECAN",21);

insert into Municipio values (null,"CORONANGO",21);

insert into Municipio values (null,"COXCATLÁN",21);

insert into Municipio values (null,"COYOMEAPAN",21);

insert into Municipio values (null,"COYOTEPEC",21);

insert into Municipio values (null,"CUAPIAXTLA DE MADERO",21);

insert into Municipio values (null,"CUAUTEMPAN",21);

insert into Municipio values (null,"CUAUTINCHÁN",21);

insert into Municipio values (null,"CUAUTLANCINGO",21);

insert into Municipio values (null,"CUAYUCA DE ANDRADE",21);

insert into Municipio values (null,"CUETZALAN DEL PROGRESO",21);

insert into Municipio values (null,"CUYOACO",21);

insert into Municipio values (null,"CHALCHICOMULA DE SESMA",21);

insert into Municipio values (null,"CHAPULCO",21);

insert into Municipio values (null,"CHIAUTLA",21);

insert into Municipio values (null,"CHIAUTZINGO",21);

insert into Municipio values (null,"CHICONCUAUTLA",21);

insert into Municipio values (null,"CHICHIQUILA",21);

insert into Municipio values (null,"CHIETLA",21);

insert into Municipio values (null,"CHIGMECATITLÁN",21);

insert into Municipio values (null,"CHIGNAHUAPAN",21);

insert into Municipio values (null,"CHIGNAUTLA",21);

insert into Municipio values (null,"CHILA",21);

insert into Municipio values (null,"CHILA DE LA SAL",21);

insert into Municipio values (null,"HONEY",21);

insert into Municipio values (null,"CHILCHOTLA",21);

insert into Municipio values (null,"CHINANTLA",21);

insert into Municipio values (null,"DOMINGO ARENAS",21);

insert into Municipio values (null,"ELOXOCHITLÁN",21);

insert into Municipio values (null,"EPATLÁN",21);

insert into Municipio values (null,"ESPERANZA",21);

insert into Municipio values (null,"FRANCISCO Z. MENA",21);

insert into Municipio values (null,"GENERAL FELIPE ÁNGELES",21);

insert into Municipio values (null,"GUADALUPE",21);

insert into Municipio values (null,"GUADALUPE VICTORIA",21);

insert into Municipio values (null,"HERMENEGILDO GALEANA",21);

insert into Municipio values (null,"HUAQUECHULA",21);

insert into Municipio values (null,"HUATLATLAUCA",21);

insert into Municipio values (null,"HUAUCHINANGO",21);

insert into Municipio values (null,"HUEHUETLA",21);

insert into Municipio values (null,"HUEHUETLÁN EL CHICO",21);

insert into Municipio values (null,"HUEJOTZINGO",21);

insert into Municipio values (null,"HUEYAPAN",21);

insert into Municipio values (null,"HUEYTAMALCO",21);

insert into Municipio values (null,"HUEYTLALPAN",21);

insert into Municipio values (null,"HUITZILAN DE SERDÁN",21);

insert into Municipio values (null,"HUITZILTEPEC",21);

insert into Municipio values (null,"ATLEQUIZAYAN",21);

insert into Municipio values (null,"IXCAMILPA DE GUERRERO",21);

insert into Municipio values (null,"IXCAQUIXTLA",21);

insert into Municipio values (null,"IXTACAMAXTITLÁN",21);

insert into Municipio values (null,"IXTEPEC",21);

insert into Municipio values (null,"IZÚCAR DE MATAMOROS",21);

insert into Municipio values (null,"JALPAN",21);

insert into Municipio values (null,"JOLALPAN",21);

insert into Municipio values (null,"JONOTLA",21);

insert into Municipio values (null,"JOPALA",21);

insert into Municipio values (null,"JUAN C. BONILLA",21);

insert into Municipio values (null,"JUAN GALINDO",21);

insert into Municipio values (null,"JUAN N. MÉNDEZ",21);

insert into Municipio values (null,"LAFRAGUA",21);

insert into Municipio values (null,"LIBRES",21);

insert into Municipio values (null,"LA MAGDALENA TLATLAUQUITEPEC",21);

insert into Municipio values (null,"MAZAPILTEPEC DE JUÁREZ",21);

insert into Municipio values (null,"MIXTLA",21);

insert into Municipio values (null,"MOLCAXAC",21);

insert into Municipio values (null,"CAÑADA MORELOS",21);

insert into Municipio values (null,"NAUPAN",21);

-- 1696 al 1808
insert into municipio values (null,'NAUA', 21);

insert into municipio values (null,'NEALTICAN', 21);

insert into municipio values (null,'NICOLÁS BRAVO', 21);

insert into municipio values (null,'NOPALUCAN', 21);

insert into municipio values (null,'OCOTEPEC', 21);

insert into municipio values (null,'OCOYUCAN', 21);

insert into municipio values (null,'OLINTLA', 21);

insert into municipio values (null,'ORIENTAL', 21);

insert into municipio values (null,'PAHUATLÁN', 21);

insert into municipio values (null,'PALMAR DE BRAVO', 21);

insert into municipio values (null,'PANTEPEC', 21);

insert into municipio values (null,'PETLALCINGO', 21);

insert into municipio values (null,'PIAXTLA', 21);

insert into municipio values (null,'PUEBLA', 21);

insert into municipio values (null,'QUECHOLAC', 21);

insert into municipio values (null,'QUIMIXTLÁN', 21);

insert into municipio values (null,'RAFAEL LARA GRAJALES', 21);

insert into municipio values (null,'LOS REYES DE JUÁREZ', 21);

insert into municipio values (null,'SAN ANDRÉS CHOLULA', 21);

insert into municipio values (null,'SAN ANTONIO CAÑADA', 21);

insert into municipio values (null,'SAN DIEGO LA MESA TOCHIMILTZINGO', 21);

insert into municipio values (null,'SAN FELIPE TEOTLALCINGO', 21);

insert into municipio values (null,'SAN FELIPE TEPATLÁN', 21);

insert into municipio values (null,'SAN GABRIEL CHILAC', 21);

insert into municipio values (null,'SAN GREGORIO ATZOMPA', 21);

insert into municipio values (null,'SAN JERÓNIMO TECUANIPAN', 21);

insert into municipio values (null,'SAN JERÓNIMO XAYACATLÁN', 21);

insert into municipio values (null,'SAN JOSÉ CHIAPA', 21);

insert into municipio values (null,'SAN JOSÉ MIAHUATLÁN', 21);

insert into municipio values (null,'SAN JUAN ATENCO', 21);

insert into municipio values (null,'SAN JUAN ATZOMPA', 21);

insert into municipio values (null,'SAN MARTÍN TEXMELUCAN', 21);

insert into municipio values (null,'SAN MARTÍN TOTOLTEPEC', 21);

insert into municipio values (null,'SAN MATÍAS TLALANCALECA', 21);

insert into municipio values (null,'SAN MIGUEL IXITLÁN', 21);

insert into municipio values (null,'SAN MIGUEL XOXTLA', 21);

insert into municipio values (null,'SAN NICOLÁS BUENOS AIRES', 21);

insert into municipio values (null,'SAN NICOLÁS DE LOS RANCHOS', 21);

insert into municipio values (null,'SAN PABLO ANICANO', 21);

insert into municipio values (null,'SAN PEDRO CHOLULA', 21);

insert into municipio values (null,'SAN PEDRO YELOIXTLAHUACA', 21);

insert into municipio values (null,'SAN SALVADOR EL SECO', 21);

insert into municipio values (null,'SAN SALVADOR EL VERDE', 21);

insert into municipio values (null,'SAN SALVADOR HUIXCOLOTLA', 21);

insert into municipio values (null,'SAN SEBASTIÁN TLACOTEPEC', 21);

insert into municipio values (null,'SANTA CATARINA TLALTEMPAN', 21);

insert into municipio values (null,'SANTA INÉS AHUATEMPA', 21);

insert into municipio values (null,'SANTA ISABEL CHOLULA', 21);

insert into municipio values (null,'SANTIAGO MIAHUATLÁN', 21);

insert into municipio values (null,'HUEHUETLÁN EL GRANDE', 21);

insert into municipio values (null,'SANTO TOMÁS HUEYOTLIPAN', 21);

insert into municipio values (null,'SOLTEPEC', 21);

insert into municipio values (null,'TECALI DE HERRERA', 21);

insert into municipio values (null,'TECAMACHALCO', 21);

insert into municipio values (null,'TECOMATLÁN', 21);

insert into municipio values (null,'TEHUACÁN', 21);

insert into municipio values (null,'TEHUITZINGO', 21);

insert into municipio values (null,'TENAMPULCO', 21);

insert into municipio values (null,'TEOPANTLÁN', 21);

insert into municipio values (null,'TEOTLALCO', 21);

insert into municipio values (null,'TEPANCO DE LÓPEZ', 21);

insert into municipio values (null,'TEPANGO DE RODRÍGUEZ', 21);

insert into municipio values (null,'TEPATLAXCO DE HIDALGO', 21);

insert into municipio values (null,'TEPEACA', 21);

insert into municipio values (null,'TEPEMAXALCO', 21);

insert into municipio values (null,'TEPEOJUMA', 21);

insert into municipio values (null,'TEPETZINTLA', 21);

insert into municipio values (null,'TEPEXCO', 21);

insert into municipio values (null,'TEPEXI DE RODRÍGUEZ', 21);

insert into municipio values (null,'TEPEYAHUALCO', 21);

insert into municipio values (null,'TEPEYAHUALCO DE CUAUHTÉMOC', 21);

insert into municipio values (null,'TETELA DE OCAMPO', 21);

insert into municipio values (null,'TETELES DE AVILA CASTILLO', 21);

insert into municipio values (null,'TEZIUTLÁN', 21);

insert into municipio values (null,'TIANGUISMANALCO', 21);

insert into municipio values (null,'TILAPA', 21);

insert into municipio values (null,'TLACOTEPEC DE BENITO JUÁREZ', 21);

insert into municipio values (null,'TLACUILOTEPEC', 21);

insert into municipio values (null,'TLACHICHUCA', 21);

insert into municipio values (null,'TLAHUAPAN', 21);

insert into municipio values (null,'TLALTENANGO', 21);

insert into municipio values (null,'TLANEPANTLA', 21);

insert into municipio values (null,'TLAOLA', 21);

insert into municipio values (null,'TLAPACOYA', 21);

insert into municipio values (null,'TLAPANALÁ', 21);

insert into municipio values (null,'TLATLAUQUITEPEC', 21);

insert into municipio values (null,'TLAXCO', 21);

insert into municipio values (null,'TOCHIMILCO', 21);

insert into municipio values (null,'TOCHTEPEC', 21);

insert into municipio values (null,'TOTOLTEPEC DE GUERRERO', 21);

insert into municipio values (null,'TULCINGO', 21);

insert into municipio values (null,'TUZAMAPAN DE GALEANA', 21);

insert into municipio values (null,'TZICATLACOYAN', 21);

insert into municipio values (null,'VENUSTIANO CARRANZA', 21);

insert into municipio values (null,'VICENTE GUERRERO', 21);

insert into municipio values (null,'XAYACATLÁN DE BRAVO', 21);

insert into municipio values (null,'XICOTEPEC', 21);

insert into municipio values (null,'XICOTLÁN', 21);

insert into municipio values (null,'XIUTETELCO', 21);

insert into municipio values (null,'XOCHIAPULCO', 21);

insert into municipio values (null,'XOCHILTEPEC', 21);

insert into municipio values (null,'XOCHITLÁN DE VICENTE SUÁREZ', 21);

insert into municipio values (null,'XOCHITLÁN TODOS SANTOS', 21);

insert into municipio values (null,'YAONÁHUAC', 21);

insert into municipio values (null,'YEHUALTEPEC', 21);

insert into municipio values (null,'ZACAPALA', 21);

insert into municipio values (null,'ZACAPOAXTLA', 21);

insert into municipio values (null,'ZACATLÁN', 21);

insert into municipio values (null,'ZAPOTITLÁN', 21);

insert into municipio values (null,'ZAPOTITLÁN DE MÉNDEZ', 21);

insert into municipio values (null,'ZARAGOZA', 21);

insert into municipio values (null,'ZAUTLA', 21);

insert into municipio values (null,'ZIHUATEUTLA', 21);

-- 1809 al 1921
-- Municipio 1809-1921

INSERT INTO Municipio VALUES 

(null, 'ZINACATEPEC', 21),

(null, 'ZONGOZOTLA', 21),

(null, 'ZOQUIAPAN', 21),

(null, 'ZOQUITLÁN', 21),

(null, 'NO ESPECIFICADO', 21),

(null, 'AMEALCO DE BONFIL', 22),

(null, 'PINAL DE AMOLES', 22),

(null, 'ARROYO SECO', 22),

(null, 'CADEREYTA DE MONTES', 22),

(null, 'COLÓN', 22),

(null, 'CORREGIDORA', 22),

(null, 'EZEQUIEL MONTES', 22),

(null, 'HUIMILPAN', 22),

(null, 'JALPAN DE SERRA', 22),

(null, 'LANDA DE MATAMOROS', 22),

(null, 'EL MARQUÉS', 22),

(null, 'PEDRO ESCOBEDO', 22),

(null, 'PEÑAMILLER', 22),

(null, 'QUERÉTARO', 22),

(null, 'SAN JOAQUÍN', 22),

(null, 'SAN JUAN DEL RÍO', 22),

(null, 'TEQUISQUIAPAN', 22),

(null, 'TOLIMÁN', 22),

(null, 'NO ESPECIFICADO', 22),

(null, 'COZUMEL', 23),

(null, 'FELIPE CARRILLO PUERTO', 23),

(null, 'ISLA MUJERES', 23),

(null, 'OTHÓN P. BLANCO', 23),

(null, 'BENITO JUÁREZ', 23),

(null, 'JOSÉ MARÍA MORELOS', 23),

(null, 'LÁZARO CÁRDENAS', 23),

(null, 'SOLIDARIDAD', 23),

(null, 'TULUM', 23),

(null, 'BACALAR', 23),

(null, 'PUERTO MORELOS', 23),

(null, 'NO ESPECIFICADO', 23),

(null, 'AHUALULCO', 24),

(null, 'ALAQUINES', 24),

(null, 'AQUISMÓN', 24),

(null, 'ARMADILLO DE LOS INFANTE', 24),

(null, 'CÁRDENAS', 24),

(null, 'CATORCE', 24),

(null, 'CEDRAL', 24),

(null, 'CERRITOS', 24),

(null, 'CERRO DE SAN PEDRO', 24),

(null, 'CIUDAD DEL MAÍZ', 24),

(null, 'CIUDAD FERNÁNDEZ', 24),

(null, 'TANCANHUITZ', 24),

(null, 'CIUDAD VALLES', 24),

(null, 'COXCATLÁN', 24),

(null, 'CHARCAS', 24),

(null, 'EBANO', 24),

(null, 'GUADALCÁZAR', 24),

(null, 'HUEHUETLÁN', 24),

(null, 'LAGUNILLAS', 24),

(null, 'MATEHUALA', 24),

(null, 'MEXQUITIC DE CARMONA', 24),

(null, 'MOCTEZUMA', 24),

(null, 'RAYÓN', 24),

(null, 'RIOVERDE', 24),

(null, 'SALINAS', 24),

(null, 'SAN ANTONIO', 24),

(null, 'SAN CIRO DE ACOSTA', 24),

(null, 'SAN LUIS POTOSÍ', 24),

(null, 'SAN MARTÍN CHALCHICUAUTLA', 24),

(null, 'SAN NICOLÁS TOLENTINO', 24),

(null, 'SANTA CATARINA', 24),

(null, 'SANTA MARÍA DEL RÍO', 24),

(null, 'SANTO DOMINGO', 24),

(null, 'SAN VICENTE TANCUAYALAB', 24),

(null, 'SOLEDAD DE GRACIANO SÁNCHEZ', 24),

(null, 'TAMASOPO', 24),

(null, 'TAMAZUNCHALE', 24),

(null, 'TAMPACÁN', 24),

(null, 'TAMPAMOLÓN CORONA', 24),

(null, 'TAMUÍN', 24),

(null, 'TANLAJÁS', 24),

(null, 'TANQUIÁN DE ESCOBEDO', 24),

(null, 'TIERRA NUEVA', 24),

(null, 'VANEGAS', 24),

(null, 'VENADO', 24),

(null, 'VILLA DE ARRIAGA', 24),

(null, 'VILLA DE GUADALUPE', 24),

(null, 'VILLA DE LA PAZ', 24),

(null, 'VILLA DE RAMOS', 24),

(null, 'VILLA DE REYES', 24),

(null, 'VILLA HIDALGO', 24),

(null, 'VILLA JUÁREZ', 24),

(null, 'AXTLA DE TERRAZAS', 24),

(null, 'XILITLA', 24),

(null, 'ZARAGOZA', 24),

(null, 'VILLA DE ARISTA', 24),

(null, 'MATLAPA', 24),

(null, 'EL NARANJO', 24),

(null, 'NO ESPECIFICADO', 24),

(null, 'AHOME', 25),

(null, 'ANGOSTURA', 25),

(null, 'BADIRAGUATO', 25),

(null, 'CONCORDIA', 25),

(null, 'COSALÁ', 25),

(null, 'CULIACÁN', 25),

(null, 'CHOIX', 25),

(null, 'ELOTA', 25),

(null, 'ESCUINAPA', 25),

(null, 'EL FUERTE', 25),

(null, 'GUASAVE', 25),

(null, 'MAZATLÁN', 25),

(null, 'MOCORITO', 25),

(null, 'ROSARIO', 25),

(null, 'SALVADOR ALVARADO', 25),

(null, 'SAN IGNACIO', 25),

(null, 'SINALOA', 25),

(null, 'NAVOLATO', 25);


-- 1922 al 2034
insert into municipio(municipioNombre, entidad) values("No Especificado",25);




insert into municipio(municipioNombre, entidad) values

("Aconchi",26),

("Agua Prieta",26),

("Alamos",26),

("Altar",26),

("Arivechi",26),

("Arizpe",26),

("Atil",26),

("Bacadéhuachi",26),

("Bacanora",26),

("Bacerac",26),

("Bacoachi",26),

("Bácum",26),

("Banámichi",26),

("Baviácora",26),

("Bavispe",26),

("Benjamín Hill",26),

("Caborca",26),

("Cajeme",26),

("Cananea",26),

("Carbó",26),

("La Colorada",26),

("Cucurpe",26),

("Cumpas",26),

("Divisaderos",26),

("Empalme",26),

("Etchojoa",26),

("Fronteras",26),

("Granados",26),

("Guaymas",26),

("Hermosillo",26),

("Huachinera",26),

("Huásabas",26),

("Huatabampo",26),

("Huépac",26),

("Imuris",26),

("Magdalena",26),

("Mazatán",26),

("Moctezuma",26),

("Naco",26),

("Nácori Chico",26),

("Nacozari de García",26),

("Navojoa",26),

("Nogales",26),

("Onavas",26),

("Opodepe",26),

("Oquitoa",26),

("Pitiquito",26),

("Puerto Peñasco",26),

("Quiriego",26),

("Rayón",26),

("Rosario",26),

("Sahuaripa",26),

("San Felipe de Jesús",26),

("San Javier",26),

("San Luis Río Colorado",26),

("San Miguel de Horcasitas",26),

("San Pedro de la Cueva",26),

("Santa Ana",26),

("Santa Cruz",26),

("Sáric",26),

("Soyopa",26),

("Suaqui Grande",26),

("Tepache",26),

("Trincheras",26),

("Tubutama",26),

("Ures",26),

("Villa Hidalgo",26),

("Villa Pesquera",26),

("Yécora",26),

("General Plutarco Elías Calles",26),

("Benito Juárez",26),

("San Ignacio Río Muerto",26),

("No Especificado",26);




insert into municipio(municipioNombre, entidad) values

("Balancán",27),

("Cárdenas",27),

("Centla",27),

("Centro",27),

("Comalcalco",27),

("Cunduacán",27),

("Emiliano Zapata",27),

("Huimanguillo",27),

("Jalapa",27),

("Jalpa de Méndez",27),

("Jonuta",27),

("Macuspana",27),

("Nacajuca",27),

("Paraíso",27),

("Tacotalpa",27),

("Teapa",27),

("Tenosique",27),

("No Especiifcado",27);




insert into municipio(municipioNombre, entidad) values

("Abasolo",28),

("Aldama",28),

("Altamira",28),

("Antiguo Morelos",28),

("Burgos",28),

("Bustamante",28),

("Camargo",28),

("Casas",28),

("Ciudad Madero",28),

("Cruillas",28),

("Gómez Farías",28),

("González",28),

("Güémez",28),

("Guerrero",28),

("Gustavo Díaz Ordaz",28),

("Hidalgo",28),

("Jaumave",28),

("Jiménez",28),

("Llera",28),

("Mainero",28),

("El Mante",28);

-- 2035 al 2147
insert into Municipio(municipioNombre, Entidad) values 

    ("Matamoros", 28), -- 2035 

    ("Méndez", 28), 

    ("Mier", 28), 

    ("Miguel Alemán", 28), 

    ("Miquihuana", 28), 

    ("Nuevo Laredo", 28), 

    ("Nuevo Morelos", 28), 

    ("Ocampo", 28), 

    ("Padilla", 28), 

    ("Palmillas", 28), 

    ("Reynosa", 28), 

    ("Río Bravo", 28), 

    ("San Carlos", 28), 

    ("San Fernando", 28), 

    ("San Nicolás", 28), 

    ("Soto La Marina", 28), 

    ("Tampico", 28), 

    ("Tula", 28), 

    ("Valle hermoso", 28), 

    ("Victoria", 28), 

    ("Villagrán", 28), 

    ("Xicoténcatl", 28), 

    ("No especificado", 28), 

    ("Amaxac de Guerrero", 29), 

    ("Apetatitlán de Antonio Carvajal", 29), 

    ("Atlangatepec", 29), 

    ("Atltzayanca", 29), 

    ("Apizaco", 29), 

    ("Calpulalpan", 29), 

    ("El Carmen Tequexquitla", 29), 

    ("Cuapiaxtla", 29), 

    ("Cuaxomulco", 29), 

    ("Chiautempan", 29), 

    ("Muñoz de Domingo Arenas", 29), 

    ("Españita", 29), 

    ("Huamantla", 29), 

    ("Hueyotlipan", 29), 

    ("Ixtacuixtla de Mariano Matamoros", 29), 

    ("Ixtenco", 29), 

    ("Mazatecochco de José María Morelos", 29), 

    ("Contla de Juan Cuamatzi", 29), 

    ("Tepetitla de Lardizábal", 29), 

    ("Sanctórum de Lázaro Cárdenas", 29), 

    ("Nanacamilpa de Mariano Arista", 29), 

    ("Acuamanala de Miguel Hidalgo", 29), 

    ("Natívitas", 29), 

    ("Panotla", 29), 

    ("San Pablo del Monte", 29), 

    ("Santa Cruz Tlaxcala", 29), 

    ("Tenancingo", 29), 

    ("Teolocholco", 29), 

    ("Tepeyanco", 29), 

    ("Terrenate", 29), 

    ("Tetla de la Solidaridad", 29), 

    ("Tetlatlahuca", 29), 

    ("Tlaxcala", 29), 

    ("Tlaxco", 29), 

    ("Tocatlán", 29), 

    ("Totolac", 29), 

    ("Ziltlaltépec de Trinidad Sánchez Santos", 29), 

    ("Tzompantepec", 29), 

    ("Xaloztoc", 29), 

    ("Xaltocan", 29), 

    ("Papalotla de Xicohténcatl", 29), 

    ("Xicohtzinco", 29), 

    ("Yauhquemehcan", 29), 

    ("Zacatelco", 29), 

    ("Benito Juárez", 29), 

    ("Emiliano Zapata", 29), 

    ("Lázaro Cárdenas", 29), 

    ("La Magdalena Tlaltelulco", 29), 

    ("San Damián Texóloc", 29), 

    ("San Francisco Tetlanohcan", 29), 

    ("San Jerónimo Zacualpan", 29), 

    ("San José Teacalco", 29), 

    ("San Juan Huactzingo", 29), 

    ("San Lorenzo Axocomanitla", 29), 

    ("San Lucas Tecopilco", 29), 

    ("Santa Ana Nopalucan", 29), 

    ("Santa Apolonia Teacalco", 29), 

    ("Santa Catarina Ayometla", 29), 

    ("Santa Cruz Quilehtla", 29), 

    ("Santa Isabel Xiloxoxtla", 29), 

    ("No especificado", 29), 

    ("Acajete", 30), 

    ("Acatlán", 30), 

    ("Acayucan", 30), 

    ("Actopan", 30), 

    ("Acula", 30), 

    ("Acultzingo", 30), 

    ("Camarón de Tejeda", 30), 

    ("Alpatláhuac", 30), 

    ("Alto Lucero de Gutiérrez Barrios", 30), 

    ("Altotonga", 30), 

    ("Alvarado", 30), 

    ("Amatitlán", 30), 

    ("Naranjos Amatlán", 30), 

    ("Amatlán de los Reyes", 30), 

    ("Angel R. Cabada", 30), 

    ("La Antigua", 30), 

    ("Apazapan", 30), 

    ("Aquila", 30), 

    ("Astacinga", 30), 

    ("Atlahuilco", 30), 

    ("Atoyac", 30), 

    ("Atzacan", 30), 

    ("Atzalan", 30), 

    ("Tlaltetela", 30), 

    ("Ayahualulco", 30), 

    ("Banderilla", 30), 

    ("Benito Juárez", 30), 

    ("Boca del Río", 30), 

    ("Calcahualco", 30); -- 2147 
    
-- 2148 al 2260
insert into municipio values (null, 'Camerino Z. Mendoza', 30);

insert into municipio values (null, 'Carrillo Puerto', 30);

insert into municipio values (null, 'Catemaco', 30);

insert into municipio values (null, 'Cazones de Herrera', 30);

insert into municipio values (null, 'Cerro azul', 30);

insert into municipio values (null, 'Citlaltépetl', 30);

insert into municipio values (null, 'Coacoatzintla', 30);

insert into municipio values (null, 'Coahuitlán', 30);

insert into municipio values (null, 'Coatepec', 30);

insert into municipio values (null, 'Coatzacoalcos', 30);

insert into municipio values (null, 'Coatzintla', 30);

insert into municipio values (null, 'Coetzala', 30);

insert into municipio values (null, 'Colipa', 30);

insert into municipio values (null, 'Comapa', 30);

insert into municipio values(null, 'Córdoba', 30);

insert into municipio values(null, 'Cosamaloapan de Carpio', 30);

insert into municipio values(null, 'Cosautlán de Carvajal', 30);

insert into municipio values(null, 'Coscomatepec', 30);

insert into municipio values(null, 'Cosoleacaque', 30);

insert into municipio values(null, 'Cotaxtla', 30);

insert into municipio values(null, 'Coxquihui', 30);

insert into municipio values(null, 'Coyutla', 30);

insert into municipio values(null, 'Cuichapa', 30);

insert into municipio values(null, 'Cuitláhuac', 30);

insert into municipio values(null, 'Chacaltianguis', 30);

insert into municipio values(null, 'Chalma', 30);

insert into municipio values(null, 'Chiconamel', 30);

insert into municipio values(null, 'Chinconquiaco', 30);

insert into municipio values(null, 'Chicontepec', 30);

insert into municipio values(null, 'Chinameca', 30);

insert into municipio values(null, 'Chinampa de Gorostiza', 30);

insert into municipio values(null, 'Las Choapas', 30);

insert into municipio values(null, 'Chocamán', 30);

insert into municipio values(null, 'Chontla', 30);

insert into municipio values(null, 'Chumatlán', 30);

insert into municipio values(null, 'Emiliano Zapata', 30);

insert into municipio values(null, 'Espinal', 30);

insert into municipio values(null, 'Filomeno Mata', 30);

insert into municipio values(null, 'Fortín', 30);

insert into municipio values(null, 'Gutiérrez Zamora', 30);

insert into municipio values(null, 'Hidalgotitlán', 30);

insert into municipio values(null, 'Huatusco', 30);

insert into municipio values(null, 'Huayacocotla', 30);

insert into municipio values(null, 'Hueyapan de Ocampo', 30);

insert into municipio values(null, 'Huiloapan de Cuauhtémoc', 30);

insert into municipio values(null, 'Ignacio de la llave', 30);

insert into municipio values(null, 'Ilamatlán', 30);

insert into municipio values(null, 'Isla', 30);

insert into municipio values(null, 'Ixcatepec', 30);

insert into municipio values(null, 'Ixhuacán de los reyes', 30);

insert into municipio values(null, 'Ixhuatlán del café', 30);

insert into municipio values(null, 'Ixhuatlancillo', 30);

insert into municipio values(null, 'Ixhuatlán del sureste', 30);

insert into municipio values(null, 'Ixhuatlán de Madero', 30);

insert into municipio values(null, 'Ixmatlahuacan', 30); 

insert into municipio values(null, 'Ixtaczoquitlán', 30);

insert into municipio values(null, 'Jalacingo', 30);

insert into municipio values(null, 'Xalapa', 30);

insert into municipio values(null, 'Jalcomulco', 30);

insert into municipio values(null, 'Jáltipan', 30);

insert into municipio values(null, 'Jamapa', 30);

insert into municipio values(null, 'Jesús Carranza', 30);

insert into municipio values(null, 'Xico', 30);

insert into municipio values(null, 'Jilotepec', 30);

insert into municipio values(null, 'Juan Rodríguez Clara', 30);

insert into municipio values(null, 'Juchique de Ferrer', 30);

insert into municipio values(null, 'Landero y Coss', 30);

insert into municipio values(null, 'Lerdo de Tejada', 30);

insert into municipio values(null, 'Magdalena', 30);

insert into municipio values(null, 'Maltrata', 30);

insert into municipio values(null, 'Manlio Fabio Altamirano', 30);

insert into municipio values(null, 'Mariano Escobedo', 30);

insert into municipio values(null, 'Martínez de la Torre', 30);

insert into municipio values(null, 'Mecatlán', 30);

insert into municipio values(null, 'Mecayapan', 30);

insert into municipio values(null, 'Medellín de Bravo', 30);

insert into municipio values(null, 'Miahuatlán', 30);

insert into municipio values(null, 'Las minas', 30);

insert into municipio values(null, 'Minatitlán', 30);

insert into municipio values(null, 'Misantla', 30);

insert into municipio values(null, 'Mixtla de Altamirano', 30);

insert into municipio values(null, 'Molocán', 30);

insert into municipio values(null, 'Naolinco', 30);

insert into municipio values(null, 'Naranjal', 30);

insert into municipio values(null, 'Nautla', 30);

insert into municipio values(null, 'Nogales', 30);

insert into municipio values(null, 'Oluta', 30);

insert into municipio values(null, 'Omealca', 30);

insert into municipio values(null, 'Orizaba', 30);

insert into municipio values(null, 'Otatitlán', 30);

insert into municipio values(null, 'Oteapan', 30);

insert into municipio values(null, 'Ozuluama de Mascareñas', 30);

insert into municipio values(null, 'Pajapan', 30);

insert into municipio values(null, 'Pánuco', 30);

insert into municipio values(null, 'Papantla', 30);

insert into municipio values(null, 'Paso del macho', 30);

insert into municipio values(null, 'Paso de ovejas', 30);

insert into municipio values(null, 'La Perla', 30);

insert into municipio values(null, 'Perote', 30);

insert into municipio values(null, 'Platón Sánchez', 30);

insert into municipio values(null, 'Playa Vicente', 30);

insert into municipio values(null, 'Poza rica de Hidalgo', 30);

insert into municipio values(null, 'Las vigas de Ramírez', 30);

insert into municipio values(null, 'Pueblo viejo', 30);

insert into municipio values(null, 'Puente Nacional', 30);

insert into municipio values(null, 'Rafael Delgado', 30);

insert into municipio values(null, 'Rafael Lucio', 30);

insert into municipio values(null, 'Los Reyes', 30);

insert into municipio values(null, 'Río Blanco', 30);

insert into municipio values(null, 'Saltabarranca', 30);

insert into municipio values(null, 'San Andrés Tuxtla', 30);

insert into municipio values(null, 'San Juan Evangelista', 30);

-- 2261 al 2373
INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2261', ' SANTIAGO TUXTLA', '30');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2262', ' SAYULA DE ALEMÁN', '30');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2263', ' SOCONUSCO ', '30');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2264', 'SOCHIAPA ', '30');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2265', ' SOLEDAD ATZOMPA', '30');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2266', 'SOLEDAD DE DOBLADO ', '30');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2267', ' SOTEAPAN ', '30');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2268', ' TAMALÍN', '30');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2269', ' TAMIAHUA ', '30');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2270', ' TAMPICO ALTO', '30');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2271', ' TANCOCO', '30');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2272', ' TANTIMA ', '30');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2273', ' TANTOYUCA ', '30');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2274', ' TATATILA', '30');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2275', 'CASTILLO DE TEAYO ', '30');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2276', 'TECOLUTLA ', '30');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2277', 'TEHUIPANGO ', '30');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2278', 'ÁLAMO TEMAPACHE ', '30');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2279', 'TEMPOAL ', '30');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2280', 'TENAMPA', '30');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2281', 'TENOCHTITLÁN', '30');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2282', ' TEOCELO ', '30');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2283', 'TEPATLAXCO', '30');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2284', ' TEPETLÁN', '30');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2285', ' TEPETZINTLA ', '30');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2286', ' TEQUILA ', '30');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2287', ' JOSÉ AZUETA ', '30');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2288', ' TEXCATEPEC ', '30');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2289', 'TEXHUACÁN', '30');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2290', ' TEXISTEPEC ', '30');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2291', 'TEZONAPA ', '30');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2292', ' TIERRA BLANCA ', '30');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2293', 'TIHUATLÁN', '30');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2294', ' TLACOJALPAN ', '30');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2295', ' TLACOLULAN', '30');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2296', ' TLACOTALPAN', '30');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2297', 'TLACOTEPEC DE MEJÍA', '30');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2298', ' TLACHICHILCO ', '30');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2299', ' TLALIXCOYAN ', '30');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2300', ' TLALNELHUAYOCAN', '30');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2301', ' TLAPACOYAN ', '30');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2302', ' TLAQUILPA ', '30');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2303', 'TLILAPAN', '30');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2304', 'TOMATLÁN ', '30');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2305', 'TONAYÁN ', '30');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2306', 'TOTUTLA ', '30');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2307', ' TUXPAN VERACRUZ DE IGNACIO DE LA LLAVE', '30');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2308', ' TUXTILLA', '30');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2309', ' URSULO GALVÁN ', '30');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2310', ' VEGA DE ALATORRE ', '30');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2311', ' VERACRUZ ', '30');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2312', 'VILLA ALDAMA ', '30');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2313', ' XOXOCOTLA ', '30');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2314', 'YANGA ', '30');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2315', ' YECUATLA', '30');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2316', 'ZACUALPAN  ', '30');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2317', ' ZARAGOZA', '30');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2318', ' ZENTLA ', '30');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2319', 'ZONGOLICA', '30');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2320', 'ZONTECOMATLÁN DE LÓPEZ Y FUENTES', '30');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2321', 'ZOZOCOLCO DE HIDALGO', '30');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2322', 'AGUA DULCE ', '30');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2323', ' EL HIGO ', '30');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2324', 'NANCHITAL DE LÁZARO CÁRDENAS DEL RÍO', '30');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2325', ' TRES VALLES', '30');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2326', 'CARLOS A. CARRILLO ', '30');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2327', ' TATAHUICAPAN DE JUÁREZ', '30');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2328', 'UXPANAPA ', '30');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2329', 'SAN RAFAEL ', '30');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2330', ' SANTIAGO SOCHIAPAN ', '30');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2331', ' NO ESPECIFICADO ', '30');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2332', ' ABALÁ ', '31');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2333', 'ACANCEH ', '31');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2334', ' AKIL', '31');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2335', 'BACA ', '31');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2336', 'BOKOBÁ ', '31');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2337', ' BUCTZOTZ ', '31');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2338', ' CACALCHÉN ', '31');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2339', ' CALOTMUL ', '31');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2340', 'CANSAHCAB ', '31');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2341', 'CANTAMAYEC', '31');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2342', ' CELESTÚN ', '31');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2343', 'CENOTILLO', '31');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2344', 'CONKAL', '31');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2345', 'CUNCUNUL', '31');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2346', ' CUZAMÁ', '31');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2347', 'CHACSINKÍN', '31');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2348', ' CHANKOM', '31');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2349', 'CHAPAB ', '31');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2350', 'CHEMAX ', '31');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2351', ' CHICXULUB PUEBLO ', '31');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2352', ' CHICHIMILÁ ', '31');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2353', 'CHIKINDZONOT ', '31');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2354', 'CHOCHOLÁ ', '31');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2355', 'CHUMAYEL', '31');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2356', 'DZÁN ', '31');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2357', 'DZEMUL', '31');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2358', 'DZIDZANTÚN', '31');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2359', 'DZILAM DE BRAVO ', '31');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2360', ' DZILAM GONZÁLEZ', '31');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2361', 'DZITÁS ', '31');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2362', 'DZONCAUICH', '31');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2363', 'ESPITA', '31');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2364', 'HALACHÓ ', '31');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2365', 'HOCABÁ', '31');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2366', 'HOCTÚN', '31');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2367', 'HOMÚN', '31');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2368', 'HUHÍ ', '31');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2369', 'HUNUCMÁ', '31');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2370', 'IXIL ', '31');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2371', ' IZAMAL ', '31');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2372', 'KANASÍN ', '31');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2373', ' KANTUNIL ', '31');


-- 2374 al 2501 
INSERT INTO Municipio(municipioNombre, entidad) VALUES('KAUA', 31);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('KINCHIL', 31);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('KOPOMÁ', 31);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('MAMA', 31);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('MANÍ', 31);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('MAXCANÚ', 31);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('MAYAPÁN', 31);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('MÉRIDA', 31);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('MOCOCHÁ', 31);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('MOTUL', 31);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('MUNA', 31);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('MUXUPIP', 31);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('OPICHÉN', 31);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('OXKUTZCAB', 31);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('PANABÁ', 31);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('PETO', 31);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('PROGRESO', 31);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('QUINTANA ROO', 31);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('RÍO LAGARTOS', 31);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('SACALUM', 31);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('SAMAHIL', 31);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('SANAHCAT', 31);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('SAN FELIPE', 31);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('SANTA ELENA', 31);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('SEYÉ', 31);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('SINANCHÉ', 31);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('SOTUTA', 31);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('SUCILÁ', 31);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('SUDZA', 31);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('SUMA', 31);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('TAHDZIÚ', 31);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('TAHMEK', 31);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('TEABO', 31);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('TECOH', 31);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('TEKAL DE VENEGAS', 31);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('TEKANTÓ', 31);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('TEKAX', 31);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('TEKIT', 31);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('TEKOM', 31);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('TELCHAC PUEBLO', 31);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('TELCHAC PUERTO', 31);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('TEMAX', 31);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('TEMOZÓN', 31);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('TEPAKÁN', 31);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('TETIZ', 31);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('TEYA ', 31);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('TICUL', 31);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('TIMUCUY ', 31);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('TINUM', 31);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('TIXCACALCUPUL', 31);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('TIXKOKOB', 31);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('TIXMEHUAC', 31);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('TIXPÉHUAL', 31);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('TIZIMÍN', 31);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('TUNKÁS', 31);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('TZUCACAB', 31);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('UAYMA', 31);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('UCÚ', 31);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('UMÁN', 31);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('VALLADOLID', 31);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('XOCCHEL', 31);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('YAXCABÁ', 31);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('YAXKUKUL', 31);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('YOBAÍN', 31);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('NO ESPECIFICADO', 31);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('APOZOL', 32);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('APULCO', 32);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('ATOLINGA', 32);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('BENITO JUÁREZ', 32);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('CALERA', 32);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('CAÑITAS DE FELIPE PESCADOR', 32);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('CONCEPCIÓN DEL ORO', 32);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('CUAUHTÉMOC', 32);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('CHALCHIHUITES', 32);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('FRESNILLO', 32);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('TRINIDAD GARCÍA DE LA CADENA', 32);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('GENARO CODINA', 32);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('GENERAL ENRIQUE ESTRADA', 32);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('GENERAL FRANCISCO R. MURGUÍA', 32);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('EL PLATEADO DE JOAQUÍN AMARO', 32);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('GENERAL PÁNFILO NATERA', 32);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('GUADALUPE', 32);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('HUANUSCO', 32);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('JALPA', 32);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('JEREZ', 32);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('JIMÉNEZ DEL TEUL', 32);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('JUAN ALDAMA', 32);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('JUCHIPILA', 32);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('LORETO', 32);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('LUIS MOYA', 32);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('MAZAPIL', 32);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('MELCHOR OCAMPO ', 32);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('MEZQUITAL DEL ORO ', 32);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('MIGUEL AUZA', 32);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('MOMAX ', 32);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('MONTE ESCOBEDO', 32);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('MORELOS', 32);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('MOYAHUA DE ESTRADA', 32);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('NOCHISTLÁN DE MEJÍA', 32);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('NORIA DE ÁNGELES ', 32);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('OJOCALIENTE', 32);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('PÁNUCO ', 32);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('PINOS', 32);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('RÍO GRANDE ', 32);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('SAIN ALTO', 32);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('EL SALVADOR', 32);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('SOMBRERETE', 32);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('SUSTICACÁN', 32);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('TABASCO', 32);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('TEPECHITLÁN', 32);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('TEPETONGO', 32);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('TEÚL DE GONZÁLEZ ORTEGA', 32);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('TLALTENANGO DE SÁNCHEZ ROMÁN', 32);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('VALPARAÍSO', 32);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('VETAGRANDE', 32);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('VILLA DE COS', 32);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('VILLA GARCÍA', 32);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('VILLA GONZÁLEZ ORTEGA', 32);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('VILLA HIDALGO', 32);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('VILLANUEVA', 32);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('ZACATECAS', 32);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('TRANCOSO', 32);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('SANTA MARÍA DE LA PAZ', 32);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('NO ESPECIFICADO', 32);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('NO ESPECIFICADO', 36);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('NO APLICA', 97);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('SE IGNORA', 98);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('NO ESPECIFICADO', 99);

-- 