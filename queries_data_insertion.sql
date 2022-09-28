-- queries and data inserion
-- Using Select Statement
select * from `Clients`;

-- Filter Using Where Statement
select * from `Clients`
	where FName like '%Goma';

-- Creating Expressions by generating atributes
select FName, Telephone, Model, Placa from Clients as c, Vehicles as cr
	where c.`idClients`=cr.idClients;

-- Using Order BY*/
select FName, Telephone, Model, Placa from Clients as c, Vehicles as cr
	where c.`idClients`=cr.idClients
    order by FName
    asc;

-- Using Having Statement*/
select count(*) as total, Model from Clients as c, Vehicles as cr
	where c.idClients = cr.idClients
	group by Model 
	having total >= 1;

-- Creating junction between tables
select FName, Telephone, Model, Placa, status from Clients as a
	inner join Vehicles as b
	on b.idClients = a.idClients
	inner join OS as c
	on c.idStaff = b.idStaff
	inner join Authorizations as d
	on d.idAuthorizations = c.idAuthorizations
	order by FName 
	asc ;