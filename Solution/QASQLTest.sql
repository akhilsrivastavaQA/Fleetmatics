-- 1. Write a query that outputs all vehicle names, 
-- IMEI's and Account Names ordered by Date Created with the oldest at the top

Select vehicles.Name,vehicles.IMEI,Account.Name from vehicles INNER JOIN Accounts
ON vehicles.Accountid = Accounts.Accountid order by vehicles.CreatedOn



-- 2. Write a Query that outputs the number of Vehicles who have Drivers assigned to them
 
Select count(vehicleid) from vehicles where Driverid IS NOT NULL
Select count(vehicleid) from vehicles INNER JOIN Drivers
ON Vehicles.DriverID = Drivers.DriverID




-- 3. Write a Query to find all users who are also a driver,
-- who's emails are not of domain 'fleetmatics.com' and who were created before 2010.
-- Display their email address, date created and current vehicle (if assigned)

Select Users.Email, Users.CreatedOn, vehicles.Name from 
(Users INNER JOIN Drivers
ON Users.DriverID = Drivers.DriverID) Left Join Vehicles
ON Vehicles.Driverid= Users.Drivers
where Users.Email NOT Like '%@fleetmatics.com' AND DATEPART(yyyy,Users.Created)< 2010
 



-- 4. Write a Query to find the vehicle (or vehicles in the event of a tie)
-- that has the highest odometer reading and output the vehicle name(s) and
-- odometer value(s). 

Select Vehicles.Name, Vehicles.odometer from 
(SELECT MAX(odometer) as Temp from vehicles) O inner Join Vehicles 
ON Vehicles.odometer = O.Temp



