
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

