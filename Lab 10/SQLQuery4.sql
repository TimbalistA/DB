CREATE TRIGGER inregistrare on database
for  ALTER_TABLE
AS
declare @Nume_Student varchar(20)
select @Nume_Student = eventdata().value('(/EVENT_INSTANCE/AlterTableActionList/*/Columns/Name)[1]','sysname');
if @Nume_Student = 'Nume_Student'
begin
Raiserror (' You do not have permissions',16,1)
end
go
alter table studenti alter column Nume_Student varchar(20)