-- Mechanic Data Base Scenario

-- Create clients table

set names utf8mb4;
set foreign_key_checks = 0;

-- Creating authorization table
drop table if exists  `Authorizations`;
create table `Authorizations`  (
  `idAuthorizations` int not null auto_increment,
  `Status` varchar(45) character set utf8mb4 collate utf8mb4_0900_ai_ci not null comment 'Authorized by client\nNot authorized by client',
  primary key (`idAuthorizations`) using btree
) engine = InnoDB character set = utf8mb4 collate = utf8mb4_0900_ai_ci row_format = Dynamic;

-- Authorization Records
insert into `Authorizations` values (1, 'Authorized');
insert into `Authorizations` values (2, 'Not Authorized');

-- Creating Vehicle table
drop table if exists `Vehicles`;
create table `Vehicles`  (
  `idVehicle` int not null auto_increment,
  `Model` varchar(45) character set utf8mb4 collate utf8mb4_0900_ai_ci not null,
  `Placa` varchar(45) character set utf8mb4 collate utf8mb4_0900_ai_ci not null,
  `idClients` int not null,
  `idStatus` int not null,
  `idStaff` int not null,
  primary key (`idVehicle`) using btree,
  index `fk_vehicle_Client_idx`(`idClients`) using btree,
  index `fk_vehicle_Service1 Type_idx`(`idStatus`) using btree,
  index `fk_vehicle_Staff1_idx`(`idStaff`) using btree,
  constraint `fk_vehicle_Client` foreign key (`idClients`) references `Clients` (`idClients`) on delete restrict on update restrict,
  constraint `fk_vehicle_staff` foreign key (`idStaff`) references `Staff` (`idStaff`) on delete restrict on update restrict,
  constraint `fk_vehicle_Service1 type` foreign key (`idStatus`) references `Service Type` (`idStatus`) on delete restrict on update restrict
) engine = InnoDB character set = utf8mb4 collate = utf8mb4_0900_ai_ci row_format = Dynamic;

-- Vehicle Records
insert into `Vehicles` values (1, 'Audi', 'AAA1234', 1, 1, 1);
insert into `Vehicles` values (2, 'BMW', 'BBB1234', 2, 1, 2);
insert into `Vehicles` values (3, 'Bugatti', 'CCC1234', 3, 2, 3);

-- Creating Client Table
drop table if exists `Clients`;
create table `Clients`  (
  `idClients` int not null auto_increment,
  `FName` varchar(45) character set utf8mb4 collate utf8mb4_0900_ai_ci not null,
  `Telephone` varchar(45) CHARACTER SET utf8mb4 collate utf8mb4_0900_ai_ci not null,
  primary key (`idClients`) using btree
) engine = InnoDB character set = utf8mb4 collate = utf8mb4_0900_ai_ci row_format = Dynamic;

-- Client Records
insert into `Clients` VALUES (1, 'Antonio Goma', '(35) 9-3272-1661');
insert into `Clients` VALUES (2, 'Marcelina Barata', '(26) 9-5689-2190');
insert into `Clients` VALUES (3, 'Dario Jeremias', '(33) 9-5640-5812');

-- Creating Staff Table
drop table if exists `Staff`;
create table `Staff`  (
  `idStaff` int not null auto_increment,
  `staffName` varchar(45) character set utf8mb4 collate utf8mb4_0900_ai_ci not null,
  primary key (`idStaff`) using btree
) engine = InnoDB character set = utf8mb4 collate = utf8mb4_0900_ai_ci row_format = Dynamic;

-- Staff Records
insert into `Staff` values (1, 'Staff Babutana');
insert into `Staff` values (2, 'Staff Nafina');
insert into `Staff` values (3, 'Staff Vries');

-- Creating Speciality Table
drop table if exists `Specialities`;
create table `Specialities`  (
  `idSpecialities` int not null auto_increment,
  `Speciality` varchar(45) character set utf8mb4 collate utf8mb4_0900_ai_ci not null,
  `idMechanics` int not null,
  primary key (`idSpecialities`) using btree,
  index `fk_Specialities_Mechanics1_idx`(`idMechanics`) using btree,
  constraint `fk_Speciality_Mechanics1` foreign key (`idMechanics`) references `Mechanics` (`idMechanics`) on delete restrict on update restrict
) engine = InnoDB character set = utf8mb4 collate = utf8mb4_0900_ai_ci row_format = Dynamic;

-- Records of Especialidades
insert into `Specialities` values (1, 'Motor', 1);
insert into `Specialities` values (2, 'Painting', 2);
insert into `Specialities` values (3, 'Motor', 3);
insert into `Specialities` values (4, 'Painting', 4);
insert into `Specialities` values (5, 'Eletricist', 5);

-- Creating Mechanics Table
drop table if exists `Mechanics`;
create table `Mechanics`  (
  `idMechanics` int not null auto_increment,
  `FName` varchar(45) character set utf8mb4 collate utf8mb4_0900_ai_ci not null,
  `Address` varchar(45) character set utf8mb4 collate utf8mb4_0900_ai_ci not null,
  `idStaff` int not null,
  primary key (`idMechanics`) using btree,
  index `fk_Mechanics_Staff1_idx`(`idStaff`) using btree,
  constraint `fk_Mechanics_Staff1` foreign key (`idStaff`) references `Staff` (`idStaff`) on delete restrict on update restrict
) engine = InnoDB character set = utf8mb4 collate = utf8mb4_0900_ai_ci row_format = Dynamic;

-- Mechanics Records
insert into `Mechanics` values (1, 'Antonio', 'Rua X, Nº 1', 1);
insert into `Mechanics` values (2, 'Dario', 'Rua Y, Nº 2', 1);
insert into `Mechanics` values (3, 'Nelo', 'Rua A, Nº 3', 2);
insert into `Mechanics` values (4, 'Lindy', 'Rua B, Nº 4', 2);
insert into `Mechanics` values (5, 'Keanu', 'Rua C, Nº 5', 3);

-- Creating OS Table
drop table if exists `OS`;
create table `OS`  (
  `idOS` int not null auto_increment,
  `start date` date not null,
  `finish date` date null default null,
  `Pieces Value` float null default null,
  `idStatus OS` int not null,
  `idStaff` int not null,
  `idAuthorizations` int not null,
  primary key (`idOS`) using btree,
  index `fk_OS_Status OS1_idx`(`idStatus OS`) using btree,
  index `fk_OS_Staff1_idx`(`idStaff`) using btree,
  index `fk_OS_Authorization1_idx`(`idAuthorizations`) using btree,
  constraint `fk_OS_Authorization1` foreign key (`idAuthorizations`) references `Authorizations` (`idAuthorizations`) on delete restrict on update restrict,
  constraint `fk_OS_Staff1` foreign key (`idStaff`) references `Staff` (`idStaff`) on delete restrict on update restrict,
  constraint `fk_OS_Status OS1` foreign key (`idStatus OS`) references `Status OS` (`idStatus OS`) on delete restrict on update restrict
) engine = InnoDB character set = utf8mb4 collate = utf8mb4_0900_ai_ci row_format = Dynamic;

-- OS Records
insert into `OS` values (1, '2022-09-15', '2022-08-03', 60, 1, 1, 1);
insert into `OS` values (2, '2022-09-16', '2022-08-22', 70.5, 1, 2, 2);
insert into `OS` values (3, '2022-09-14', '2022-10-22', 87.9, 2, 3, 1);

-- Creating Services Table
drop table if exists `Services`;
create table `Services`  (
  `idServices` int not null auto_increment,
  `service` varchar(45) character set utf8mb4 collate utf8mb4_0900_ai_ci not null,
  `valor` float not null,
  `idOS` int not null,
  primary key (`idServices`) using btree,
  index `fk_Services_OS1_idx`(`idOS`) using btree,
  constraint `fk_Services_OS1` foreign key (`idOS`) references `OS` (`idOS`) on delete restrict on update restrict
) engine = InnoDB character set = utf8mb4 collate = utf8mb4_0900_ai_ci row_format = Dynamic;

-- Records of Services
insert into `Services` values (1, 'Lights', 50.8, 1);
insert into `Services` values (2, 'Glass', 40.6, 2);
insert into `Services` values (3, 'Eletric', 80.4, 3);

-- Creating Status OS Table
drop table if exists `Status OS`;
create table `Status OS`  (
  `idStatus OS` int not null auto_increment,
  `Status` varchar(45) character set utf8mb4 collate utf8mb4_0900_ai_ci not null,
  primary key (`idStatus OS`) using btree
) engine = InnoDB character set = utf8mb4 collate = utf8mb4_0900_ai_ci row_format = Dynamic;

-- Status OS Records
insert into `Status OS` values (1, 'Working on');
Insert into `Status OS` values (2, 'Finalized');

-- Service Type Structure Table
drop table if exists `Service Type`;
create table `Service Type`  (
  `idStatus` int not null auto_increment,
  `Type` varchar(45) character set utf8mb4 collate utf8mb4_0900_ai_ci not null comment 'Types: Fix or periodic revisions',
  primary key (`idStatus`) using btree
) engine = InnoDB character set = utf8mb4 collate = utf8mb4_0900_ai_ci row_format = Dynamic;

-- Service Type Records
insert into `Service Type` values (1, 'Fixed');
insert into `Service Type` values (2, 'Revision');

set foreign_key_checks = 1;