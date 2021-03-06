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
-- SENTENCIA PARA CAMBIAR TAMA??O DE COLUMNA PORQUE NO CABE UN NOMBRE

ALTER TABLE Opcion MODIFY opcionNombre VARCHAR(20);


-- SENTENCIA PARA INSERTAR REGISTROS

insert into Opcion (opcionNombre, opcionDescripcion) values  ('SI','LA INFORMACI??N RECABADA DEL PACIENTE DEMUESTRA QUE SI PRESENTA ESTA CONDICI??N.'),  
('NO','LA INFORMACI??N RECABADA DEL PACIENTE DEMUESTRA QUE NO PRESENTA ESTA CONDICI??N.');
insert into opcion values (97,'NO APLICA ','EL PACIENTE NO APLICA PARA ESTA CONDICI??N.'),  
					(98,'SE IGNORA','SE DESCONOCE LA INFORMACI??N ACERCA DEL PACIENTE PARA DETERMINAR SI PRESENTA ESTA CONDICI??N.'), 
                    (99,'NO ESPECIFICADO','EL PACIENTE NO PRESENTA INFORMACI??N ACERCA DE ESTA CONDICI??N.');


select * from sexo;
-- Sexo

insert into sexo values  (NULL,'M',"Mujer"),(NULL, 'H',"Hombre"),(99, 'N',"Se distinguen solo dos generos para fines de registro");


-- ------------------------------------Pais 
-- 1-10
insert into pais values (null, 'M??xico');
insert into pais values (null, 'Estados Unidos');
insert into pais values (null, 'Canada');
insert into pais values (null, 'Alemania');
insert into pais values (null, 'Hungr??a');
insert into pais values (null, 'Espa??a');
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
INSERT INTO pais(idpais, paisNombre) VALUES (null,"Gran Breta??a");
INSERT INTO pais(idpais, paisNombre) VALUES (null,"Japon");
INSERT INTO pais(idpais, paisNombre) VALUES (null,"Macao");
INSERT INTO pais(idpais, paisNombre) VALUES (null,"Australia");
INSERT INTO pais(idpais, paisNombre) VALUES (null,"Hati"); 
-- 21 a 30
-- Inserci??n pais a covid19
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
insert into pais values (Null, "Rep??blica democr??tica de Corea");
insert into pais values (Null, "Austria");
insert into pais values (Null, "Libano");
insert into pais values (Null, "Paraguay");
insert into pais values (Null, "Rep??blica de Mauricio");
insert into pais values (Null, "Principado de M??naco");
insert into pais values (Null, "Pakist??n");
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
insert into entidad (entidadNombre) values ('CIUDAD DE M??XICO');
insert into entidad (entidadNombre) values ('DURANGO');


-- 11-20

insert into entidad (entidadNombre) values ('Guanajuato');
insert into entidad (entidadNombre) values ('Guerrero');
insert into entidad (entidadNombre) values ('Hidalgo');
insert into entidad (entidadNombre) values ('Jalisco');
insert into entidad (entidadNombre) values ('M??xico');
insert into entidad (entidadNombre) values ('Michoac??n de Ocampo');
insert into entidad (entidadNombre) values ('Morelos');
insert into entidad (entidadNombre) values ('Nayarit');
insert into entidad (entidadNombre) values ('Nuevo Le??n');
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
('COS??O',1),
('JES??S MAR??A',1),
('PABELL??N DE ARTEAGA',1),
('RINC??N DE ROMOS',1),
('SAN JOS?? DE GRACIA',1),
('TEPEZAL??',1),
('EL LLANO',1),
('SAN FRANCISCO DE LOS ROMO',1),
('NO ESPECIFICADO',1),
('ENSENADA',2),
('MEXICALI',2),
('TECATE',2),
('TIJUANA',2),
('PLAYAS DE ROSARITO',2),
('NO ESPECIFICADO',2),
('COMOND??',3),
('MULEG??',3),
('LA PAZ',3),
('LOS CABOS',3),
('LORETO',3),
('NO ESPECIFICADO',3),
('CALKIN??',4),
('CAMPECHE',4),
('CARMEN',4),
('CHAMPOT??N',4),
('HECELCHAK??N',4),
('HOPELCH??N',4),
('PALIZADA',4),
('TENABO',4),
('ESC??RCEGA',4),
('CALAKMUL',4),
('CANDELARIA',4),
('NO ESPECIFICADO',4),
('ABASOLO',5),
('ACU??A',5),
('ALLENDE',5),
('ARTEAGA',5),
('CANDELA',5),
('CASTA??OS',5),
('CUATRO CI??NEGAS',5),
('ESCOBEDO',5),
('FRANCISCO I. MADERO',5),
('FRONTERA',5),
('GENERAL CEPEDA',5),
('GUERRERO',5),
('HIDALGO',5),
('JIM??NEZ',5),
('JU??REZ',5),
('LAMADRID',5),
('MATAMOROS',5),
('MONCLOVA',5),
('MORELOS',5),
('M??ZQUIZ',5),
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
('TORRE??N',5),
('VIESCA',5),
('VILLA UNI??N',5),
('ZARAGOZA',5),
('NO ESPECIFICADO',5),
('ARMER??A',6),
('COLIMA',6),
('COMALA',6),
('COQUIMATL??N',6),
('CUAUHT??MOC',6),
('IXTLAHUAC??N',6),
('MANZANILLO',6),
('MINATITL??N',6),
('TECOM??N',6),
('VILLA DE ??LVAREZ',6),
('NO ESPECIFICADO',6),
('ACACOYAGUA',7),
('ACALA',7),
('ACAPETAHUA',7),
('ALTAMIRANO',7),
('AMAT??N',7),
('AMATENANGO DE LA FRONTERA',7),
('AMATENANGO DEL VALLE',7),
('ANGEL ALBINO CORZO',7),
('ARRIAGA',7),
('BEJUCAL DE OCAMPO',7),
('BELLA VISTA',7),
('BERRIOZ??BAL',7),
('BOCHIL',7),
('EL BOSQUE',7),
('CACAHOAT??N',7),
('CATAZAJ??',7),
('CINTALAPA',7),
('COAPILLA',7),
('COMIT??N DE DOM??NGUEZ',7),
('LA CONCORDIA',7),
('COPAINAL??',7),
('CHALCHIHUIT??N',7),
('CHAMULA',7),
('CHANAL',7),
('CHAPULTENANGO',7),
('CHENALH??',7),
('CHIAPA DE CORZO',7);

-- 114 al 226
INSERT INTO Municipio(municipioNombre, entidad) VALUES('CHIAPILLA', 7);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('CHICOAS??N', 7);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('CHICOMUSELO', 7);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('CHIL??N', 7);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('ESCUINTLA', 7);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('FRANCISCO LEON', 7);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('FRONTERA COMALAPA', 7);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('FRONTERA HIDALGO', 7);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('LA GRANDEZA', 7);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('HUEHUET??N', 7);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('HUIXT??N', 7);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('HUITIUP??N', 7);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('HUIXTLA', 7);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('LA INDEPENDENCIA', 7);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('IXHUAT??N ', 7);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('IXTACOMIT??N', 7);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('IXTAPA', 7);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('IXTAPANGAJOYA', 7);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('JIQUIPILAS', 7);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('JITOTOL', 7);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('JU??REZ', 7);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('LARR??INZAR', 7);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('LA LIBERTAD', 7);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('MAPASTEPEC', 7);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('LAS MARGARITAS', 7);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('MAZAPA DE MADERO', 7);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('MAZAT??N', 7);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('METAPA', 7);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('MITONTIC ', 7);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('MOTOZINTLA', 7);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('NICOL??S RU??Z', 7);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('OCOSINGO', 7);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('OCOTEPEC', 7);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('OCOZOCOAUTLA DE ESPINOSA', 7);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('OSTUAC??N', 7);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('OSUMACINTA', 7);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('OXCHUC', 7);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('PALENQUE', 7);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('PANTELH??', 7);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('PANTEPEC', 7);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('PICHUCALCO', 7);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('PIJIJIAPAN', 7);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('EL PORVENIR', 7);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('VILLA COMALTITL??N', 7);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('PUEBLO NUEVO SOLISTAHUAC??N', 7);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('RAY??N', 7);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('REFORMA', 7);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('LAS ROSAS', 7);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('SABANILLA', 7);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('SALTO DE AGUA', 7);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('SAN CRIST??BAL DE LAS CASAS', 7);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('SAN FERNANDO', 7);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('SILTEPEC', 7);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('SIMOJOVEL', 7);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('SITAL??', 7);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('SOCOLTENANGO', 7);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('SOLOSUCHIAPA', 7);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('SOYAL??', 7);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('SUCHIAPA', 7);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('SUCHIAT', 7);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('SUNUAPA', 7);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('TAPACHULA', 7);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('TAPALAPA', 7);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('TAPILULA', 7);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('TECPAT??N', 7);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('TENEJAPA', 7);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('TEOPISCA', 7);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('TILA', 7);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('TONAL??', 7);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('TOTOLAPA', 7);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('LA TRINITARIA', 7);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('TUMBAL??', 7);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('TUXTLA GUTI??RREZ', 7);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('TUXTLA CHICO', 7);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('TUZANT??N', 7);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('TZIMOL', 7);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('UNI??N JU??REZ', 7);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('VENUSTIANO CARRANZA', 7);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('VILLA CORZO', 7);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('VILLAFLORES', 7);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('YAJAL??N', 7);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('SAN LUCAS', 7);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('ZINACANT??N', 7);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('SAN JUAN CANCUC', 7);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('ALDAMA', 7);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('BENEM??RITO DE LAS AM??RICAS', 7);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('MARAVILLA TENEJAPA', 7);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('MARQU??S DE COMILLAS', 7);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('MONTECRISTO DE GUERRERO', 7);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('SAN ANDR??S DURAZNAL', 7);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('SANTIAGO EL PINAR', 7);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('CAPIT??N LUIS ??NGEL VIDAL', 7);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('RINC??N CHAMULA SAN PEDRO', 7);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('EL PARRAL', 7);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('EMILIANO ZAPATA', 7);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('MEZCALAPA', 7);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('NO ESPECIFICADO', 7);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('AHUMADA', 8);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('ALDAMA', 8);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('ALLENDE', 8);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('AQUILES SERD??N', 8);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('ASCENSI??N', 8);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('BACH??NIVA', 8);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('BALLEZA', 8);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('BATOPILAS DE MANUEL G??MEZ MOR??N', 8);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('BOCOYNA', 8);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('BUENAVENTURA', 8);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('CAMARGO', 8);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('CARICH??', 8);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('CASAS GRANDES', 8);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('CORONADO', 8);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('COYAME DEL SOTOL', 8);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('LA CRUZ', 8);

-- 227 al 452 
insert into municipio values ( null,"LA CRUZ",08),(null,"CUAUHT??MOC",08),(null,"CUSIHUIRIACHI",08),(null,"CHIHUAHUA",08),(null,"CH??NIPAS",08),(null,"DELICIAS",08),(null,"DR. BELISARIO DOM??NGUEZ",08),(null,"GALEANA",08),(null,"SANTA ISABEL",08),(null,"G??MEZ FAR??AS",08),(null,"GRAN MORELOS",08),(null,"GUACHOCHI",08),(null,"GUADALUPE",08),(null,"GUADALUPE Y CALVO",08),(null,"GUAZAPARES",08),(null,"GUERRERO",08),(null,"HIDALGO DEL PARRAL",08),(null,"HUEJOTIT??N",08),(null,"IGNACIO ZARAGOZA",08),(null,"JANOS",08),(null,"JIM??NEZ",08),(null,"JU??REZ",08),(null,"JULIMES",08),(null,"L??PEZ",08),(null,"MADERA",08),(null,"MAGUARICHI",08),(null,"MANUEL BENAVIDES",08),(null,"MATACH??",08),(null,"MATAMOROS",08),(null,"MEOQUI",08),(null,"MORELOS",08),(null,"MORIS",08),(null,"NAMIQUIPA",08),(null,"NONOAVA",08),(null,"NUEVO CASAS GRANDES",08),(null,"OCAMPO",08),(null,"OJINAGA",08),(null,"PRAXEDIS G. GUERRERO",08),(null,"RIVA PALACIO",08),(null,"ROSALES",08),(null,"ROSARIO",08),(null,"SAN FRANCISCO DE BORJA",08),(null,"SAN FRANCISCO DE CONCHOS",08),(null,"SAN FRANCISCO DEL ORO",08),(null,"SANTA B??RBARA",08),(null,"SATEV??",08),(null,"SAUCILLO",08),(null,"TEM??SACHIC",08),(null,"EL TULE",08),(null,"URIQUE",08),(null,"URUACHI",08),(null,"VALLE DE ZARAGOZA",08),(null,"NO ESPECIFICADO",08),(null,"AZCAPOTZALCO",09),(null,"COYOAC??N",09),(null,"CUAJIMALPA DE MORELOS",09),(null,"GUSTAVO A. MADERO",09),(null,"IZTACALCO",09),(null,"IZTAPALAPA",09),(null,"LA MAGDALENA CONTRERAS",09),(null,"MILPA ALTA",09),(null,"??LVARO OBREG??N",09),(null,"TL??HUAC",09),(null,"TLALPAN",09),(null,"XOCHIMILCO",09),(null,"BENITO JU??REZ",09),(null,"CUAUHT??MOC",09),(null,"MIGUEL HIDALGO",09),(null,"VENUSTIANO CARRANZA",09),(null,"NO ESPECIFICADO",09),(null,"CANATL??N",10),(null,"CANELAS",10),(null,"CONETO DE COMONFORT",10),(null,"CUENCAM??",10),(null,"DURANGO",10),(null,"GENERAL SIM??N BOL??VAR",10),(null,"G??MEZ PALACIO",10),(null,"GUADALUPE VICTORIA",10),(null,"GUANACEV??",10),(null,"HIDALGO",10),(null,"IND??",10),(null,"LERDO",10),(null,"MAPIM??",10),(null,"MEZQUITAL",10),(null,"NAZAS",10),(null,"NOMBRE DE DIOS",10),(null,"OCAMPO",10),(null,"EL ORO",10),(null,"OT??EZ",10),(null,"P??NUCO DE CORONADO",10),(null,"PE????N BLANCO",10),(null,"POANAS",10),(null,"PUEBLO NUEVO",10),(null,"RODEO",10),(null,"SAN BERNARDO",10),(null,"SAN DIMAS",10),(null,"SAN JUAN DE GUADALUPE",10),(null,"SAN JUAN DEL R??O",10),(null,"SAN LUIS DEL CORDERO",10),(null,"SAN PEDRO DEL GALLO",10),(null,"SANTA CLARA",10),(null,"SANTIAGO PAPASQUIARO",10),(null,"S??CHIL",10),(null,"TAMAZULA",10),(null,"TEPEHUANES",10),(null,"TLAHUALILO",10),(null,"TOPIA",10),(null,"VICENTE GUERRERO",10),(null,"NUEVO IDEAL",10),(null,"NO ESPECIFICADO",10),(null,"ABASOLO",11),(null,"AC??MBARO",11),(null,"SAN MIGUEL DE ALLENDE",11),(null,"APASEO EL ALTO",11),(null,"APASEO EL GRANDE",11),(null,"ATARJEA",11),(null,"CELAYA",11),(null,"MANUEL DOBLADO",11),(null,"COMONFORT",11),(null,"CORONEO",11),(null,"CORTAZAR",11),(null,"CUER??MARO",11),(null,"DOCTOR MORA",11),(null,"DOLORES HIDALGO CUNA DE LA INDEPENDENCIA NACIONAL",11),(null,"GUANAJUATO",11),(null,"HUAN??MARO",11),(null,"IRAPUATO",11),(null,"JARAL DEL PROGRESO",11),(null,"JER??CUARO",11),(null,"LE??N",11),(null,"MOROLE??N",11),(null,"OCAMPO",11),(null,"P??NJAMO",11),(null,"PUEBLO NUEVO",11),(null,"PUR??SIMA DEL RINC??N",11),(null,"ROMITA",11),(null,"SALAMANCA",11),(null,"SALVATIERRA",11),(null,"SAN DIEGO DE LA UNI??N",11),(null,"SAN FELIPE",11),(null,"SAN FRANCISCO DEL RINC??N",11),(null,"SAN JOS?? ITURBIDE",11),(null,"SAN LUIS DE LA PAZ",11),(null,"SANTA CATARINA",11),(null,"SANTA CRUZ DE JUVENTINO ROSAS",11),(null,"SANTIAGO MARAVAT??O",11),(null,"SILAO DE LA VICTORIA",11),(null,"TARANDACUAO",11),(null,"TARIMORO",11),(null,"TIERRA BLANCA",11),(null,"URIANGATO",11),(null,"VALLE DE SANTIAGO",11),(null,"VICTORIA",11),(null,"VILLAGR??N",11),(null,"XICH??",11),(null,"YURIRIA",11),(null,"NO ESPECIFICADO",11),(null,"ACAPULCO DE JU??REZ",12),(null,"AHUACUOTZINGO",12),(null,"AJUCHITL??N DEL PROGRESO",12),(null,"ALCOZAUCA DE GUERRERO",12),(null,"ALPOYECA",12),(null,"APAXTLA",12),(null,"ARCELIA",12),(null,"ATENANGO DEL R??O",12),(null,"ATLAMAJALCINGO DEL MONTE",12),(null,"ATLIXTAC",12),(null,"ATOYAC DE ??LVAREZ",12),(null,"AYUTLA DE LOS LIBRES",12),(null,"AZOY??",12),(null,"BENITO JU??REZ",12),(null,"BUENAVISTA DE CU??LLAR",12),(null,"COAHUAYUTLA DE JOS?? MAR??A IZAZAGA",12),(null,"COCULA",12),(null,"COPALA",12),(null,"COPALILLO",12),(null,"COPANATOYAC",12),(null,"COYUCA DE BEN??TEZ",12),(null,"COYUCA DE CATAL??N",12),(null,"CUAJINICUILAPA",12),(null,"CUAL??C",12),(null,"CUAUTEPEC",12),(null,"CUETZALA DEL PROGRESO",12),(null,"CUTZAMALA DE PINZ??N",12),(null,"CHILAPA DE ??LVAREZ",12),(null,"CHILPANCINGO DE LOS BRAVO",12),(null,"FLORENCIO VILLARREAL",12),(null,"GENERAL CANUTO A. NERI",12),(null,"GENERAL HELIODORO CASTILLO",12),(null,"HUAMUXTITL??N",12),(null,"HUITZUCO DE LOS FIGUEROA",12),(null,"IGUALA DE LA INDEPENDENCIA",12),(null,"IGUALAPA",12),(null,"IXCATEOPAN DE CUAUHT??MOC",12),(null,"ZIHUATANEJO DE AZUETA",12),(null,"JUAN R. ESCUDERO",12),(null,"LEONARDO BRAVO",12),(null,"MALINALTEPEC",12),(null,"M??RTIR DE CUILAPAN",12),(null,"METLAT??NOC",12),(null,"MOCHITL??N",12),(null,"OLINAL??",12),(null,"OMETEPEC",12),(null,"PEDRO ASCENCIO ALQUISIRAS",12),(null,"PETATL??N",12),(null,"PILCAYA",12),(null,"PUNGARABATO",12),(null,"QUECHULTENANGO",12),(null,"SAN LUIS ACATL??N",12),(null,"SAN MARCOS",12),(null,"SAN MIGUEL TOTOLAPAN",12),(null,"TAXCO DE ALARC??N",12),(null,"TECOANAPA",12),(null,"T??CPAN DE GALEANA",12),(null,"TELOLOAPAN",12),(null,"TEPECOACUILCO DE TRUJANO",12),(null,"TETIPAC",12),(null,"TIXTLA DE GUERRERO",12),(null,"TLACOACHISTLAHUACA",12),(null,"TLACOAPA",12),(null,"TLALCHAPA",12),(null,"TLALIXTAQUILLA DE MALDONADO",12),(null,"TLAPA DE COMONFORT",12),(null,"TLAPEHUALA",12),(null,"LA UNI??N DE ISIDORO MONTES DE OCA",12),(null,"XALPATL??HUAC",12);

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

    ('BOLA??OS',14),

    ('CABO CORRIENTES',14),

    ('CASIMIRO CASTILLO',14),

    ('CIHUATL??N',14),

    ('ZAPOTL??N EL GRANDE',14),

    ('COCULA',14),

    ('COLOTL??N',14),

    ('CONCEPCI??N DE BUENOS AIRES',14),

    ('CUAUTITL??N DE GARC??A BARRAG??N',14),

    ('CUAUTLA',14),

    ('CUQU??O',14),

    ('CHAPALA',14),

    ('CHIMALTIT??N',14),

    ('CHIQUILISTL??N',14),

    ('ENCARNACI??N DE D??AZ',14),

    ('ETZATL??N',14),

    ('EL GRULLO',14),

    ('GUACHINANGO',14),

    ('GUADALAJARA',14),

    ('HOSTOTIPAQUILLO',14),

    ('HUEJ??CAR',14),

    ('HUEJUQUILLA EL ALTO',14),

    ('LA HUERTA',14),

    ('IXTLAHUAC??N DE LOS MEMBRILLOS',14),

    ('IXTLAHUAC??N DEL R??O',14),

    ('JALOSTOTITL??N',14),

    ('JAMAY',14),

    ('JES??S MAR??A',14),

     ('JILOTL??N DE LOS DOLORES',14),

    ('JOCOTEPEC',14),

    ('JUANACATL??N',14),

    ('JUCHITL??N',14),

    ('LAGOS DE MORENO',14),

    ('EL LIM??N',14),

    ('MAGDALENA',14),

    ('SANTA MAR??A DEL ORO',14),

    ('LA MANZANILLA DE LA PAZ',14),

    ('MASCOTA',14),

     ('MAZAMITLA',14),

    ('MEXTICAC??N',14),

    ('MEZQUITIC',14),

    ('MIXTL??N',14),

    ('OCOTL??N',14),

    ('OJUELOS DE JALISCO',14),

    ('PIHUAMO',14),

    ('PONCITL??N',14),

    ('PUERTO VALLARTA',14),

    ('VILLA PURIFICACI??N',14),

     ('QUITUPAN',14),

    ('EL SALTO',14),

    ('SAN CRIST??BAL DE LA BARRANCA',14),

    ('SAN DIEGO DE ALEJANDR??A',14),

    ('SAN JUAN DE LOS LAGOS',14),

    ('SAN JULI??N',14),

    ('SAN MARCOS',14),

    ('SAN MART??N DE BOLA??OS',14),

    ('SAN MART??N HIDALGO',14),

    ('SAN MIGUEL EL ALTO',14),

	('G??MEZ FAR??AS',14),

    ('SAN SEBASTI??N DEL OESTE',14),

    ('SANTA MAR??A DE LOS ??NGELES',14),

    ('SAYULA',14),

    ('TALA',14),

    ('TALPA DE ALLENDE',14),

    ('TAMAZULA DE GORDIANO',14),

    ('TAPALPA',14),

    ('TECALITL??N',14),

    ('TECOLOTL??N',14),

     ('TECHALUTA DE MONTENEGRO',14),

    ('TENAMAXTL??N',14),

    ('TEOCALTICHE',14),

    ('TEOCUITATL??N DE CORONA',14),

    ('TEPATITL??N DE MORELOS',14),

    ('TEQUILA',14),

    ('TEUCHITL??N',14),

    ('TIZAP??N EL ALTO',14),

    ('TLAJOMULCO DE Z????IGA',14),

    ('SAN PEDRO TLAQUEPAQUE',14),

     ('TOLIM??N',14),

    ('TOMATL??N',14),

    ('TONAL??',14),

    ('TONAYA',14),

    ('TONILA',14),

    ('TOTATICHE',14),

    ('TOTOTL??N',14),

    ('TUXCACUESCO',14),

    ('TUXCUECA',14),

    ('TUXPAN',14),

     ('UNI??N DE SAN ANTONIO',14),

    ('UNI??N DE TULA',14),

    ('VALLE DE GUADALUPE',14),

    ('VALLE DE JU??REZ',14),

    ('SAN GABRIEL',14),

    ('VILLA CORONA',14),

    ('VILLA GUERRERO',14),

    ('VILLA HIDALGO',14),

    ('CA??ADAS DE OBREG??N',14),

    ('YAHUALICA DE GONZ??LEZ GALLO',14),

     ('ZACOALCO DE TORRES',14),

    ('ZAPOPAN',14),

    ('ZAPOTILTIC',14),

    ('ZAPOTITL??N DE VADILLO',14),

    ('ZAPOTL??N DEL REY',14),

    ('ZAPOTLANEJO',14),

    ('SAN IGNACIO CERRO GORDO',14),

    ('NO ESPECIFICADO',14),

    ('ACAMBAY DE RU??Z CASTA??EDA',15),

    ('ACOLMAN',15),

     ('ACULCO',15);
     
-- 679 al 991
insert into Municipio (idMunicipio, municipioNombre, entidad) values (null, 'ALMOLOYA DE ALQUISIRAS', 1);

insert into Municipio (idMunicipio, municipioNombre, entidad) values (null, 'ALMOLOYA DE JUE??REZ', 1);

insert into Municipio (idMunicipio, municipioNombre, entidad) values (null, 'ALMOLOYA DEL R??O', 1);

insert into Municipio (idMunicipio, municipioNombre, entidad) values (null, 'AMANALCO', 1);

insert into Municipio (idMunicipio, municipioNombre, entidad) values (null, 'AMATEPEC', 1);

insert into Municipio (idMunicipio, municipioNombre, entidad) values (null, 'AMECAMECA', 1);

insert into Municipio (idMunicipio, municipioNombre, entidad) values (null, 'APAXCO', 1);

insert into Municipio (idMunicipio, municipioNombre, entidad) values (null, 'ATENCO', 1);

insert into Municipio (idMunicipio, municipioNombre, entidad) values (null, 'ATIZAP??N', 1);

insert into Municipio (idMunicipio, municipioNombre, entidad) values (null, 'ATIZAP??N DE ZARAGOZA', 1);

insert into Municipio (idMunicipio, municipioNombre, entidad) values (null, 'ATLACOMULCO', 1);

insert into Municipio (idMunicipio, municipioNombre, entidad) values (null, 'ATLAUTLA', 1);

insert into Municipio (idMunicipio, municipioNombre, entidad) values (null, 'AXAPUSCO', 1);

insert into Municipio (idMunicipio, municipioNombre, entidad) values (null, 'AYAPANGO', 1);

insert into Municipio (idMunicipio, municipioNombre, entidad) values (null, 'CALIMAYA', 1);

insert into Municipio (idMunicipio, municipioNombre, entidad) values (null, 'CAPULHUAC', 1);

insert into Municipio (idMunicipio, municipioNombre, entidad) values (null, 'COACALCO DE BERRIOZ??BAL', 1);

insert into Municipio (idMunicipio, municipioNombre, entidad) values (null, 'COATEPEC HARINAS', 1);

insert into Municipio (idMunicipio, municipioNombre, entidad) values (null, 'COCOTITL??N', 1);

insert into Municipio (idMunicipio, municipioNombre, entidad) values (null, 'COYOTEPEC', 1);

insert into Municipio (idMunicipio, municipioNombre, entidad) values (null, 'CUAUTITL??N', 1);

insert into Municipio (idMunicipio, municipioNombre, entidad) values (null, 'CHALCO', 1);

insert into Municipio (idMunicipio, municipioNombre, entidad) values (null, 'CHAPA DE MOTA', 1);

insert into Municipio (idMunicipio, municipioNombre, entidad) values (null, 'CHAPULTEPEC', 1);

insert into Municipio (idMunicipio, municipioNombre, entidad) values (null, 'CHIAUTLA', 1);

insert into Municipio (idMunicipio, municipioNombre, entidad) values (null, 'CHICOLOAPAN', 1);

insert into Municipio (idMunicipio, municipioNombre, entidad) values (null, 'CHICONCUAC', 1);

insert into Municipio (idMunicipio, municipioNombre, entidad) values (null, 'CHIMALHUAC??N', 1);

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

insert into Municipio (idMunicipio, municipioNombre, entidad) values (null, 'JOCOTITL??N', 1);

insert into Municipio (idMunicipio, municipioNombre, entidad) values (null, 'JOQUICINGO', 1);

insert into Municipio (idMunicipio, municipioNombre, entidad) values (null, 'JUCHITEPEC', 1);

insert into Municipio (idMunicipio, municipioNombre, entidad) values (null, 'LERMA', 1);

insert into Municipio (idMunicipio, municipioNombre, entidad) values (null, 'MALINALCO', 1);

insert into Municipio (idMunicipio, municipioNombre, entidad) values (null, 'MELCHOR OCAMPO', 1);

insert into Municipio (idMunicipio, municipioNombre, entidad) values (null, 'METEPEC', 1);

insert into Municipio (idMunicipio, municipioNombre, entidad) values (null, 'MEXICALTZINGO', 1);

insert into Municipio (idMunicipio, municipioNombre, entidad) values (null, 'MORELOS', 1);

insert into Municipio (idMunicipio, municipioNombre, entidad) values (null, 'NAUCALPAN DE JU??REZ', 1);

insert into Municipio (idMunicipio, municipioNombre, entidad) values (null, 'NEZAHUALC??YOLT', 1);

insert into Municipio (idMunicipio, municipioNombre, entidad) values (null, 'NEXTLALPAN', 1);

insert into Municipio (idMunicipio, municipioNombre, entidad) values (null, 'NICOL??S ROMERO', 1);

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

insert into Municipio (idMunicipio, municipioNombre, entidad) values (null, 'POLOTITL??N', 1);

insert into Municipio (idMunicipio, municipioNombre, entidad) values (null, 'RAY??N', 1);

insert into Municipio (idMunicipio, municipioNombre, entidad) values (null, 'SAN ANTONIO LA ISLA', 1);

insert into Municipio (idMunicipio, municipioNombre, entidad) values (null, 'SAN FELIPE DEL PROGESO', 1);

insert into Municipio (idMunicipio, municipioNombre, entidad) values (null, 'SAN MART??N DE LAS PIR??MIDES', 1);

insert into Municipio (idMunicipio, municipioNombre, entidad) values (null, 'SAN MATEO ATENCO', 1);

insert into Municipio (idMunicipio, municipioNombre, entidad) values (null, 'SAN SIM??N DE GUERRERO', 1);

insert into Municipio (idMunicipio, municipioNombre, entidad) values (null, 'SANTO TOM??S', 1);

insert into Municipio (idMunicipio, municipioNombre, entidad) values (null, 'SOYANIQUILPAN DE JU??REZ', 1);

insert into Municipio (idMunicipio, municipioNombre, entidad) values (null, 'SULTEPEC', 1);

insert into Municipio (idMunicipio, municipioNombre, entidad) values (null, 'TEC??MAC', 1);

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

insert into Municipio (idMunicipio, municipioNombre, entidad) values (null, 'TEOTIHUAC??N', 1);

insert into Municipio (idMunicipio, municipioNombre, entidad) values (null, 'TEPETLAOXTOC', 1);

insert into Municipio (idMunicipio, municipioNombre, entidad) values (null, 'TEPETLIXPA', 1);

insert into Municipio (idMunicipio, municipioNombre, entidad) values (null, 'TEPOTZOTL??N', 1);

insert into Municipio (idMunicipio, municipioNombre, entidad) values (null, 'TEQUIXQUIAC', 1);

insert into Municipio (idMunicipio, municipioNombre, entidad) values (null, 'TEXCALTITL??N', 1);

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

insert into Municipio (idMunicipio, municipioNombre, entidad) values (null, 'TULTITL??N', 1);

insert into Municipio (idMunicipio, municipioNombre, entidad) values (null, 'VALLE DE BRAVO', 1);

insert into Municipio (idMunicipio, municipioNombre, entidad) values (null, 'VILLA DE ALLENDE', 1);

insert into Municipio (idMunicipio, municipioNombre, entidad) values (null, 'VILLA DEL CARB??N', 1);

insert into Municipio (idMunicipio, municipioNombre, entidad) values (null, 'VILLA GUERRERO', 1);

insert into Municipio (idMunicipio, municipioNombre, entidad) values (null, 'VILLA VICTORIA', 1);

insert into Municipio (idMunicipio, municipioNombre, entidad) values (null, 'XONACATL??N', 1);

insert into Municipio (idMunicipio, municipioNombre, entidad) values (null, 'ZACAZONAPAN', 1);

-- 792 al 904
INSERT INTO Municipio VALUE ( NULL , "ZACUALPAN" , "15" );
INSERT INTO Municipio VALUE ( NULL , "ZINACANTEPEC" , "15" );
INSERT INTO Municipio VALUE ( NULL , "ZUMPAHUAC??N" , "15" );
INSERT INTO Municipio VALUE ( NULL , "ZUMPANGO" , "15" );
INSERT INTO Municipio VALUE ( NULL , "CUAUTITL??N IZCALLI" , "15" );
INSERT INTO Municipio VALUE ( NULL , "VALLE DE CHALCO SOLIDARIDAD" , "15" );
INSERT INTO Municipio VALUE ( NULL , "LUVIANOS" , "15" );
INSERT INTO Municipio VALUE ( NULL , "SAN JOS?? DEL RINC??N" , "15" );
INSERT INTO Municipio VALUE ( NULL , "TONANITLAC" , "15" );
INSERT INTO Municipio VALUE ( NULL , "NO ESPECIFICADO" , "15" );
INSERT INTO Municipio VALUE ( NULL , "ACUITZIO" , "16" );
INSERT INTO Municipio VALUE ( NULL , "AGUILILLA" , "16" );
INSERT INTO Municipio VALUE ( NULL , "??LVARO OBREG??N" , "16" );
INSERT INTO Municipio VALUE ( NULL , "ANGAMACUTIRO" , "16" );
INSERT INTO Municipio VALUE ( NULL , "ANGANGUEO" , "16" );
INSERT INTO Municipio VALUE ( NULL , "APATZING??N" , "16" );
INSERT INTO Municipio VALUE ( NULL , "APORO" , "16" );
INSERT INTO Municipio VALUE ( NULL , "AQUILA" , "16" );
INSERT INTO Municipio VALUE ( NULL , "ARIO" , "16" );
INSERT INTO Municipio VALUE ( NULL , "ARTEAGA" , "16" );
INSERT INTO Municipio VALUE ( NULL , "BRISE??AS" , "16" );
INSERT INTO Municipio VALUE ( NULL , "BUENAVISTA" , "16" );
INSERT INTO Municipio VALUE ( NULL , "CAR??CUARO" , "16" );
INSERT INTO Municipio VALUE ( NULL , "COAHUAYANA" , "16" );
INSERT INTO Municipio VALUE ( NULL , "COALCOM??N DE V??ZQUEZ PALLARES" , "16" );
INSERT INTO Municipio VALUE ( NULL , "COENEO" , "16" );
INSERT INTO Municipio VALUE ( NULL , "CONTEPEC" , "16" );
INSERT INTO Municipio VALUE ( NULL , "COP??NDARO" , "16" );
INSERT INTO Municipio VALUE ( NULL , "COTIJA" , "16" );
INSERT INTO Municipio VALUE ( NULL , "CUITZEO" , "16" );
INSERT INTO Municipio VALUE ( NULL , "CHARAPAN" , "16" );
INSERT INTO Municipio VALUE ( NULL , "CHARO" , "16" );
INSERT INTO Municipio VALUE ( NULL , "CHAVINDA" , "16" );
INSERT INTO Municipio VALUE ( NULL , "CHER??N" , "16" );
INSERT INTO Municipio VALUE ( NULL , "CHILCHOTA" , "16" );
INSERT INTO Municipio VALUE ( NULL , "CHINICUILA" , "16" );
INSERT INTO Municipio VALUE ( NULL , "CHUC??NDIRO" , "16" );
INSERT INTO Municipio VALUE ( NULL , "CHURINTZIO" , "16" );
INSERT INTO Municipio VALUE ( NULL , "CHURUMUCO" , "16" );
INSERT INTO Municipio VALUE ( NULL , "ECUANDUREO" , "16" );
INSERT INTO Municipio VALUE ( NULL , "EPITACIO HUERTA" , "16" );
INSERT INTO Municipio VALUE ( NULL , "ERONGAR??CUARO" , "16" );
INSERT INTO Municipio VALUE ( NULL , "GABRIEL ZAMORA" , "16" );
INSERT INTO Municipio VALUE ( NULL , "HIDALGO" , "16" );
INSERT INTO Municipio VALUE ( NULL , "LA HUACANA" , "16" );
INSERT INTO Municipio VALUE ( NULL , "HUANDACAREO" , "16" );
INSERT INTO Municipio VALUE ( NULL , "HUANIQUEO" , "16" );
INSERT INTO Municipio VALUE ( NULL , "HUETAMO" , "16" );
INSERT INTO Municipio VALUE ( NULL , "HUIRAMBA" , "16" );
INSERT INTO Municipio VALUE ( NULL , "INDAPARAPEO" , "16" );
INSERT INTO Municipio VALUE ( NULL , "IRIMBO" , "16" );
INSERT INTO Municipio VALUE ( NULL , "IXTL??N" , "16" );
INSERT INTO Municipio VALUE ( NULL , "JACONA" , "16" );
INSERT INTO Municipio VALUE ( NULL , "JIM??NEZ" , "16" );
INSERT INTO Municipio VALUE ( NULL , "JIQUILPAN" , "16" );
INSERT INTO Municipio VALUE ( NULL , "JU??REZ" , "16" );
INSERT INTO Municipio VALUE ( NULL , "JUNGAPEO" , "16" );
INSERT INTO Municipio VALUE ( NULL , "LAGUNILLAS" , "16" );
INSERT INTO Municipio VALUE ( NULL , "MADERO" , "16" );
INSERT INTO Municipio VALUE ( NULL , "MARAVAT??O" , "16" );
INSERT INTO Municipio VALUE ( NULL , "MARCOS CASTELLANOS" , "16" );
INSERT INTO Municipio VALUE ( NULL , "L??ZARO C??RDENAS" , "16" );
INSERT INTO Municipio VALUE ( NULL , "MORELIA" , "16" );
INSERT INTO Municipio VALUE ( NULL , "MORELOS" , "16" );
INSERT INTO Municipio VALUE ( NULL , "M??GICA" , "16" );
INSERT INTO Municipio VALUE ( NULL , "NAHUATZEN" , "16" );
INSERT INTO Municipio VALUE ( NULL , "NOCUP??TARO" , "16" );
INSERT INTO Municipio VALUE ( NULL , "NUEVO PARANGARICUTIRO" , "16" );
INSERT INTO Municipio VALUE ( NULL , "NUEVO URECHO" , "16" );
INSERT INTO Municipio VALUE ( NULL , "NUMAR??N" , "16" );
INSERT INTO Municipio VALUE ( NULL , "OCAMPO" , "16" );
INSERT INTO Municipio VALUE ( NULL , "PAJACUAR??N" , "16" );
INSERT INTO Municipio VALUE ( NULL , "PANIND??CUARO" , "16" );
INSERT INTO Municipio VALUE ( NULL , "PAR??CUARO" , "16" );
INSERT INTO Municipio VALUE ( NULL , "PARACHO" , "16" );
INSERT INTO Municipio VALUE ( NULL , "P??TZCUARO" , "16" );
INSERT INTO Municipio VALUE ( NULL , "PENJAMILLO" , "16" );
INSERT INTO Municipio VALUE ( NULL , "PERIB??N" , "16" );
INSERT INTO Municipio VALUE ( NULL , "LA PIEDAD", "16" );
INSERT INTO Municipio VALUE ( NULL , "PUR??PERO" , "16" );
INSERT INTO Municipio VALUE ( NULL , "PURU??NDIRO" , "16" );
INSERT INTO Municipio VALUE ( NULL , "QUER??NDARO" , "16" );
INSERT INTO Municipio VALUE ( NULL , "QUIROG" , "16" );
INSERT INTO Municipio VALUE ( NULL , "COJUMATL??N DE R??GULES" , "16" );
INSERT INTO Municipio VALUE ( NULL , "LOS REYES" , "16" );
INSERT INTO Municipio VALUE ( NULL , "SAHUAYO" , "16" );
INSERT INTO Municipio VALUE ( NULL , "SAN LUCAS" , "16" );
INSERT INTO Municipio VALUE ( NULL , "SANTA ANA MAYA" , "16" );
INSERT INTO Municipio VALUE ( NULL , "SALVADOR ESCALANTE" , "16" );
INSERT INTO Municipio VALUE ( NULL , "SENGUIO" , "16" );
INSERT INTO Municipio VALUE ( NULL , "SUSUPUATO" , "16" );
INSERT INTO Municipio VALUE ( NULL , "TAC??MBARO" , "16" );
INSERT INTO Municipio VALUE ( NULL , "TANC??TARO" , "16" );
INSERT INTO Municipio VALUE ( NULL , "TANGAMANDAPIO" , "16" );
INSERT INTO Municipio VALUE ( NULL , "TANGANC??CUARO" , "16" );
INSERT INTO Municipio VALUE ( NULL , "TANHUATO" , "16" );
INSERT INTO Municipio VALUE ( NULL , "TARETAN" , "16" );
INSERT INTO Municipio VALUE ( NULL , "TAR??MBARO" , "16" );
INSERT INTO Municipio VALUE ( NULL , "TEPALCATEPEC" , "16" );
INSERT INTO Municipio VALUE ( NULL , "TINGAMBATO" , "16" );
INSERT INTO Municipio VALUE ( NULL , "TING??IND??N" , "16" );
INSERT INTO Municipio VALUE ( NULL , "TIQUICHEO DE NICOL??S ROMERO" , "16" );
INSERT INTO Municipio VALUE ( NULL , "TLALPUJAHUA" , "16" );
INSERT INTO Municipio VALUE ( NULL , "TLAZAZALCA" , "16" );
INSERT INTO Municipio VALUE ( NULL , "TOCUMBO" , "16" );
INSERT INTO Municipio VALUE ( NULL , "TUMBISCAT??O" , "16" );
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

('VILLAMAR', 16),('VISTA HERMOSA',16),('YUR??CUARO ',16),('ZACAPU ',16),('ZAMORA ',16),

('ZIN??PARO ',16),('ZINAP??CUARO ',16),('ZIRACUARETIRO ',16),('ZIT??CUARO ',16),('JOS?? SIXTO VERDUZCO',16),

('NO ESPECIFICADO ',16);-- 915


-- MORELOS 17

insert into Municipio (municipioNombre,entidad) values

('AMACUZAC ', 17),('ATLATLAHUCAN ',17),('AXOCHIAPAN  ',17),('AYALA  ',17),('COATL??N DEL R??O ',17), 

('CUAUTLA ',17),('CUERNAVACA ',17),('EMILIANO ZAPATA',17),('HUITZILAC',17),('JANTETELCO ',17),

('JIUTEPEC',17),('JOJUTLA', 17),('JONACATEPEC DE LEANDRO VALLE ',17),('MAZATEPEC ',17),('MIACATL??N ',17), 

('OCUITUCO ',17),('PUENTE DE IXTLA',17),('TEMIXCO ',17),('TEPALCINGO ',17),('TEPOZTL??N',17),

('TETECALA ',17),('TETELA DEL VOLC??N',17),('TLALNEPANTLA', 17),('TLALTIZAP??N DE ZAPATA',17),('TLAQUILTENANGO',17), 

('TLAYACAPAN',17),('TOTOLAPAN',17),('XOCHITEPEC',17),('YAUTEPEC',17),('YECAPIXTLA',17),

('ZACATEPEC',17),('ZACUALPAN DE AMILPAS',17),('TEMOAC',17),('COATETELCO',17),('XOXOCOTLA',17),-- 950

('NO ESPECIFICADO',17);-- 951


-- NAYARIT 18

insert into Municipio (municipioNombre,entidad) values

('ACAPONETA', 18),('AHUACATL??N', 18),('AMATL??N DE CA??AS', 18),('COMPOSTELA', 18),('HUAJICORI', 18), 

('IXTL??N DEL R??O', 18),('JALA', 18),('XALISCO', 18),('DEL NAYAR', 18),('ROSAMORADA ', 18), 

('RU??Z', 18),('SAN BLAS', 18),('SAN PEDRO LAGUNILLAS', 18),('SANTA MAR??A DEL ORO', 18),('SANTIAGO IXCUINTLA', 18), 

('TECUALA', 18),('TEPIC', 18), ('TUXPAN', 18), ('LA YESCA', 18), ('BAH??A DE BANDERAS', 18),

('NO ESPECIFICADO', 18);-- 972


-- NUEVO LE??N 19

insert into Municipio (municipioNombre,entidad) values

('ABASOLO', 19), ('AGUALEGUAS', 19), ('LOS ALDAMAS', 19), ('ALLENDE', 19), ('AN??HUAC', 19),  

('APODACA', 19), ('ARAMBERRI', 19), ('BUSTAMANTE', 19),('CADEREYTA JIM??NEZ', 19),('EL CARMEN', 19),  

('CERRALVO', 19),('CI??NEGA DE FLORES', 19),('CHINA', 19), ('DOCTOR ARROYO', 19), ('DOCTOR COSS', 19),  

('DOCTOR GONZ??LEZ', 19),('GALEANA', 19),('GARC??A', 19), ('SAN PEDRO GARZA GARCIA', 19),('GENERAL BRAVO', 19),  

('GENERAL ESCOBEDO', 19),('GENERAL TER??N', 19), ('GENERAL TREVI??O', 19),('GENERAL ZARAGOZA', 19),('GENERAL ZUAZUA', 19),  

('GUADALUPE', 19),('LOS HERRERAS', 19),('HIGUERAS', 19),('HUALAHUISES', 19),('ITURBIDE', 19),  

('JU??REZ', 19),('LAMPAZOS DE NARANJO', 19),('LINARES', 19),('MAR??N', 19),('MELCHOR OCAMPO', 19), 

('MIER Y NORIEGA', 19),('MINA', 19),('MONTEMORELOS', 19),('MONTERREY', 19),('PAR??S', 19),  

('PESQUER??A', 19),('LOS RAMONES', 19),('RAYONES', 19),('SABINAS HIDALGO', 19),('SALINAS VICTORIA', 19);  -- 1017

-- 1018 al 1130
-- insert municipios 1018 - 1130

insert into Municipio (idMunicipio,municipioNombre,entidad)

values(null,'SAN NICOL??S DE LOS GARZA',19),

	(null,'HIDALGO',19),

    (null,'SANTA CATARINA',19),

    (null,'SANTIAGO',19),

    (null,'VALLECILLO',19),

    (null,'VILLALDAMA',19),

    (null,'NO ESPECIFICADO',19),

    (null,'ABEJONES',20),

    (null,'ACATL??N DE P??REZ FIGUEROA',20),

    (null,'ASUNCI??N CACALOTEPEC',20),  -- 10

    

	(null,'ASUNCI??N CUYOTEPEJI',20),	

    (null,'ASUNCI??N IXTALTEPEC',20),

    (null,'ASUNCI??N NOCHIXTL??N',20),

	(null,'ASUNCI??N OCOTL??N',20),

    (null,'ASUNCI??N TLACOLULITA',20),

    (null,'AYOTZINTEPEC',20),

	(null,'EL BARRIO DE LA SOLEDAD',20),

    (null,'CALIHUAL??',20),

    (null,'CANDELARIA LOXICHA',20),

	(null,'CI??NEGA DE ZIMATL??N',20),   -- 20


  	(null,'CIUDAD IXTEPEC',20),

    (null,'COATECAS ALTAS',20),

    (null,'COICOY??N DE LAS FLORES',20),

	(null,'LA COMPA????A',20),

    (null,'CONCEPCI??N BUENAVISTA',20),

    (null,'CONCEPCI??N P??PALO',20),

	(null,'CONSTANCIA DEL ROSARIO',20),

    (null,'COSOLAPA',20),

    (null,'COSOLTEPEC',20),

	(null,'CUIL??PAM DE GUERRERO',20),   -- 30


	(null,'CUYAMECALCO VILLA DE ZARAGOZA',20),

    (null,'CHAHUITES',20),

    (null,'CHALCATONGO DE HIDALGO',20),

	(null,'CHIQUIHUITL??N DE BENITO JU??REZ',20),

    (null,'HEROICA CIUDAD DE EJUTLA DE CRESPO',20),

    (null,'ELOXOCHITL??N DE FLORES MAG??N',20),

	(null,'EL ESPINAL',20),

    (null,'TAMAZUL??PAM DEL ESP??RITU SANTO',20),

    (null,'FRESNILLO DE TRUJANO',20),

	(null,'GUADALUPE ETLA',20),   -- 40


	(null,'GUADALUPE DE RAM??REZ',20),

    (null,'GUELATAO DE JU??REZ',20),

    (null,'GUEVEA DE HUMBOLDT',20),

	(null,'MESONES HIDALGO',20),

    (null,'VILLA HIDALGO',20),

    (null,'HEROICA CIUDAD DE HUAJUAPAN DE LE??N',20),

	(null,'HUAUTEPEC',20),

    (null,'HUAUTLA DE JIM??NEZ',20),

    (null,'IXTL??N DE JU??REZ',20),

	(null,'JUCHIT??N DE ZARAGOZA',20),   -- 50


	(null,'LOMA BONITA',20),

    (null,'MAGDALENA APASCO',20),

    (null,'MAGDALENA JALTEPEC',20),

	(null,'SANTA MAGDALENA JICOTL??N',20),

    (null,'MAGDALENA MIXTEPEC',20),

    (null,'MAGDALENA OCOTL??N',20),

	(null,'MAGDALENA PE??ASCO',20),

    (null,'MAGDALENA TEITIPAC',20),

    (null,'MAGDALENA TEQUISISTL??N',20),

	(null,'MAGDALENA TLACOTEPEC',20),   -- 60


	(null,'MAGDALENA ZAHUATL??N',20),

    (null,'MARISCALA DE JU??REZ',20),

    (null,'M??RTIRES DE TACUBAYA',20),

	(null,'MAT??AS ROMERO AVENDA??O',20),

    (null,'MAZATL??N VILLA DE FLORES',20),

    (null,'MIAHUATL??N DE PORFIRIO D??AZ',20),

	(null,'MIXISTL??N DE LA REFORMA',20),

    (null,'MONJAS',20),

    (null,'NATIVIDAD',20),

	(null,'NAZARENO ETLA',20),   -- 70


	(null,'NEJAPA DE MADERO',20),

    (null,'IXPANTEPEC NIEVES',20),

    (null,'SANTIAGO NILTEPEC',20),

	(null,'OAXACA DE JU??REZ',20),

    (null,'OCOTL??N DE MORELOS',20),

    (null,'LA PE',20),

	(null,'PINOTEPA DE DON LUIS',20),

    (null,'PLUMA HIDALGO',20),

    (null,'SAN JOS?? DEL PROGRESO',20),

	(null,'PUTLA VILLA DE GUERRERO',20),   -- 80


	(null,'SANTA CATARINA QUIOQUITANI',20),

    (null,'REFORMA DE PINEDA',20),

    (null,'LA REFORMA',20),

	(null,'REYES ETLA',20),

    (null,'ROJAS DE CUAUHT??MOC',20),

    (null,'SALINA CRUZ',20),

	(null,'SAN AGUST??N AMATENGO',20),

    (null,'SAN AGUST??N ATENANGO',20),

    (null,'SAN AGUST??N CHAYUCO',20),

	(null,'SAN AGUST??N DE LAS JUNTAS',20),   -- 90


	(null,'SAN AGUST??N ETLA',20),

    (null,'SAN AGUST??N LOXICHA',20),

    (null,'SAN AGUST??N TLACOTEPEC',20),

	(null,'SAN AGUST??N YATARENI',20),

    (null,'SAN ANDR??S CABECERA NUEVA',20),

    (null,'SAN ANDR??S DINICUITI',20),

	(null,'SAN ANDR??S HUAXPALTEPEC',20),

    (null,'SAN ANDR??S HUAY??PAM',20),

    (null,'SAN ANDR??S IXTLAHUACA',20),

	(null,'SAN ANDR??S LAGUNAS',20),   -- 100


	(null,'SAN ANDR??S NUXI??O',20),

    (null,'SAN ANDR??S PAXTL??N',20),

    (null,'SAN ANDR??S SINAXTLA',20),

	(null,'SAN ANDR??S SOLAGA',20),

    (null,'SAN ANDR??S TEOTIL??LPAM',20),

    (null,'SAN ANDR??S TEPETLAPA',20),

	(null,'SAN ANDR??S YA??',20),

    (null,'SAN ANDR??S ZABACHE',20),

    (null,'SAN ANDR??S ZAUTLA',20),

	(null,'SAN ANTONINO CASTILLO VELASCO',20),   -- 110

    

    (null,'SAN ANTONINO EL ALTO',20),

    (null,'SAN ANTONINO MONTE VERDE',20),

    (null,'SAN ANTONIO ACUTLA',20); -- 113
    
-- 1131 al 1243
insert into municipio values(NULL,"SAN ANTONIO DE LA CAL",20);

insert into municipio values(NULL,"SAN ANTONIO HUITEPEC",20);

insert into municipio values(NULL,"SAN ANTONIO NANAHUAT??PAM",20);

insert into municipio values(NULL,"SAN ANTONIO SINICAHUA ",20);

insert into municipio values(NULL,"SAN ANTONIO TEPETLAPA",20);

insert into municipio values(NULL,"SAN BALTAZAR CHICHIC??PAM",20);

insert into municipio values(NULL,"SAN BALTAZAR LOXICHA",20);

insert into municipio values(NULL,"SAN BALTAZAR YATZACHI EL BAJO",20);

insert into municipio values(NULL,"SAN BARTOLO COYOTEPEC",20);

insert into municipio values(NULL,"SAN BARTOLOM?? AYAUTLA",20);

insert into municipio values(NULL,"SAN BARTOLOM?? LOXICHA",20);

insert into municipio values(NULL,"SAN BARTOLOM?? QUIALANA",20);

insert into municipio values(NULL,"SAN BARTOLOM?? YUCUA??E",20);

insert into municipio values(NULL,"SAN BARTOLOM?? ZOOGOCHO",20);

insert into municipio values(NULL,"SAN BARTOLO SOYALTEPEC",20);

insert into municipio values(NULL,"SAN BARTOLO YAUTEPEC",20);

insert into municipio values(NULL,"SAN BERNARDO MIXTEPEC",20);

insert into municipio values(NULL,"SAN BLAS ATEMPA" ,20);

insert into municipio values(NULL,"SAN CARLOS YAUTEPEC",20);

insert into municipio values(NULL,"SAN CRIST??BAL AMATL??N",20);

insert into municipio values(NULL,"SAN CRIST??BAL AMOLTEPEC",20);

insert into municipio values(NULL,"SAN CRIST??BAL LACHIRIOAG",20);

insert into municipio values(NULL,"SAN CRIST??BAL SUCHIXTLAHUACA",20);

insert into municipio values(NULL,"SAN DIONISIO DEL MAR" ,20);

insert into municipio values(NULL,"SAN DIONISIO OCOTEPEC",20);

insert into municipio values(NULL,"SAN DIONISIO OCOTL??N",20);

insert into municipio values(NULL,"SAN ESTEBAN ATATLAHUCA",20);

insert into municipio values(NULL,"SAN FELIPE JALAPA DE D??AZ",20);

insert into municipio values(NULL,"SAN FELIPE TEJAL??PAM",20);

insert into municipio values(NULL,"SAN FELIPE USILA",20);

insert into municipio values(NULL,"SAN FRANCISCO CAHUACU??",20);

insert into municipio values(NULL,"SAN FRANCISCO CAJONOS",20);

insert into municipio values(NULL,"SAN FRANCISCO CHAPULAPA",20);

insert into municipio values(NULL,"SAN FRANCISCO CHIND??A",20);

insert into municipio values(NULL,"SAN FRANCISCO DEL MAR",20);

insert into municipio values(NULL,"SAN FRANCISCO HUEHUETL??N",20);

insert into municipio values(NULL,"SAN FRANCISCO IXHUAT??N",20);

insert into municipio values(NULL,"SAN FRANCISCO JALTEPETONGO",20);

insert into municipio values(NULL,"SAN FRANCISCO LACHIGOL??",20);

insert into municipio values(NULL,"SAN FRANCISCO LOGUECHE",20);

insert into municipio values(NULL,"SAN FRANCISCO NUXA??O",20);

insert into municipio values(NULL,"SAN FRANCISCO OZOLOTEPEC",20);

insert into municipio values(NULL,"SAN FRANCISCO SOLA" ,20);

insert into municipio values(NULL,"SAN FRANCISCO TELIXTLAHUACA",20);

insert into municipio values(NULL,"SAN FRANCISCO TEOPAN" ,20);

insert into municipio values(NULL,"SAN FRANCISCO TLAPANCINGO",20);

insert into municipio values(NULL,"SAN GABRIEL MIXTEPEC" ,20);

insert into municipio values(NULL,"SAN ILDEFONSO AMATL??N",20);

insert into municipio values(NULL,"SAN ILDEFONSO SOLA" ,20);

insert into municipio values(NULL,"SAN ILDEFONSO VILLA ALTA",20);

insert into municipio values(NULL,"SAN JACINTO AMILPAS",20);

insert into municipio values(NULL,"SAN JACINTO TLACOTEPEC",20);

insert into municipio values(NULL,"SAN JER??NIMO COATL??N",20);

insert into municipio values(NULL,"SAN JER??NIMO SILACAYOAPILLA",20);

insert into municipio values(NULL,"SAN JER??NIMO SOSOLA",20);

insert into municipio values(NULL,"SAN JER??NIMO TAVICHE",20);

insert into municipio values(NULL,"SAN JER??NIMO TEC??ATL",20);

insert into municipio values(NULL,"SAN JORGE NUCHITA",20);

insert into municipio values(NULL,"SAN JOS?? AYUQUILA",20);

insert into municipio values(NULL,"SAN JOS?? CHILTEPEC",20);

insert into municipio values(NULL,"SAN JOS?? DEL PE??ASCO",20);

insert into municipio values(NULL,"SAN JOS?? ESTANCIA GRANDE",20);

insert into municipio values(NULL,"SAN JOS?? INDEPENDENCIA",20);

insert into municipio values(NULL,"SAN JOS?? LACHIGUIRI",20);

insert into municipio values(NULL,"SAN JOS?? TENANGO" ,20);

insert into municipio values(NULL,"SAN JUAN ACHIUTLA",20);

insert into municipio values(NULL,"SAN JUAN ATEPEC",20);

insert into municipio values(NULL,"??NIMAS TRUJANO",20);

insert into municipio values(NULL,"SAN JUAN BAUTISTA ATATLAHUCA",20);

insert into municipio values(NULL,"SAN JUAN BAUTISTA COIXTLAHUACA",20);

insert into municipio values(NULL,"SAN JUAN BAUTISTA CUICATL??N",20);

insert into municipio values(NULL,"SAN JUAN BAUTISTA GUELACHE",20);

insert into municipio values(NULL,"SAN JUAN BAUTISTA JAYACATL??N",20);

insert into municipio values(NULL,"SAN JUAN BAUTISTA LO DE SOTO",20);

insert into municipio values(NULL,"SAN JUAN BAUTISTA SUCHITEPEC",20);

insert into municipio values(NULL,"SAN JUAN BAUTISTA TLACOATZINTEPEC",20);

insert into municipio values(NULL,"SAN JUAN BAUTISTA TLACHICHILCO",20);

insert into municipio values(NULL,"SAN JUAN BAUTISTA TUXTEPEC",20);

insert into municipio values(NULL,"SAN JUAN CACAHUATEPEC",20);

insert into municipio values(NULL,"SAN JUAN CIENEGUILLA" ,20);

insert into municipio values(NULL,"SAN JUAN COATZ??SPAM",20);

insert into municipio values(NULL,"SAN JUAN COLORADO",20);

insert into municipio values(NULL,"SAN JUAN COMALTEPEC",20);

insert into municipio values(NULL,"SAN JUAN COTZOC??N",20);

insert into municipio values(NULL,"SAN JUAN CHICOMEZ??CHIL",20);

insert into municipio values(NULL,"SAN JUAN CHILATECA",20);

insert into municipio values(NULL,"SAN JUAN DEL ESTADO",20);

insert into municipio values(NULL,"SAN JUAN DEL R??O",20);

insert into municipio values(NULL,"SAN JUAN DIUXI",20);

insert into municipio values(NULL,"SAN JUAN EVANGELISTA ANALCO",20);

insert into municipio values(NULL,"SAN JUAN GUELAV??A",20);

insert into municipio values(NULL,"SAN JUAN GUICHICOVI",20);

insert into municipio values(NULL,"SAN JUAN IHUALTEPEC",20);

insert into municipio values(NULL,"SAN JUAN JUQUILA MIXES",20);

insert into municipio values(NULL,"SAN JUAN JUQUILA VIJANOS",20);

insert into municipio values(NULL,"SAN JUAN LACHAO",20);

insert into municipio values(NULL,"SAN JUAN LACHIGALLA" ,20);

insert into municipio values(NULL,"SAN JUAN LAJARCIA" ,20);

insert into municipio values(NULL,"SAN JUAN LALANA" ,20);

insert into municipio values(NULL,"SAN JUAN DE LOS CU??S" ,20);

insert into municipio values(NULL,"SAN JUAN MAZATL??N" ,20);

insert into municipio values(NULL,"SAN JUAN MIXTEPEC" ,20);

insert into municipio values(NULL,"SAN JUAN MIXTEPEC" ,20);

insert into municipio values(NULL,"SAN JUAN ??UM??" ,20);

insert into municipio values(NULL,"SAN JUAN OZOLOTEPEC" ,20);

insert into municipio values(NULL,"SAN JUAN PETLAPA",20);

insert into municipio values(NULL,"SAN JUAN QUIAHIJE",20);

insert into municipio values(NULL,"SAN JUAN QUIOTEPEC",20);

insert into municipio values(NULL,"SAN JUAN SAYULTEPEC",20);

insert into municipio values(NULL,"SAN JUAN TABA??",20);

insert into municipio values(NULL,"SAN JUAN TAMAZOLA",20);

insert into municipio values(NULL,"SAN JUAN TEITA",20);

insert into municipio values(NULL,"SAN JUAN TEITIPAC",20);

-- 1244 al 1356
-- Oaxaca id 20


-- 1244-1356

insert into municipio values (null, 'SAN JUAN TEPEUXILA', 20); -- 1244

insert into municipio values (null, 'SAN JUAN TEPOSCOLULA', 20);

insert into municipio values (null, 'SAN JUAN YAE??', 20);

insert into municipio values (null, 'SAN JUAN YATZONA', 20);

insert into municipio values (null, 'SAN JUAN YUCUITA', 20);

insert into municipio values (null, 'SAN LORENZO', 20);

insert into municipio values (null, 'SAN LORENZO ALBARRADAS', 20);

insert into municipio values (null, 'SAN LORENZO CACAOTEPEC', 20);

insert into municipio values (null, 'SAN LORENZO CUAUNECUILTITLA', 20);

insert into municipio values (null, 'SAN LORENZO TEXMEL??CAN', 20);  

insert into municipio values (null, 'SAN LORENZO VICTORIA', 20);  -- 1254

insert into municipio values (null, 'SAN LUCAS CAMOTL??N', 20); 

insert into municipio values (null, 'SAN LUCAS OJITL??N', 20);

insert into municipio values (null, 'SAN LUCAS QUIAVIN??', 20);

insert into municipio values (null, 'SAN LUCAS ZOQUI??PAM', 20);

insert into municipio values (null, 'SAN LUIS AMATL??N', 20);

insert into municipio values (null, 'SAN MARCIAL OZOLOTEPEC', 20);

insert into municipio values (null, 'SAN MARCOS ARTEAGA', 20);

insert into municipio values (null, 'SAN MART??N DE LOS CANSECOS', 20);

insert into municipio values (null, 'SAN MART??N HUAMEL??LPAM', 20); 

insert into municipio values (null, 'SAN MART??N ITUNYOSO', 20); -- 1264

insert into municipio values (null, 'SAN MART??N LACHIL??', 20);

insert into municipio values (null, 'SAN MART??N PERAS', 20);

insert into municipio values (null, 'SAN MART??N TILCAJETE', 20);

insert into municipio values (null, 'SAN MART??N TOXPALAN', 20);

insert into municipio values (null, 'SAN MART??N ZACATEPEC', 20);

insert into municipio values (null, 'SAN MATEO CAJONOS', 20);

insert into municipio values (null, 'CAPUL??LPAM DE M??NDEZ', 20);

insert into municipio values (null, 'SAN MATEO DEL MAR', 20);

insert into municipio values (null, 'SAN MATEO YOLOXOCHITL??N', 20);

insert into municipio values (null, 'SAN MATEO ETLATONGO', 20); -- 1274

insert into municipio values (null, 'SAN MATEO NEJ??PAM', 20);

insert into municipio values (null, 'SAN MATEO PE??ASCO', 20);

insert into municipio values (null, 'SAN MATEO PI??AS', 20);

insert into municipio values (null, 'SAN MATEO R??O HONDO', 20);

insert into municipio values (null, 'SAN MATEO SINDIHUI', 20);

insert into municipio values (null, 'SAN MATEO TLAPILTEPEC', 20);

insert into municipio values (null, 'SAN MELCHOR BETAZA', 20);

insert into municipio values (null, 'SAN MIGUEL ACHIUTLA', 20);

insert into municipio values (null, 'SAN MIGUEL AHUEHUETITL??N', 20);

insert into municipio values (null, 'SAN MIGUEL ALO??PAM', 20); -- 1284

insert into municipio values (null, 'SAN MIGUEL AMATITL??N', 20);

insert into municipio values (null, 'SAN MIGUEL AMATL??N', 20);

insert into municipio values (null, 'SAN MIGUEL COATL??N', 20);

insert into municipio values (null, 'SAN MIGUEL CHICAHUA', 20);

insert into municipio values (null, 'SAN MIGUEL CHIMALAPA', 20);

insert into municipio values (null, 'SAN MIGUEL DEL PUERTO', 20);

insert into municipio values (null, 'SAN MIGUEL DEL R??O', 20);

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

insert into municipio values (null, 'SAN MIGUEL TECOMATL??N', 20);

insert into municipio values (null, 'SAN MIGUEL TENANGO', 20);

insert into municipio values (null, 'SAN MIGUEL TEQUIXTEPEC', 20);

insert into municipio values (null, 'SAN MIGUEL TILQUI??PAM', 20);

insert into municipio values (null, 'SAN MIGUEL TLACAMAMA', 20);

insert into municipio values (null, 'SAN MIGUEL TLACOTEPEC', 20);

insert into municipio values (null, 'SAN MIGUEL TULANCINGO', 20);

insert into municipio values (null, 'SAN MIGUEL YOTAO', 20);

insert into municipio values (null, 'SAN NICOL??S', 20);

insert into municipio values (null, 'SAN NICOL??S HIDALGO', 20); -- 1314

insert into municipio values (null, 'SAN PABLO COATL??N', 20);

insert into municipio values (null, 'SAN PABLO CUATRO VENADOS', 20);

insert into municipio values (null, 'SAN PABLO ETLA', 20);

insert into municipio values (null, 'SAN PABLO HUITZO', 20);

insert into municipio values (null, 'SAN PABLO HUIXTEPEC', 20);

insert into municipio values (null, 'SAN PABLO MACUILTIANGUIS', 20);

insert into municipio values (null, 'SAN PABLO TIJALTEPEC', 20);

insert into municipio values (null, 'SAN PABLO VILLA DE MITLA', 20);

insert into municipio values (null, 'SAN PABLO YAGANIZA', 20);

insert into municipio values (null, 'SAN PEDRO AMUZGOS', 20); -- 1324

insert into municipio values (null, 'SAN PEDRO AP??STOL', 20);

insert into municipio values (null, 'SAN PEDRO ATOYAC', 20);

insert into municipio values (null, 'SAN PEDRO CAJONOS', 20);

insert into municipio values (null, 'SAN PEDRO COXCALTEPEC C??NTAROS', 20);

insert into municipio values (null, 'SAN PEDRO COMITANCILLO', 20);

insert into municipio values (null, 'SAN PEDRO EL ALTO', 20);

insert into municipio values (null, 'SAN PEDRO HUAMELULA', 20);

insert into municipio values (null, 'SAN PEDRO HUILOTEPEC', 20);

insert into municipio values (null, 'SAN PEDRO IXCATL??N', 20);

insert into municipio values (null, 'SAN PEDRO IXTLAHUACA', 20); -- 1334

insert into municipio values (null, 'SAN PEDRO JALTEPETONGO', 20);

insert into municipio values (null, 'SAN PEDRO JICAY??N', 20);

insert into municipio values (null, 'SAN PEDRO JOCOTIPAC', 20);

insert into municipio values (null, 'SAN PEDRO JUCHATENGO', 20);

insert into municipio values (null, 'SAN PEDRO M??RTIR', 20);

insert into municipio values (null, 'SAN PEDRO M??RTIR QUIECHAPA', 20);

insert into municipio values (null, 'SAN PEDRO M??RTIR YUCUXACO', 20);

insert into municipio values (null, 'SAN PEDRO MIXTEPEC', 20);

insert into municipio values (null, 'SAN PEDRO MIXTEPEC', 20);  -- <-- este se repet??a en la tabla, es el 1343

insert into municipio values (null, 'SAN PEDRO MOLINOS', 20); -- 1344

insert into municipio values (null, 'SAN PEDRO NOPALA', 20);

insert into municipio values (null, 'SAN PEDRO OCOPETATILLO', 20);

insert into municipio values (null, 'SAN PEDRO OCOTEPEC', 20);

insert into municipio values (null, 'SAN PEDRO POCHUTLA', 20);

insert into municipio values (null, 'SAN PEDRO QUIATONI', 20);

insert into municipio values (null, 'SAN PEDRO SOCHI??PAM', 20);

insert into municipio values (null, 'SAN PEDRO TAPANATEPEC', 20);

insert into municipio values (null, 'SAN PEDRO TAVICHE', 20);

insert into municipio values (null, 'SAN PEDRO TEOZACOALCO', 20);

insert into municipio values (null, 'SAN PEDRO TEUTILA', 20); -- 1354

insert into municipio values (null, 'SAN PEDRO TIDA??', 20);

insert into municipio values (null, 'SAN PEDRO TOPILTEPEC', 20); -- 1356

-- 1357 al 1469 falta

insert into municipio values (null,"SAN PEDRO TOPILTEPEC",20),(null,"SAN PEDRO TOTOL??PAM",20),(null,"VILLA DE TUTUTEPEC",20),(null,"SAN PEDRO YANERI",20),(null,"SAN PEDRO Y??LOX",20),(null,"SAN PEDRO Y SAN PABLO AYUTLA",20),(null,"VILLA DE ETLA",20),(null,"SAN PEDRO Y SAN PABLO TEPOSCOLULA",20),(null,"SAN PEDRO Y SAN PABLO TEQUIXTEPEC",20),(null,"SAN PEDRO YUCUNAMA",20),(null,"SAN RAYMUNDO JALPAN",20),(null,"SAN SEBASTI??N ABASOLO",20),(null,"SAN SEBASTI??N COATL??N",20),(null,"SAN SEBASTI??N IXCAPA",20),(null,"SAN SEBASTI??N NICANANDUTA",20),(null,"SAN SEBASTI??N R??O HONDO",20),(null,"SAN SEBASTI??N TECOMAXTLAHUACA",20),(null,"SAN SEBASTI??N TEITIPAC",20),(null,"SAN SEBASTI??N TUTLA",20),(null,"SAN SIM??N ALMOLONGAS",20),(null,"SAN SIM??N ZAHUATL??N",20),(null,"SANTA ANA",20),(null,"SANTA ANA ATEIXTLAHUACA",20),(null,"SANTA ANA CUAUHT??MOC",20),(null,"SANTA ANA DEL VALLE",20),(null,"SANTA ANA TAVELA",20),(null,"SANTA ANA TLAPACOYAN",20),(null,"SANTA ANA YARENI",20),(null,"SANTA ANA ZEGACHE",20),(null,"SANTA CATALINA QUIER??",20),(null,"SANTA CATARINA CUIXTLA",20),(null,"SANTA CATARINA IXTEPEJI",20),(null,"SANTA CATARINA JUQUILA",20),(null,"SANTA CATARINA LACHATAO",20),(null,"SANTA CATARINA LOXICHA",20),(null,"SANTA CATARINA MECHOAC??N",20),(null,"SANTA CATARINA MINAS",20),(null,"SANTA CATARINA QUIAN??",20),(null,"SANTA CATARINA TAYATA",20),(null,"SANTA CATARINA TICU??",20),(null,"SANTA CATARINA YOSONOT??",20),(null,"SANTA CATARINA ZAPOQUILA",20),(null,"SANTA CRUZ ACATEPEC",20),(null,"SANTA CRUZ AMILPAS",20),(null,"SANTA CRUZ DE BRAVO",20),(null,"SANTA CRUZ ITUNDUJIA",20),(null,"SANTA CRUZ MIXTEPEC",20),(null,"SANTA CRUZ NUNDACO",20),(null,"SANTA CRUZ PAPALUTLA",20),(null,"SANTA CRUZ TACACHE DE MINA",20),(null,"SANTA CRUZ TACAHUA",20),(null,"SANTA CRUZ TAYATA",20),(null,"SANTA CRUZ XITLA",20),(null,"SANTA CRUZ XOXOCOTL??N",20),(null,"SANTA CRUZ ZENZONTEPEC",20),(null,"SANTA GERTRUDIS",20),(null,"SANTA IN??S DEL MONTE",20),(null,"SANTA IN??S YATZECHE",20),(null,"SANTA LUC??A DEL CAMINO",20),(null,"SANTA LUC??A MIAHUATL??N",20),(null,"SANTA LUC??A MONTEVERDE",20),(null,"SANTA LUC??A OCOTL??N",20),(null,"SANTA MAR??A ALOTEPEC",20),(null,"SANTA MAR??A APAZCO",20),(null,"SANTA MAR??A LA ASUNCI??N",20),(null,"HEROICA CIUDAD DE TLAXIACO",20),(null,"AYOQUEZCO DE ALDAMA",20),(null,"SANTA MAR??A ATZOMPA",20),(null,"SANTA MAR??A CAMOTL??N",20),(null,"SANTA MAR??A COLOTEPEC",20),(null,"SANTA MAR??A CORTIJO",20),(null,"SANTA MAR??A COYOTEPEC",20),(null,"SANTA MAR??A CHACHO??PAM",20),(null,"VILLA DE CHILAPA DE D??AZ",20),(null,"SANTA MAR??A CHILCHOTLA",20),(null,"SANTA MAR??A CHIMALAPA",20),(null,"SANTA MAR??A DEL ROSARIO",20),(null,"SANTA MAR??A DEL TULE",20),(null,"SANTA MAR??A ECATEPEC",20),(null,"SANTA MAR??A GUELAC??",20),(null,"SANTA MAR??A GUIENAGATI",20),(null,"SANTA MAR??A HUATULCO",20),(null,"SANTA MAR??A HUAZOLOTITL??N",20),(null,"SANTA MAR??A IPALAPA",20),(null,"SANTA MAR??A IXCATL??N",20),(null,"SANTA MAR??A JACATEPEC",20),(null,"SANTA MAR??A JALAPA DEL MARQU??S",20),(null,"SANTA MAR??A JALTIANGUIS",20),(null,"SANTA MAR??A LACHIX??O",20),(null,"SANTA MAR??A MIXTEQUILLA",20),(null,"SANTA MAR??A NATIVITAS",20),(null,"SANTA MAR??A NDUAYACO",20),(null,"SANTA MAR??A OZOLOTEPEC",20),(null,"SANTA MAR??A P??PALO",20),(null,"SANTA MAR??A PE??OLES",20),(null,"SANTA MAR??A PETAPA",20),(null,"SANTA MAR??A QUIEGOLANI",20),(null,"SANTA MAR??A SOLA",20),(null,"SANTA MAR??A TATALTEPEC",20),(null,"SANTA MAR??A TECOMAVACA",20),(null,"SANTA MAR??A TEMAXCALAPA",20),(null,"SANTA MAR??A TEMAXCALTEPEC",20),(null,"SANTA MAR??A TEOPOXCO",20),(null,"SANTA MAR??A TEPANTLALI",20),(null,"SANTA MAR??A TEXCATITL??N",20),(null,"SANTA MAR??A TLAHUITOLTEPEC",20),(null,"SANTA MAR??A TLALIXTAC",20),(null,"SANTA MAR??A TONAMECA",20),(null,"SANTA MAR??A TOTOLAPILLA",20),(null,"SANTA MAR??A XADANI",20),(null,"SANTA MAR??A YALINA",20),(null,"SANTA MAR??A YAVES??A",20),(null,"SANTA MAR??A YOLOTEPEC",20);


-- 1470 al 1582
insert into municipio values (1470, "SANTA MAR??A YUCUHITI", 20);

insert into municipio values (1471, "SANTA MAR??A ZACATEPEC", 20);

insert into municipio values (1472, "SANTA MAR??A ZANIZA", 20);

insert into municipio values (1473, "SANTA MAR??A ZOQUITL??N", 20);

insert into municipio values (1474, "SANTIAGO AMOLTEPEC", 20);

insert into municipio values (1475, "SANTIAGO APOALA", 20);

insert into municipio values (1476, "SANTIAGO AP??STOL", 20);

insert into municipio values (1477, "SANTIAGO ASTATA", 20);

insert into municipio values (1478, "SANTIAGO ATITL??N", 20);

insert into municipio values (1479, "SANTIAGO AYUQUILILLA", 20);

insert into municipio values (1480, "SANTIAGO CACALOXTEPEC", 20);

insert into municipio values (1481, "SANTIAGO CAMOTL??N", 20);

insert into municipio values (1482, "SANTIAGO COMALTEPEC", 20);

insert into municipio values (1483, "VILLA DE SANTIAGO CHAZUMBA", 20);

insert into municipio values (1484, "SANTIAGO CHO??PAM", 20);

insert into municipio values (1485, "SANTIAGO DEL R??O", 20);

insert into municipio values (1486, "SANTIAGO HUAJOLOTITL??N", 20);

insert into municipio values (1487, "SANTIAGO HUAUCLILLA", 20);

insert into municipio values (1488, "SANTIAGO IHUITL??N PLUMAS", 20);

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

insert into municipio values (1499, "SANTIAGO MATATL??N", 20);

insert into municipio values (1500, "SANTIAGO MILTEPEC", 20);

insert into municipio values (1501, "SANTIAGO MINAS", 20);

insert into municipio values (1502, "SANTIAGO NACALTEPEC", 20);

insert into municipio values (1503, "SANTIAGO NEJAPILLA", 20);

insert into municipio values (1504, "SANTIAGO NUNDICHE", 20);

insert into municipio values (1505, "SANTIAGO NUYO??", 20);

insert into municipio values (1506, "SANTIAGO PINOTEPA NACIONAL", 20);

insert into municipio values (1507, "SANTIAGO SUCHILQUITONGO", 20);

insert into municipio values (1508, "SANTIAGO TAMAZOLA", 20);

insert into municipio values (1509, "SANTIAGO TAPEXTLA", 20);

insert into municipio values (1510, "VILLA TEJ??PAM DE LA UNI??N", 20);

insert into municipio values (1511, "SANTIAGO TENANGO", 20);

insert into municipio values (1512, "SANTIAGO TEPETLAPA", 20);

insert into municipio values (1513, "SANTIAGO TETEPEC", 20);

insert into municipio values (1514, "SANTIAGO TEXCALCINGO", 20);

insert into municipio values (1515, "SANTIAGO TEXTITL??N", 20);

insert into municipio values (1516, "SANTIAGO TILANTONGO", 20);

insert into municipio values (1517, "SANTIAGO TILLO", 20);

insert into municipio values (1518, "SANTIAGO TLAZOYALTEPEC", 20);

insert into municipio values (1519, "SANTIAGO XANICA", 20);

insert into municipio values (1520, "SANTIAGO XIACU??", 20);

insert into municipio values (1521, "SANTIAGO YAITEPEC", 20);

insert into municipio values (1522, "SANTIAGO YAVEO", 20);

insert into municipio values (1523, "SANTIAGO YOLOM??CATL", 20);

insert into municipio values (1524, "SANTIAGO YOSOND??A", 20);

insert into municipio values (1525, "SANTIAGO YUCUYACHI", 20);

insert into municipio values (1526, "SANTIAGO ZACATEPEC", 20);

insert into municipio values (1527, "SANTIAGO ZOOCHILA", 20);

insert into municipio values (1528, "NUEVO ZOQUI??PAM", 20);

insert into municipio values (1529, "SANTO DOMINGO INGENIO", 20);

insert into municipio values (1530, "SANTO DOMINGO ALBARRADAS", 20);

insert into municipio values (1531, "SANTO DOMINGO ARMENTA", 20);

insert into municipio values (1532, "SANTO DOMINGO CHIHUIT??N", 20);

insert into municipio values (1533, "SANTO DOMINGO DE MORELOS", 20);

insert into municipio values (1534, "SANTO DOMINGO IXCATL??N", 20);

insert into municipio values (1535, "SANTO DOMINGO NUXA??", 20);

insert into municipio values (1536, "SANTO DOMINGO OZOLOTEPEC", 20);

insert into municipio values (1537, "SANTO DOMINGO PETAPA", 20);

insert into municipio values (1538, "SANTO DOMINGO ROAYAGA", 20);

insert into municipio values (1539, "SANTO DOMINGO TEHUANTEPEC", 20);

insert into municipio values (1540, "SANTO DOMINGO TEOJOMULCO", 20);

insert into municipio values (1541, "SANTO DOMINGO TEPUXTEPEC", 20);

insert into municipio values (1542, "SANTO DOMINGO TLATAY??PAM", 20);

insert into municipio values (1543, "SANTO DOMINGO TOMALTEPEC", 20);

insert into municipio values (1544, "SANTO DOMINGO TONAL??", 20);

insert into municipio values (1545, "SANTO DOMINGO TONALTEPEC", 20);

insert into municipio values (1546, "SANTO DOMINGO XAGAC??A", 20);

insert into municipio values (1547, "SANTO DOMINGO YANHUITL??N", 20);

insert into municipio values (1548, "SANTO DOMINGO YODOHINO", 20);

insert into municipio values (1549, "SANTO DOMINGO ZANATEPEC", 20);

insert into municipio values (1550, "SANTOS REYES NOPALA", 20);

insert into municipio values (1551, "SANTOS REYES P??PALO", 20);

insert into municipio values (1552, "SANTOS REYES TEPEJILLO", 20);

insert into municipio values (1553, "SANTOS REYES YUCUN??", 20);

insert into municipio values (1554, "SANTO TOM??S JALIEZA", 20);

insert into municipio values (1555, "SANTO TOM??S MAZALTEPEC", 20);

insert into municipio values (1556, "SANTO TOM??S OCOTEPEC", 20);

insert into municipio values (1557, "SANTO TOM??S TAMAZULAPAN", 20);

insert into municipio values (1558, "SAN VICENTE COATL??N", 20);

insert into municipio values (1559, "SAN VICENTE LACHIX??O", 20);

insert into municipio values (1560, "SAN VICENTE NU????", 20);

insert into municipio values (1561, "SILACAYO??PAM", 20);

insert into municipio values (1562, "SITIO DE XITLAPEHUA", 20);

insert into municipio values (1563, "SOLEDAD ETLA", 20);

insert into municipio values (1564, "VILLA DE TAMAZUL??PAM DEL PROGRESO", 20);

insert into municipio values (1565, "TANETZE DE ZARAGOZA", 20);

insert into municipio values (1566, "TANICHE", 20);

insert into municipio values (1567, "TATALTEPEC DE VALD??S", 20);

insert into municipio values (1568, "TEOCOCUILCO DE MARCOS P??REZ", 20);

insert into municipio values (1569, "TEOTITL??N DE FLORES MAG??N", 20);

insert into municipio values (1570, "TEOTITL??N DEL VALLE", 20);

insert into municipio values (1571, "TEOTONGO", 20);

insert into municipio values (1572, "TEPELMEME VILLA DE MORELOS", 20);

insert into municipio values (1573, "HEROICA VILLA TEZOATL??N DE SEGURA Y LUNA", 20);

insert into municipio values (1574, "SAN JER??NIMO TLACOCHAHUAYA", 20);

insert into municipio values (1575, "TLACOLULA DE MATAMOROS", 20);

insert into municipio values (1576, "TLACOTEPEC PLUMAS", 20);

insert into municipio values (1577, "TLALIXTAC DE CABRERA", 20);

insert into municipio values (1578, "TOTONTEPEC VILLA DE MORELOS", 20);

insert into municipio values (1579, "TRINIDAD ZAACHILA", 20);

insert into municipio values (1580, "LA TRINIDAD VISTA HERMOSA", 20);

insert into municipio values (1581, "UNI??N HIDALGO", 20);

insert into municipio values (1582, "VALERIO TRUJANO", 20);

-- 1583 al 1695
insert into Municipio values (null,"SAN JUAN BAUTISTA VALLE NACIONAL",20);

insert into Municipio values (null,"VILLA D??AZ ORDAZ",20);

insert into Municipio values (null,"YAXE",20);

insert into Municipio values (null,"MAGDALENA YODOCONO DE PORFIRIO D??AZ",20);

insert into Municipio values (null,"YOGANA",20);

insert into Municipio values (null,"YUTANDUCHI DE GUERRERO",20);

insert into Municipio values (null,"VILLA DE ZAACHILA",20);

insert into Municipio values (null,"SAN MATEO YUCUTINDOO",20);

insert into Municipio values (null,"ZAPOTITL??N LAGUNAS",20);

insert into Municipio values (null,"ZAPOTITL??N PALMAS",20);

insert into Municipio values (null,"SANTA IN??S DE ZARAGOZA",20);

insert into Municipio values (null,"ZIMATL??N DE ??LVAREZ",20);

insert into Municipio values (null,"NO ESPECIFICADO",20);

insert into Municipio values (null,"ACAJETE",21);

insert into Municipio values (null,"ACATENO",21);

insert into Municipio values (null,"ACATL??N",21);

insert into Municipio values (null,"ACATZINGO",21);

insert into Municipio values (null,"ACTEOPAN",21);

insert into Municipio values (null,"AHUACATL??N",21);

insert into Municipio values (null,"AHUATL??N",21);

insert into Municipio values (null,"AHUAZOTEPEC",21);

insert into Municipio values (null,"AHUEHUETITLA",21);

insert into Municipio values (null,"AJALPAN",21);

insert into Municipio values (null,"ALBINO ZERTUCHE",21);

insert into Municipio values (null,"ALJOJUCA",21);

insert into Municipio values (null,"ALTEPEXI",21);

insert into Municipio values (null,"AMIXTL??N",21);

insert into Municipio values (null,"AMOZOC",21);

insert into Municipio values (null,"AQUIXTLA",21);

insert into Municipio values (null,"ATEMPAN",21);

insert into Municipio values (null,"ATEXCAL",21);

insert into Municipio values (null,"ATLIXCO",21);

insert into Municipio values (null,"ATOYATEMPAN",21);

insert into Municipio values (null,"ATZALA",21);

insert into Municipio values (null,"ATZITZIHUAC??N",21);

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

insert into Municipio values (null,"COXCATL??N",21);

insert into Municipio values (null,"COYOMEAPAN",21);

insert into Municipio values (null,"COYOTEPEC",21);

insert into Municipio values (null,"CUAPIAXTLA DE MADERO",21);

insert into Municipio values (null,"CUAUTEMPAN",21);

insert into Municipio values (null,"CUAUTINCH??N",21);

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

insert into Municipio values (null,"CHIGMECATITL??N",21);

insert into Municipio values (null,"CHIGNAHUAPAN",21);

insert into Municipio values (null,"CHIGNAUTLA",21);

insert into Municipio values (null,"CHILA",21);

insert into Municipio values (null,"CHILA DE LA SAL",21);

insert into Municipio values (null,"HONEY",21);

insert into Municipio values (null,"CHILCHOTLA",21);

insert into Municipio values (null,"CHINANTLA",21);

insert into Municipio values (null,"DOMINGO ARENAS",21);

insert into Municipio values (null,"ELOXOCHITL??N",21);

insert into Municipio values (null,"EPATL??N",21);

insert into Municipio values (null,"ESPERANZA",21);

insert into Municipio values (null,"FRANCISCO Z. MENA",21);

insert into Municipio values (null,"GENERAL FELIPE ??NGELES",21);

insert into Municipio values (null,"GUADALUPE",21);

insert into Municipio values (null,"GUADALUPE VICTORIA",21);

insert into Municipio values (null,"HERMENEGILDO GALEANA",21);

insert into Municipio values (null,"HUAQUECHULA",21);

insert into Municipio values (null,"HUATLATLAUCA",21);

insert into Municipio values (null,"HUAUCHINANGO",21);

insert into Municipio values (null,"HUEHUETLA",21);

insert into Municipio values (null,"HUEHUETL??N EL CHICO",21);

insert into Municipio values (null,"HUEJOTZINGO",21);

insert into Municipio values (null,"HUEYAPAN",21);

insert into Municipio values (null,"HUEYTAMALCO",21);

insert into Municipio values (null,"HUEYTLALPAN",21);

insert into Municipio values (null,"HUITZILAN DE SERD??N",21);

insert into Municipio values (null,"HUITZILTEPEC",21);

insert into Municipio values (null,"ATLEQUIZAYAN",21);

insert into Municipio values (null,"IXCAMILPA DE GUERRERO",21);

insert into Municipio values (null,"IXCAQUIXTLA",21);

insert into Municipio values (null,"IXTACAMAXTITL??N",21);

insert into Municipio values (null,"IXTEPEC",21);

insert into Municipio values (null,"IZ??CAR DE MATAMOROS",21);

insert into Municipio values (null,"JALPAN",21);

insert into Municipio values (null,"JOLALPAN",21);

insert into Municipio values (null,"JONOTLA",21);

insert into Municipio values (null,"JOPALA",21);

insert into Municipio values (null,"JUAN C. BONILLA",21);

insert into Municipio values (null,"JUAN GALINDO",21);

insert into Municipio values (null,"JUAN N. M??NDEZ",21);

insert into Municipio values (null,"LAFRAGUA",21);

insert into Municipio values (null,"LIBRES",21);

insert into Municipio values (null,"LA MAGDALENA TLATLAUQUITEPEC",21);

insert into Municipio values (null,"MAZAPILTEPEC DE JU??REZ",21);

insert into Municipio values (null,"MIXTLA",21);

insert into Municipio values (null,"MOLCAXAC",21);

insert into Municipio values (null,"CA??ADA MORELOS",21);

insert into Municipio values (null,"NAUPAN",21);

-- 1696 al 1808
insert into municipio values (null,'NAUA', 21);

insert into municipio values (null,'NEALTICAN', 21);

insert into municipio values (null,'NICOL??S BRAVO', 21);

insert into municipio values (null,'NOPALUCAN', 21);

insert into municipio values (null,'OCOTEPEC', 21);

insert into municipio values (null,'OCOYUCAN', 21);

insert into municipio values (null,'OLINTLA', 21);

insert into municipio values (null,'ORIENTAL', 21);

insert into municipio values (null,'PAHUATL??N', 21);

insert into municipio values (null,'PALMAR DE BRAVO', 21);

insert into municipio values (null,'PANTEPEC', 21);

insert into municipio values (null,'PETLALCINGO', 21);

insert into municipio values (null,'PIAXTLA', 21);

insert into municipio values (null,'PUEBLA', 21);

insert into municipio values (null,'QUECHOLAC', 21);

insert into municipio values (null,'QUIMIXTL??N', 21);

insert into municipio values (null,'RAFAEL LARA GRAJALES', 21);

insert into municipio values (null,'LOS REYES DE JU??REZ', 21);

insert into municipio values (null,'SAN ANDR??S CHOLULA', 21);

insert into municipio values (null,'SAN ANTONIO CA??ADA', 21);

insert into municipio values (null,'SAN DIEGO LA MESA TOCHIMILTZINGO', 21);

insert into municipio values (null,'SAN FELIPE TEOTLALCINGO', 21);

insert into municipio values (null,'SAN FELIPE TEPATL??N', 21);

insert into municipio values (null,'SAN GABRIEL CHILAC', 21);

insert into municipio values (null,'SAN GREGORIO ATZOMPA', 21);

insert into municipio values (null,'SAN JER??NIMO TECUANIPAN', 21);

insert into municipio values (null,'SAN JER??NIMO XAYACATL??N', 21);

insert into municipio values (null,'SAN JOS?? CHIAPA', 21);

insert into municipio values (null,'SAN JOS?? MIAHUATL??N', 21);

insert into municipio values (null,'SAN JUAN ATENCO', 21);

insert into municipio values (null,'SAN JUAN ATZOMPA', 21);

insert into municipio values (null,'SAN MART??N TEXMELUCAN', 21);

insert into municipio values (null,'SAN MART??N TOTOLTEPEC', 21);

insert into municipio values (null,'SAN MAT??AS TLALANCALECA', 21);

insert into municipio values (null,'SAN MIGUEL IXITL??N', 21);

insert into municipio values (null,'SAN MIGUEL XOXTLA', 21);

insert into municipio values (null,'SAN NICOL??S BUENOS AIRES', 21);

insert into municipio values (null,'SAN NICOL??S DE LOS RANCHOS', 21);

insert into municipio values (null,'SAN PABLO ANICANO', 21);

insert into municipio values (null,'SAN PEDRO CHOLULA', 21);

insert into municipio values (null,'SAN PEDRO YELOIXTLAHUACA', 21);

insert into municipio values (null,'SAN SALVADOR EL SECO', 21);

insert into municipio values (null,'SAN SALVADOR EL VERDE', 21);

insert into municipio values (null,'SAN SALVADOR HUIXCOLOTLA', 21);

insert into municipio values (null,'SAN SEBASTI??N TLACOTEPEC', 21);

insert into municipio values (null,'SANTA CATARINA TLALTEMPAN', 21);

insert into municipio values (null,'SANTA IN??S AHUATEMPA', 21);

insert into municipio values (null,'SANTA ISABEL CHOLULA', 21);

insert into municipio values (null,'SANTIAGO MIAHUATL??N', 21);

insert into municipio values (null,'HUEHUETL??N EL GRANDE', 21);

insert into municipio values (null,'SANTO TOM??S HUEYOTLIPAN', 21);

insert into municipio values (null,'SOLTEPEC', 21);

insert into municipio values (null,'TECALI DE HERRERA', 21);

insert into municipio values (null,'TECAMACHALCO', 21);

insert into municipio values (null,'TECOMATL??N', 21);

insert into municipio values (null,'TEHUAC??N', 21);

insert into municipio values (null,'TEHUITZINGO', 21);

insert into municipio values (null,'TENAMPULCO', 21);

insert into municipio values (null,'TEOPANTL??N', 21);

insert into municipio values (null,'TEOTLALCO', 21);

insert into municipio values (null,'TEPANCO DE L??PEZ', 21);

insert into municipio values (null,'TEPANGO DE RODR??GUEZ', 21);

insert into municipio values (null,'TEPATLAXCO DE HIDALGO', 21);

insert into municipio values (null,'TEPEACA', 21);

insert into municipio values (null,'TEPEMAXALCO', 21);

insert into municipio values (null,'TEPEOJUMA', 21);

insert into municipio values (null,'TEPETZINTLA', 21);

insert into municipio values (null,'TEPEXCO', 21);

insert into municipio values (null,'TEPEXI DE RODR??GUEZ', 21);

insert into municipio values (null,'TEPEYAHUALCO', 21);

insert into municipio values (null,'TEPEYAHUALCO DE CUAUHT??MOC', 21);

insert into municipio values (null,'TETELA DE OCAMPO', 21);

insert into municipio values (null,'TETELES DE AVILA CASTILLO', 21);

insert into municipio values (null,'TEZIUTL??N', 21);

insert into municipio values (null,'TIANGUISMANALCO', 21);

insert into municipio values (null,'TILAPA', 21);

insert into municipio values (null,'TLACOTEPEC DE BENITO JU??REZ', 21);

insert into municipio values (null,'TLACUILOTEPEC', 21);

insert into municipio values (null,'TLACHICHUCA', 21);

insert into municipio values (null,'TLAHUAPAN', 21);

insert into municipio values (null,'TLALTENANGO', 21);

insert into municipio values (null,'TLANEPANTLA', 21);

insert into municipio values (null,'TLAOLA', 21);

insert into municipio values (null,'TLAPACOYA', 21);

insert into municipio values (null,'TLAPANAL??', 21);

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

insert into municipio values (null,'XAYACATL??N DE BRAVO', 21);

insert into municipio values (null,'XICOTEPEC', 21);

insert into municipio values (null,'XICOTL??N', 21);

insert into municipio values (null,'XIUTETELCO', 21);

insert into municipio values (null,'XOCHIAPULCO', 21);

insert into municipio values (null,'XOCHILTEPEC', 21);

insert into municipio values (null,'XOCHITL??N DE VICENTE SU??REZ', 21);

insert into municipio values (null,'XOCHITL??N TODOS SANTOS', 21);

insert into municipio values (null,'YAON??HUAC', 21);

insert into municipio values (null,'YEHUALTEPEC', 21);

insert into municipio values (null,'ZACAPALA', 21);

insert into municipio values (null,'ZACAPOAXTLA', 21);

insert into municipio values (null,'ZACATL??N', 21);

insert into municipio values (null,'ZAPOTITL??N', 21);

insert into municipio values (null,'ZAPOTITL??N DE M??NDEZ', 21);

insert into municipio values (null,'ZARAGOZA', 21);

insert into municipio values (null,'ZAUTLA', 21);

insert into municipio values (null,'ZIHUATEUTLA', 21);

-- 1809 al 1921
-- Municipio 1809-1921

INSERT INTO Municipio VALUES 

(null, 'ZINACATEPEC', 21),

(null, 'ZONGOZOTLA', 21),

(null, 'ZOQUIAPAN', 21),

(null, 'ZOQUITL??N', 21),

(null, 'NO ESPECIFICADO', 21),

(null, 'AMEALCO DE BONFIL', 22),

(null, 'PINAL DE AMOLES', 22),

(null, 'ARROYO SECO', 22),

(null, 'CADEREYTA DE MONTES', 22),

(null, 'COL??N', 22),

(null, 'CORREGIDORA', 22),

(null, 'EZEQUIEL MONTES', 22),

(null, 'HUIMILPAN', 22),

(null, 'JALPAN DE SERRA', 22),

(null, 'LANDA DE MATAMOROS', 22),

(null, 'EL MARQU??S', 22),

(null, 'PEDRO ESCOBEDO', 22),

(null, 'PE??AMILLER', 22),

(null, 'QUER??TARO', 22),

(null, 'SAN JOAQU??N', 22),

(null, 'SAN JUAN DEL R??O', 22),

(null, 'TEQUISQUIAPAN', 22),

(null, 'TOLIM??N', 22),

(null, 'NO ESPECIFICADO', 22),

(null, 'COZUMEL', 23),

(null, 'FELIPE CARRILLO PUERTO', 23),

(null, 'ISLA MUJERES', 23),

(null, 'OTH??N P. BLANCO', 23),

(null, 'BENITO JU??REZ', 23),

(null, 'JOS?? MAR??A MORELOS', 23),

(null, 'L??ZARO C??RDENAS', 23),

(null, 'SOLIDARIDAD', 23),

(null, 'TULUM', 23),

(null, 'BACALAR', 23),

(null, 'PUERTO MORELOS', 23),

(null, 'NO ESPECIFICADO', 23),

(null, 'AHUALULCO', 24),

(null, 'ALAQUINES', 24),

(null, 'AQUISM??N', 24),

(null, 'ARMADILLO DE LOS INFANTE', 24),

(null, 'C??RDENAS', 24),

(null, 'CATORCE', 24),

(null, 'CEDRAL', 24),

(null, 'CERRITOS', 24),

(null, 'CERRO DE SAN PEDRO', 24),

(null, 'CIUDAD DEL MA??Z', 24),

(null, 'CIUDAD FERN??NDEZ', 24),

(null, 'TANCANHUITZ', 24),

(null, 'CIUDAD VALLES', 24),

(null, 'COXCATL??N', 24),

(null, 'CHARCAS', 24),

(null, 'EBANO', 24),

(null, 'GUADALC??ZAR', 24),

(null, 'HUEHUETL??N', 24),

(null, 'LAGUNILLAS', 24),

(null, 'MATEHUALA', 24),

(null, 'MEXQUITIC DE CARMONA', 24),

(null, 'MOCTEZUMA', 24),

(null, 'RAY??N', 24),

(null, 'RIOVERDE', 24),

(null, 'SALINAS', 24),

(null, 'SAN ANTONIO', 24),

(null, 'SAN CIRO DE ACOSTA', 24),

(null, 'SAN LUIS POTOS??', 24),

(null, 'SAN MART??N CHALCHICUAUTLA', 24),

(null, 'SAN NICOL??S TOLENTINO', 24),

(null, 'SANTA CATARINA', 24),

(null, 'SANTA MAR??A DEL R??O', 24),

(null, 'SANTO DOMINGO', 24),

(null, 'SAN VICENTE TANCUAYALAB', 24),

(null, 'SOLEDAD DE GRACIANO S??NCHEZ', 24),

(null, 'TAMASOPO', 24),

(null, 'TAMAZUNCHALE', 24),

(null, 'TAMPAC??N', 24),

(null, 'TAMPAMOL??N CORONA', 24),

(null, 'TAMU??N', 24),

(null, 'TANLAJ??S', 24),

(null, 'TANQUI??N DE ESCOBEDO', 24),

(null, 'TIERRA NUEVA', 24),

(null, 'VANEGAS', 24),

(null, 'VENADO', 24),

(null, 'VILLA DE ARRIAGA', 24),

(null, 'VILLA DE GUADALUPE', 24),

(null, 'VILLA DE LA PAZ', 24),

(null, 'VILLA DE RAMOS', 24),

(null, 'VILLA DE REYES', 24),

(null, 'VILLA HIDALGO', 24),

(null, 'VILLA JU??REZ', 24),

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

(null, 'COSAL??', 25),

(null, 'CULIAC??N', 25),

(null, 'CHOIX', 25),

(null, 'ELOTA', 25),

(null, 'ESCUINAPA', 25),

(null, 'EL FUERTE', 25),

(null, 'GUASAVE', 25),

(null, 'MAZATL??N', 25),

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

("Bacad??huachi",26),

("Bacanora",26),

("Bacerac",26),

("Bacoachi",26),

("B??cum",26),

("Ban??michi",26),

("Bavi??cora",26),

("Bavispe",26),

("Benjam??n Hill",26),

("Caborca",26),

("Cajeme",26),

("Cananea",26),

("Carb??",26),

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

("Hu??sabas",26),

("Huatabampo",26),

("Hu??pac",26),

("Imuris",26),

("Magdalena",26),

("Mazat??n",26),

("Moctezuma",26),

("Naco",26),

("N??cori Chico",26),

("Nacozari de Garc??a",26),

("Navojoa",26),

("Nogales",26),

("Onavas",26),

("Opodepe",26),

("Oquitoa",26),

("Pitiquito",26),

("Puerto Pe??asco",26),

("Quiriego",26),

("Ray??n",26),

("Rosario",26),

("Sahuaripa",26),

("San Felipe de Jes??s",26),

("San Javier",26),

("San Luis R??o Colorado",26),

("San Miguel de Horcasitas",26),

("San Pedro de la Cueva",26),

("Santa Ana",26),

("Santa Cruz",26),

("S??ric",26),

("Soyopa",26),

("Suaqui Grande",26),

("Tepache",26),

("Trincheras",26),

("Tubutama",26),

("Ures",26),

("Villa Hidalgo",26),

("Villa Pesquera",26),

("Y??cora",26),

("General Plutarco El??as Calles",26),

("Benito Ju??rez",26),

("San Ignacio R??o Muerto",26),

("No Especificado",26);




insert into municipio(municipioNombre, entidad) values

("Balanc??n",27),

("C??rdenas",27),

("Centla",27),

("Centro",27),

("Comalcalco",27),

("Cunduac??n",27),

("Emiliano Zapata",27),

("Huimanguillo",27),

("Jalapa",27),

("Jalpa de M??ndez",27),

("Jonuta",27),

("Macuspana",27),

("Nacajuca",27),

("Para??so",27),

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

("G??mez Far??as",28),

("Gonz??lez",28),

("G????mez",28),

("Guerrero",28),

("Gustavo D??az Ordaz",28),

("Hidalgo",28),

("Jaumave",28),

("Jim??nez",28),

("Llera",28),

("Mainero",28),

("El Mante",28);

-- 2035 al 2147
insert into Municipio(municipioNombre, Entidad) values 

    ("Matamoros", 28), -- 2035 

    ("M??ndez", 28), 

    ("Mier", 28), 

    ("Miguel Alem??n", 28), 

    ("Miquihuana", 28), 

    ("Nuevo Laredo", 28), 

    ("Nuevo Morelos", 28), 

    ("Ocampo", 28), 

    ("Padilla", 28), 

    ("Palmillas", 28), 

    ("Reynosa", 28), 

    ("R??o Bravo", 28), 

    ("San Carlos", 28), 

    ("San Fernando", 28), 

    ("San Nicol??s", 28), 

    ("Soto La Marina", 28), 

    ("Tampico", 28), 

    ("Tula", 28), 

    ("Valle hermoso", 28), 

    ("Victoria", 28), 

    ("Villagr??n", 28), 

    ("Xicot??ncatl", 28), 

    ("No especificado", 28), 

    ("Amaxac de Guerrero", 29), 

    ("Apetatitl??n de Antonio Carvajal", 29), 

    ("Atlangatepec", 29), 

    ("Atltzayanca", 29), 

    ("Apizaco", 29), 

    ("Calpulalpan", 29), 

    ("El Carmen Tequexquitla", 29), 

    ("Cuapiaxtla", 29), 

    ("Cuaxomulco", 29), 

    ("Chiautempan", 29), 

    ("Mu??oz de Domingo Arenas", 29), 

    ("Espa??ita", 29), 

    ("Huamantla", 29), 

    ("Hueyotlipan", 29), 

    ("Ixtacuixtla de Mariano Matamoros", 29), 

    ("Ixtenco", 29), 

    ("Mazatecochco de Jos?? Mar??a Morelos", 29), 

    ("Contla de Juan Cuamatzi", 29), 

    ("Tepetitla de Lardiz??bal", 29), 

    ("Sanct??rum de L??zaro C??rdenas", 29), 

    ("Nanacamilpa de Mariano Arista", 29), 

    ("Acuamanala de Miguel Hidalgo", 29), 

    ("Nat??vitas", 29), 

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

    ("Tocatl??n", 29), 

    ("Totolac", 29), 

    ("Ziltlalt??pec de Trinidad S??nchez Santos", 29), 

    ("Tzompantepec", 29), 

    ("Xaloztoc", 29), 

    ("Xaltocan", 29), 

    ("Papalotla de Xicoht??ncatl", 29), 

    ("Xicohtzinco", 29), 

    ("Yauhquemehcan", 29), 

    ("Zacatelco", 29), 

    ("Benito Ju??rez", 29), 

    ("Emiliano Zapata", 29), 

    ("L??zaro C??rdenas", 29), 

    ("La Magdalena Tlaltelulco", 29), 

    ("San Dami??n Tex??loc", 29), 

    ("San Francisco Tetlanohcan", 29), 

    ("San Jer??nimo Zacualpan", 29), 

    ("San Jos?? Teacalco", 29), 

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

    ("Acatl??n", 30), 

    ("Acayucan", 30), 

    ("Actopan", 30), 

    ("Acula", 30), 

    ("Acultzingo", 30), 

    ("Camar??n de Tejeda", 30), 

    ("Alpatl??huac", 30), 

    ("Alto Lucero de Guti??rrez Barrios", 30), 

    ("Altotonga", 30), 

    ("Alvarado", 30), 

    ("Amatitl??n", 30), 

    ("Naranjos Amatl??n", 30), 

    ("Amatl??n de los Reyes", 30), 

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

    ("Benito Ju??rez", 30), 

    ("Boca del R??o", 30), 

    ("Calcahualco", 30); -- 2147 
    
-- 2148 al 2260
insert into municipio values (null, 'Camerino Z. Mendoza', 30);

insert into municipio values (null, 'Carrillo Puerto', 30);

insert into municipio values (null, 'Catemaco', 30);

insert into municipio values (null, 'Cazones de Herrera', 30);

insert into municipio values (null, 'Cerro azul', 30);

insert into municipio values (null, 'Citlalt??petl', 30);

insert into municipio values (null, 'Coacoatzintla', 30);

insert into municipio values (null, 'Coahuitl??n', 30);

insert into municipio values (null, 'Coatepec', 30);

insert into municipio values (null, 'Coatzacoalcos', 30);

insert into municipio values (null, 'Coatzintla', 30);

insert into municipio values (null, 'Coetzala', 30);

insert into municipio values (null, 'Colipa', 30);

insert into municipio values (null, 'Comapa', 30);

insert into municipio values(null, 'C??rdoba', 30);

insert into municipio values(null, 'Cosamaloapan de Carpio', 30);

insert into municipio values(null, 'Cosautl??n de Carvajal', 30);

insert into municipio values(null, 'Coscomatepec', 30);

insert into municipio values(null, 'Cosoleacaque', 30);

insert into municipio values(null, 'Cotaxtla', 30);

insert into municipio values(null, 'Coxquihui', 30);

insert into municipio values(null, 'Coyutla', 30);

insert into municipio values(null, 'Cuichapa', 30);

insert into municipio values(null, 'Cuitl??huac', 30);

insert into municipio values(null, 'Chacaltianguis', 30);

insert into municipio values(null, 'Chalma', 30);

insert into municipio values(null, 'Chiconamel', 30);

insert into municipio values(null, 'Chinconquiaco', 30);

insert into municipio values(null, 'Chicontepec', 30);

insert into municipio values(null, 'Chinameca', 30);

insert into municipio values(null, 'Chinampa de Gorostiza', 30);

insert into municipio values(null, 'Las Choapas', 30);

insert into municipio values(null, 'Chocam??n', 30);

insert into municipio values(null, 'Chontla', 30);

insert into municipio values(null, 'Chumatl??n', 30);

insert into municipio values(null, 'Emiliano Zapata', 30);

insert into municipio values(null, 'Espinal', 30);

insert into municipio values(null, 'Filomeno Mata', 30);

insert into municipio values(null, 'Fort??n', 30);

insert into municipio values(null, 'Guti??rrez Zamora', 30);

insert into municipio values(null, 'Hidalgotitl??n', 30);

insert into municipio values(null, 'Huatusco', 30);

insert into municipio values(null, 'Huayacocotla', 30);

insert into municipio values(null, 'Hueyapan de Ocampo', 30);

insert into municipio values(null, 'Huiloapan de Cuauht??moc', 30);

insert into municipio values(null, 'Ignacio de la llave', 30);

insert into municipio values(null, 'Ilamatl??n', 30);

insert into municipio values(null, 'Isla', 30);

insert into municipio values(null, 'Ixcatepec', 30);

insert into municipio values(null, 'Ixhuac??n de los reyes', 30);

insert into municipio values(null, 'Ixhuatl??n del caf??', 30);

insert into municipio values(null, 'Ixhuatlancillo', 30);

insert into municipio values(null, 'Ixhuatl??n del sureste', 30);

insert into municipio values(null, 'Ixhuatl??n de Madero', 30);

insert into municipio values(null, 'Ixmatlahuacan', 30); 

insert into municipio values(null, 'Ixtaczoquitl??n', 30);

insert into municipio values(null, 'Jalacingo', 30);

insert into municipio values(null, 'Xalapa', 30);

insert into municipio values(null, 'Jalcomulco', 30);

insert into municipio values(null, 'J??ltipan', 30);

insert into municipio values(null, 'Jamapa', 30);

insert into municipio values(null, 'Jes??s Carranza', 30);

insert into municipio values(null, 'Xico', 30);

insert into municipio values(null, 'Jilotepec', 30);

insert into municipio values(null, 'Juan Rodr??guez Clara', 30);

insert into municipio values(null, 'Juchique de Ferrer', 30);

insert into municipio values(null, 'Landero y Coss', 30);

insert into municipio values(null, 'Lerdo de Tejada', 30);

insert into municipio values(null, 'Magdalena', 30);

insert into municipio values(null, 'Maltrata', 30);

insert into municipio values(null, 'Manlio Fabio Altamirano', 30);

insert into municipio values(null, 'Mariano Escobedo', 30);

insert into municipio values(null, 'Mart??nez de la Torre', 30);

insert into municipio values(null, 'Mecatl??n', 30);

insert into municipio values(null, 'Mecayapan', 30);

insert into municipio values(null, 'Medell??n de Bravo', 30);

insert into municipio values(null, 'Miahuatl??n', 30);

insert into municipio values(null, 'Las minas', 30);

insert into municipio values(null, 'Minatitl??n', 30);

insert into municipio values(null, 'Misantla', 30);

insert into municipio values(null, 'Mixtla de Altamirano', 30);

insert into municipio values(null, 'Moloc??n', 30);

insert into municipio values(null, 'Naolinco', 30);

insert into municipio values(null, 'Naranjal', 30);

insert into municipio values(null, 'Nautla', 30);

insert into municipio values(null, 'Nogales', 30);

insert into municipio values(null, 'Oluta', 30);

insert into municipio values(null, 'Omealca', 30);

insert into municipio values(null, 'Orizaba', 30);

insert into municipio values(null, 'Otatitl??n', 30);

insert into municipio values(null, 'Oteapan', 30);

insert into municipio values(null, 'Ozuluama de Mascare??as', 30);

insert into municipio values(null, 'Pajapan', 30);

insert into municipio values(null, 'P??nuco', 30);

insert into municipio values(null, 'Papantla', 30);

insert into municipio values(null, 'Paso del macho', 30);

insert into municipio values(null, 'Paso de ovejas', 30);

insert into municipio values(null, 'La Perla', 30);

insert into municipio values(null, 'Perote', 30);

insert into municipio values(null, 'Plat??n S??nchez', 30);

insert into municipio values(null, 'Playa Vicente', 30);

insert into municipio values(null, 'Poza rica de Hidalgo', 30);

insert into municipio values(null, 'Las vigas de Ram??rez', 30);

insert into municipio values(null, 'Pueblo viejo', 30);

insert into municipio values(null, 'Puente Nacional', 30);

insert into municipio values(null, 'Rafael Delgado', 30);

insert into municipio values(null, 'Rafael Lucio', 30);

insert into municipio values(null, 'Los Reyes', 30);

insert into municipio values(null, 'R??o Blanco', 30);

insert into municipio values(null, 'Saltabarranca', 30);

insert into municipio values(null, 'San Andr??s Tuxtla', 30);

insert into municipio values(null, 'San Juan Evangelista', 30);

-- 2261 al 2373
INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2261', ' SANTIAGO TUXTLA', '30');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2262', ' SAYULA DE ALEM??N', '30');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2263', ' SOCONUSCO ', '30');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2264', 'SOCHIAPA ', '30');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2265', ' SOLEDAD ATZOMPA', '30');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2266', 'SOLEDAD DE DOBLADO ', '30');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2267', ' SOTEAPAN ', '30');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2268', ' TAMAL??N', '30');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2269', ' TAMIAHUA ', '30');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2270', ' TAMPICO ALTO', '30');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2271', ' TANCOCO', '30');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2272', ' TANTIMA ', '30');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2273', ' TANTOYUCA ', '30');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2274', ' TATATILA', '30');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2275', 'CASTILLO DE TEAYO ', '30');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2276', 'TECOLUTLA ', '30');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2277', 'TEHUIPANGO ', '30');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2278', '??LAMO TEMAPACHE ', '30');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2279', 'TEMPOAL ', '30');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2280', 'TENAMPA', '30');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2281', 'TENOCHTITL??N', '30');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2282', ' TEOCELO ', '30');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2283', 'TEPATLAXCO', '30');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2284', ' TEPETL??N', '30');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2285', ' TEPETZINTLA ', '30');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2286', ' TEQUILA ', '30');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2287', ' JOS?? AZUETA ', '30');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2288', ' TEXCATEPEC ', '30');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2289', 'TEXHUAC??N', '30');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2290', ' TEXISTEPEC ', '30');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2291', 'TEZONAPA ', '30');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2292', ' TIERRA BLANCA ', '30');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2293', 'TIHUATL??N', '30');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2294', ' TLACOJALPAN ', '30');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2295', ' TLACOLULAN', '30');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2296', ' TLACOTALPAN', '30');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2297', 'TLACOTEPEC DE MEJ??A', '30');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2298', ' TLACHICHILCO ', '30');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2299', ' TLALIXCOYAN ', '30');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2300', ' TLALNELHUAYOCAN', '30');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2301', ' TLAPACOYAN ', '30');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2302', ' TLAQUILPA ', '30');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2303', 'TLILAPAN', '30');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2304', 'TOMATL??N ', '30');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2305', 'TONAY??N ', '30');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2306', 'TOTUTLA ', '30');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2307', ' TUXPAN VERACRUZ DE IGNACIO DE LA LLAVE', '30');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2308', ' TUXTILLA', '30');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2309', ' URSULO GALV??N ', '30');

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

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2320', 'ZONTECOMATL??N DE L??PEZ Y FUENTES', '30');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2321', 'ZOZOCOLCO DE HIDALGO', '30');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2322', 'AGUA DULCE ', '30');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2323', ' EL HIGO ', '30');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2324', 'NANCHITAL DE L??ZARO C??RDENAS DEL R??O', '30');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2325', ' TRES VALLES', '30');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2326', 'CARLOS A. CARRILLO ', '30');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2327', ' TATAHUICAPAN DE JU??REZ', '30');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2328', 'UXPANAPA ', '30');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2329', 'SAN RAFAEL ', '30');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2330', ' SANTIAGO SOCHIAPAN ', '30');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2331', ' NO ESPECIFICADO ', '30');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2332', ' ABAL?? ', '31');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2333', 'ACANCEH ', '31');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2334', ' AKIL', '31');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2335', 'BACA ', '31');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2336', 'BOKOB?? ', '31');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2337', ' BUCTZOTZ ', '31');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2338', ' CACALCH??N ', '31');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2339', ' CALOTMUL ', '31');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2340', 'CANSAHCAB ', '31');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2341', 'CANTAMAYEC', '31');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2342', ' CELEST??N ', '31');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2343', 'CENOTILLO', '31');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2344', 'CONKAL', '31');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2345', 'CUNCUNUL', '31');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2346', ' CUZAM??', '31');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2347', 'CHACSINK??N', '31');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2348', ' CHANKOM', '31');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2349', 'CHAPAB ', '31');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2350', 'CHEMAX ', '31');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2351', ' CHICXULUB PUEBLO ', '31');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2352', ' CHICHIMIL?? ', '31');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2353', 'CHIKINDZONOT ', '31');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2354', 'CHOCHOL?? ', '31');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2355', 'CHUMAYEL', '31');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2356', 'DZ??N ', '31');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2357', 'DZEMUL', '31');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2358', 'DZIDZANT??N', '31');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2359', 'DZILAM DE BRAVO ', '31');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2360', ' DZILAM GONZ??LEZ', '31');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2361', 'DZIT??S ', '31');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2362', 'DZONCAUICH', '31');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2363', 'ESPITA', '31');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2364', 'HALACH?? ', '31');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2365', 'HOCAB??', '31');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2366', 'HOCT??N', '31');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2367', 'HOM??N', '31');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2368', 'HUH?? ', '31');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2369', 'HUNUCM??', '31');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2370', 'IXIL ', '31');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2371', ' IZAMAL ', '31');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2372', 'KANAS??N ', '31');

INSERT INTO `covid19`.`municipio` (`idMunicipio`, `municipioNombre`, `entidad`) VALUES ('2373', ' KANTUNIL ', '31');


-- 2374 al 2501 
INSERT INTO Municipio(municipioNombre, entidad) VALUES('KAUA', 31);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('KINCHIL', 31);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('KOPOM??', 31);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('MAMA', 31);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('MAN??', 31);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('MAXCAN??', 31);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('MAYAP??N', 31);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('M??RIDA', 31);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('MOCOCH??', 31);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('MOTUL', 31);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('MUNA', 31);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('MUXUPIP', 31);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('OPICH??N', 31);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('OXKUTZCAB', 31);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('PANAB??', 31);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('PETO', 31);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('PROGRESO', 31);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('QUINTANA ROO', 31);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('R??O LAGARTOS', 31);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('SACALUM', 31);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('SAMAHIL', 31);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('SANAHCAT', 31);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('SAN FELIPE', 31);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('SANTA ELENA', 31);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('SEY??', 31);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('SINANCH??', 31);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('SOTUTA', 31);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('SUCIL??', 31);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('SUDZA', 31);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('SUMA', 31);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('TAHDZI??', 31);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('TAHMEK', 31);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('TEABO', 31);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('TECOH', 31);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('TEKAL DE VENEGAS', 31);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('TEKANT??', 31);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('TEKAX', 31);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('TEKIT', 31);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('TEKOM', 31);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('TELCHAC PUEBLO', 31);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('TELCHAC PUERTO', 31);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('TEMAX', 31);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('TEMOZ??N', 31);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('TEPAK??N', 31);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('TETIZ', 31);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('TEYA ', 31);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('TICUL', 31);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('TIMUCUY ', 31);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('TINUM', 31);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('TIXCACALCUPUL', 31);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('TIXKOKOB', 31);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('TIXMEHUAC', 31);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('TIXP??HUAL', 31);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('TIZIM??N', 31);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('TUNK??S', 31);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('TZUCACAB', 31);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('UAYMA', 31);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('UC??', 31);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('UM??N', 31);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('VALLADOLID', 31);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('XOCCHEL', 31);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('YAXCAB??', 31);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('YAXKUKUL', 31);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('YOBA??N', 31);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('NO ESPECIFICADO', 31);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('APOZOL', 32);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('APULCO', 32);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('ATOLINGA', 32);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('BENITO JU??REZ', 32);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('CALERA', 32);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('CA??ITAS DE FELIPE PESCADOR', 32);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('CONCEPCI??N DEL ORO', 32);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('CUAUHT??MOC', 32);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('CHALCHIHUITES', 32);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('FRESNILLO', 32);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('TRINIDAD GARC??A DE LA CADENA', 32);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('GENARO CODINA', 32);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('GENERAL ENRIQUE ESTRADA', 32);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('GENERAL FRANCISCO R. MURGU??A', 32);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('EL PLATEADO DE JOAQU??N AMARO', 32);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('GENERAL P??NFILO NATERA', 32);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('GUADALUPE', 32);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('HUANUSCO', 32);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('JALPA', 32);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('JEREZ', 32);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('JIM??NEZ DEL TEUL', 32);

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

INSERT INTO Municipio(municipioNombre, entidad) VALUES('NOCHISTL??N DE MEJ??A', 32);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('NORIA DE ??NGELES ', 32);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('OJOCALIENTE', 32);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('P??NUCO ', 32);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('PINOS', 32);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('R??O GRANDE ', 32);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('SAIN ALTO', 32);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('EL SALVADOR', 32);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('SOMBRERETE', 32);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('SUSTICAC??N', 32);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('TABASCO', 32);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('TEPECHITL??N', 32);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('TEPETONGO', 32);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('TE??L DE GONZ??LEZ ORTEGA', 32);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('TLALTENANGO DE S??NCHEZ ROM??N', 32);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('VALPARA??SO', 32);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('VETAGRANDE', 32);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('VILLA DE COS', 32);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('VILLA GARC??A', 32);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('VILLA GONZ??LEZ ORTEGA', 32);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('VILLA HIDALGO', 32);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('VILLANUEVA', 32);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('ZACATECAS', 32);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('TRANCOSO', 32);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('SANTA MAR??A DE LA PAZ', 32);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('NO ESPECIFICADO', 32);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('NO ESPECIFICADO', 36);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('NO APLICA', 97);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('SE IGNORA', 98);

INSERT INTO Municipio(municipioNombre, entidad) VALUES('NO ESPECIFICADO', 99);

-- 