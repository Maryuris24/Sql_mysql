create database Biblioteca;
use biblioteca;

create table Libro(
IdLibro int,
Titulo varchar(45),
Editorial varchar(45),
Area varchar(45),
primary key (IdLibro)
);

create table Autor(
IdAutor int,
Nombre varchar(45),
Nacionalidad varchar(45),
primary key (IdAutor)
);

create table Estudiante(
IdLector int,
CI INT(10),
Nombre varchar(45),
Direccion varchar(45),
Carrera varchar(45),
Edad int,
primary key (IdLector)
);

create table Prestamo(
IdLector int,
IdLibro int,
FechaPrestamo timestamp,
FechaDevolucion date,
Devuelto int,
primary key (FechaPrestamo),
foreign key (IdLector) references Estudiante(IdLector) on update cascade,
foreign key (IdLibro) references Libro(IdLibro) on update cascade
);

create table LibAut(
IdAutor int,
IdLibro int, 
foreign key (IdAutor) references Autor(IdAutor) on update cascade,
foreign key (IdLibro) references Libro(IdLibro) on update cascade 
);