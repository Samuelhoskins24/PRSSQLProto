
Use PRSProto

Create Table [User]
(
  ID Int Primary Key Identity(1,1),  --Creates Index 
  Username Varchar(20) Not Null Unique,
  Password Varchar(10) Not Null,
  FirstName Varchar(20) Not Null,
  LastName Varchar(20) Not Null,
  PhoneNumber Varchar(12) Null,
  Email Varchar(75) Not Null,
  Reviewer Bit,
  Admin Bit -- Could Uses char(1) T or F
)

Select * From [User]

Create Table Vendor
(
 Id Int Primary Key Identity(1,1),
 Code varchar(10) Not Null Unique,
 Name varchar(255) Not Null,
 Address varchar(255) Not Null,
 City varchar(255) Not Null,
 State varchar(2) Not Null,
 Zip varchar(5) Not Null,
 PhoneNumber varchar(12),
 Email varchar (100) Not Null
 )

Create Table Product
(
 Id Int Primary Key Identity(1,1),
 VendorID int References Vendor(Id) Not Null Unique,
 PartNumber varchar(50) Not Null Unique,
 Name varchar(150) Not Null,
 Price Decimal(10,2) Not Null,
 Unit varchar(255),
 PhotoPath varchar(255)
 )

Create Table Request
(
 Id Int Primary Key Identity(1,1),
 UserID Int References [User](ID),
 RequestNumber varchar(20) Not Null,
 Description varchar(100) Not Null,
 Justification varchar(255) Not Null,
 DateNeeded Date Not Null,
 DeliveryMode varchar(25) Not Null,
 Status varchar(20) Default 'New',
 Total Decimal(10,2) Default 0.0,
 SubmittedDate DateTime Not Null,
 ReasonForRejection varchar(100)
)

Create Table LineItem
(
 Id Int Primary Key Identity(1,1),
 RequestID Int References Request(Id) Not Null Unique,
 ProductID Int References Product(Id) Not Null Unique,
 Quantity Int Not Null
)

insert into Vendor(Code, Name, Address, City, State, Zip, PhoneNumber, Email) 
Values
	('VND001', 'Alpha Supplies', '123 Maple St.', 'Chicago', 'IL', '60601', '312-555-0123', 'contact@alphasupplies.com'),
	('VND002', 'Beta Widgets', '456 Oak Ave.', 'Austin', 'TX', '78701', '512-555-0456', 'info@betawidgets.com'),
	('VND003', 'Gamma Tools', '789 Pine Rd.', 'Orlando', 'FL', '32801', '407-555-0789', 'support@gammatools.com')


	
Select * from vendor	
	
Insert into [User] (Username, Password, Firstname, Lastname, Phonenumber, Email, Reviewer, Admin) 
Values
	('user101', 'P@ssw0rd12', 'Emma', 'Johnson', '248-555-1234', 'emma.johnson@email.com', 0, 0),
	('user202', 'SafePass!4', 'Liam', 'Williams', '313-555-5678', 'liam.williams@email.com', 1, 0),
	('user303', 'Zsecure789', 'Sophia', 'Brown', '734-555-9012', 'sophia.brown@email.com', 0, 1)

Select * From [User]

Insert into Product(VendorID, PartNumber, Name, Price, Unit, PhotoPath)
Values
	('2', 'RESIDJNDND', 'Launching Beam Hook', '25.99', 'Not Available', 'Not available'),
	('3', 'ABCPOTX', 'Plate', '15.49', 'Not Available', 'Not available'),
	('4', 'ZXFTYES', 'Grinding Machine', '1250.00', 'Not Available', 'Not available')



Select * from Product
