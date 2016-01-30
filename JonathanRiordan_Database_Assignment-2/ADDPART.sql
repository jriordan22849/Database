create or replace PROCEDURE ADDPART(serial in faultsheet.Serial_number%type) is
serial_num faultsheet.Serial_number%type;
sNumber Part.Serial_number%type;
date_entered Part.Date_Submitted%type;
cond faultsheet.Condition%type;
Service_number Service_centre.Service_centre_ID%type;
part_num Part.Part_Number%type;
BEGIN

 select faultsheet.Serial_number, faultsheet.Date_Submitted, faultsheet.Condition, Part.Part_Number into sNumber, date_entered, cond,part_num from faultsheet
 join Part on faultsheet.Serial_number = Part.Serial_number where faultsheet.Serial_number = serial;
 
 select Service_centre_ID into Service_number from Service_centre join Manufacturer using(Manufacturer_ID)
 join Appliance using(Manufacturer_ID) where Appliance.Serial_number = serial;

  
  IF(cond = 'ON_NeedsRepair') then
     DBMS_OUTPUT.PUT_LINE('insert to onsite');
     Insert into RepairOnSite values(SYSDATE,part_num,date_entered,serial);
     commit;
  ELSE IF(cond = 'OFF_NeedsRepair') then
       DBMS_OUTPUT.PUT_LINE('insert to off site');
       Insert into RepairOffSite values(part_num,Service_number,date_entered,sNumber);
       commit;
    END IF;
  END IF;
END ADDPART;