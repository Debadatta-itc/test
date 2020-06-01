create or replace trigger trg1
  before insert on emp
  for each row
declare
  a number(10);
     begin
select count(*) into a from emp where empno=:new.empno;
     if a>=1 then
raise_application_error(-20001,'cant insert duplicate data');
      elsif a=0 then
dbms_output.put_line('your record has inserted');
       end if;
end;
