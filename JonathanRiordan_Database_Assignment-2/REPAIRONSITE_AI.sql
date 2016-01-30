create or replace TRIGGER REPAIRONSITE_AI 
AFTER INSERT ON RepairOnSite
FOR EACH ROW
BEGIN
  INSERT INTO logtable VALUES
  ('RepairOnSite','INS',TO_CHAR(USER),SYSDATE, :new.serial_number);
   DBMS_OUTPUT.PUT_LINE('Appliance been repaired on site');
END;