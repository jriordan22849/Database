set SERVEROUTPUT on;
DECLARE 
  serial faultsheet.Serial_number%type := &Enter_in_Serial_Number;

BEGIN
 if CHECKSERIALNUMBER(serial,'&date_entered') THEN
  dbms_output.put_line('Serial Number exists');
  if CHECKPARTEXIST(serial,'&date_entered') then
  ADDPART(serial);
  ELSE
    dbms_output.put_line('No data found in the part table');
  END IF;  
 ELSE
  dbms_output.put_line('Serial Number and date do not exist');
 END IF;
 EXCEPTION
 WHEN OTHERS THEN
 dbms_output.put_line('Error occurred '||SQLCODE||SQLERRM);
END;