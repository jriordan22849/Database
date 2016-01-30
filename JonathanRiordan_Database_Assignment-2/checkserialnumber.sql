create or replace FUNCTION CHECKSERIALNUMBER
(sNumber Appliance.Serial_number%type, date_passed faultsheet.Date_Submitted%type) RETURN BOOLEAN
  IS
  aname Appliance.Appliance_Name%TYPE;
  BEGIN
    SELECT Appliance_Name INTO aname FROM Appliance join faultsheet using(Serial_number)
    WHERE Serial_number = sNumber and faultsheet.Date_Submitted = date_passed;
    RETURN TRUE;
  EXCEPTION
  WHEN NO_DATA_FOUND THEN
    RETURN FALSE;
  END CHECKSERIALNUMBER;