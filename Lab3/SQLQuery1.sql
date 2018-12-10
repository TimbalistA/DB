use master
go
---------------------------- Crearea tabelelor: ----------------------------
use universitatea
go
---------------------------
create table discipline
(Id_Disciplina int primary key
 ,Disciplina char (50)
 ,Nr_ore_plan_disciplina int
)
go
create table grupe
(Id_Grupa int primary key 
 ,Cod_Grupa char (10)
 ,Specialitate char (50)
 ,Nume_Facultate char (50) )
go
create table studenti
(Id_Student int primary key
,Nume_student char (20)
,Prenume_student char (20)
,Data_Nastere_Student char(10)
,Adresa_Postala_student char(20))
go
create table profesori
(Id_profesor int primary key
,Nume_profesor char (20)
,Prenume_profesor char (20)
,Adresa_Postala_profesor char(20))
go

create table studenti_reusita
(Id_Student int foreign key references studenti(Id_Student)
,Id_Disciplina int foreign key references discipline(Id_Disciplina)
,Id_profesor int foreign key references profesori(Id_profesor)
,Id_Grupa int foreign key references grupe(Id_Grupa)
,Tip_Evaluare char(10)
,Nota int
,Data_Evaluare char(10)
,primary key(Id_Student,Id_Disciplina,Id_profesor,Id_Grupa,Tip_Evaluare))
go
insert into discipline
(Id_Disciplina,Disciplina,Nr_ore_plan_disciplina) values
(100,'Sisteme de operare',60)
,(101,'Programarea calculatoarelor',60)
,(102,'Informatica aplicata',46)
,(103,'Sisteme de calcul',46)
,(104,'Asamblarea si depanarea PC',60)
,(105,'Cercetari operationale',76)
,(106,'Programarea WEB',46)
,(107,'Baze de date',60)
,(108,'Structuri de date si algoritmi',76)
,(109,'Retele informatice',46)
,(110,'Matematica discreta',60)
,(111,'Modelarea sistemelor',46)
,(112,'Limbaje evaluate de programe (Java,.Net)',76)
,(113,'Programarea aplicatiilor windows',60)
,(114,'Technologii de procesarea informatiei',46)
,(115,'Programarea declarativa',46)
,(116,'Programarea sistemelor informatice',60)
,(117,'Practica de licenta',80)
,(118,'Practica de productie',80)
,(119,'Integrarea informationala europeana',20)
,(120,'Programe aplicative',46)
 go
 insert into grupe
(Id_Grupa,Cod_Grupa,Specialitate,Nume_Facultate) values
(1,'CIB171','Cibernetica','Informatica si Cibernetica')
,(2,'INF171','Informatica','Informatica si Cibernetica')
,(3,'TI171','Tehnologii informationale','Informatica si Cibernetica')
 go
 select * 
 from discipline

  select * 
 from grupe