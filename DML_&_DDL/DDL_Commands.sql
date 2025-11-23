/*DML :
	In order to change the definition of the table, we can create a table, 
	change it's strcture as well as we can drop the ewhwole table
	*/
--Create--
create table persons (
id int NOT NULL, 
person_name varchar(50) NOT NULL, 
birth_date date, 
phone varchar(15) NOT NULL
CONSTRAINT pk_persons PRIMARY KEY(id)
);

--Alter  : COMMand --
--Add New columns called email to the persons table--
Alter table persons ADD  email varchar(50) NOT NULL

--Remove the column phone from the persons table--
Alter table persons DROP column phone

--Drop--
Drop table persons


select * from persons -- Query --
