create or replace TRIGGER REPAIROFFSITE_AI 
AFTER INSERT ON RepairOffSite
FOR EACH ROW
BEGIN
  INSERT INTO logtable VALUES
  ('RepairOffSite','INS',TO_CHAR(USER),SYSDATE, :new.serial_number);
   DBMS_OUTPUT.PUT_LINE('Appliance sent off site to be repaired');
END;