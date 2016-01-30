CREATE OR REPLACE FUNCTION CHECKPARTEXIST(sNumber faultsheet.Serial_number%type,date_passed faultsheet.Date_Submitted%type)
RETURN BOOLEAN IS
con faultsheet.Condition%type;
BEGIN
  select condition into con from faultsheet join Part on faultsheet.SERIAL_NUMBER = Part.Serial_number where faultsheet.Serial_number = sNumber;
  return true;
  EXCEPTION
  WHEN NO_DATA_FOUND THEN
  RETURN FALSE;
  
END CHECKPARTEXIST;
