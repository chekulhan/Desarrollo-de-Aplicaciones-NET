USE GestionSalas; 
GO  
CREATE TABLE Maquinas( 
 id int identity(1,1) constraint pk_maquinas primary key, 
 etiqueta nvarchar(50) not null, 
 procesador nvarchar(50) not null, 
 memoria smallint not null, 
 disco smallint not null, 
 pantalla tinyint not null, 
 constraint ck_memoria check (memoria>0), 
 constraint ck_disco check (disco>0), 
 constraint ck_pantalla check (pantalla>0) 
); 
GO 
CREATE TABLE Cursos( 
 id int identity(1,1) constraint pk_cursos primary key, 
 codigo nvarchar(10), 
 titulo nvarchar(50), 
 duracion tinyint, 
 programa xml 
); 
GO 
CREATE TABLE CursosMaquinas( 
 id int identity(1,1) constraint pk_cursosMaquinas primary key, 
 curso int constraint fk_cursosMaquinas_curso references Cursos(id), 
 maquina int constraint fk_cursosMaquinas_maquina references 
Maquinas(id) 
)  
GO  
CREATE TABLE Salas( 
 id int identity(1,1) constraint pk_salas primary key, 
 etiqueta nvarchar(20), 
 numeroSitios smallint constraint ck_salas_numeroSitios check  
(numeroSitios>0), 
  maquina int constraint fk_salas_maquinas references Maquinas(id) 
); 
GO 
CREATE TABLE Formaciones( 
 id int identity(1,1) constraint 
 pk_formaciones primary key, 
 cursos int constraint fk_formaciones_cursos references Cursos(id), 
 sala int constraint fk_formaciones_salas references Salas(id), 
 fechaInicio date, 
 fechaFin date 
);