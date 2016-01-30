-- Database Assignment 
-- Jonathan Riordan
-- C13432152
-- Sql querys.

-- This will run the contraint causing an error because the date of repair ws before date submitted causing an error
INSERT INTO RepairOnSite (Part_Number,Date_Submitted,Serial_number, Date_of_Repair) 
VALUES (232324, '28-DEC-2015', 76548, '27-DEC-2015');

--Selection and Projection
-- select all the appliance where the manufacturer equals a cerain ID.
select * from appliance where Manufacturer_ID = 3;

--Intersection
-- shows the serials numbers from the appliance table that have been sold and are in the sale table
select Serial_number from appliance intersect  select Serial_number from Sale;

-- inner join
-- selects the manufacturer name and the serivce centre associated with that manufacturer using the manufacturer id.
select Manufacturer.Manufacturer_ID, Manufacturer.Manufacturer_Name, Service_centre.Service_cetre_name from Manufacturer inner join
Service_centre on Manufacturer.Manufacturer_ID = Service_centre.Manufacturer_ID;


-- full outer join 
-- select the customer names form the customer table and joins the sale table based on the customer id.
select Customer.Customer_name, Sale.Date_of_sale from Customer full outer join sale on customer.customer_id = sale.customer_id;


-- Aggregation
-- sql to select the serial number where the application name equals sont tv, this is used to count the stock of a produck in the appliance table.
select count(serial_number) from appliance where appliance_name = 'Sony_TV';

-- SubQueries
-- select all the maufacturer id that are less than 3.
select manufacturer_id from Manufacturer where manufacturer_id in (select manufacturer_id from Manufacturer where Manufacturer_id < 3);

-- Union
-- returns the partn numbern the serial number of the appliance and the date submitted.
select part_number,serial_number,date_submitted from part union all 
select part_number,serial_number,date_submitted from REPAIRONSITE;

-- difference
-- returns the serial number from the appliance table that are not in the fault sheet
select serial_number from appliance minus select serial_number from faultsheet;

