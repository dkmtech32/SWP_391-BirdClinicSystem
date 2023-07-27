
CREATE TABLE Images (
  imageID CHAR(32) NOT NULL,
  imageURLName varchar(50) NOT NULL,
  
  CONSTRAINT PK_Images PRIMARY KEY CLUSTERED 
(
	imageID ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE Users (
  userID CHAR(32) NOT NULL,
  imageID CHAR(32) NOT NULL,
  userName VARCHAR(30) NOT NULL,
  userPassword CHAR(32) NOT NULL,
  fullName NVARCHAR(50),
  phoneNumber CHAR(10),
  gender VARCHAR(7) NOT NULL,
  email VARCHAR(40) NOT NULL, 
  userRole VARCHAR(10) NOT NULL, 
  status_ VARCHAR(10) NOT NULL,
  FOREIGN KEY (imageID) REFERENCES Images(imageID),
  CONSTRAINT PK_Users PRIMARY KEY CLUSTERED 
(
	userID ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE Customer (
  customerID CHAR(32) NOT NULL,
  dob DATE,
  customerAddress NVARCHAR(70) COLLATE Vietnamese_CI_AS,
  CONSTRAINT PK_Customer PRIMARY KEY CLUSTERED (customerID ASC)
) ON [PRIMARY];

CREATE TABLE Speciality (
  specialityID CHAR(32) NOT NULL,
  specialityName VARCHAR(30) NOT NULL,
  CONSTRAINT PK_Speciality PRIMARY KEY CLUSTERED 
(
	SpecialityID ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE Doctor (
  doctorID CHAR(32) NOT NULL,
  specialityID CHAR(32) NOT NULL,
  docAge TINYINT NOT NULL,
  yearsOfExperience TINYINT NOT NULL,
  academicTitle NVARCHAR(20),
  degree NVARCHAR(10),
  FOREIGN KEY (specialityID) REFERENCES Speciality(specialityID),
  CONSTRAINT PK_Doctor PRIMARY KEY CLUSTERED 
(
	doctorID ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE TimeSlot (
  timeSlotID CHAR(32) NOT NULL,
  timeSlot TIME NOT NULL,
  day_ NVARCHAR(11) NOT NULL,
  CONSTRAINT PK_TimeSlot PRIMARY KEY CLUSTERED 
(
	timeSlotID ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE DoctorTimeSlot (
	doctorID CHAR(32) NOT NULL,
	timeSlotID CHAR(32) NOT NULL,
	FOREIGN KEY (timeSlotID) REFERENCES TimeSlot(timeSlotID),
	FOREIGN KEY (doctorID) REFERENCES Doctor(doctorID),
)

CREATE TABLE Medicine (
  medicineID CHAR(32) NOT NULL,
  medicineName NVARCHAR(30) NOT NULL,
  medicinePrice DECIMAL(10, 2) NOT NULL,
  unit CHAR (13) NOT NULL,
  CONSTRAINT PK_Medicine PRIMARY KEY CLUSTERED 
(
	medicineID ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE Service_ (
  serviceID CHAR(32) NOT NULL,
  specialityID CHAR(32) NOT NULL,
  serviceName VARCHAR(60) NOT NULL,
  servicePrice DECIMAL(9, 2) NOT NULL,
  FOREIGN KEY (specialityID) REFERENCES Speciality(specialityID),
  CONSTRAINT PK_Service_ PRIMARY KEY CLUSTERED 
(
	serviceID ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE Bird (
  birdID CHAR(32) NOT NULL,
  customerID CHAR(32),
  imageID CHAR(32) NOT NULL,
  birdFullname NVARCHAR(30) NOT NULL,
  birdGender VARCHAR(6) NOT NULL,
  breed NVARCHAR(20) NOT NULL,
  band_chip CHAR(6),
  birdWeight FLOAT NOT NULL,
  sexingMethod VARCHAR(60) NOT NULL,
  medicalHistory NVARCHAR(60),
  hatchingDate DATE NOT NULL,
  featherColor NVARCHAR(50) NOT NULL,
  FOREIGN KEY (customerID) REFERENCES Customer(customerID),
  FOREIGN KEY (imageID) REFERENCES Images(imageID),
  CONSTRAINT PK_Bird PRIMARY KEY CLUSTERED 
(
	birdID ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE Appointment (
  appointmentID CHAR(32) NOT NULL,
  birdID CHAR(32) NOT NULL,
  doctorID CHAR(32),
  timeSlotID CHAR(32) NOT NULL,
  appTime DATE NOT NULL,
  notes NVARCHAR(200),
  payment NVARCHAR(20),
  appStatus VARCHAR(20) NOT NULL,
  totalPrice DECIMAL(10, 2),
  FOREIGN KEY (birdID) REFERENCES Bird(birdID),
  FOREIGN KEY (doctorID) REFERENCES Doctor(doctorID),
  FOREIGN KEY (timeSlotID) REFERENCES TimeSlot(timeSlotID),
  CONSTRAINT PK_Appointment PRIMARY KEY CLUSTERED 
(
	appointmentID ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE AppointmentServices (
  appointmentID CHAR(32) NOT NULL,
  serviceID CHAR(32) NOT NULL,
  FOREIGN KEY (serviceID) REFERENCES Service_(serviceID),
  FOREIGN KEY (appointmentID) REFERENCES Appointment(appointmentID),
	)

CREATE TABLE MedicalRecord (
  medicalRecordID CHAR(32) NOT NULL,
  appointmentID CHAR(32) NOT NULL,
  recordTime DATETIME NOT NULL,
  diagnosis NVARCHAR(100) NOT NULL,
  treatmentDays int NOT NULL,
  doctorNotes nvarchar(300),
  FOREIGN KEY (appointmentID) REFERENCES Appointment(appointmentID),
  CONSTRAINT PK_MedicalRecord PRIMARY KEY CLUSTERED 
(
	medicalrecordID ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE RecordServices (
  medicalRecordID CHAR(32) NOT NULL,
  serviceID CHAR(32) NOT NULL,
  FOREIGN KEY (medicalRecordID) REFERENCES MedicalRecord(medicalRecordID),
  FOREIGN KEY (serviceID) REFERENCES service_(serviceID),
)

CREATE TABLE RecordMedicine (
  medicalRecordID CHAR(32) NOT NULL,
  medicineID CHAR(32) NOT NULL,
  quantity INT NOT NULL,
  description_ NVARCHAR(200),
  FOREIGN KEY (medicalRecordID) REFERENCES MedicalRecord(medicalRecordID),
  FOREIGN KEY (medicineID) REFERENCES Medicine(medicineID)
);

CREATE TABLE Feedback (
  feedbackID CHAR(32) NOT NULL,
  appointmentID CHAR(32) NOT NULL,
  feedbackContent NVARCHAR(500) NOT NULL,
  title NVARCHAR(100) NOT NULL,
  feedbackTime DATETIME NOT NULL,
  rating DECIMAL(2, 1) NOT NULL,
  FOREIGN KEY (appointmentID) REFERENCES Appointment(appointmentID),
  CONSTRAINT PK_Feedback PRIMARY KEY CLUSTERED 
  (
    feedbackID ASC
  ),
  CONSTRAINT UC_AppointmentID UNIQUE (appointmentID)
) ON [PRIMARY];

CREATE TABLE Blog (
  blogID CHAR(32) NOT NULL,
  imageID CHAR(32) NOT NULL,
  title NVARCHAR(100) NOT NULL,
  uploadDatetime DATETIME NOT NULL,
  category NVARCHAR(50) NOT NULL,
  _description VARCHAR(1000) NOT NULL,
  blogContent NVARCHAR(MAX) NOT NULL,
  CONSTRAINT PK_Blog PRIMARY KEY CLUSTERED 
  (
    blogID ASC
  ) WITH (
    PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF,
    IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON,
    ALLOW_PAGE_LOCKS = ON
  ) ON [PRIMARY],
  CONSTRAINT FK_Blog_Images FOREIGN KEY (imageID) REFERENCES Images(imageID)
) ON [PRIMARY];
GO

INSERT INTO Images(imageID, imageURLName)
VALUES
    ('4twgbi3qw84bgqhorwoee83hf93jj30f', 'admin.jpg'),
	('janfa98h943ghafa92rhfuewhfnhfn3g', 'malecustomerdefault.png'),
	('gha948ga489hra3r9fh32f32f9838r93', 'femalecustomerdefault.png'),
    ('janfuewhfnhfn3ga98h943ghafa92rhf', 'malecustomer1.jpg'),
	('jan92rhffuewhfnhfn3ga98h943ghafa', 'malecustomer2.jpg'),
	('jhfnhfn3anfuewga98h943ghafa92rhf', 'malecustomer3.jpg'),
	('janfuewhhafa92rfnhfn3ga98h943ghf', 'malecustomer4.jpg'),
	('hfnhfn3ga98h94janfuew3ghafa92rhf', 'malecustomer5.jpg'),
	('janfuewhfnhfafa92n3ga98h943ghrhf', 'malecustomer6.jpg'),
	('jfnhfn3ga98h9anfuewh43ghafa92rhf', 'malecustomer7.jpg'),
	('whfnhfn3ga98h943ghjanfueafa92rhf', 'malecustomer8.jpg'),
	('janfuewh8h943ghaffnhfn3ga9a92rhf', 'malecustomer9.jpg'),
	('uewh8h943ghaffnhfnjanf3ga9a92rhf', 'malecustomer10.jpg'),
	('fn3ga9aewjanfun92rhfhh8h943ghaff', 'malecustomer11.jpg'),
	('h8ewa9a92rhfaffnhfnh943ghfu3gjan', 'malecustomer12.jpg'),
	('ga98h943ghjanwhfnhfn3fueafa92rhf', 'femalecustomer1.jpg'),
	('3ghjanwhfnga98h94hfn3fueafa92rhf', 'femalecustomer2.jpg'),
	('gnhfn3a98h943ghjanwhffueafa92rhf', 'femalecustomer3.jpg'),
	('hjanwhfnhfn3ga98h943gfueafa92rhf', 'femalecustomer4.jpg'),
	('ga98h943gfueafhjanwhfnhfn3a92rhf', 'femalecustomer5.jpg'),
	('gahjanwhfnhfn3fuea98h943gfa92rhf', 'femalecustomer6.jpg'),
	('gaafa9298h943ghjanwhfnhfn3fuerhf', 'femalecustomer7.jpg'),
	('anwhga98h943ghjfnhfn3fueafa92rhf', 'femalecustomer8.jpg'),
	('ga98hfnhfn3fueaf943ghjanwha92rhf', 'femalecustomer9.jpg'),
    ('nanwha92r943ghga98hfnh3fueaffjhf', 'femalecustomer10.jpg'),
	('hga98hfnhfn3a92rhfueaf943ghjanwf', 'femalecustomer11.jpg'),
	('hfn3fueaf94gajanwha932rhf98hfngh', 'femalecustomer12.jpg'),
	('rhaanwha928hfnhff943ghjga9fue3nf', 'femalecustomer13.jpg'),
	('3ghjga9frf94aanwhavfnhf928hue3nf', 'femalecustomer14.jpg'),
    ('fhawfbwa98fha98hf9na9uwbga9ubvg9', 'lgbtcustomer.jpg'),
	('f7384hfw34f38wb4fw38h4f03h43f93f', 'malestaff.jpg'),
	('ngseriug908hg93h4g934nf34f938f4h', 'femalestaff.jpg'),
	('cjndsjkcfnzslkjvnawjefn8jfh38fu3', 'bs1.png'),
	('vnaeojvner9gh39g4waofh28f28hfa93', 'bs2.png'),
	('fhafgbyfg87gf83bfiwifhweufhwe5g5', 'bs3.png'),
	('g73f93hf9bwfb3v384ub83bg3487fb43', 'bs4.jpg'),
	('biserhbf9473hf9b94gb49f93f38f984', 'bs5.jpg'),
	('gsbheirbfg7a843hgfa943bfu9fb3f93', 'bs6.png'),
	('fbriehafbihfa7hfa3hf983hf98qff82', 'bs7.jpg'),
	('rfhiarebfniuaerhnfuah9f48h34f843', 'bs8.png'),
	('fherajfhriuehfraufha94hf98fh93hf', 'bs9.png'),
	('fnerajfha974fhy4973haf9ha49hf338', 'bs10.jpg'),
	('0fe30e1ff175eb1c538613084ab12417', 'bs11.jpg'),
	('4d5fg5df6gyd5f6g5f6g5df6gy5rf6gh', 'bs12.jpg'),
    ('fafnbuhfauhfweoufha8hfa9hfa48hf8', 'chimyen.png'),
    ('avewifbaiuwefnwajenfhiuahenf998f', 'chimcongxanh.jpg'),
	('fewabf9qb439fufh9h438q9h34fq34t4', 'chimen.jpg'),
	('frheafiuewhf9hf983h3f4ha438f94f4', 'chimtri.jpg'),
	('4rt43t5y56y465t4r3e24r435y65u76i', 'chimse.jpg'),
	('efrgtrytuiykjhmngfbvdfewr4567898', 'chimhongyen.jpg'),
	('48c967910f7eb39ea5f7b7602a3df9ea', 'chimhactrang.jpg'),
	('3b94ace86063b245916a6e906221e6a8', 'chimkhuyentrang.jpg'),
	('249fb9cb11171ae6ab41794bee070a8f', 'chimyenphung.jpg'),
	('b3b9752ec51a5433b44e27b8d9b81c76', 'chimbocau.jpg'),
	('ee38603c9cfdb54fb0a0ab4a197f92a3', 'chimvet.jpg'),
	('ef94fe9d57eed266b24c3fc1203c1e17', 'chimhoangyen.jpg'),
	('a8cf052632950deb5ab9c1f5ec36334d', 'chimchichchoelua.png'),
	('7b1bc65da7abbaceaaadc0ea9564c175', 'chimchaomao.png'),
	('95f7e5a8c051e6b60905912bd8aedf7d', 'chimoanhcodo.png'),
	('365c43bd856cf86e0e0b4cd4b7bc0462', 'chimkhuoubacma.png'),
	('b51f1bb2e54d243e60e32563b2b1a7ed', 'chimchichbong.png'),
	('08eed66a05827e8dc02d6ff1392f9bf6', 'chimdiecdauden.png'),
	('ddfff0e1f9009fe5d621e2ed07348a51', 'chimcuccu.png'),
	('cbe26c3a3f34407ed023e3f02399d2fa', 'chimnhanden.png'),
	('05b5b4345d8ac2f73ece3df15be03230', 'chimhoamidongco.png'),
	('2bda592b2aada870747dd4366a3dff18', 'chimnhantrang.png'),
	('e28e1458f599f2391b91bfd61338483e', 'chimbimbipdongduong.png'),
	('84cb52eda2e4f0b66f8509c37e857e8c', 'chimsaobungden.png'),
	('8721d5a5f3f44bd01529d24dcf519239', 'chimchiavoihongtrang.png'),
	('66a5473e01debb47bff7f215d6c4a228', 'chimcatmindoro.png'),
	('6d47ad177fb45c2d87e1b54fc363676b', 'chimdopruoicamden.png'),
	('25abf9603856427e295b7bd1137fd04a', 'chimvetnammy.png'),
	('ed1ed3634186fc66ee692da3ba98272f', 'chimsonca.png'),
	('e47ccaddaa9e2cd4c25e84cae624b077', 'chimvanganh.png'),
	('6EF02AE8CD5103C4C74B8CAAF1471D90', 'blog1_1.jpg'),
	('A1DD1CA0BD74BB2124FE2DA1DBE6AA70', 'blog1_2.jpg'),
	('B380D7222B8087CEB9A77BE7E5C6D674', 'blog1_3.jpg'),
	('1633ADA5AEBDB9440C68C44F0A78E8EB', 'blog1_4.jpg'),
	('74BA3D05A528CB49F527559465BC577A', 'blog1_5.jpg'),
	('FA883DBE3F3AA53D38495AFF57C1BDBF', 'blog1_6.jpg'),
	('0F716E92BB955B5116129AB0EADCD694', 'blog1_7.jpg'),
	('DFAD9B5C12187AD55B9A3B71702173FD', 'blog1_8.jpg'),
	('3D3955297F0E9453621E4521F39CB6A9', 'blog1_9.jpg'),
	('A5B46B0BE55F8F58150695E37716B424', 'blog2_1.jpg'),
	('5C929AD2D6F33380FC8187CABB79E048', 'blog2_2.jpg'),
	('ECDFB7EDE4B9ED4AE2941A580141A6B7', 'blog3_1.jpg'),
	('F58150695E37716A5B46B0BE55F8B424', 'blog3_2.jpg'),
	('5C929AD2CABB79ED6F33380FC8187048', 'blog3_3.jpg'),
	('882BDE1798D4D1516641A2D190D58CAC', 'blog3_4.jpg'),
	('70B14F3F23D45B12F60A483831B662B4', 'blog3_5.jpg'),
	('042F820E781DA9CAA2E793F643B536BB', 'blog3_6.jpg'),
	('3C2E0D1CFC3BC009465195E4B5AEC73F', 'blog4_1.jpg'),
	('AADE06E1F2DC45CABC65C7B73EC87C83', 'blog4_2.jpg'),
	('48051656AB52050E0BB8D82FE0A243E0', 'blog5_1.jpg'),
	('2B5FD6349E04AB0C1099C266B2A62704', 'blog5_2.jpg'),
	('0EF12921626248169E12EBFCE6FFE810', 'blog6_1.jpg'),
	('4D907821573A6FB1DC1574827DA9514B', 'blog6_2.jpg'),
	('5010DD042DF3EC8733B0CD78AAFD4E5C', 'blog6_3.jpg'),
	('CFC93FBCA0A3EF7A4799EFBBB0571F77', 'blog6_4.jpg'),
	('53007B37778C4C4F6CCFDC1467A1F5DC', 'blog6_5.jpg'),
	('8FD8C5E01EC4F0757015A9AFC4C82D3D', 'blog6_6.jpg'),
	('7966D1174214B297382CA2D017E49A7E', 'blog6_7.jpg'),
	('835B9D2F2AD156412DEF8907E47B0C1C', 'blog6_8.jpg'),
	('0D22C5422C970064C3FE7856F16A9118', 'blog6_9.jpg'),
	('00DB5DAF82D7F818D6AB6A466AF7BEE4', 'blog6_10.jpg'),
	('76FA6E278CE75EB33427682E6C0C360D', 'blog7.jpg'),
	('B7B7A82190F83DF905868B2C1A45CC9B', 'blog8_1.jpg'),
	('D5A47A681E03A039DE4DC09B75C0FE82', 'blog8_2.jpg'),
	('AB8EF54222AF80947BD5BCBA22C8C8C5', 'blog9_1.jpg'),
	('B5894B161BAC1B56627E885461AC366E', 'blog9_2.jpg'),
	('7B4AC716D9608C09401B25D55D657DF5', 'blog10_1.jpg'),
	('64947A9C9DDEBF65E48B683464B7FBC3', 'blog10_2.jpg'),
	('76F3486A7C1E2A8071EB93571BCAD878', 'blog11_1.jpg'),
	('59D5DFD007E115968AE004645CA789EA', 'blog11_2.jpg'),
	('DEE0822E0D723293B16ABCFE332C8C51', 'blog11_3.jpg'),
	('15B6C07558ADDED547DB03751982107C', 'blog11_4.jpg'),
	('9AE0A7526A29D99AF4B88A5BE60F07D5', 'blog11_5.jpg'),
	('4716AE87BD0DC2493651AE62F82CED2C', 'blog11_6.jpg'),
	('80DD1B254C7CE466164EAABD64E657CE', 'blog11_7.jpg'),
	('1F6690A61373CDBD24B1513F09065E3B', 'blog11_8.jpg'),
	('DF30ECFBE3530A0ABFDEE6618FB2CF48', 'blog12_1.jpg'),
	('15F5C2BCEC0BC8554F7F105AA6528C51', 'blog12_2.jpg'),
	('1562B2EC846A0E0694B14CFF54E5C232', 'blog12_3.jpg'),
	('2D95D21497BC068A970A015E2057D367', 'blog12_4.jpg'),
	('955014699BCDDC9163EBF859E2E97AD3', 'blog13_1.jpg'),
	('7A07BA85FEBCA8A149A01893F84A2AB8', 'blog13_2.jpg'),
	('B7B7A82190F81A45C3DF905868B2CC9B', 'blog13_3.jpg'),
	('DA039DE4DC09B5A47A681E0375C0FE82', 'blog14_1.jpg'),
	('F80947BD5BCAB8EF54222ABA22C8C8C5', 'blog14_2.jpg'),
	('1BAC1B56627B5894B16E885461AC366E', 'blog14_3.jpg'),
	('D9608C097B4AC716401B25D55D657DF5', 'blog15_1.jpg'),
	('64965E48B6834647A9C9DDEBF4B7FBC3', 'blog15_2.jpg'),
	('7C1E2A8076F3486A71EB93571BCAD878', 'blog15_3.jpg'),
	('530A0ABFDEDF30ECFBE3E6618FB2CF48', 'blog16.jpg'),
	('F0757015A9AF8FD8C5E01EC4C4C82D3D', 'blog17_1.jpg'),
	('14B297382C7966D11742A2D017E49A7E', 'blog17_2.jpg');
	
-- Insert data into the Users table
INSERT INTO Users (userID, imageID, userName, userPassword, fullName, phoneNumber, gender, email, userRole, status_)
VALUES
    ('df906a974056cd590d0b9fc4ddc37c22', '4twgbi3qw84bgqhorwoee83hf93jj30f', 'tiendkmSE172051', '5f4dcc3b5aa765d61d8327deb882cf99', N'Nguyễn Kim Minh Tiến', '0987896754', 'male', 'tiendkmse172051@fpt.edu.vn', 'admin', 'active' ),
    ('2c9320b8639fc9e1c784880bbecfdfa1', 'janfa98h943ghafa92rhfuewhfnhfn3g', 'tuanntaSE140515', '5f4dcc3b5aa765d61d8327deb882cf99', N'Nguyễn Thanh Anh Tuấn', '0748195317', 'male', 'tuanntase140515@fpt.edu.vn', 'customer', 'active' ),
    ('3ff56e23cc31e9c9a85bc037341a65ee', 'janfa98h943ghafa92rhfuewhfnhfn3g', 'bachnhSE172021', '5f4dcc3b5aa765d61d8327deb882cf99', N'Nguyễn Huy Bách', '0987656788', 'male', 'bachnhSE172021@fpt.edu.vn', 'customer', 'active' ),
	('3ff5njfnijhfdsf8845bc037341a65ee', 'janfa98h943ghafa92rhfuewhfnhfn3g', 'minhdnaSE172977', '5f4dcc3b5aa765d61d8327deb882cf99', N'Đặng Võ Anh Minh', '0876549456', 'male', 'minhdnaSE172977@fpt.edu.vn', 'customer', 'active' ),
	('82d5cf38dc655bd1722ac5d4d350bce3', 'janfa98h943ghafa92rhfuewhfnhfn3g', 'PhuctqhSE171472', '5f4dcc3b5aa765d61d8327deb882cf99', N'Trương Quang Hồng Phúc', '0897412324', 'male', 'PhuctqhSE171472@fpt.edu.vn', 'customer', 'active' ),
	('1c4f04058f291642c159e27e1554ddf8', 'janfa98h943ghafa92rhfuewhfnhfn3g', 'anptSE172048', '5f4dcc3b5aa765d61d8327deb882cf99', N'Phan Thiên Ân', '0987656788', 'male', 'anptSE172048@fpt.edu.vn', 'customer', 'active' ),
	('c0637bb4f3d7531d936f2686b9672a66', 'janfuewhfnhfn3ga98h943ghafa92rhf', 'nghoangphuc01', '5f4dcc3b5aa765d61d8327deb882cf99', N'Nguyễn Hoàng Phúc', '1234567890', 'male', 'phucnh01@gmail.com', 'customer', 'banned' ),
    ('11eee90acf45377f4cc3ca0758f2bf30', 'janfuewhhafa92rfnhfn3ga98h943ghf', 'tuannt02ert', '5f4dcc3b5aa765d61d8327deb882cf99', N'Nguyễn Thanh Tuấn', '0987654321', 'male', 'tuannt02@gmail.com', 'customer', 'active' ),
    ('48b31829bc7599f232d06a1e686534bd', 'ga98h943ghjanwhfnhfn3fueafa92rhf', 'anhttl03edc', '5f4dcc3b5aa765d61d8327deb882cf99', N'Trần Thị Lan Anh', '0123456789', 'unknown', 'anhttl03@gmail.com', 'customer', 'active' ),
    ('4e192dacb208ceb2413376e2ad3b3db8', '3ghjga9frf94aanwhavfnhf928hue3nf', 'rienglt01', '5f4dcc3b5aa765d61d8327deb882cf99', N'Lê Thị Riêng', '9876543210', 'female', 'riengtl01@gmail.com', 'customer', 'active' ),
    ('6cb9c7dba65dd3d9e1946c5dd265dbcd', 'jan92rhffuewhfnhfn3ga98h943ghafa', 'hungnm02nbv', '5f4dcc3b5aa765d61d8327deb882cf99', N'Nguyễn Mạnh Hùng', '5678901234', 'male', 'hungnm02@gmail.com', 'customer', 'banned' ),
	('45b76de8eb0fd35e124955a2ff2473db', '3ghjanwhfnga98h94hfn3fueafa92rhf', 'thaophy04', '5f4dcc3b5aa765d61d8327deb882cf99', N'Phan Hồng Yến Thảo', '6565743635', 'female', 'thaophy04@gmail.com', 'customer', 'banned' ),
    ('ea03ec90c8836f413784ee96e50a4f11', 'gnhfn3a98h943ghjanwhffueafa92rhf', 'toanhm07cvb', '5f4dcc3b5aa765d61d8327deb882cf99', N'Huỳnh Minh Toàn', '0976534156', 'male', 'toanmt07@gmail.com', 'customer', 'active' ),
    ('bc6c32dbbb8bd0660d158b08d7cad96f', 'hfnhfn3ga98h94janfuew3ghafa92rhf', 'haileduc56', '5f4dcc3b5aa765d61d8327deb882cf99', N'Lê Đức Hải', '0965783451', 'unknown', 'haild56@gmail.com', 'customer', 'active' ),
    ('7e55fcb3a457634cfa78b49bdb774b3a', 'nanwha92r943ghga98hfnh3fueaffjhf', 'yennth09jkl', '5f4dcc3b5aa765d61d8327deb882cf99', N'Nguyễn Thị Hải Yến', '0914135352', 'female', 'yennth09@gmail.com', 'customer', 'active' ),
    ('d8869200b4fbde66a3475d6e730e1b6d', 'janfuewhfnhfafa92n3ga98h943ghrhf', 'minhngtr04', '5f4dcc3b5aa765d61d8327deb882cf99', 'Nguyên Khôi', '0765678234', 'male', 'minhngtr04@gmail.com', 'customer', 'banned' ),
	('128ce6812392dce1ca5a6919f03a26a2', 'hga98hfnhfn3a92rhfueaf943ghjanwf', 'thuthitran06', '5f4dcc3b5aa765d61d8327deb882cf99', N'Trần Thị Thu', '0908070605', 'female', 'thuthitran06@gmail.com', 'customer', 'banned' ),
    ('87ccfc84f4eb846b5aeb0e04f6ea12ea', 'uewh8h943ghaffnhfnjanf3ga9a92rhf', 'bayvanng08', '5f4dcc3b5aa765d61d8327deb882cf99', N'Nguyễn Văn Bảy', '0990807067', 'male', 'bayvanng08@gmail.com', 'customer', 'active' ),
    ('715c43d86b98da2212d7a9c9ce9d3062', 'jfnhfn3ga98h9anfuewh43ghafa92rhf', 'phattrduc04', '5f4dcc3b5aa765d61d8327deb882cf99', N'Trần Đức Phát', '0975432654', 'unknown', 'phattrduc04@gmail.com', 'customer', 'banned' ),
    ('a69b4087d281cb16efaa6bc91308f64d', 'hjanwhfnhfn3ga98h943gfueafa92rhf', 'giangngquy03', '5f4dcc3b5aa765d61d8327deb882cf99', N'Nguyễn Quỳnh Giang', '0914153645', 'female', 'giangngquy03@gmail.com', 'customer', 'active' ),
    ('61dd2b9c89fdcc1dce9fb553bf29cd8d', 'fn3ga9aewjanfun92rhfhh8h943ghaff', 'minhngqua07', '5f4dcc3b5aa765d61d8327deb882cf99', N'Nguyễn Quang Minh', '0998877665', 'male', 'minhngqua07@gmail.com', 'customer', 'active' ),
	('03b016eef369ef40bba639aa4f04341b', 'hfn3fueaf94gajanwha932rhf98hfngh', 'anhtrdan06ewq', '5f4dcc3b5aa765d61d8327deb882cf99', N'Đặng Trâm Anh', '0908866442', 'female', 'anhtrdan06@gmail.com', 'customer', 'active' ),
    ('f8b0ed4e38a71924a7d2bca97029778a', 'whfnhfn3ga98h943ghjanfueafa92rhf', 'datquocle05', '5f4dcc3b5aa765d61d8327deb882cf99', N'Lê Quốc Đạt', '0913254465', 'male', 'datqule05@gmail.com', 'customer', 'banned' ),
    ('5cbae581d99c1c3d17b8c09b07c54892', 'fhawfbwa98fha98hf9na9uwbga9ubvg9', 'yenkinguy45', '5f4dcc3b5aa765d61d8327deb882cf99', N'Nguyễn Kim Yến', '0914253647', 'unknown', 'yenkinguy45@gmail.com', 'customer', 'active' ),
    ('20e843f249d75ada67c1a2eef0dac92e', 'ga98h943gfueafhjanwhfnhfn3a92rhf', 'kimletha45', '5f4dcc3b5aa765d61d8327deb882cf99', 'Lê Thanh Kim', '0912233445', 'female', 'kimletha45@gmail.com', 'customer', 'banned' ),
    ('712da4f1096f6ae70d0f3c091b84ae7c', 'h8ewa9a92rhfaffnhfnh943ghfu3gjan', 'phucngminh17', '5f4dcc3b5aa765d61d8327deb882cf99', N'Nguyễn Minh Phúc', '0945566748', 'male', 'phucngminh17@gmail.com', 'customer', 'active' ),
	('b03c6f5a51ee06d3dbd17d0e38507ede', 'gahjanwhfnhfn3fuea98h943gfa92rhf', 'vyngphuo57qwe', '5f4dcc3b5aa765d61d8327deb882cf99', N'Nguyễn Phương Vy', '0908123452', 'female', 'vyngphuo57@gmail.com', 'customer', 'active' ),
    ('b83bb75b898592b75232c4816842d824', 'janfuewh8h943ghaffnhfn3ga9a92rhf', 'longngvu14zxc', '5f4dcc3b5aa765d61d8327deb882cf99', N'Nguyễn Vũ Long', '0987432456', 'male', 'longngvu14@gmail.com', 'customer', 'active' ),
    ('a68757602ea7419f0e2313a842be9abf', 'fhawfbwa98fha98hf9na9uwbga9ubvg9', 'ngocvanng45', '5f4dcc3b5aa765d61d8327deb882cf99', N'Nguyễn Văn Ngọc', '0965478154', 'unknown', 'ngocvanng45@gmail.com', 'customer', 'active' ),
    ('2b1850783245c06d0b782a4c9cd6a0a0', 'gaafa9298h943ghjanwhfnhfn3fuerhf', 'tratrthihuo37', '5f4dcc3b5aa765d61d8327deb882cf99', N'Trần Thị Hương Trà', '9876543210', 'female', 'tratrthihuo37@gmail.com', 'customer', 'banned' ),
    ('eb70ed9c4c32afea8f482dc873be4f6a', 'rhaanwha928hfnhff943ghjga9fue3nf', 'tranglethihuo75', '5f4dcc3b5aa765d61d8327deb882cf99', N'Lê Thị Hương Trang', '0904534256', 'female', 'tranglethihuo75@gmail.com', 'customer', 'active' ),
	('ae114dac5897fbcfd25797bf4be08fd3', 'cjndsjkcfnzslkjvnawjefn8jfh38fu3', 'yentrthith87', '5f4dcc3b5aa765d61d8327deb882cf99', N'Trần Thị Thanh Yến', '0789145356', 'female', 'yentrthith87@gmail.com', 'doctor', 'active' ),
	('9eae70b054be6eba305323d8c9106cfb', 'vnaeojvner9gh39g4waofh28f28hfa93', 'anhdongtr09', '5f4dcc3b5aa765d61d8327deb882cf99', N'Đỗ Nguyễn Trâm Anh', '0345762433', 'female', 'anhdongtr09@gmail.com', 'doctor', 'active' ),
	('c8aa14ffb7da0912c84635aa2ee0bb62', 'fhafgbyfg87gf83bfiwifhweufhwe5g5', 'anhdoquynh35', '5f4dcc3b5aa765d61d8327deb882cf99', N'Đỗ Quỳnh Anh', '0543749273', 'female', 'anhdoquynh35@gmail.com', 'doctor', 'active' ),
	('dd0e3f50648088bfecc501f809a06ca8', 'g73f93hf9bwfb3v384ub83bg3487fb43', 'tiennamtr36', '5f4dcc3b5aa765d61d8327deb882cf99', N'Trần Nam Tiến', '0546328472', 'male', 'tiennamtr36@gmail.com', 'doctor', 'active' ),
	('62fe46dae9470f311d52973a6eeb6a1a', 'biserhbf9473hf9b94gb49f93f38f984', 'anhquochoa67', '5f4dcc3b5aa765d61d8327deb882cf99', N'Hoàng Quốc Anh', '0534732843', 'male', 'anhquochoa67@gmail.com', 'doctor', 'active' ),
	('9c6189a20beb35a93df963e3b48eb9b0', 'gsbheirbfg7a843hgfa943bfu9fb3f93', 'sangkim16abcd', '5f4dcc3b5aa765d61d8327deb882cf99', N'Ngô Kim Sa', '0534254324', 'female', 'sangkim16@gmail.com', 'doctor', 'active' ),
	('1c38dd30f9e415b3a34879be077381ce', 'fbriehafbihfa7hfa3hf983hf98qff82', 'taileanh78xyz', '5f4dcc3b5aa765d61d8327deb882cf99', N'Lê Anh Tài', '0523423234', 'male', 'taileanh78@gmail.com', 'doctor', 'active' ),
	('21fc9daf44e2637d7972bd248c83577d', 'rfhiarebfniuaerhnfuah9f48h34f843', 'nhiluoman19rty', '5f4dcc3b5aa765d61d8327deb882cf99', N'Lương Mẫn Nhi', '0556475242', 'female', 'nhiluoman19@gmail.com', 'doctor', 'active' ),
	('01c1fa1b81297a2de21056f35303ad84', 'fherajfhriuehfraufha94hf98fh93hf', 'kietnganhmin47', '5f4dcc3b5aa765d61d8327deb882cf99', N'Nguyễn Minh Anh Kiệt', '0556253524', 'male', 'kietnganhmin47@gmail.com', 'doctor', 'active' ),
	('fe30e1ff175e10b1c538613084ab2417', 'fnerajfha974fhy4973haf9ha49hf338', 'thaodothithu64', '5f4dcc3b5aa765d61d8327deb882cf99', N'Đoàn Thị Thu Thảo', '0534719873', 'female', 'thaodothithu64@gmail.com', 'doctor', 'active' ),
	('0fe30e184ab12417ff175eb1c5386130', '0fe30e1ff175eb1c538613084ab12417', 'dungdomanh57', '5f4dcc3b5aa765d61d8327deb882cf99', N'Đỗ Mạnh Dũng', '0512345946', 'male', 'dungdomanh57@gmail.com', 'doctor', 'active' ),
	('t6fyt65rftvygt6f5tvyg65ftvgy6fhh', '4d5fg5df6gyd5f6g5f6g5df6gy5rf6gh', 'lankimdo657', '5f4dcc3b5aa765d61d8327deb882cf99', N'Đỗ Kim Lân', '0903373785', 'male', 'lankimdo657@gmail.com', 'doctor', 'active' ),
	('hebrf38f7h348fb384fb38ybf38byfr3', 'f7384hfw34f38wb4fw38h4f03h43f93f', 'dongovan456qwer', '5f4dcc3b5aa765d61d8327deb882cf99', N'Ngô Văn Đô', '0512345469', 'male', 'dongovan456@gmail.com', 'staff', 'active' ),
	('f7834yf8h3w9b93wfb943hf943f934hf', 'ngseriug908hg93h4g934nf34f938f4h', 'thaongthiphuong6969', '5f4dcc3b5aa765d61d8327deb882cf99', N'Nguyễn Thị Phương Thảo', '0705536741', 'female', 'thaongthiphuong6969@gmail.com', 'staff', 'active' );

-- Insert data into the Customer table

INSERT INTO Customer (customerID, dob, customerAddress)
VALUES 
	('2c9320b8639fc9e1c784880bbecfdfa1', '1990-02-15', N'123 Nguyễn Văn A, Phường Bến Nghé, Quận 1, TP.HCM'),
    ('3ff56e23cc31e9c9a85bc037341a65ee', '1985-07-28', N'456 Lê Lợi, Phường Bến Nghé, Quận 1, TP.HCM'),
    ('3ff5njfnijhfdsf8845bc037341a65ee', '1978-11-03', N'258/3 Ngô Quyền, Phường Phạm Ngũ Lão, Quận 1, TP.HCM'),
	('82d5cf38dc655bd1722ac5d4d350bce3', '1992-09-10', N'369/2 Hàm Nghi, Phường Nguyễn Thái Bình, Quận 1, TP.HCM'),
	('1c4f04058f291642c159e27e1554ddf8', '1987-04-21', N'753/1 Trần Quang Khải, Phường Tân Định, Quận 1, TP.HCM'),
	('c0637bb4f3d7531d936f2686b9672a66', '1995-12-06', N'123 Nguyễn Cư Trinh, Phường Nguyễn Cư Trinh, Quận 1, TP.HCM'),
	('11eee90acf45377f4cc3ca0758f2bf30', '1982-03-17', N'456 Bùi Thị Xuân, Phường Phạm Ngũ Lão, Quận 1, TP.HCM'),
	('48b31829bc7599f232d06a1e686534bd', '1998-08-24', N'789 Huỳnh Thúc Kháng, Phường Bến Nghé, Quận 1, TP.HCM'),
	('4e192dacb208ceb2413376e2ad3b3db8', '1975-01-09', N'321 Phạm Ngũ Lão, Phường Phạm Ngũ Lão, Quận 1, TP.HCM'),
	('6cb9c7dba65dd3d9e1946c5dd265dbcd', '1993-06-12', N'654 Nguyễn Công Trứ, Phường Nguyễn Cư Trinh, Quận 1, TP.HCM'),
	('45b76de8eb0fd35e124955a2ff2473db', '1989-10-27', N'987 Nguyễn Du, Phường Bến Thành, Quận 1, TP.HCM'),
	('ea03ec90c8836f413784ee96e50a4f11', '1996-05-02', N'147 Hồ Tùng Mậu, Phường Bến Nghé, Quận 1, TP.HCM'),
	('bc6c32dbbb8bd0660d158b08d7cad96f', '1983-08-14', N'258 Lê Thánh Tôn, Phường Bến Nghé, Quận 1, TP.HCM'),
	('7e55fcb3a457634cfa78b49bdb774b3a', '1979-12-19', N'369 Lê Thị Riêng, Phường Bến Thành, Quận 1, TP.HCM'),
	('d8869200b4fbde66a3475d6e730e1b6d', '1991-03-23', N'753 Công Trường Mê Linh, Phường Bến Nghé, Quận 1, TP.HCM'),
	('128ce6812392dce1ca5a6919f03a26a2', '1986-09-05', N'753 Đề Thám, Phường 1, Quận 5, TP.HCM'),
	('87ccfc84f4eb846b5aeb0e04f6ea12ea', '1994-02-18', N'951 Trần Phú, Phường 2, Quận 5, TP.HCM'),
	('715c43d86b98da2212d7a9c9ce9d3062', '1977-07-31', N'369 Nguyễn Chí Thanh, Phường 9, Quận 5, TP.HCM'),
	('a69b4087d281cb16efaa6bc91308f64d', '1999-11-11', N'654 Hậu Giang, Phường 12, Quận 6, TP.HCM'),
	('61dd2b9c89fdcc1dce9fb553bf29cd8d', '1984-04-26', N'987 An Dương Vương, Phường 16, Quận 6, TP.HCM'),
	('03b016eef369ef40bba639aa4f04341b', '1997-01-07', N'123 Võ Văn Kiệt, Phường Cầu Ông Lãnh, Quận 8, TP.HCM'),
	('f8b0ed4e38a71924a7d2bca97029778a', '1981-06-16', N'456 Lê Đại Hành, Phường 15, Quận 8, TP.HCM'),
	('5cbae581d99c1c3d17b8c09b07c54892', '1976-11-29', N'789 Phạm Hùng, Phường 14, Quận 8, TP.HCM'),
	('20e843f249d75ada67c1a2eef0dac92e', '1992-03-03', N'321 Tỉnh Lộ 10, Phường Bình Hưng Hòa, Quận 8, TP.HCM'),
	('712da4f1096f6ae70d0f3c091b84ae7c', '1988-08-08', N'123/4 Nguyễn Văn A, Phường Bến Nghé, Quận 1, TP.HCM'),
	('b03c6f5a51ee06d3dbd17d0e38507ede', '1995-12-13', N'456/7 Lê Lợi, Phường Bến Nghé, Quận 1, TP.HCM'),
	('b83bb75b898592b75232c4816842d824', '1980-05-25', N'987/6 Nguyễn Huệ, Phường Bến Nghé, Quận 1, TP.HCM'),
	('a68757602ea7419f0e2313a842be9abf', '1993-10-09', N'753/1 Trần Quang Khải, Phường Tân Định, Quận 1, TP.HCM'),
	('2b1850783245c06d0b782a4c9cd6a0a0', '1987-02-22', N'147/9 Lý Tự Trọng, Phường Bến Thành, Quận 1, TP.HCM'),
	('eb70ed9c4c32afea8f482dc873be4f6a', '1999-07-05', N'5 Trần Khắc Chân, Phường Tân Định, Quận 1, TP.HCM');

INSERT INTO Speciality (specialityID, specialityName)
VALUES
    ('e6157a31d2c5e20dc446f4f42fc0d40f', 'general'),
    ('52f6743e4719de9a35e1e2e1c09d6d52', 'surgery'),
    ('8c15dfb7f4f3d4789ed0c043b1512e34', 'resuscitation'),
    ('4a30b3f33f96b639ab20dce9f0b8b8db', 'image analysation'),
    ('7e2dc1364e2e1bdc9efc1669a17a9e45', 'beautify'),
	('bfiwafjnbeaffaiuwhfa9fhawfa56565', 'genetics'),
	('q3d45fgyuygf5d45f6bnu6ftvgbygdsd', 'Animal Nutrition');

	
INSERT INTO Doctor (doctorID,specialityID, docAge, academicTitle,degree,yearsOfExperience)
VALUES
	('ae114dac5897fbcfd25797bf4be08fd3' , 'e6157a31d2c5e20dc446f4f42fc0d40f' , 35 ,'','tiến sĩ',10),
	('9eae70b054be6eba305323d8c9106cfb' , 'e6157a31d2c5e20dc446f4f42fc0d40f' , 37 ,'',N'thạc sĩ',12),
	('c8aa14ffb7da0912c84635aa2ee0bb62' , '52f6743e4719de9a35e1e2e1c09d6d52' , 50 ,N'giáo sư',N'tiến sĩ',25),
	('dd0e3f50648088bfecc501f809a06ca8' , '4a30b3f33f96b639ab20dce9f0b8b8db' , 30 , '' , 'thạc sĩ' , 5 ),
	('62fe46dae9470f311d52973a6eeb6a1a' , '4a30b3f33f96b639ab20dce9f0b8b8db' , 35 , '' , 'tiến sĩ' , 10 ),
	('9c6189a20beb35a93df963e3b48eb9b0' , '7e2dc1364e2e1bdc9efc1669a17a9e45' , 40 , '' , N'thạc sĩ' , 15 ),
	('1c38dd30f9e415b3a34879be077381ce' , '8c15dfb7f4f3d4789ed0c043b1512e34' , 45 , N'phó giáo sư' , N'tiến sĩ' , 20 ),
	('21fc9daf44e2637d7972bd248c83577d' , 'e6157a31d2c5e20dc446f4f42fc0d40f' , 50 , N'phó giáo sư' , N'tiến sĩ' , 25 ),
	('01c1fa1b81297a2de21056f35303ad84' , '52f6743e4719de9a35e1e2e1c09d6d52' , 55 , N'giáo sư' , N'tiến sĩ' , 30 ),
	('fe30e1ff175e10b1c538613084ab2417' , '52f6743e4719de9a35e1e2e1c09d6d52' , 46 , '' , N'tiến sĩ' , 19 ),
	('0fe30e184ab12417ff175eb1c5386130' , 'bfiwafjnbeaffaiuwhfa9fhawfa56565' , 56 , N'giáo sư' , N'tiến sĩ' , 31 ),
	('t6fyt65rftvygt6f5tvyg65ftvgy6fhh' , 'q3d45fgyuygf5d45f6bnu6ftvgbygdsd' , 42 , '' , N'tiến sĩ', 17);

INSERT INTO TimeSlot (timeSlotID, timeSlot, day_)
VALUES
    ('7274b557467ff107537ffe6f642cde39', '07:00:00', 'Monday'),
    ('a54060a06aa0e97217726362a5b580d3', '08:00:00', 'Monday'),
    ('e2283b7f6695530a79793e3fe172155c', '09:00:00', 'Monday'),
    ('4e4b39473c2dfc3e918ee79b1c28fc6f', '10:00:00', 'Monday'),
    ('0f34a633c6767c1e46e90dad2700ce76', '13:00:00', 'Monday'),
    ('6ba12b34e7c18eff6380f8b22ae6211e', '14:00:00', 'Monday'),
    ('1468c48caf3c8acd45c13732fa1c7797', '15:00:00', 'Monday'),
    ('5c9ba69a58918129f033a2c25e250584', '16:00:00', 'Monday'),
    ('0d5408947d23dd60557de6b616352275', '07:00:00', 'Tuesday'),
    ('3deb11e87f2a937320bc503ceff3bda0', '08:00:00', 'Tuesday'),
    ('657be9bfb1eed80938b24e3b154863cb', '09:00:00', 'Tuesday'),
    ('7b84cc4412f9e9a4213a9f979be42063', '10:00:00', 'Tuesday'),
    ('b57c1f7068f9c8220f290b95b7183fc9', '13:00:00', 'Tuesday'),
    ('c397d73df0a2ad5dcb930bd8d26cc2f6', '14:00:00', 'Tuesday'),
    ('b312f680c0e4eac9c2a3bd9bf2260267', '15:00:00', 'Tuesday'),
    ('58ceaa7c941c896dcea4d42bbd40b463', '16:00:00', 'Tuesday'),
    ('b798d08ebebbcabf9315bcef98e8263b', '07:00:00', 'Wednesday'),
    ('9436e53cce52225010e09858fc287123', '08:00:00', 'Wednesday'),
    ('c789ff5a8a615b3cbd55b12d431c1a51', '09:00:00', 'Wednesday'),
    ('0227321c75909512447393796f173788', '10:00:00', 'Wednesday'),
    ('86fc882bb1aadc489464a8ecb5f43a30', '13:00:00', 'Wednesday'),
    ('b82fece225c99d7b1faa427866745620', '14:00:00', 'Wednesday'),
    ('3e895d7bd28f3f7687197d2dd2c5558e', '15:00:00', 'Wednesday'),
    ('0b0ac0d3db2f67dd2626c726e51b0612', '16:00:00', 'Wednesday'),
    ('0f6c341110df21c899097b659454e1ab', '07:00:00', 'Thursday'),
    ('71071e13d9c8cd2902737b7e39f32a5a', '08:00:00', 'Thursday'),
    ('3cd774fd522ed4a7b81dc2e3ed0373bd', '09:00:00', 'Thursday'),
    ('516ab8138f50bbbb0be18ceed38b6ad3', '10:00:00', 'Thursday'),
    ('9eea7e14fbd37b455d69e7114399aa0a', '13:00:00', 'Thursday'),
    ('4db7ce38baceaddfc93e9bdcfe0a7f57', '14:00:00', 'Thursday'),
    ('8d84a3d75c4f560729956e1fd9886ded', '15:00:00', 'Thursday'),
    ('4aec19307175805430f2cccde15d88a3', '16:00:00', 'Thursday'),
    ('4940cc64f161f2caf8fb70416d0c41cc', '07:00:00', 'Friday'),
    ('68e185b8d481c5652842b42ef66b3210', '08:00:00', 'Friday'),
    ('9d35c51b03f46f6edd9aaa81c4cfc3c4', '09:00:00', 'Friday'),
    ('8accf3a256bcc4e7335afe49531eaac6', '10:00:00', 'Friday'),
    ('13c16787a7506cfefc1f38586a793196', '13:00:00', 'Friday'),
    ('7be65563411c5ce7cd508f04c8a54ecb', '14:00:00', 'Friday'),
    ('8e397cbb235075a9cb231b2c3b316011', '15:00:00', 'Friday'),
    ('e5bf5358b106ba77625e21497cb2a446', '16:00:00', 'Friday'),
    ('7146c2b1971837ea3045d243802bd8a2', '07:00:00', 'Saturday'),
    ('88549bf6059c27cd9bf49508373f6dad', '08:00:00', 'Saturday'),
    ('14efd87c0e8f2e3d045efc1cda0ccba0', '09:00:00', 'Saturday'),
    ('92d969030097f06af642a4577606afe0', '10:00:00', 'Saturday'),
    ('b02c69a820861a57ac38b4282399335c', '13:00:00', 'Saturday'),
    ('7fc51e03321ce0adc4413168f12a8eb1', '14:00:00', 'Saturday'),
    ('02a3908fe51e3235f7a535358c5c8730', '15:00:00', 'Saturday'),
    ('718838b54bc5450a76c6a75576021dc3', '16:00:00', 'Saturday'),
    ('85688ffa8d935b9da96e2a680aaa4e34', '07:00:00', 'Sunday'),
    ('35214a23d76865f60f6d837db69f87fd', '08:00:00', 'Sunday'),
    ('ce26b41ff7120b6f14c47596d9cb96b0', '09:00:00', 'Sunday'),
    ('12bc604e930e56d53915a09b61bc459a', '10:00:00', 'Sunday'),
    ('5a71a95534bbd12150558baa83f945de', '13:00:00', 'Sunday'),
    ('5c4960d3243606ca79b7692f8a4c9957', '14:00:00', 'Sunday'),
    ('966de85e9140af61d6ee26c11feb6f78', '15:00:00', 'Sunday'),
    ('a2855125bdc9e06b5313b3f827f07705', '16:00:00', 'Sunday');

INSERT INTO DoctorTimeSlot (doctorID, timeSlotID)
SELECT doctorID, timeSlotID
FROM
(
    -- Monday
    SELECT 'ae114dac5897fbcfd25797bf4be08fd3' AS doctorID, timeSlotID, ROW_NUMBER() OVER (ORDER BY timeSlotID) AS row_num
    FROM TimeSlot
    WHERE day_ = 'Monday'
) AS subquery
WHERE row_num <= 8
UNION ALL
SELECT doctorID, timeSlotID
FROM
(
    -- Tuesday
    SELECT 'ae114dac5897fbcfd25797bf4be08fd3' AS doctorID, timeSlotID, ROW_NUMBER() OVER (ORDER BY timeSlotID) AS row_num
    FROM TimeSlot
    WHERE day_ = 'Tuesday'
) AS subquery
WHERE row_num <= 8
UNION ALL
SELECT doctorID, timeSlotID
FROM
(    -- Wednesday
    SELECT 'ae114dac5897fbcfd25797bf4be08fd3' AS doctorID, timeSlotID, ROW_NUMBER() OVER (ORDER BY timeSlotID) AS row_num
    FROM TimeSlot
    WHERE day_ = 'Wednesday'
) AS subquery
WHERE row_num <= 8
UNION ALL
SELECT doctorID, timeSlotID
FROM
(
    -- Thursday
    SELECT 'ae114dac5897fbcfd25797bf4be08fd3' AS doctorID, timeSlotID, ROW_NUMBER() OVER (ORDER BY timeSlotID) AS row_num
    FROM TimeSlot
    WHERE day_ = 'Thursday'
) AS subquery
WHERE row_num <= 8
UNION ALL
SELECT doctorID, timeSlotID
FROM
(
    -- Friday
    SELECT 'ae114dac5897fbcfd25797bf4be08fd3' AS doctorID, timeSlotID, ROW_NUMBER() OVER (ORDER BY timeSlotID) AS row_num
    FROM TimeSlot
    WHERE day_ = 'Friday'
) AS subquery
WHERE row_num <= 8
UNION ALL






SELECT doctorID, timeSlotID
FROM
(
    -- Monday
    SELECT '9eae70b054be6eba305323d8c9106cfb' AS doctorID, timeSlotID, ROW_NUMBER() OVER (ORDER BY timeSlotID) AS row_num
    FROM TimeSlot
    WHERE day_ = 'Monday'
) AS subquery
WHERE row_num <= 8
UNION ALL
SELECT doctorID, timeSlotID
FROM
(
    -- Tuesday
    SELECT '9eae70b054be6eba305323d8c9106cfb' AS doctorID, timeSlotID, ROW_NUMBER() OVER (ORDER BY timeSlotID) AS row_num
    FROM TimeSlot
    WHERE day_ = 'Tuesday'
) AS subquery
WHERE row_num <= 8
UNION ALL
SELECT doctorID, timeSlotID
FROM
(
    -- Wednesday
    SELECT '9eae70b054be6eba305323d8c9106cfb' AS doctorID, timeSlotID, ROW_NUMBER() OVER (ORDER BY timeSlotID) AS row_num
    FROM TimeSlot
    WHERE day_ = 'Wednesday'
) AS subquery
WHERE row_num <= 8
UNION ALL
SELECT doctorID, timeSlotID
FROM
(
    -- Thursday
    SELECT '9eae70b054be6eba305323d8c9106cfb' AS doctorID, timeSlotID, ROW_NUMBER() OVER (ORDER BY timeSlotID) AS row_num
    FROM TimeSlot
    WHERE day_ = 'Thursday'
) AS subquery
WHERE row_num <= 8
UNION ALL
SELECT doctorID, timeSlotID
FROM
(
    -- Friday
    SELECT '9eae70b054be6eba305323d8c9106cfb' AS doctorID, timeSlotID, ROW_NUMBER() OVER (ORDER BY timeSlotID) AS row_num
    FROM TimeSlot
    WHERE day_ = 'Friday'
) AS subquery
WHERE row_num <= 8
UNION ALL
SELECT doctorID, timeSlotID
FROM
(
    -- Saturday
    SELECT '9eae70b054be6eba305323d8c9106cfb' AS doctorID, timeSlotID, ROW_NUMBER() OVER (ORDER BY timeSlotID) AS row_num
    FROM TimeSlot
    WHERE day_ = 'Saturday'
) AS subquery
WHERE row_num <= 8






UNION ALL
SELECT doctorID, timeSlotID
FROM
(
    -- Monday
    SELECT 'c8aa14ffb7da0912c84635aa2ee0bb62' AS doctorID, timeSlotID, ROW_NUMBER() OVER (ORDER BY timeSlotID) AS row_num
    FROM TimeSlot
    WHERE day_ = 'Monday'
) AS subquery
WHERE row_num <= 8
UNION ALL
SELECT doctorID, timeSlotID
FROM
(    -- Wednesday
    SELECT 'c8aa14ffb7da0912c84635aa2ee0bb62' AS doctorID, timeSlotID, ROW_NUMBER() OVER (ORDER BY timeSlotID) AS row_num
    FROM TimeSlot
    WHERE day_ = 'Wednesday'
) AS subquery
WHERE row_num <= 8
UNION ALL
SELECT doctorID, timeSlotID
FROM
(
    -- Thursday
    SELECT 'c8aa14ffb7da0912c84635aa2ee0bb62' AS doctorID, timeSlotID, ROW_NUMBER() OVER (ORDER BY timeSlotID) AS row_num
    FROM TimeSlot
    WHERE day_ = 'Thursday'
) AS subquery
WHERE row_num <= 8
UNION ALL
SELECT doctorID, timeSlotID
FROM
(
    -- Friday
    SELECT 'c8aa14ffb7da0912c84635aa2ee0bb62' AS doctorID, timeSlotID, ROW_NUMBER() OVER (ORDER BY timeSlotID) AS row_num
    FROM TimeSlot
    WHERE day_ = 'Friday'
) AS subquery
WHERE row_num <= 8
UNION ALL
SELECT doctorID, timeSlotID
FROM
(
    -- Saturday
    SELECT 'c8aa14ffb7da0912c84635aa2ee0bb62' AS doctorID, timeSlotID, ROW_NUMBER() OVER (ORDER BY timeSlotID) AS row_num
    FROM TimeSlot
    WHERE day_ = 'Saturday'
) AS subquery
WHERE row_num <= 8





UNION ALL
SELECT doctorID, timeSlotID
FROM
(
-- Monday
    SELECT 'dd0e3f50648088bfecc501f809a06ca8' AS doctorID, timeSlotID, ROW_NUMBER() OVER (ORDER BY timeSlotID) AS row_num
    FROM TimeSlot
    WHERE day_ = 'Monday'
) AS subquery
WHERE row_num <= 8
UNION ALL
SELECT doctorID, timeSlotID
FROM
(
    -- Tuesday
    SELECT 'dd0e3f50648088bfecc501f809a06ca8' AS doctorID, timeSlotID, ROW_NUMBER() OVER (ORDER BY timeSlotID) AS row_num
    FROM TimeSlot
    WHERE day_ = 'Tuesday'
) AS subquery
WHERE row_num <= 8
UNION ALL
SELECT doctorID, timeSlotID
FROM
(    -- Wednesday
    SELECT 'dd0e3f50648088bfecc501f809a06ca8' AS doctorID, timeSlotID, ROW_NUMBER() OVER (ORDER BY timeSlotID) AS row_num
    FROM TimeSlot
    WHERE day_ = 'Wednesday'
) AS subquery
WHERE row_num <= 8
UNION ALL
SELECT doctorID, timeSlotID
FROM
(
    -- Thursday
    SELECT 'dd0e3f50648088bfecc501f809a06ca8' AS doctorID, timeSlotID, ROW_NUMBER() OVER (ORDER BY timeSlotID) AS row_num
    FROM TimeSlot
    WHERE day_ = 'Thursday'
) AS subquery
WHERE row_num <= 8
UNION ALL
SELECT doctorID, timeSlotID
FROM
(
    -- Saturday
    SELECT 'dd0e3f50648088bfecc501f809a06ca8' AS doctorID, timeSlotID, ROW_NUMBER() OVER (ORDER BY timeSlotID) AS row_num
    FROM TimeSlot
    WHERE day_ = 'Saturday'
) AS subquery
WHERE row_num <= 8







UNION ALL
SELECT doctorID, timeSlotID
FROM
(
    -- Monday
    SELECT '62fe46dae9470f311d52973a6eeb6a1a' AS doctorID, timeSlotID, ROW_NUMBER() OVER (ORDER BY timeSlotID) AS row_num
    FROM TimeSlot
    WHERE day_ = 'Monday'
) AS subquery
WHERE row_num <= 8
UNION ALL
SELECT doctorID, timeSlotID
FROM
(
    -- Tuesday
    SELECT '62fe46dae9470f311d52973a6eeb6a1a' AS doctorID, timeSlotID, ROW_NUMBER() OVER (ORDER BY timeSlotID) AS row_num
    FROM TimeSlot
    WHERE day_ = 'Tuesday'
) AS subquery
WHERE row_num <= 8
UNION ALL
SELECT doctorID, timeSlotID
FROM
(    -- Wednesday
    SELECT '62fe46dae9470f311d52973a6eeb6a1a' AS doctorID, timeSlotID, ROW_NUMBER() OVER (ORDER BY timeSlotID) AS row_num
    FROM TimeSlot
    WHERE day_ = 'Wednesday'
) AS subquery
WHERE row_num <= 8
UNION ALL
SELECT doctorID, timeSlotID
FROM
(
    -- Thursday
    SELECT '62fe46dae9470f311d52973a6eeb6a1a' AS doctorID, timeSlotID, ROW_NUMBER() OVER (ORDER BY timeSlotID) AS row_num
    FROM TimeSlot
    WHERE day_ = 'Thursday'
) AS subquery
WHERE row_num <= 8
UNION ALL
SELECT doctorID, timeSlotID
FROM
(
    -- Friday
    SELECT '62fe46dae9470f311d52973a6eeb6a1a' AS doctorID, timeSlotID, ROW_NUMBER() OVER (ORDER BY timeSlotID) AS row_num
    FROM TimeSlot
    WHERE day_ = 'Friday'
) AS subquery
WHERE row_num <= 8
UNION ALL
SELECT doctorID, timeSlotID
FROM
(
    -- Saturday
    SELECT '62fe46dae9470f311d52973a6eeb6a1a' AS doctorID, timeSlotID, ROW_NUMBER() OVER (ORDER BY timeSlotID) AS row_num
    FROM TimeSlot
    WHERE day_ = 'Saturday'
) AS subquery
WHERE row_num <= 8
UNION ALL
SELECT doctorID, timeSlotID
FROM
(
    -- Sunday
    SELECT '62fe46dae9470f311d52973a6eeb6a1a' AS doctorID, timeSlotID, ROW_NUMBER() OVER (ORDER BY timeSlotID) AS row_num
    FROM TimeSlot
    WHERE day_ = 'Sunday'
) AS subquery
WHERE row_num <= 8





UNION ALL
SELECT doctorID, timeSlotID
FROM
(
    -- Monday
    SELECT '9c6189a20beb35a93df963e3b48eb9b0' AS doctorID, timeSlotID, ROW_NUMBER() OVER (ORDER BY timeSlotID) AS row_num
    FROM TimeSlot
    WHERE day_ = 'Monday'
) AS subquery
WHERE row_num <= 8
UNION ALL
SELECT doctorID, timeSlotID
FROM
(
    -- Tuesday
    SELECT '9c6189a20beb35a93df963e3b48eb9b0' AS doctorID, timeSlotID, ROW_NUMBER() OVER (ORDER BY timeSlotID) AS row_num
    FROM TimeSlot
    WHERE day_ = 'Tuesday'
) AS subquery
WHERE row_num <= 8
UNION ALL
SELECT doctorID, timeSlotID
FROM
(
    -- Thursday
    SELECT '9c6189a20beb35a93df963e3b48eb9b0' AS doctorID, timeSlotID, ROW_NUMBER() OVER (ORDER BY timeSlotID) AS row_num
    FROM TimeSlot
    WHERE day_ = 'Thursday'
) AS subquery
WHERE row_num <= 8
UNION ALL
SELECT doctorID, timeSlotID
FROM
(
    -- Friday
    SELECT '9c6189a20beb35a93df963e3b48eb9b0' AS doctorID, timeSlotID, ROW_NUMBER() OVER (ORDER BY timeSlotID) AS row_num
    FROM TimeSlot
    WHERE day_ = 'Friday'
) AS subquery
WHERE row_num <= 8
UNION ALL
SELECT doctorID, timeSlotID
FROM
(
    -- Saturday
    SELECT '9c6189a20beb35a93df963e3b48eb9b0' AS doctorID, timeSlotID, ROW_NUMBER() OVER (ORDER BY timeSlotID) AS row_num
    FROM TimeSlot
    WHERE day_ = 'Saturday'
) AS subquery
WHERE row_num <= 8
UNION ALL
SELECT doctorID, timeSlotID
FROM
(
    -- Sunday
    SELECT '9c6189a20beb35a93df963e3b48eb9b0' AS doctorID, timeSlotID, ROW_NUMBER() OVER (ORDER BY timeSlotID) AS row_num
    FROM TimeSlot
    WHERE day_ = 'Sunday'
) AS subquery
WHERE row_num <= 8





UNION ALL
SELECT doctorID, timeSlotID
FROM
(
    -- Monday
    SELECT '1c38dd30f9e415b3a34879be077381ce' AS doctorID, timeSlotID, ROW_NUMBER() OVER (ORDER BY timeSlotID) AS row_num
    FROM TimeSlot
    WHERE day_ = 'Monday'
) AS subquery
WHERE row_num <= 8
UNION ALL
SELECT doctorID, timeSlotID
FROM
(
    -- Tuesday
    SELECT '1c38dd30f9e415b3a34879be077381ce' AS doctorID, timeSlotID, ROW_NUMBER() OVER (ORDER BY timeSlotID) AS row_num
    FROM TimeSlot
    WHERE day_ = 'Tuesday'
) AS subquery
WHERE row_num <= 8
UNION ALL
SELECT doctorID, timeSlotID
FROM
(    -- Wednesday
    SELECT '1c38dd30f9e415b3a34879be077381ce' AS doctorID, timeSlotID, ROW_NUMBER() OVER (ORDER BY timeSlotID) AS row_num
    FROM TimeSlot
    WHERE day_ = 'Wednesday'
) AS subquery
WHERE row_num <= 8
UNION ALL
SELECT doctorID, timeSlotID
FROM
(
    -- Thursday
    SELECT '1c38dd30f9e415b3a34879be077381ce' AS doctorID, timeSlotID, ROW_NUMBER() OVER (ORDER BY timeSlotID) AS row_num
    FROM TimeSlot
    WHERE day_ = 'Thursday'
) AS subquery
WHERE row_num <= 8
UNION ALL
SELECT doctorID, timeSlotID
FROM
(
    -- Friday
    SELECT '1c38dd30f9e415b3a34879be077381ce' AS doctorID, timeSlotID, ROW_NUMBER() OVER (ORDER BY timeSlotID) AS row_num
    FROM TimeSlot
    WHERE day_ = 'Friday'
) AS subquery
WHERE row_num <= 8
UNION ALL
SELECT doctorID, timeSlotID
FROM
(
    -- Saturday
    SELECT '1c38dd30f9e415b3a34879be077381ce' AS doctorID, timeSlotID, ROW_NUMBER() OVER (ORDER BY timeSlotID) AS row_num
    FROM TimeSlot
    WHERE day_ = 'Saturday'
) AS subquery
WHERE row_num <= 8






UNION ALL
SELECT doctorID, timeSlotID
FROM
(
    -- Monday
    SELECT '21fc9daf44e2637d7972bd248c83577d' AS doctorID, timeSlotID, ROW_NUMBER() OVER (ORDER BY timeSlotID) AS row_num
    FROM TimeSlot
    WHERE day_ = 'Monday'
) AS subquery
WHERE row_num <= 8
UNION ALL
SELECT doctorID, timeSlotID
FROM
(
    -- Tuesday
    SELECT '21fc9daf44e2637d7972bd248c83577d' AS doctorID, timeSlotID, ROW_NUMBER() OVER (ORDER BY timeSlotID) AS row_num
    FROM TimeSlot
    WHERE day_ = 'Tuesday'
) AS subquery
WHERE row_num <= 8
UNION ALL
SELECT doctorID, timeSlotID
FROM
(
    -- Thursday
    SELECT '21fc9daf44e2637d7972bd248c83577d' AS doctorID, timeSlotID, ROW_NUMBER() OVER (ORDER BY timeSlotID) AS row_num
    FROM TimeSlot
    WHERE day_ = 'Thursday'
) AS subquery
WHERE row_num <= 8
UNION ALL
SELECT doctorID, timeSlotID
FROM
(
    -- Friday
    SELECT '21fc9daf44e2637d7972bd248c83577d' AS doctorID, timeSlotID, ROW_NUMBER() OVER (ORDER BY timeSlotID) AS row_num
    FROM TimeSlot
    WHERE day_ = 'Friday'
) AS subquery
WHERE row_num <= 8
UNION ALL
SELECT doctorID, timeSlotID
FROM
(
    -- Saturday
    SELECT '21fc9daf44e2637d7972bd248c83577d' AS doctorID, timeSlotID, ROW_NUMBER() OVER (ORDER BY timeSlotID) AS row_num
    FROM TimeSlot
    WHERE day_ = 'Saturday'
) AS subquery
WHERE row_num <= 8
UNION ALL
SELECT doctorID, timeSlotID
FROM
(
    -- Sunday
    SELECT '21fc9daf44e2637d7972bd248c83577d' AS doctorID, timeSlotID, ROW_NUMBER() OVER (ORDER BY timeSlotID) AS row_num
    FROM TimeSlot
    WHERE day_ = 'Sunday'
) AS subquery
WHERE row_num <= 8





UNION ALL
SELECT doctorID, timeSlotID
FROM
(
    -- Monday
    SELECT '01c1fa1b81297a2de21056f35303ad84' AS doctorID, timeSlotID, ROW_NUMBER() OVER (ORDER BY timeSlotID) AS row_num
    FROM TimeSlot
    WHERE day_ = 'Monday'
) AS subquery
WHERE row_num <= 8
UNION ALL
SELECT doctorID, timeSlotID
FROM
(
    -- Tuesday
    SELECT '01c1fa1b81297a2de21056f35303ad84' AS doctorID, timeSlotID, ROW_NUMBER() OVER (ORDER BY timeSlotID) AS row_num
    FROM TimeSlot
    WHERE day_ = 'Tuesday'
) AS subquery
WHERE row_num <= 8
UNION ALL
SELECT doctorID, timeSlotID
FROM
(    -- Wednesday
    SELECT '01c1fa1b81297a2de21056f35303ad84' AS doctorID, timeSlotID, ROW_NUMBER() OVER (ORDER BY timeSlotID) AS row_num
    FROM TimeSlot
    WHERE day_ = 'Wednesday'
) AS subquery
WHERE row_num <= 8
UNION ALL
SELECT doctorID, timeSlotID
FROM
(
    -- Thursday
    SELECT '01c1fa1b81297a2de21056f35303ad84' AS doctorID, timeSlotID, ROW_NUMBER() OVER (ORDER BY timeSlotID) AS row_num
    FROM TimeSlot
    WHERE day_ = 'Thursday'
) AS subquery
WHERE row_num <= 8
UNION ALL
SELECT doctorID, timeSlotID
FROM
(
    -- Friday
    SELECT '01c1fa1b81297a2de21056f35303ad84' AS doctorID, timeSlotID, ROW_NUMBER() OVER (ORDER BY timeSlotID) AS row_num
    FROM TimeSlot
    WHERE day_ = 'Friday'
) AS subquery
WHERE row_num <= 8
UNION ALL
SELECT doctorID, timeSlotID
FROM
(
    -- Saturday
    SELECT '01c1fa1b81297a2de21056f35303ad84' AS doctorID, timeSlotID, ROW_NUMBER() OVER (ORDER BY timeSlotID) AS row_num
    FROM TimeSlot
    WHERE day_ = 'Saturday'
) AS subquery
WHERE row_num <= 8
UNION ALL
SELECT doctorID, timeSlotID
FROM
(
    -- Sunday
    SELECT '01c1fa1b81297a2de21056f35303ad84' AS doctorID, timeSlotID, ROW_NUMBER() OVER (ORDER BY timeSlotID) AS row_num
    FROM TimeSlot
    WHERE day_ = 'Sunday'
) AS subquery
WHERE row_num <= 8





UNION ALL
SELECT doctorID, timeSlotID
FROM
(
    -- Monday
    SELECT 'fe30e1ff175e10b1c538613084ab2417' AS doctorID, timeSlotID, ROW_NUMBER() OVER (ORDER BY timeSlotID) AS row_num
    FROM TimeSlot
    WHERE day_ = 'Monday'
) AS subquery
WHERE row_num <= 8
UNION ALL
SELECT doctorID, timeSlotID
FROM
(
    -- Tuesday
    SELECT 'fe30e1ff175e10b1c538613084ab2417' AS doctorID, timeSlotID, ROW_NUMBER() OVER (ORDER BY timeSlotID) AS row_num
    FROM TimeSlot
    WHERE day_ = 'Tuesday'
) AS subquery
WHERE row_num <= 8
UNION ALL
SELECT doctorID, timeSlotID
FROM
(    -- Wednesday
    SELECT 'fe30e1ff175e10b1c538613084ab2417' AS doctorID, timeSlotID, ROW_NUMBER() OVER (ORDER BY timeSlotID) AS row_num
    FROM TimeSlot
    WHERE day_ = 'Wednesday'
) AS subquery
WHERE row_num <= 8
UNION ALL
SELECT doctorID, timeSlotID
FROM
(
    -- Thursday
    SELECT 'fe30e1ff175e10b1c538613084ab2417' AS doctorID, timeSlotID, ROW_NUMBER() OVER (ORDER BY timeSlotID) AS row_num
    FROM TimeSlot
    WHERE day_ = 'Thursday'
) AS subquery
WHERE row_num <= 8
UNION ALL
SELECT doctorID, timeSlotID
FROM
(
    -- Friday
    SELECT 'fe30e1ff175e10b1c538613084ab2417' AS doctorID, timeSlotID, ROW_NUMBER() OVER (ORDER BY timeSlotID) AS row_num
    FROM TimeSlot
    WHERE day_ = 'Friday'
) AS subquery
WHERE row_num <= 8
UNION ALL
SELECT doctorID, timeSlotID
FROM
(
    -- Saturday
    SELECT 'fe30e1ff175e10b1c538613084ab2417' AS doctorID, timeSlotID, ROW_NUMBER() OVER (ORDER BY timeSlotID) AS row_num
    FROM TimeSlot
    WHERE day_ = 'Saturday'
) AS subquery
WHERE row_num <= 8





UNION ALL
SELECT doctorID, timeSlotID
FROM
(
    -- Monday
    SELECT '0fe30e184ab12417ff175eb1c5386130' AS doctorID, timeSlotID, ROW_NUMBER() OVER (ORDER BY timeSlotID) AS row_num
    FROM TimeSlot
    WHERE day_ = 'Monday'
) AS subquery
WHERE row_num <= 8
UNION ALL
SELECT doctorID, timeSlotID
FROM
(
    -- Tuesday
    SELECT '0fe30e184ab12417ff175eb1c5386130' AS doctorID, timeSlotID, ROW_NUMBER() OVER (ORDER BY timeSlotID) AS row_num
    FROM TimeSlot
    WHERE day_ = 'Tuesday'
) AS subquery
WHERE row_num <= 8
UNION ALL
SELECT doctorID, timeSlotID
FROM
(    -- Wednesday
    SELECT '0fe30e184ab12417ff175eb1c5386130' AS doctorID, timeSlotID, ROW_NUMBER() OVER (ORDER BY timeSlotID) AS row_num
    FROM TimeSlot
    WHERE day_ = 'Wednesday'
) AS subquery
WHERE row_num <= 8
UNION ALL
SELECT doctorID, timeSlotID
FROM
(
    -- Thursday
    SELECT '0fe30e184ab12417ff175eb1c5386130' AS doctorID, timeSlotID, ROW_NUMBER() OVER (ORDER BY timeSlotID) AS row_num
    FROM TimeSlot
    WHERE day_ = 'Thursday'
) AS subquery
WHERE row_num <= 8
UNION ALL
SELECT doctorID, timeSlotID
FROM
(
    -- Friday
    SELECT '0fe30e184ab12417ff175eb1c5386130' AS doctorID, timeSlotID, ROW_NUMBER() OVER (ORDER BY timeSlotID) AS row_num
    FROM TimeSlot
    WHERE day_ = 'Friday'
) AS subquery
WHERE row_num <= 8

UNION ALL
SELECT doctorID, timeSlotID
FROM
(
    -- Monday
    SELECT 't6fyt65rftvygt6f5tvyg65ftvgy6fhh' AS doctorID, timeSlotID, ROW_NUMBER() OVER (ORDER BY timeSlotID) AS row_num
    FROM TimeSlot
    WHERE day_ = 'Monday'
) AS subquery
WHERE row_num <= 8
UNION ALL
SELECT doctorID, timeSlotID
FROM
(
    -- Tuesday
    SELECT 't6fyt65rftvygt6f5tvyg65ftvgy6fhh' AS doctorID, timeSlotID, ROW_NUMBER() OVER (ORDER BY timeSlotID) AS row_num
    FROM TimeSlot
    WHERE day_ = 'Tuesday'
) AS subquery
WHERE row_num <= 8
UNION ALL
SELECT doctorID, timeSlotID
FROM
(    -- Wednesday
    SELECT 't6fyt65rftvygt6f5tvyg65ftvgy6fhh' AS doctorID, timeSlotID, ROW_NUMBER() OVER (ORDER BY timeSlotID) AS row_num
    FROM TimeSlot
    WHERE day_ = 'Wednesday'
) AS subquery
WHERE row_num <= 8
UNION ALL
SELECT doctorID, timeSlotID
FROM
(
    -- Thursday
    SELECT 't6fyt65rftvygt6f5tvyg65ftvgy6fhh' AS doctorID, timeSlotID, ROW_NUMBER() OVER (ORDER BY timeSlotID) AS row_num
    FROM TimeSlot
    WHERE day_ = 'Thursday'
) AS subquery
WHERE row_num <= 8
UNION ALL
SELECT doctorID, timeSlotID
FROM
(
    -- Friday
    SELECT 't6fyt65rftvygt6f5tvyg65ftvgy6fhh' AS doctorID, timeSlotID, ROW_NUMBER() OVER (ORDER BY timeSlotID) AS row_num
    FROM TimeSlot
    WHERE day_ = 'Friday'
) AS subquery
WHERE row_num <= 8;

INSERT INTO Medicine (medicineID,medicineName,medicinePrice, unit)
VALUES
	('1a27a82eb264532c271baf05c7a6e10d','Penicillin','53.01', 'pill packet'),
	('c93c634859e543a562441ca36f9bd9f0','AMTYL','18.99', 'pill'),
	('d0141bd1067e2f534fd908b54a72a1ff','Aureomycin','16.35', 'tube'),
	('c69f4b52c792233f31e11393012e5e19','Antibiotics','42.67', 'pill packet'),
	('5f7fb0d98491f5efdf52623a7d4839aa','Enrofloxacin','16.69', 'vial'),
	('8e89704ade7f8e48da32ce2d6bb15054','Coccivet','23.55', 'vial'),
	('7c7f0e401b7926cb956e1e798e7d6664','Aureomycin','16.35', 'tube'),
	('2b1937a02cb1cc8255ecfeb8dc38c5d2','D2 Remedy for Birds','23.00', 'pill packet'),
	('589ff60828e99f431d7f07d8ef62baff','4 in 1 powder Generic','27.00', 'pill packet'),
	('f9a7dfe69faaaf1f0c2dc348c0254d50','Medistatin','21.73', 'vial'),
	('e365252333bf5bd19b86b828e64b0eb0','Psittavet','15.99', 'pill packet'),
	('9dc94408c0e9b062a5cdd03830011d72','Ronidazole','10.49', 'vial'),
	('7c6164ddf235787f5d1e2d8f4540c838','Ronivet-S','30.95', 'pill packet'),
	('124b0999a2e3a37b30f8b4d4196d5666','SCATT','28.00', 'pill'),
	('5587ecc8c67f1ba9f77488eedc2d1164','Spectovet powder','45.95', 'pill'),
	('9e9af1d637a369cdaf6bac028b8bd813','Terramycin Ointment','14.95', 'pill packet'),
	('9faeec1795e05223ab80bf4d06971616','Tetrasol','13.95', 'pill'),
	('976f58180ccfd7c80f492b1665fd003a','Triple C','28.00', 'pill'),

	('hsabfkhasbnafksdjflwuefghifug434 ','Coccivet','23.55', 'pill'),
	('nscojdicjndjncdsncowinc992n9e444','Amoxicillin 10%','23.50', 'pill packet'),
	('djfbvkjnbviuanfoiuefiu2hf9hf9839','Amoxicillin 25%','21.95', 'tube'),
	('skskcdjvdjndfouhq9fhfqhf98hf9q2e','Anxiety Relief','27.99', 'vial'),
	('jhnjuygresxdwswe4ert5ty7y7yu7yu7','Baytril 10%','35.95', 'pill'),
	('ffbakjfbkjnflsjfaoh3f43fh43fhj4f','Baytril 2.5%','26.95', 'pill packet'),
	('kdjbnalkjdnfawhefoaihofhi3o4fho3','BirdPen','39.95', 'pill'),
	('afnaofhdofuhq93fh9fn93unf993fj39','Digestive Upsets','14.99', 'pill'),
	('dadncadnclknofijf834u38fu3ffij44','Doxy-Tyl Powder Generic','33.50', 'pill'),
	('mnbvcxcvbnbvcxcvbgretytrty654rrr','Doxyvet Liquid','11.99', 'pill'),
	('lkjhgfdfghjiuytfvbnmngft65456546','Endocox Powder','26.95', 'tube'),
	('f7gfq83fhqn9u93uvn3n94inv93vnvni','Enrofloxacin 10%','24.00', 'pill packet'),
	('vndslvncnvsdnlckdmslkcmdfkfjpi04','Erythromycin','11.95', 'pill'),
	('sdcsdcndslcnlkncokqsmxoqskmow999','ESB-3 Powder Generic','22.89', 'pill'),
	('bntyju7k98ok7j6hy5tgerf3g4th5777','Fireworks','14.99', 'pill'),
	('gthygbvfer4567ujhnbgvfer4t56ygrf','Furaltadone ','22.95', 'pill'),
	('fgrth67j68k76j75h64g3g54h6545g3f','Generic Metronidazole','30.00', 'pill'),
	('jfhwoeihfwoehfewifwwf28h032fj039','Ivermectin Solution','25.55', 'pill'),
	('ncbxvfdsrtyruthfgdfsderw54678i6u','Joint Stress','14.99', 'pill packet'),
	('xwmspxmwspckmdwockdocnejvn939939','Lewerstim','16.95', 'pill'),
	('rhtyju76756y45t34t4f2g43g54hh4y5','Liver Rescue','14.99', 'pill'),
	('bnbfrt56yuhgfe34r5tre345t6y7u78i','Medistatin','22.95', 'tube'),
	('45678ijhbfr5678987654fghy654rfgg','Megabac-S','113.00', 'pill'),
	('bvcnvmhtye678665rtgdgfw5t4657u6y','Nose Relief','27.99', 'vial'),
	('bnbft67uhgfr567uhgfrt678ujhgfr55','Nystatin','34.00', 'pill'),
	('hikjkiokmjkioijhgfr543er34rertt5','Pox Dry','15.95', 'tube'),
	('nbfgety65544refgrety65u7yhrtg4y6','Psittavet','15.99', 'pill'),
	('bnbvsdfwrt4354y6u75hyrterfwe23d3','Respiratory Soluble','39.95', 'pill'),
	('nbvgtyhgfty7654edfghu876ytfcfdre','Ronidazole','10.49', 'vial'),
	('vbcndsfwrtyui57654rffwer4356475u','Ronidazole 6%','28.95', 'pill'),
	('vbnjiokjnhjutfdqdacdewfyuyghnhhn','Ronivet - S 12%','33.55', 'pill packet'),
	('getry5u7utyh6t6yh6ytgvtgb6tfyhkk','Skin and Itch','14.99', 'vial');

INSERT INTO Service_ (serviceID,specialityID,serviceName,servicePrice)
VALUES
	('f8c17d469d7dfd4fa84eae659923536b','e6157a31d2c5e20dc446f4f42fc0d40f','Health check',42.00),
	('c739c1e62319f52411908f874c0698bf','e6157a31d2c5e20dc446f4f42fc0d40f','Diagnostic test',111.00),
	('a074614583162a3d58b89c13699d70a1','52f6743e4719de9a35e1e2e1c09d6d52','Surgery',400.00),
	('cd9bfc9d6bb22a47f6dcdc2a5c99b2fd','q3d45fgyuygf5d45f6bnu6ftvgbygdsd','Nutrition advice',75.00),
	('744722e0fb1eb8e7f4fc5c4682159800','7e2dc1364e2e1bdc9efc1669a17a9e45','Take care service',25.00),
	('84fbf5e32cfdb21cf48721cf849b0c20','8c15dfb7f4f3d4789ed0c043b1512e34','Urgent care',156.00),
	('517d8993ec9bcdb8c33fc50ea7ec5da8','e6157a31d2c5e20dc446f4f42fc0d40f','Microchip service ',50.00),
	('291129122c3e6bbbd76a76b428f2809a','4a30b3f33f96b639ab20dce9f0b8b8db','Endoscopy and X-ray',258.00),
	('52b7bedca394c621f40a99d03a564341','7e2dc1364e2e1bdc9efc1669a17a9e45','Beautify',13.62),
	('e41d8b0c31b65cc94f5eb4bbb7b76907','bfiwafjnbeaffaiuwhfa9fhawfa56565','DNA sex and identification',31.00),
	('507e4c66da1ccd4fcf621069065494bc','e6157a31d2c5e20dc446f4f42fc0d40f','vaccination',142.00);

INSERT INTO Bird(birdID, customerID,imageID, medicalHistory, birdGender, breed, band_chip, birdWeight, sexingMethod, birdFullname, hatchingDate, featherColor)
VALUES
	('2bbb77362ead86434fd59f94b282eae1' , '2c9320b8639fc9e1c784880bbecfdfa1' , 'fafnbuhfauhfweoufha8hfa9hfa48hf8', N'cảm cúm' ,'male','Apodidae', 'qwerty', 0.02,N'Observe shapes and colors', N'tom', '2019-01-01', N'đen'),
	('507c2afab061a1c2cf1dee7142e557be' , '3ff56e23cc31e9c9a85bc037341a65ee' , 'avewifbaiuwefnwajenfhiuahenf998f', N'Bệnh viêm tuyến nhờn' ,'male','Phasianidae', 'wertyu', 0.02, N'Check behavior', N'jerry', '2019-02-01', N'lam-lục'),
	('15d35bb9396992d02127345380e38d73' , '3ff5njfnijhfdsf8845bc037341a65ee' , 'fewabf9qb439fufh9h438q9h34fq34t4', '' ,'female','Én', 'ertyui', 0.03, N'Observe shapes and colors', N'Yến', '2019-03-01', N'đen'),
	('e9e0f3bcddc65940e089972ce4088e59' , '82d5cf38dc655bd1722ac5d4d350bce3' , 'frheafiuewhf9hf983h3f4ha438f94f4', N'Bệnh cầu trùng' , 'male' , 'Phasianidae' , 'no' , 0.02 , N'Check behavior' , N'mít' , '2019-04-01' , N'vàng-đỏ-lam'),
	('2e4076dd7f277dc8f29b4cdb922052c0' , '1c4f04058f291642c159e27e1554ddf8' , '4rt43t5y56y465t4r3e24r435y65u76i', '' , 'male' , N'Sẻ', 'tyuiop' , 0.02 , N'Observe shapes and colors' , N'Leo' , '2019-05-01' , N'nâu'),
	('27009754484e5b64300b05706c954565' , 'c0637bb4f3d7531d936f2686b9672a66' , 'efrgtrytuiykjhmngfbvdfewr4567898', 'Bệnh tiêu chảy' , 'male' , 'Finches', 'no' , 0.2 , N'Check behavior' , N'kitty' , '2019-06-01' , N'đỏ'),
	('49f34170b6590fea6bce454059764c12' , '11eee90acf45377f4cc3ca0758f2bf30' , '48c967910f7eb39ea5f7b7602a3df9ea', '' , 'male' , 'Ciconiidae', 'uiopas' , 15 , N'Checking the spawning zone' , N'Milo' , '2019-07-01' , N'trắng-đen'),
	('2e9d61c3330f9e10e3a0bc3fb8a4b4a2' , '48b31829bc7599f232d06a1e686534bd' , '3b94ace86063b245916a6e906221e6a8', N'Bệnh cảm cúm' , 'female' , 'Canidae', 'iopasd' , 3 , N'Checking the spawning zone' , N'Mỹ Diệu' , '2019-08-01' , N'vàng-trắng'),
	('e939af928268bda5f11f7bf215d452eb' , '4e192dacb208ceb2413376e2ad3b3db8' , '249fb9cb11171ae6ab41794bee070a8f', '' , 'male' , N'Vẹt', 'opasdf' , 0.2 , N'Observe shapes and colors' , 'Oscar' , '2019-09-01' , N'lục-vàng-đen'),
	('43e02d9e3ce088b73229155e462e32d9' , '6cb9c7dba65dd3d9e1946c5dd265dbcd' , 'b3b9752ec51a5433b44e27b8d9b81c76', N'Bệnh cảm cúm' , 'female' , N'Bồ câu', 'pasdfg' , 0.4 , N'DNA analysis' , N'Meo MEo' , '2019-10-01' , N'xám'),
	('00c38b52d5cdedc2667af4a83e346a85' , '45b76de8eb0fd35e124955a2ff2473db' , 'ee38603c9cfdb54fb0a0ab4a197f92a3', '' , 'male' , N'Vẹt', 'asdfgh' , 0.02 , N'Check behavior' , N'Hổ Báo' , '2019-11-01' , N'đỏ-lam-vàng'),
	('1587900aee161437134c2e2479de5b64' , 'ea03ec90c8836f413784ee96e50a4f11' , 'ef94fe9d57eed266b24c3fc1203c1e17', N'Bệnh viêm tuyến nhờn' , 'female' , N'Sẻ thông', 'sdfghj' , 0.02 , N'DNA analysis' , 'Oliver' , '2019-12-01' , N'vàng'),
	('277dd0cf43f2cc494be796373fd7bf2b' , 'bc6c32dbbb8bd0660d158b08d7cad96f' , 'a8cf052632950deb5ab9c1f5ec36334d', N'Bệnh cảm cúm' , 'male' , 'Muscicapidae', 'dfghjk' , 0.03 , N'Checking the spawning zone' , N'Phượng Hoàng' , '2020-01-01' , N'đen-nâu'),
	('08605ccab7ad051603412533c59e46c7' , '7e55fcb3a457634cfa78b49bdb774b3a' , '7b1bc65da7abbaceaaadc0ea9564c175', '' , 'female' , N'Chào mào', 'fghjkl' , 0.05 , N'Observe shapes and colors' , 'Rocky' , '2020-02-01' , N'trắng-nâu'),
	('acdbf948aa576959e791abe5ec2f124d' , 'd8869200b4fbde66a3475d6e730e1b6d' , '95f7e5a8c051e6b60905912bd8aedf7d', '' , 'male' , N'Đớp ruồi', 'ghjklz' , 0.03 , N'Check behavior' , N'Cơm' , '2020-03-01' , N'xám-trắng-đỏ'),
	('4b4c133439471c8d694b5c3e47edb446' , '128ce6812392dce1ca5a6919f03a26a2' , '365c43bd856cf86e0e0b4cd4b7bc0462', N'Bệnh cầu trùng' , 'female' , N'Sẻ', 'hjklzx' , 0.03 , N'Observe shapes and colors' , N'Mỹ Linh' , '2020-04-01' , N'trắng-đen-xám'),
	('0d0dd3c14756ae8316e7054b205896c9' , '87ccfc84f4eb846b5aeb0e04f6ea12ea' , 'b51f1bb2e54d243e60e32563b2b1a7ed', '' , 'female' , N'Chiền chiện', 'jklzxc' , 0.03 , N'DNA analysis' , N'Lan' , '2020-05-01' , N'vàng-đen'),
	('861c51821e55ecad053b072323fac994' , '715c43d86b98da2212d7a9c9ce9d3062' , '08eed66a05827e8dc02d6ff1392f9bf6', '' , 'female' , N'Diệc', 'klzxcv' , 0.2 , N'DNA analysis' , N'Hồng Nhung' , '2020-06-01' , N'đen'),
	('380965fe9f1584559ea8a90b9c8d680c' , 'a69b4087d281cb16efaa6bc91308f64d' , 'ddfff0e1f9009fe5d621e2ed07348a51', N'Bệnh cầu trùng' , 'female' , N'Cu cu', 'lzxcvb' , 0.08 , N'Checking the spawning zone' , N'Chôm Chôm' , '2020-07-01' , N'xám'),
	('17787dd14e0fda883a36016cada64123' , '61dd2b9c89fdcc1dce9fb553bf29cd8d' , 'cbe26c3a3f34407ed023e3f02399d2fa', '' , 'male' , N'Nhạn', 'zxcvbn' , 0.5 , N'Observe shapes and colors' , N'Đại ca' , '2020-08-01' , N'đen'),
	('d5ea83ec7f100a6803bd39e14c619299' , '03b016eef369ef40bba639aa4f04341b' , '05b5b4345d8ac2f73ece3df15be03230', N'Bệnh cầu trùng' , 'female' , N'Kim oanh', 'xcvbnm' , 0.1 , N'DNA analysis' , N'Xuân Mai' , '2020-09-01' , N'nâu đất'),
	('25c448b0241244364f7653f08cb8aff6' , 'f8b0ed4e38a71924a7d2bca97029778a' , '2bda592b2aada870747dd4366a3dff18', '' , 'male' , N'Nhạn', 'cvbnmq' , 3 , N'Check behavior' , N'Thạch đậu' , '2020-10-01' , N'trắng'),
	('bc0b9fe1f4df72fa1289f4437e6a3953' , '5cbae581d99c1c3d17b8c09b07c54892' , 'e28e1458f599f2391b91bfd61338483e', '' , 'male' , N'Cu cu', 'vbnmqw' , 0.08 , N'Observe shapes and colors' , 'Buddy' , '2020-11-01' , N'đen-cam'),
	('43aaf0240284fd15416b429bed0ef321' , '20e843f249d75ada67c1a2eef0dac92e' , '84cb52eda2e4f0b66f8509c37e857e8c', '' , 'female' , N'Sáo', 'bnmqwe' , 0.015 , N'DNA analysis' , N'Polly' , '2020-12-01' , N'đen'),
	('ca8406790940dec227193cc7dca16212' , '712da4f1096f6ae70d0f3c091b84ae7c' , '8721d5a5f3f44bd01529d24dcf519239', N'Bệnh cầu trùng' , 'male' , N'Chìa vôi', 'nmqwer' , 0.04 , N'DNA analysis' , N'Anh chàng đẹp trai' , '2021-01-01' , N'đen-trắng'),
	('752ee3ce65129a7bd54292accb28983e' , 'b03c6f5a51ee06d3dbd17d0e38507ede' , '66a5473e01debb47bff7f215d6c4a228', '' , 'male' , N'Cắt', 'mqwert' , 0.15 , N'DNA analysis' , 'Max' , '2021-02-01' , N'nâu'),
	('c91f8b119029caa4ec2046bcc5c69bb5' , 'b83bb75b898592b75232c4816842d824' , '6d47ad177fb45c2d87e1b54fc363676b', N'Bệnh viêm tuyến nhờn' , 'female' , N'Đớp ruồi', 'mnbvcx' , 0.05 , N'Observe shapes and colors' , 'Daisy' , '2021-03-01' , N'lam-vàng'),
	('16c5bd4d79c66e16042bee6bbf128c6f' , 'a68757602ea7419f0e2313a842be9abf' , '25abf9603856427e295b7bd1137fd04a', '' , 'male' , N'Vẹt', 'nbvcxz' , 6 , N'DNA analysis' , N'Cạp cạp' , '2021-04-01' , N'xanh lá-xanh nước biển-vàng'),
	('56a7207dd933fe09f539083edb711548' , '2b1850783245c06d0b782a4c9cd6a0a0' , 'ed1ed3634186fc66ee692da3ba98272f', N'Bệnh cầu trùng' , 'male' , N'sơn ca', 'bvcxzl' , 0.01 , N'DNA analysis' , N'Bầu trời' , '2021-05-01' , N'trắng-đen-vàng-đỏ'),
	('6a045cdabdccb76073091f263cbf3e52' , 'eb70ed9c4c32afea8f482dc873be4f6a' , 'e47ccaddaa9e2cd4c25e84cae624b077', '' , 'female' , N'vàng Anh', 'vcxzlk' , 0.04 , N'Check behavior' , 'Stella' , '2021-06-01' , N'vàng-đen');

INSERT INTO Appointment(appointmentID, birdID, doctorID, timeSlotID, appTime, notes, payment, appStatus, totalPrice)
VALUES
	('a6a837e5d05e57e160dea29c335f30d0' , '2bbb77362ead86434fd59f94b282eae1' , 'ae114dac5897fbcfd25797bf4be08fd3', 'a54060a06aa0e97217726362a5b580d3' , '2023-01-01' , '', 'Bank Transfer', 'complete', 52.00),
	('95b579fe61c622b5c50def9dccb66bdc' , '507c2afab061a1c2cf1dee7142e557be' , '9eae70b054be6eba305323d8c9106cfb', '657be9bfb1eed80938b24e3b154863cb' , '2023-01-02' , '',  'Bank Transfer', 'complete', 1158.15),
	('86ae960dc44eba248c481d76520846c3' , '15d35bb9396992d02127345380e38d73' , 'c8aa14ffb7da0912c84635aa2ee0bb62', '86fc882bb1aadc489464a8ecb5f43a30' , '2023-01-03' , '',  'Cash', 'complete', 2493.77),
	('801b58e3d0b00f7f9f9eac80058f99f0' , 'e9e0f3bcddc65940e089972ce4088e59' , '21fc9daf44e2637d7972bd248c83577d', '0f6c341110df21c899097b659454e1ab' , '2023-01-04' , '' , 'Bank Transfer' , 'complete',	1204.12),
	('ca768c1b1876a2f286496e62666dfada' , '2e4076dd7f277dc8f29b4cdb922052c0' , 'ae114dac5897fbcfd25797bf4be08fd3', '8accf3a256bcc4e7335afe49531eaac6' , '2023-01-05' , '' , 'Bank Transfer' , 'complete', 35.00),
	('0a7a30124b6b4f266459a6b69677152c' , '27009754484e5b64300b05706c954565' , '1c38dd30f9e415b3a34879be077381ce', '718838b54bc5450a76c6a75576021dc3' , '2023-01-06' , '' , 'Credit/Debit card' , 'complete', 221.80),
	('ebcf025d47ee19d929f6707029df09d0' , '49f34170b6590fea6bce454059764c12' , 'c8aa14ffb7da0912c84635aa2ee0bb62', '1468c48caf3c8acd45c13732fa1c7797' , '2023-01-07' , '' , 'Bank Transfer' , 'complete', 60.00),
	('b7e4621ca7d7273ea67ba0b40992d189' , '2e9d61c3330f9e10e3a0bc3fb8a4b4a2' , 'dd0e3f50648088bfecc501f809a06ca8', '5c9ba69a58918129f033a2c25e250584' , '2023-01-08' , '' , 'Cash' , 'complete', 622.70),
	('35847b5a3a8de7e0af06281b1d889bcf' , 'e939af928268bda5f11f7bf215d452eb' , '9c6189a20beb35a93df963e3b48eb9b0', '4940cc64f161f2caf8fb70416d0c41cc' , '2023-02-09' , '' , 'Bank Transfer' , 'complete', 23.62),
	('ca05b981160139795fbf616bfd5d491b' , '43e02d9e3ce088b73229155e462e32d9' , '0fe30e184ab12417ff175eb1c5386130', 'e2283b7f6695530a79793e3fe172155c' , '2023-02-10' , '' , 'Cash' , 'complete', 41.00),
	('3967200752865b1bb65a63f386925d14' , '00c38b52d5cdedc2667af4a83e346a85' , 'ae114dac5897fbcfd25797bf4be08fd3', 'c397d73df0a2ad5dcb930bd8d26cc2f6' , '2023-02-11' , '' , 'Bank Transfer' , 'cancelled', NULL),
	('943b4c67a61164d245ea5af7f3848a37' , '1587900aee161437134c2e2479de5b64' , '9eae70b054be6eba305323d8c9106cfb', '6ba12b34e7c18eff6380f8b22ae6211e' , '2023-03-12' , '' , 'Bank Transfer' , 'complete', 495.66),
	('040c93cff9c0cc5cd6d008fb02e17b69' , '277dd0cf43f2cc494be796373fd7bf2b' , '21fc9daf44e2637d7972bd248c83577d', '657be9bfb1eed80938b24e3b154863cb' , '2023-03-13' , '' , 'Cash' , 'complete', 986.62),
	('3841cd8942a581d2092ff1d3739fcebc' , '08605ccab7ad051603412533c59e46c7' , '01c1fa1b81297a2de21056f35303ad84', 'c789ff5a8a615b3cbd55b12d431c1a51' , '2023-03-14' , '' , 'Bank Transfer' , 'complete', 1351.18),
	('4a160bb951e81bb14485ab90391d0c58' , 'acdbf948aa576959e791abe5ec2f124d' , 't6fyt65rftvygt6f5tvyg65ftvgy6fhh', '71071e13d9c8cd2902737b7e39f32a5a' , '2023-03-15' , '' , 'Bank Transfer' , 'complete', 179.41),
	('0bb8e03d00ecc7642c5142de8f12a335' , '4b4c133439471c8d694b5c3e47edb446' , '21fc9daf44e2637d7972bd248c83577d', '85688ffa8d935b9da96e2a680aaa4e34' , '2023-04-16' , '' , 'Credit/Debit card' , 'cancelled', NULL),
	('aeed52468a0d9880fa013c611816e897' , '0d0dd3c14756ae8316e7054b205896c9' , '1c38dd30f9e415b3a34879be077381ce', '657be9bfb1eed80938b24e3b154863cb' , '2023-04-17' , '' , 'Cash' , 'complete', 1189.43),
	('cde92de8a056398e6a281dba87bdffb1' , '861c51821e55ecad053b072323fac994' , 'fe30e1ff175e10b1c538613084ab2417', '0227321c75909512447393796f173788' , '2023-04-18' , '' , 'Bank Transfer' , 'complete', 60.00),
	('6c3b331b0cde4d503944f2f16f979c93' , '380965fe9f1584559ea8a90b9c8d680c' , '62fe46dae9470f311d52973a6eeb6a1a', '516ab8138f50bbbb0be18ceed38b6ad3' , '2023-04-19' , '' , 'Cash' , 'complete', 268.00),
	('b6b447b56dbe005a626c4b5e3fdb97be' , '17787dd14e0fda883a36016cada64123' , '9c6189a20beb35a93df963e3b48eb9b0', '9d35c51b03f46f6edd9aaa81c4cfc3c4' , '2023-04-20' , '' , 'Bank Transfer' , 'complete', 23.62),
	('a61de36f81c0f699a8653863ea9e3d2f' , 'd5ea83ec7f100a6803bd39e14c619299' , '0fe30e184ab12417ff175eb1c5386130', 'a54060a06aa0e97217726362a5b580d3' , '2023-05-21' , '' , 'Cash' , 'complete', 41.00),
	('47b601885ddc891de11eb62451a97b43' , '25c448b0241244364f7653f08cb8aff6' , 'ae114dac5897fbcfd25797bf4be08fd3', '3deb11e87f2a937320bc503ceff3bda0' , '2023-05-22' , '' , 'Bank Transfer' , 'complete', 152.00),
	('2f7294ec43136a43ca696ad6f06e1635' , 'bc0b9fe1f4df72fa1289f4437e6a3953' , '9eae70b054be6eba305323d8c9106cfb', '9436e53cce52225010e09858fc287123' , '2023-05-23' , '' , 'Cash' , 'complete', 1152.00),
	('090f345a844fedfb9ca86ff69b59d969' , '43aaf0240284fd15416b429bed0ef321' , '21fc9daf44e2637d7972bd248c83577d', '3cd774fd522ed4a7b81dc2e3ed0373bd' , '2023-05-24' , '' , 'Cash' , 'complete', 688.50),
	('d2601ee48263e69982e4dbd809c0358a' , 'ca8406790940dec227193cc7dca16212' , 'c8aa14ffb7da0912c84635aa2ee0bb62', '8accf3a256bcc4e7335afe49531eaac6' , '2023-05-25' , '' , 'Bank Transfer' , 'complete', 1685.20),
	('e221bebf131b7773da0045982e018fba' , '752ee3ce65129a7bd54292accb28983e' , 't6fyt65rftvygt6f5tvyg65ftvgy6fhh', 'b57c1f7068f9c8220f290b95b7183fc9' , '2023-06-26' , '' , 'Cash' , 'complete', 441.52),
	('85c10fd22fe836139fd76fbaee831673' , 'c91f8b119029caa4ec2046bcc5c69bb5' , 'ae114dac5897fbcfd25797bf4be08fd3', 'b82fece225c99d7b1faa427866745620' , '2023-06-27' , '' , 'Bank Transfer' , 'complete', 35.00),
	('7caa694dda6e1cf8c0993cf301c84bba' , '16c5bd4d79c66e16042bee6bbf128c6f' , '1c38dd30f9e415b3a34879be077381ce', '0227321c75909512447393796f173788' , '2023-06-28' , '' , 'Credit/Debit card' , 'cancelled', NULL),
	('b7ad6a62013acd21497265b6f7ff74eb' , '56a7207dd933fe09f539083edb711548' , '01c1fa1b81297a2de21056f35303ad84', '8e397cbb235075a9cb231b2c3b316011' , '2023-06-29' , '' , 'Bank Transfer' , 'complete', 60.00),
	('3427f117121dd0789b94a37ef63b64dc' , '6a045cdabdccb76073091f263cbf3e52' , 'dd0e3f50648088bfecc501f809a06ca8', '92d969030097f06af642a4577606afe0' , '2023-06-30' , '' , 'Credit/Debit card' , 'complete', 268.00),
	('b7ad6137ff75b214972a6acd6206f4eb' , '16c5bd4d79c66e16042bee6bbf128c6f' , '0fe30e184ab12417ff175eb1c5386130', '5c9ba69a58918129f033a2c25e250584' , '2023-07-02' , '' , 'Bank Transfer' , 'complete', 41.00),
	('f1174d213346307894a92d177efbb6dc' , '752ee3ce65129a7bd54292accb28983e' , '0fe30e184ab12417ff175eb1c5386130', 'b312f680c0e4eac9c2a3bd9bf2260267' , '2023-07-03' , '' , 'Bank Transfer' , 'complete', 41.00),
	('fbvwiebfewfgqiugfiwgfiyvefiyefue' , '507c2afab061a1c2cf1dee7142e557be' , 'ae114dac5897fbcfd25797bf4be08fd3', 'c789ff5a8a615b3cbd55b12d431c1a51' , '2023-07-04' , '' , 'Bank Transfer' , 'complete', 480.20),
	('fabdskf8wg3fb87fgbq87fh87f387hf4' , 'e9e0f3bcddc65940e089972ce4088e59' , '9eae70b054be6eba305323d8c9106cfb', '516ab8138f50bbbb0be18ceed38b6ad3' , '2023-07-05' , '' , 'Cash' , 'complete', 1685.30),
	('ihsbgeyb87rwf80hwf8hf983hf837hf8' , '27009754484e5b64300b05706c954565' , 'c8aa14ffb7da0912c84635aa2ee0bb62', '7be65563411c5ce7cd508f04c8a54ecb' , '2023-07-06' , '' , 'Cash' , 'complete', 2168.50),
	('fiabfibvfaiwuyebfawe8fb8aa37fa77' , '43e02d9e3ce088b73229155e462e32d9' , 'dd0e3f50648088bfecc501f809a06ca8', '92d969030097f06af642a4577606afe0' , '2023-07-07' , '' , 'Bank Transfer' , 'complete', 268.00),
	('frfhbafihfioahfewaufiuwefa7fhah2' , '2e9d61c3330f9e10e3a0bc3fb8a4b4a2' , '62fe46dae9470f311d52973a6eeb6a1a', 'ce26b41ff7120b6f14c47596d9cb96b0' , '2023-07-08' , '' , 'Bank Transfer' , 'complete', 691.76),
	('foijdaofhdfouha9fhewafh8hf9f983h' , '49f34170b6590fea6bce454059764c12' , '9c6189a20beb35a93df963e3b48eb9b0', 'a54060a06aa0e97217726362a5b580d3' , '2023-07-09' , '' , 'Cash' , 'complete', 23.62),
	('8ajwijwefjao8a98a9fa9unfr9nr9238' , '15d35bb9396992d02127345380e38d73' , '1c38dd30f9e415b3a34879be077381ce', '7b84cc4412f9e9a4213a9f979be42063' , '2023-07-10' , '' , 'Bank Transfer' , 'complete', 1775.58),
	('8ry98h23r923jd9h23f9b3fa8ufb8fuf' , '00c38b52d5cdedc2667af4a83e346a85' , 't6fyt65rftvygt6f5tvyg65ftvgy6fhh', '9eea7e14fbd37b455d69e7114399aa0a' , '2023-07-11' , '' , 'Bank Transfer' , 'complete', 176.80),
	('fajwnfjdnfiduhfa9hf984f398334934' , '1587900aee161437134c2e2479de5b64' , '01c1fa1b81297a2de21056f35303ad84', '4db7ce38baceaddfc93e9bdcfe0a7f57' , '2023-07-12' , '' , 'Bank Transfer' , 'complete', 60.00),
	('892809f2jf92n39f923fnh92hf9h9dn3' , '277dd0cf43f2cc494be796373fd7bf2b' , 'fe30e1ff175e10b1c538613084ab2417', '9d35c51b03f46f6edd9aaa81c4cfc3c4' , '2023-07-13' , '' , 'Bank Transfer' , 'complete', 2108.16),
	('fafjndjfnaieufniudfnaewufha9f483' , '08605ccab7ad051603412533c59e46c7' , '0fe30e184ab12417ff175eb1c5386130', 'a54060a06aa0e97217726362a5b580d3' , '2023-07-14' , '' , 'Cash' , 'complete', 41.00),
	('9229jf2nfj92nf9e2fuefe2fn9en9ksn' , 'acdbf948aa576959e791abe5ec2f124d' , 'ae114dac5897fbcfd25797bf4be08fd3', 'e2283b7f6695530a79793e3fe172155c' , '2023-07-15' , '' , 'Bank Transfer' , 'complete', 35.00),
	('ffjndiojf98f98f9jffi9j39f3f94394' , '4b4c133439471c8d694b5c3e47edb446' , '9eae70b054be6eba305323d8c9106cfb', '1468c48caf3c8acd45c13732fa1c7797' , '2023-07-16' , '' , 'Credit/Debit card' , 'complete', 152.00),
	('smxokwmxowmsxowncuecu2cun8328444' , '0d0dd3c14756ae8316e7054b205896c9' , 'c8aa14ffb7da0912c84635aa2ee0bb62', '9436e53cce52225010e09858fc287123' , '2023-07-17' , '' , 'Bank Transfer' , 'complete', 2185.05),
	('98r923r9j3eifn92nu9rewidjf3uf93j' , '861c51821e55ecad053b072323fac994' , 'dd0e3f50648088bfecc501f809a06ca8', '0b0ac0d3db2f67dd2626c726e51b0612' , '2023-07-18' , '' , 'Cash' , 'complete', 268.00),
	('fofijewijfew9fn9uewfnue9ue2f9ef9' , '380965fe9f1584559ea8a90b9c8d680c' , '62fe46dae9470f311d52973a6eeb6a1a', '4db7ce38baceaddfc93e9bdcfe0a7f57' , '2023-07-19' , '' , 'Bank Transfer' , 'complete', 2859.88),
	('ff8u929fjimd2f9n9fmunr94r8fu3nfu' , '17787dd14e0fda883a36016cada64123' , '9c6189a20beb35a93df963e3b48eb9b0', '8e397cbb235075a9cb231b2c3b316011' , '2023-07-20' , '' , 'Bank Transfer' , 'complete', 23.62),
	('f9r2jr03imfnrviefn93uf3urfuruuur' , 'd5ea83ec7f100a6803bd39e14c619299' , '1c38dd30f9e415b3a34879be077381ce', '88549bf6059c27cd9bf49508373f6dad' , '2023-07-21' , '' , 'Bank Transfer' , 'complete', 2954.87),
	('78439i4j5tjfkide8u34j5rkfidueree' , '25c448b0241244364f7653f08cb8aff6' , '21fc9daf44e2637d7972bd248c83577d', '35214a23d76865f60f6d837db69f87fd' , '2023-07-22' , '' , 'Cash' , 'complete', 785.03),
	('45678ikjhgfdertyhjnbvcdftyujmnbv' , 'bc0b9fe1f4df72fa1289f4437e6a3953' , '01c1fa1b81297a2de21056f35303ad84', '4e4b39473c2dfc3e918ee79b1c28fc6f' , '2023-07-23' , '' , 'Bank Transfer' , 'complete', 60.00),
	('lkiuhjnbvcde45678765rtyjnbvcdrty' , '43aaf0240284fd15416b429bed0ef321' , 'fe30e1ff175e10b1c538613084ab2417', 'c397d73df0a2ad5dcb930bd8d26cc2f6' , '2023-07-24' , '' , '' , 'prescribed', NULL),
	('81c0f699a861de36fea9e653863a3d2f' , '25c448b0241244364f7653f08cb8aff6' , 'ae114dac5897fbcfd25797bf4be08fd3', '0d5408947d23dd60557de6b616352275' , '2023-08-01' , '' , '' , 'check-in', NULL),
	('985ddc8a97245147b60181de11eb6b43' , 'd5ea83ec7f100a6803bd39e14c619299' , '9eae70b054be6eba305323d8c9106cfb', '9436e53cce52225010e09858fc287123' , '2023-08-02' , '' , '' , 'check-in', NULL),
	('ec436f0ca64396ad2f6e16136a437295' , 'ca8406790940dec227193cc7dca16212' , '9c6189a20beb35a93df963e3b48eb9b0', '4db7ce38baceaddfc93e9bdcfe0a7f57' , '2023-08-03' , '' , '' , 'check-in', NULL),
	('edf345a8f69ca86f0fb90944fb59d969' , 'c91f8b119029caa4ec2046bcc5c69bb5' , 'fe30e1ff175e10b1c538613084ab2417', '7be65563411c5ce7cd508f04c8a54ecb' , '2023-08-04' , '' , '' , 'confirm', NULL),
	('e4c03e6998de4826309bd8d2601e258a' , 'bc0b9fe1f4df72fa1289f4437e6a3953' , '21fc9daf44e2637d7972bd248c83577d', 'b02c69a820861a57ac38b4282399335c' , '2023-08-05' , '' , '' , 'confirm', NULL),
	('13e25982e018f21bda01bebf077734ba' , '6a045cdabdccb76073091f263cbf3e52' , 'ae114dac5897fbcfd25797bf4be08fd3', '1468c48caf3c8acd45c13732fa1c7797' , '2023-08-06' , '' , '' , 'confirm', NULL),
	('d76836859ffbaee831c10fd22fe13673' , '43aaf0240284fd15416b429bed0ef321' , '9eae70b054be6eba305323d8c9106cfb', '4e4b39473c2dfc3e918ee79b1c28fc6f' , '2023-08-07' , '' , '' , 'processing', NULL),
	('e199d87ca6943ccf8cdac4bbaa6f3010' , '56a7207dd933fe09f539083edb711548' , '1c38dd30f9e415b3a34879be077381ce', '8e397cbb235075a9cb231b2c3b316011' , '2023-09-01' , '' , '' , 'processing', NULL),
	('13acd6206f7ff75bb7ad6214972a64eb' , '16c5bd4d79c66e16042bee6bbf128c6f' , '21fc9daf44e2637d7972bd248c83577d', '92d969030097f06af642a4577606afe0' , '2023-09-02' , '' , '' , 'processing', NULL),
	('3346307894a7f1171217efbb64d92ddc' , '752ee3ce65129a7bd54292accb28983e' , '62fe46dae9470f311d52973a6eeb6a1a', 'a2855125bdc9e06b5313b3f827f07705' , '2023-09-03' , '' , '' , 'processing', NULL);
	
INSERT INTO AppointmentServices (appointmentID, serviceID)
VALUES
    ('a6a837e5d05e57e160dea29c335f30d0', 'f8c17d469d7dfd4fa84eae659923536b'),
    ('95b579fe61c622b5c50def9dccb66bdc', 'c739c1e62319f52411908f874c0698bf'),
    ('86ae960dc44eba248c481d76520846c3', 'a074614583162a3d58b89c13699d70a1'),
    ('801b58e3d0b00f7f9f9eac80058f99f0', 'cd9bfc9d6bb22a47f6dcdc2a5c99b2fd'),
    ('ca768c1b1876a2f286496e62666dfada', '744722e0fb1eb8e7f4fc5c4682159800'),
    ('0a7a30124b6b4f266459a6b69677152c', '84fbf5e32cfdb21cf48721cf849b0c20'),
    ('ebcf025d47ee19d929f6707029df09d0', '517d8993ec9bcdb8c33fc50ea7ec5da8'),
    ('b7e4621ca7d7273ea67ba0b40992d189', '291129122c3e6bbbd76a76b428f2809a'),
    ('35847b5a3a8de7e0af06281b1d889bcf', '52b7bedca394c621f40a99d03a564341'),
    ('ca05b981160139795fbf616bfd5d491b', 'e41d8b0c31b65cc94f5eb4bbb7b76907'),
    ('3967200752865b1bb65a63f386925d14', '507e4c66da1ccd4fcf621069065494bc'),
    ('943b4c67a61164d245ea5af7f3848a37', 'f8c17d469d7dfd4fa84eae659923536b'),
    ('040c93cff9c0cc5cd6d008fb02e17b69', 'c739c1e62319f52411908f874c0698bf'),
    ('3841cd8942a581d2092ff1d3739fcebc', 'a074614583162a3d58b89c13699d70a1'),
    ('4a160bb951e81bb14485ab90391d0c58', 'cd9bfc9d6bb22a47f6dcdc2a5c99b2fd'),
    ('0bb8e03d00ecc7642c5142de8f12a335', '744722e0fb1eb8e7f4fc5c4682159800'),
    ('aeed52468a0d9880fa013c611816e897', '84fbf5e32cfdb21cf48721cf849b0c20'),
    ('cde92de8a056398e6a281dba87bdffb1', '517d8993ec9bcdb8c33fc50ea7ec5da8'),
    ('6c3b331b0cde4d503944f2f16f979c93', '291129122c3e6bbbd76a76b428f2809a'),
    ('b6b447b56dbe005a626c4b5e3fdb97be', '52b7bedca394c621f40a99d03a564341'),
    ('a61de36f81c0f699a8653863ea9e3d2f', 'e41d8b0c31b65cc94f5eb4bbb7b76907'),
    ('47b601885ddc891de11eb62451a97b43', '507e4c66da1ccd4fcf621069065494bc'),
    ('2f7294ec43136a43ca696ad6f06e1635', 'f8c17d469d7dfd4fa84eae659923536b'),
    ('090f345a844fedfb9ca86ff69b59d969', 'c739c1e62319f52411908f874c0698bf'),
    ('d2601ee48263e69982e4dbd809c0358a', 'a074614583162a3d58b89c13699d70a1'),
    ('e221bebf131b7773da0045982e018fba', 'cd9bfc9d6bb22a47f6dcdc2a5c99b2fd'),
    ('85c10fd22fe836139fd76fbaee831673', '744722e0fb1eb8e7f4fc5c4682159800'),
    ('7caa694dda6e1cf8c0993cf301c84bba', '84fbf5e32cfdb21cf48721cf849b0c20'),
    ('b7ad6a62013acd21497265b6f7ff74eb', '517d8993ec9bcdb8c33fc50ea7ec5da8'),
    ('3427f117121dd0789b94a37ef63b64dc', '291129122c3e6bbbd76a76b428f2809a'),
    ('b7ad6137ff75b214972a6acd6206f4eb', 'e41d8b0c31b65cc94f5eb4bbb7b76907'),
    ('f1174d213346307894a92d177efbb6dc', 'e41d8b0c31b65cc94f5eb4bbb7b76907'),
	('fbvwiebfewfgqiugfiwgfiyvefiyefue', 'f8c17d469d7dfd4fa84eae659923536b'),
	('fabdskf8wg3fb87fgbq87fh87f387hf4', 'c739c1e62319f52411908f874c0698bf'),
	('ihsbgeyb87rwf80hwf8hf983hf837hf8', 'a074614583162a3d58b89c13699d70a1'),
	('fiabfibvfaiwuyebfawe8fb8aa37fa77', '291129122c3e6bbbd76a76b428f2809a'),
	('frfhbafihfioahfewaufiuwefa7fhah2', '291129122c3e6bbbd76a76b428f2809a'),
	('foijdaofhdfouha9fhewafh8hf9f983h', '52b7bedca394c621f40a99d03a564341'),
	('8ajwijwefjao8a98a9fa9unfr9nr9238', '84fbf5e32cfdb21cf48721cf849b0c20'),
	('8ry98h23r923jd9h23f9b3fa8ufb8fuf', 'cd9bfc9d6bb22a47f6dcdc2a5c99b2fd'),
	('fajwnfjdnfiduhfa9hf984f398334934', '517d8993ec9bcdb8c33fc50ea7ec5da8'),
	('892809f2jf92n39f923fnh92hf9h9dn3', 'a074614583162a3d58b89c13699d70a1'),
	('fafjndjfnaieufniudfnaewufha9f483', 'e41d8b0c31b65cc94f5eb4bbb7b76907'),
	('9229jf2nfj92nf9e2fuefe2fn9en9ksn', '744722e0fb1eb8e7f4fc5c4682159800'),
	('ffjndiojf98f98f9jffi9j39f3f94394', '507e4c66da1ccd4fcf621069065494bc'),
	('smxokwmxowmsxowncuecu2cun8328444', 'a074614583162a3d58b89c13699d70a1'),
	('98r923r9j3eifn92nu9rewidjf3uf93j', '291129122c3e6bbbd76a76b428f2809a'),
	('fofijewijfew9fn9uewfnue9ue2f9ef9', '291129122c3e6bbbd76a76b428f2809a'),
	('ff8u929fjimd2f9n9fmunr94r8fu3nfu', '52b7bedca394c621f40a99d03a564341'),
	('f9r2jr03imfnrviefn93uf3urfuruuur', '84fbf5e32cfdb21cf48721cf849b0c20'),
	('78439i4j5tjfkide8u34j5rkfidueree', 'f8c17d469d7dfd4fa84eae659923536b'),
	('45678ikjhgfdertyhjnbvcdftyujmnbv', '517d8993ec9bcdb8c33fc50ea7ec5da8'),
	('lkiuhjnbvcde45678765rtyjnbvcdrty', 'a074614583162a3d58b89c13699d70a1'),
    ('81c0f699a861de36fea9e653863a3d2f', '507e4c66da1ccd4fcf621069065494bc'),
    ('985ddc8a97245147b60181de11eb6b43', '507e4c66da1ccd4fcf621069065494bc'),
    ('ec436f0ca64396ad2f6e16136a437295', '52b7bedca394c621f40a99d03a564341'),
    ('edf345a8f69ca86f0fb90944fb59d969', '517d8993ec9bcdb8c33fc50ea7ec5da8'),
    ('e4c03e6998de4826309bd8d2601e258a', 'c739c1e62319f52411908f874c0698bf'),
    ('13e25982e018f21bda01bebf077734ba', 'cd9bfc9d6bb22a47f6dcdc2a5c99b2fd'),
    ('d76836859ffbaee831c10fd22fe13673', '744722e0fb1eb8e7f4fc5c4682159800'),
    ('e199d87ca6943ccf8cdac4bbaa6f3010', '84fbf5e32cfdb21cf48721cf849b0c20'),
    ('13acd6206f7ff75bb7ad6214972a64eb', '517d8993ec9bcdb8c33fc50ea7ec5da8'),
    ('3346307894a7f1171217efbb64d92ddc', '291129122c3e6bbbd76a76b428f2809a');
	
INSERT INTO MedicalRecord (medicalRecordID, appointmentID, recordTime, diagnosis, treatmentDays, doctorNotes)
VALUES
	('3b153a85daab45c693cdd0e1f02631c9' , 'a6a837e5d05e57e160dea29c335f30d0', '2023-01-02', N'không phát hiện bất thường', 0, ''),
	('87599195136fd0440b341eed32d36c84' , '95b579fe61c622b5c50def9dccb66bdc', '2023-01-03', N'Thiếu hụt dinh dưỡng', 0, 'thiếu nhiều chất, cần nạp đủ chất dinh dưỡng'),
	('4d0ac1b5e6f8e2e4ee256c4c2031b1d2' , '86ae960dc44eba248c481d76520846c3', '2023-01-04', N'chấn thương chân', 2 , 'không để chim đi lại nhiều'),
	('b356f8672801e4820bd72b17dbda7764' , '801b58e3d0b00f7f9f9eac80058f99f0' , '2023-01-05' , N'thiếu vitamin A' , 1, 'bổ sung vitamin A'),
	('a0540a74c856251ad819d931fee6b078' , 'ca768c1b1876a2f286496e62666dfada' , '2023-01-06' , N'chăm sóc trong ngày', 3 , ''),
	('32fe2542e25434a1acde0f6edff2f0b4' , '0a7a30124b6b4f266459a6b69677152c' , '2023-01-07' , N'gãy cánh', 3, 'không để vết thương bị nhiễm trùng'),
	('2f6c8e2ec915f490a91c6c7e888126f6' , 'ebcf025d47ee19d929f6707029df09d0' , '2023-01-09', N'gắn chip', 1, ''),
	('21def0e373e1e8d57d1ab5f339726167' , 'b7e4621ca7d7273ea67ba0b40992d189' , '2023-01-09' , N'dị vật trong dạ dày', 2, 'cẩn thận khi cho chim ăn uống'),
	('ff398a2c8cdd28c7c9e31446c0e2a629' , '35847b5a3a8de7e0af06281b1d889bcf' , '2023-02-10' , N'làm đẹp', 1 , '' ),
	('753906196d6e7bdd8f8d874efaacfa8d' , 'ca05b981160139795fbf616bfd5d491b' , '2023-02-13' , N'không phát hiện bất thường', 1, '' ),
	('4aa48bfce29088db4424a1b921e2be55' , '943b4c67a61164d245ea5af7f3848a37' , '2023-03-13' , N'Bệnh cảm cúm', 1 , 'cho chim ăn uống đầy đủ và uống thuốc đúng giờ' ),
	('154aa8864b0445239a1c8cf636ce8164' , '040c93cff9c0cc5cd6d008fb02e17b69' , '2023-03-14' , N'Bệnh cầu trùng', 1, '' ),
	('b72e56f3705781fdfaa652dabbefd8b4' , '3841cd8942a581d2092ff1d3739fcebc' , '2023-03-15' , N'chấn thương phần đầu', 3, '' ),
	('96f71fd09596eeda17b234c2a87b783f' , '4a160bb951e81bb14485ab90391d0c58' , '2023-03-16' , N'thiếu vitamin D', 1, 'bổ sung vitamin D' ),
	('de9aa8254527b52b336a60f9373740ea' , 'aeed52468a0d9880fa013c611816e897' , '2023-04-18' , N'mỏ bị gãy', 3, '' ),
	('737cebac25159c2b8e46f50881a7abcb' , 'cde92de8a056398e6a281dba87bdffb1' , '2023-04-19' , N'gắn chip', 1, '' ),
	('1450707c9e9a8ea70f8d341e19e5a9bb' , '6c3b331b0cde4d503944f2f16f979c93' , '2023-04-20' , N'dị vật ở ngực', 3, ''),
	('321d5d0f522e1ba28bbb2243b6b18de8' , 'b6b447b56dbe005a626c4b5e3fdb97be' , '2023-04-21' , N'làm đẹp', 1, '' ),
	('008be4115afd1511f4cc2ae97c9834f0' , 'a61de36f81c0f699a8653863ea9e3d2f' , '2023-05-22' , N'xác định giới tính', 1, '' ),
	('3ff90b1c47898c6e576e8f109eba0bef' , '47b601885ddc891de11eb62451a97b43' , '2023-05-23' , N'tiêm vaccine', 0 , 'Cần theo dõi vật nuôi để kịp thời can thiệp các trường hợp phản ứng ,chim có thể bị sốc phản vệ. ' ),
	('21879306649bc1429b0f6d9d57217356' , '2f7294ec43136a43ca696ad6f06e1635' , '2023-05-24' , N'Bệnh béo phì', 3, 'giảm phần ăn cho chim' ),
	('56e00973cbc998b7ddce6cdc45b3cd25' , '090f345a844fedfb9ca86ff69b59d969' , '2023-05-25' , N'Bệnh mổ lông', 2 , '' ),
	('8c6abf5a30122f683a29871b67190785' , 'd2601ee48263e69982e4dbd809c0358a' , '2023-05-26' , N'khối u ở chân', 5, '' ),
	('65a4f559051183b9a50cda6876422baa' , 'e221bebf131b7773da0045982e018fba' , '2023-06-27' , N'thiếu vitamin E', 1, 'bổ sung vitamin E' ),
	('5fe272ab8622289deb002353518c8941' , '85c10fd22fe836139fd76fbaee831673' , '2023-06-28' , N'chăm sóc trong ngày', 5, '' ),
	('5e6c49d4fffd4d10de12dc2de829029e' , 'b7ad6a62013acd21497265b6f7ff74eb' , '2023-06-30' , N'gắn chip', 1 , '' ),
	('52f50c616b0653a3fab725e6c2421692' , '3427f117121dd0789b94a37ef63b64dc' , '2023-07-01' , N'không phát hiện dị vật', 0, '' ),
	('6b0653af50c61fe6c3ab725522421692' , 'b7ad6137ff75b214972a6acd6206f4eb' , '2023-07-03' , N'xác định giới tính', 1 , '' ),
	('ffd4d1092d5e6de12dc9d4fe82c4029e' , 'f1174d213346307894a92d177efbb6dc' , '2023-07-04' , N'xác định giới tính', 1 , '' ),

	('jfbihwebdfaibwuhdoewaudouewdsdcs' , 'fbvwiebfewfgqiugfiwgfiyvefiyefue' , '2023-07-05' , N'cúm', 1 , 'chú ý đến sức khỏe của chim' ),
	('78ijhgfre4567yhgvfde45tgfder5trr' , 'fabdskf8wg3fb87fgbq87fh87f387hf4' , '2023-07-06' , N'thủy đậu', 1 , '' ),
	('98ujgfredsw23wasxcvghy567tfr56yu' , 'ihsbgeyb87rwf80hwf8hf983hf837hf8' , '2023-07-07' , N'chấn thương mắt', 3 , '' ),
	('09ikmnji87yhnbgt654efdsew34567uh' , 'fiabfibvfaiwuyebfawe8fb8aa37fa77' , '2023-07-08' , N'không phát hiện dị thường', 0 , '' ),
	('123432wsdfgy65433rtyikjngftgfdrr' , 'frfhbafihfioahfewaufiuwefa7fhah2' , '2023-07-09' , N'có đá trong dạ dày', 2 , '' ),
	('mko098ijnbhuwsdfghjiuytr456ygfgg' , 'foijdaofhdfouha9fhewafh8hf9f983h' , '2023-07-10' , N'làm đẹp', 1 , '' ),
	('876iuyuijhgbnmnbvfdfghgfghgfdfgh' , '8ajwijwefjao8a98a9fa9unfr9nr9238' , '2023-07-11' , N'Nôn mửa', 3 , 'chú ý đến khẩu phần ăn của chim' ),
	('12343wsxdrtyhio98765678ujbvcfrty' , '8ry98h23r923jd9h23f9b3fa8ufb8fuf' , '2023-07-13' , N'thiếu protein', 1 , '' ),
	('87uhgty765rtgvcdseyhgtyujnbftytg' , 'fajwnfjdnfiduhfa9hf984f398334934' , '2023-07-13' , N'gắn chip', 1 , '' ),
	('0987uijnbgtyu876tyhbvfdty654erfe' , '892809f2jf92n39f923fnh92hf9h9dn3' , '2023-07-14' , N'cắt móng',	1 , '' ),
	('097ujnbgt76rd12345rdfgh7ytr67yuu' , 'fafjndjfnaieufniudfnaewufha9f483' , '2023-07-17' , N'xác định giới tính', 2 , '' ),
	('12wedc5rdx5tyhj09ijhbverfiuhg3er' , '9229jf2nfj92nf9e2fuefe2fn9en9ksn' , '2023-07-17' , N'chăm sóc trong ngày', 2 , '' ),
	('okmnijhbygrdwdefthyujoijtygvwedf' , 'ffjndiojf98f98f9jffi9j39f3f94394' , '2023-07-17' , N'tiêm vaccine', 0 , 'Cần theo dõi vật nuôi để kịp thời can thiệp các trường hợp phản ứng ,chim có thể bị sốc phản vệ.' ),
	('bbfenjoeijfnowekmfoiefn2epovng3u' , 'smxokwmxowmsxowncuecu2cun8328444' , '2023-07-19' , N'mổ mắt ', 2 , '' ),
	('98io9uhju7yghutrfgyrfgy5rfghu6tg' , '98r923r9j3eifn92nu9rewidjf3uf93j' , '2023-07-19' , N'không phát hiện dị vật', 0 , '' ),
	('nbtyhgftyhvfrtyhgfrtuhfr6ygr56y7' , 'fofijewijfew9fn9uewfnue9ue2f9ef9' , '2023-07-20' , N'dị vật trong dạ dày không thể tiêu hóa', 4 , 'không nên để chim ăn linh tinh' ),
	('okiokjuiokjuytrt54e32wse3wsdedff' , 'ff8u929fjimd2f9n9fmunr94r8fu3nfu' , '2023-07-21' , N'làm đẹp', 1 , '' ),
	('zwasxesxwsxesxxwesxertbygbyygggg' , 'f9r2jr03imfnrviefn93uf3urfuruuur' , '2023-07-22' , N'tiêu chảy nặng', 5 , 'chú ý đến khẩu phần ăn của chim' ),
	('5vbyhbygbngybtyfvbrdfvvrdcfverdc' , '78439i4j5tjfkide8u34j5rkfidueree' , '2023-07-23' , N'khó thở, thở khò khè', 1 , '' ),
	('67tyg87tgb65rv456rf56rf56r5r5rrr' , '45678ikjhgfdertyhjnbvcdftyujmnbv' , '2023-07-24' , N'gắn chip', 1 , '' ),
	('ryfhdsiuwayehaf8a7iewuyrh8fiwaer' , 'lkiuhjnbvcde45678765rtyjnbvcdrty' , '2023-07-25' , N'cắt chân', 3 , '' );
 
INSERT INTO RecordMedicine (medicalRecordID, medicineID, quantity, description_)
VALUES
('87599195136fd0440b341eed32d36c84', '1a27a82eb264532c271baf05c7a6e10d', 9 , N'sáng: 1, trưa: 1, chiều: 1, tối: 0'),
('87599195136fd0440b341eed32d36c84', 'c93c634859e543a562441ca36f9bd9f0', 9 , N'sáng: 1, trưa: 1, chiều: 1, tối: 0'),
('87599195136fd0440b341eed32d36c84', 'd0141bd1067e2f534fd908b54a72a1ff', 9 , N'sáng: 1, trưa: 1, chiều: 1, tối: 0'),
('4d0ac1b5e6f8e2e4ee256c4c2031b1d2', '7c7f0e401b7926cb956e1e798e7d6664', 12 , N'sáng: 1, trưa: 1, chiều: 1, tối: 1'),
('4d0ac1b5e6f8e2e4ee256c4c2031b1d2', '2b1937a02cb1cc8255ecfeb8dc38c5d2', 6 , N'sáng: 1, trưa: 0, chiều: 1, tối: 0'),
('4d0ac1b5e6f8e2e4ee256c4c2031b1d2', '589ff60828e99f431d7f07d8ef62baff', 12 , N'sáng: 1, trưa: 1, chiều: 1, tối: 1'),
('4d0ac1b5e6f8e2e4ee256c4c2031b1d2', 'f9a7dfe69faaaf1f0c2dc348c0254d50', 9 , N'sáng: 0, trưa: 1, chiều: 1, tối: 1'),
('b356f8672801e4820bd72b17dbda7764', '5f7fb0d98491f5efdf52623a7d4839aa', 12 , N'sáng: 1, trưa: 1, chiều: 1, tối: 1'),
('b356f8672801e4820bd72b17dbda7764', '8e89704ade7f8e48da32ce2d6bb15054', 9 , N'sáng: 1, trưa: 0, chiều: 1, tối: 0'),
('b356f8672801e4820bd72b17dbda7764', '7c7f0e401b7926cb956e1e798e7d6664', 9 , N'sáng: 1, trưa: 1, chiều: 1, tối: 0'),
('b356f8672801e4820bd72b17dbda7764', 'e365252333bf5bd19b86b828e64b0eb0', 6 , N'sáng: 1, trưa: 1, chiều: 1, tối: 0'),
('b356f8672801e4820bd72b17dbda7764', '7c6164ddf235787f5d1e2d8f4540c838', 4 , N'sáng: 1, trưa: 0, chiều: 1, tối: 1'),
('32fe2542e25434a1acde0f6edff2f0b4', '9faeec1795e05223ab80bf4d06971616', 4 , N'sáng: 1, trưa: 0, chiều: 1, tối: 1'),
('21def0e373e1e8d57d1ab5f339726167', '9e9af1d637a369cdaf6bac028b8bd813', 3 , N'sáng: 1, trưa: 0, chiều: 0, tối: 0'),
('21def0e373e1e8d57d1ab5f339726167', '9faeec1795e05223ab80bf4d06971616', 3 , N'sáng: 1, trưa: 0, chiều: 0, tối: 0'),
('4aa48bfce29088db4424a1b921e2be55', '9dc94408c0e9b062a5cdd03830011d72', 4 , N'sáng: 0, trưa: 1, chiều: 1, tối: 0'),
('4aa48bfce29088db4424a1b921e2be55', '7c6164ddf235787f5d1e2d8f4540c838', 6 , N'sáng: 0, trưa: 1, chiều: 1, tối: 1'),
('4aa48bfce29088db4424a1b921e2be55', '124b0999a2e3a37b30f8b4d4196d5666', 4 , N'sáng: 0, trưa: 1, chiều: 1, tối: 0'),
('154aa8864b0445239a1c8cf636ce8164', '124b0999a2e3a37b30f8b4d4196d5666', 6 , N'sáng: 1, trưa: 1, chiều: 1, tối: 0'),
('154aa8864b0445239a1c8cf636ce8164', '9dc94408c0e9b062a5cdd03830011d72', 6 , N'sáng: 1, trưa: 1, chiều: 1, tối: 0'),
('154aa8864b0445239a1c8cf636ce8164', 'f9a7dfe69faaaf1f0c2dc348c0254d50', 6 , N'sáng: 1, trưa: 1, chiều: 1, tối: 0'),
('154aa8864b0445239a1c8cf636ce8164', '8e89704ade7f8e48da32ce2d6bb15054', 6 , N'sáng: 1, trưa: 1, chiều: 1, tối: 0'),
('b72e56f3705781fdfaa652dabbefd8b4', 'd0141bd1067e2f534fd908b54a72a1ff', 9 , N'sáng: 1, trưa: 1, chiều: 1, tối: 1'),
('b72e56f3705781fdfaa652dabbefd8b4', 'c69f4b52c792233f31e11393012e5e19', 9 , N'sáng: 1, trưa: 1, chiều: 1, tối: 1'),
('96f71fd09596eeda17b234c2a87b783f', '9dc94408c0e9b062a5cdd03830011d72', 9 , N'sáng: 1, trưa: 1, chiều: 1, tối: 1'),
('de9aa8254527b52b336a60f9373740ea', '9faeec1795e05223ab80bf4d06971616', 9 , N'sáng: 1, trưa: 1, chiều: 1, tối: 0'),
('de9aa8254527b52b336a60f9373740ea', 'f9a7dfe69faaaf1f0c2dc348c0254d50', 3 , N'sáng: 0, trưa: 0, chiều: 1, tối: 0'),
('de9aa8254527b52b336a60f9373740ea', '5f7fb0d98491f5efdf52623a7d4839aa', 3 , N'sáng: 0, trưa: 0, chiều: 1, tối: 0'),
('de9aa8254527b52b336a60f9373740ea', 'e365252333bf5bd19b86b828e64b0eb0', 3 , N'sáng: 0, trưa: 0, chiều: 1, tối: 0'),
('de9aa8254527b52b336a60f9373740ea', '8e89704ade7f8e48da32ce2d6bb15054', 3 , N'sáng: 0, trưa: 0, chiều: 1, tối: 0'),
('21879306649bc1429b0f6d9d57217356', '1a27a82eb264532c271baf05c7a6e10d', 10 , N'sáng: 1, trưa: 1, chiều: 1, tối: 0'),
('21879306649bc1429b0f6d9d57217356', 'c93c634859e543a562441ca36f9bd9f0', 10 , N'sáng: 1, trưa: 1, chiều: 1, tối: 0'),
('21879306649bc1429b0f6d9d57217356', '2b1937a02cb1cc8255ecfeb8dc38c5d2', 12 , N'sáng: 1, trưa: 1, chiều: 1, tối: 0'),
('56e00973cbc998b7ddce6cdc45b3cd25', '589ff60828e99f431d7f07d8ef62baff', 6 , N'sáng: 1, trưa: 1, chiều: 1, tối: 0'),
('56e00973cbc998b7ddce6cdc45b3cd25', '7c7f0e401b7926cb956e1e798e7d6664', 6 , N'sáng: 1, trưa: 1, chiều: 1, tối: 0'),
('56e00973cbc998b7ddce6cdc45b3cd25', 'd0141bd1067e2f534fd908b54a72a1ff', 4 , N'sáng: 1, trưa: 1, chiều: 1, tối: 0'),
('8c6abf5a30122f683a29871b67190785', '976f58180ccfd7c80f492b1665fd003a', 8 , N'sáng: 1, trưa: 1, chiều: 1, tối: 0'),
('8c6abf5a30122f683a29871b67190785', '9faeec1795e05223ab80bf4d06971616', 8 , N'sáng: 1, trưa: 1, chiều: 1, tối: 0'),
('8c6abf5a30122f683a29871b67190785', '9e9af1d637a369cdaf6bac028b8bd813', 8 , N'sáng: 1, trưa: 1, chiều: 1, tối: 0'),
('65a4f559051183b9a50cda6876422baa', '2b1937a02cb1cc8255ecfeb8dc38c5d2', 6 , N'sáng: 1, trưa: 0, chiều: 1, tối: 0'),
('65a4f559051183b9a50cda6876422baa', '5f7fb0d98491f5efdf52623a7d4839aa', 8 , N'sáng: 1, trưa: 1, chiều: 1, tối: 0'),
('jfbihwebdfaibwuhdoewaudouewdsdcs', 'nscojdicjndjncdsncowinc992n9e444', 12 , N'sáng: 1, trưa: 0, chiều: 1, tối: 0' ),
('jfbihwebdfaibwuhdoewaudouewdsdcs', 'hsabfkhasbnafksdjflwuefghifug434', 4 , N'sáng: 1, trưa: 0, chiều: 1, tối: 1' ),
('78ijhgfre4567yhgvfde45tgfder5trr', 'ffbakjfbkjnflsjfaoh3f43fh43fhj4f', 12 , N'sáng: 1, trưa: 1, chiều: 1, tối: 0' ),
('78ijhgfre4567yhgvfde45tgfder5trr', 'jhnjuygresxdwswe4ert5ty7y7yu7yu7', 20 , N'sáng: 1, trưa: , chiều: 1, tối: 0' ),
('78ijhgfre4567yhgvfde45tgfder5trr', 'skskcdjvdjndfouhq9fhfqhf98hf9q2e', 10 , N'sáng: 1, trưa: 0, chiều: 0, tối: 0' ),
('98ujgfredsw23wasxcvghy567tfr56yu', 'kdjbnalkjdnfawhefoaihofhi3o4fho3', 8 , N'sáng: 1, trưa: 0, chiều: 0, tối: 0' ),
('98ujgfredsw23wasxcvghy567tfr56yu', 'afnaofhdofuhq93fh9fn93unf993fj39', 10 , N'sáng: 1, trưa: 1, chiều: 1, tối: 0' ),
('98ujgfredsw23wasxcvghy567tfr56yu', 'dadncadnclknofijf834u38fu3ffij44', 14 , N'sáng: 1, trưa: 1, chiều: 1, tối: 0' ),
('123432wsdfgy65433rtyikjngftgfdrr', 'lkjhgfdfghjiuytfvbnmngft65456546', 4 , N'sáng: 1, trưa: 0, chiều: 1, tối: 0' ),
('123432wsdfgy65433rtyikjngftgfdrr', 'mnbvcxcvbnbvcxcvbgretytrty654rrr', 4 , N'sáng: 1, trưa: 0, chiều: 1, tối: 0' ),
('876iuyuijhgbnmnbvfdfghgfghgfdfgh', 'f7gfq83fhqn9u93uvn3n94inv93vnvni', 20 , N'sáng: 1, trưa: 0, chiều: 1, tối: 1' ),
('876iuyuijhgbnmnbvfdfghgfghgfdfgh', 'vndslvncnvsdnlckdmslkcmdfkfjpi04', 16 , N'sáng: 1, trưa: 1, chiều: 1, tối: 0' ),
('876iuyuijhgbnmnbvfdfghgfghgfdfgh', 'sdcsdcndslcnlkncokqsmxoqskmow999', 14 , N'sáng: 1, trưa: 0, chiều: 1, tối: 0' ),
('876iuyuijhgbnmnbvfdfghgfghgfdfgh', 'bntyju7k98ok7j6hy5tgerf3g4th5777', 8 , N'sáng: 1, trưa: 0, chiều: 0, tối: 0' ),
('12343wsxdrtyhio98765678ujbvcfrty', 'gthygbvfer4567ujhnbgvfer4t56ygrf', 4 , N'sáng: 1, trưa: 0, chiều: 0, tối: 0' ),
('0987uijnbgtyu876tyhbvfdty654erfe', 'ncbxvfdsrtyruthfgdfsderw54678i6u', 9, N'sáng: 1, trưa: 0, chiều: 1, tối: 0' ),
('0987uijnbgtyu876tyhbvfdty654erfe', 'jfhwoeihfwoehfewifwwf28h032fj039', 15 , N'sáng: 1, trưa: 1, chiều: 1, tối: 0' ),
('0987uijnbgtyu876tyhbvfdty654erfe', 'fgrth67j68k76j75h64g3g54h6545g3f', 12 , N'sáng: 1, trưa: 1, chiều: 1, tối: 0' ),
('bbfenjoeijfnowekmfoiefn2epovng3u', 'bnbfrt56yuhgfe34r5tre345t6y7u78i', 20 , N'sáng: 1, trưa: 1, chiều: 1, tối: 0' ),
('bbfenjoeijfnowekmfoiefn2epovng3u', 'rhtyju76756y45t34t4f2g43g54hh4y5', 15, N'sáng: 1, trưa: 0, chiều: 1, tối: 0' ),
('bbfenjoeijfnowekmfoiefn2epovng3u', 'xwmspxmwspckmdwockdocnejvn939939', 16, N'sáng: 1, trưa: 1, chiều: 0, tối: 1' ),
('nbtyhgftyhvfrtyhgfrtuhfr6ygr56y7', 'bnbft67uhgfr567uhgfrt678ujhgfr55', 24 , N'sáng: 1, trưa: 1, chiều: 1, tối: 0' ),
('nbtyhgftyhvfrtyhgfrtuhfr6ygr56y7', 'bvcnvmhtye678665rtgdgfw5t4657u6y', 12 , N'sáng: 1, trưa: 0, chiều: 1, tối: 0' ),
('nbtyhgftyhvfrtyhgfrtuhfr6ygr56y7', '45678ijhbfr5678987654fghy654rfgg', 8 , N'sáng: 1, trưa: 0, chiều: 0, tối: 0' ),
('zwasxesxwsxesxxwesxertbygbyygggg', 'vbcndsfwrtyui57654rffwer4356475u', 30 , N'sáng: 1, trưa: 1, chiều: 1, tối: 0' ),
('zwasxesxwsxesxxwesxertbygbyygggg', 'nbvgtyhgfty7654edfghu876ytfcfdre', 20 , N'sáng: 1, trưa: 1, chiều: 1, tối: 0' ),
('zwasxesxwsxesxxwesxertbygbyygggg', 'bnbvsdfwrt4354y6u75hyrterfwe23d3', 15 , N'sáng: 1, trưa: 0, chiều: 1, tối: 1' ),
('zwasxesxwsxesxxwesxertbygbyygggg', 'nbfgety65544refgrety65u7yhrtg4y6', 18 , N'sáng: 0, trưa: 0, chiều: 1, tối: 1' ),
('zwasxesxwsxesxxwesxertbygbyygggg', 'hikjkiokmjkioijhgfr543er34rertt5', 10 , N'sáng: 0, trưa: 0, chiều: 1, tối: 0' ),
('5vbyhbygbngybtyfvbrdfvvrdcfverdc', 'c69f4b52c792233f31e11393012e5e19', 8 , N'sáng: 1, trưa: 0, chiều: 1, tối: 0' ),
('5vbyhbygbngybtyfvbrdfvvrdcfverdc', 'getry5u7utyh6t6yh6ytgvtgb6tfyhkk', 8 , N'sáng: 1, trưa: 0, chiều: 1, tối: 0' ),
('5vbyhbygbngybtyfvbrdfvvrdcfverdc', 'vbnjiokjnhjutfdqdacdewfyuyghnhhn', 5 , N'sáng: 1, trưa: 0, chiều: 0, tối: 1' ),
('ryfhdsiuwayehaf8a7iewuyrh8fiwaer', 'vndslvncnvsdnlckdmslkcmdfkfjpi04', 10 , N'sáng: 1, trưa: 1, chiều: 1, tối: 0' ),
('ryfhdsiuwayehaf8a7iewuyrh8fiwaer', 'jhnjuygresxdwswe4ert5ty7y7yu7yu7', 12, N'sáng: 1, trưa: 0, chiều: 1, tối: 1' ),
('ryfhdsiuwayehaf8a7iewuyrh8fiwaer', '124b0999a2e3a37b30f8b4d4196d5666', 8, N'sáng: 1, trưa: 0, chiều: 1, tối: 0' ),
('ryfhdsiuwayehaf8a7iewuyrh8fiwaer', 'e365252333bf5bd19b86b828e64b0eb0', 14, N'sáng: 1, trưa: 1, chiều: 1, tối: 0' ); 

INSERT INTO Feedback (feedbackID, appointmentID, feedbackContent, title, feedbackTime, rating)	
VALUES
	( 'a4e6c35adb5663181253e2c610ceb080' , 'a6a837e5d05e57e160dea29c335f30d0', N'Các nhân viên phòng khám đã vượt lên trên tất cả để đảm bảo sự thoải mái và hài lòng cho tôi. Từ sự chào đón nồng nhiệt tại quầy lễ tân đến các y tá và bác sĩ tận tình, dịch vụ khách hàng đặc biệt của họ thực sự nổi bật.', N'Dịch vụ khách hàng rất tốt', GETDATE(), 5),
	( '1926f20e0d3c56f9a5e4d9dea3a1ca23' , '95b579fe61c622b5c50def9dccb66bdc', N'Cơ sở vật chất hiện đại của phòng khám đã gây ấn tượng với tôi. Các thiết bị hiện đại và môi trường thoải mái đã góp phần tạo nên trải nghiệm tích cực và không căng thẳng trong chuyến thăm của tôi.', N'Cơ sở vật chất hiện đại', GETDATE(), 4.5),
	( 'c7c84d9b4f86cab7091dfc674da2d233' , '86ae960dc44eba248c481d76520846c3', N'Các bác sĩ tại phòng khám này có kiến ​​thức cao trong lĩnh vực tương ứng của họ. Họ đã dành thời gian để giải thích cặn kẽ về tình trạng cho chim của tôi, giải đáp mọi lo lắng của tôi và đưa ra các phương án điều trị thích hợp.', N'Bác sĩ chuyên nghiệp', GETDATE(), 4),
	( 'b85f8bf4eef0d6343a8ac49e824fdb77' , '801b58e3d0b00f7f9f9eac80058f99f0' , N'Hệ thống đặt lịch hẹn phòng khám là hiệu quả và thuận tiện. Tôi đánh giá cao việc đặt lịch hẹn dễ dàng như thế nào và nhân viên đảm bảo giảm thiểu thời gian chờ đợi, cho phép tôi quản lý lịch trình của mình một cách hiệu quả.' , N'Lên lịch hẹn hiệu quả' , GETDATE(), 4.5 ),
	( '3871a21957320daf0208624dea20b3db' , 'ca768c1b1876a2f286496e62666dfada' , N'Các nhân viên phòng khám có vẻ coi thường tôi, họ nói chuyện với tôi một cách cẩu thả và qua loa nhưng may là vẫn được các bác sĩ nói chuyện thân thiện và nhiệt tình' , N'Nhân viên không thân thiện' , GETDATE(), 2.5 ),
	( 'c3f1ad462249f3d02191d1a9a872e881' , '0a7a30124b6b4f266459a6b69677152c' , N'Phòng khám duy trì một môi trường sạch sẽ và hợp vệ sinh, điều cần thiết cho bất kỳ cơ sở y tế nào. Tôi cảm thấy yên tâm khi biết rằng các biện pháp vệ sinh phù hợp đã được áp dụng.' , N'Môi trường sạch sẽ và hợp vệ sinh' , GETDATE(), 4),
	( 'b529c5b6c02436d52646b251135a8580' , 'ebcf025d47ee19d929f6707029df09d0' , N'Các bác sĩ tại phòng khám này đã đưa ra chẩn đoán kịp thời và chính xác, cho phép điều trị kịp thời. Chuyên môn và sự chú ý của họ đến từng chi tiết rất đáng khen ngợi.' , N'Chẩn đoán kịp thời và chính xác' , GETDATE(), 4.5 ),
	( '6b608c52effdd5d149613fd5ebf4c55c' , 'b7e4621ca7d7273ea67ba0b40992d189' , N'Phòng khám này cung cấp các dịch vụ y tế tạm được, chỉ phục vụ cho các nhu cầu y tế, không có quá nhiều dịch vụ.' , N'Dịch vụ Y tế tạm được' , GETDATE(), 3 ),
	( 'e4da29dfa2d7f2e893b7068eba2f2665' , '35847b5a3a8de7e0af06281b1d889bcf' , N'Phòng khám vượt trội trong giao tiếp. Các bác sĩ và nhân viên chăm chú lắng nghe những lo lắng của tôi và truyền đạt rõ ràng, đảm bảo rằng tôi hiểu rõ quá trình điều trị và bất kỳ bước tiếp theo cần thiết nào.' , N'Giao tiếp xuất sắc' , GETDATE(), 5 ),
	( 'c208fe80be67e0ac443894edf9048959' , 'ca05b981160139795fbf616bfd5d491b' , N'Phòng khám cung cấp dịch vụ chăm sóc cá nhân phù hợp với từng nhu cầu của bệnh nhân. Họ đã dành thời gian để hiểu hoàn cảnh đặc biệt của chim tôi, đảm bảo một kế hoạch điều trị cá nhân và hiệu quả.' , N'Chăm sóc cá nhân' , GETDATE(), 5 ),
	( '95e8fffd6181170d848151e13d25c397' , '943b4c67a61164d245ea5af7f3848a37' , N'Phòng khám có một bầu không khí tích cực và chào đón khiến tôi cảm thấy thoải mái ngay lập tức. Những nụ cười thân thiện và môi trường hỗ trợ đã góp phần tạo nên trải nghiệm không căng thẳng.' , N'bầu không khí tích cực' , GETDATE(), 5 ),
	( 'bfbc8861190e55a089b0c4afc1c41a07' , '040c93cff9c0cc5cd6d008fb02e17b69' , N'Phòng khám duy trì thực hành giá cả minh bạch. Họ cung cấp giải thích chi tiết về các chi phí liên quan, đảm bảo không có bất ngờ hoặc phí ẩn.' , 'Định giá minh bạch' , GETDATE(), 5 ),
	( '4dcb301699e281d9eda42ee915f8c91d' , '3841cd8942a581d2092ff1d3739fcebc' , N'Các quy trình theo dõi hiệu quả của phòng khám đã gây ấn tượng với tôi. Họ nhanh chóng lên lịch cho bất kỳ cuộc hẹn tiếp theo cần thiết nào và đảm bảo sự chăm sóc liên tục.' , N'Quy trình theo dõi hiệu quả' , GETDATE(), 5 ),
	( '3f8c2d5acfcad832c564afe05fdc4dd2' , '4a160bb951e81bb14485ab90391d0c58' , N'Phòng khám này tích hợp công nghệ hiện đại vào thực hành của họ. Từ hồ sơ y tế điện tử đến các công cụ chẩn đoán tiên tiến, cam kết đổi mới của họ là điều hiển nhiên.' , N'Tích Hợp Công Nghệ Hiện Đại' , GETDATE(), 5 ),
	( '02025191b401a33ee5d5dbf672b0d9cd' , 'aeed52468a0d9880fa013c611816e897' , N'Phòng khám đặt trọng tâm mạnh mẽ vào lời khuyên dành cho chim. Họ cung cấp cho tôi những thông tin có giá trị về tình trạng của chim, giúp tôi đưa ra những quyết định sáng suốt về sức khỏe của chim.' , N'Chú trọng vào lời khuyên làm đẹp' , GETDATE(), 5),
	( 'f31300a92d53523f7c9e63f082429559' , 'cde92de8a056398e6a281dba87bdffb1' , N'Vị trí thuận tiện của phòng khám làm cho nó dễ dàng tiếp cận. Vị trí gần với phương tiện giao thông công cộng và nhiều lựa chọn đỗ xe là một sự thuận tiện tuyệt vời.' , N'Vị trí thuận tiện' , GETDATE(), 5 ),
	( '021c8752a33aa45ffaabbc24b9718c65' , '6c3b331b0cde4d503944f2f16f979c93' , N'Phòng khám nuôi dưỡng một môi trường tôn trọng và không phán xét. Các nhân viên đối xử với mọi người một cách đàng hoàng và tôn trọng, tạo ra một không gian an toàn cho chim.' , N'Môi trường tôn trọng và không phán xét' , GETDATE(), 4.5 ),
	( '2b72c3de10429d9be2c5b7f6fb799eb7' , 'b6b447b56dbe005a626c4b5e3fdb97be' , N'Phòng khám cung cấp hỗ trợ theo dõi toàn diện. Họ đã chủ động trong việc đảm bảo sự tiến bộ của chim và giải quyết mọi vấn đề sau điều trị.' , N'Hỗ trợ theo dõi toàn diện' , GETDATE(), 5),
	( 'b3ce71cf9331b8139a30efa95f01af8a' , 'a61de36f81c0f699a8653863ea9e3d2f' , N'Các dịch vụ theo toa của phòng khám rất hiệu quả và không rắc rối. Các nhân viên đã nhanh chóng xử lý đơn thuốc cho chim, giảm thiểu bất kỳ sự bất tiện nào.' , N'Dịch vụ kê đơn hiệu quả' , GETDATE(), 5 ),
	( 'c83755957ea168197e2362912cd8ebdc' , '47b601885ddc891de11eb62451a97b43' , N'Cách tiếp cận đồng cảm của phòng khám đối với bệnh nhân là đáng khen ngợi. Họ thực sự quan tâm đến sức khỏe của chim và thể hiện sự thấu hiểu trong suốt quá trình điều trị cho chim.' , N' Cách tiếp cận đồng cảm' , GETDATE(), 4.5 ),
	( 'a413ed3e5df4149bb41c5a55ab70cca8' , '2f7294ec43136a43ca696ad6f06e1635' , N'Đội ngũ nhân viên đa ngôn ngữ của phòng khám là một lợi thế lớn cho bệnh nhân đến từ nhiều nguồn gốc khác nhau. Khả năng giao tiếp bằng các ngôn ngữ khác nhau tạo điều kiện cho các tương tác hiệu quả giữa bác sĩ và chim của khách hàng.' , N'Bác sĩ giỏi ngoại ngữ' , GETDATE(), 5 ),
	( 'b2e26005217a74208df092883606602e' , '090f345a844fedfb9ca86ff69b59d969' , N'Phòng khám này cung cấp các đánh giá sức khỏe toàn diện nhằm cung cấp sự hiểu biết thấu đáo về sức khỏe tổng thể của chim. Những đánh giá chuyên sâu của họ vượt xa các cuộc kiểm tra thông thường.' , N'Đánh giá sức khỏe toàn diện' , GETDATE(), 5 ),
	( '288269426198f8724d0da8a362f7cc2d' , 'd2601ee48263e69982e4dbd809c0358a' , N'Phòng khám vượt trội trong quản lý đau. Họ cung cấp các phương pháp điều trị và trị liệu hiệu quả làm giảm đáng kể sự khó chịu của chim.' , 'Quản lý cơn đau hiệu quả' , GETDATE(), 5 ),
	( '6d8e4dfa0f9a9938e767039bba8c43b4' , 'e221bebf131b7773da0045982e018fba' , N'Khu vực chờ của phòng khám được chào đón và thoải mái. Bầu không khí dễ chịu và các tiện nghi chu đáo đã giúp tạo ra một bầu không khí thoải mái.' , N'Khu vực chờ thoải mái' , GETDATE(), 5 ),
	( 'af5013fa896bf00600b23c7a8b4995d4' , '85c10fd22fe836139fd76fbaee831673' , N'Tôi rất ấn tượng bởi hiệu quả của phòng khám trong việc cung cấp kết quả xét nghiệm. Họ cung cấp thông tin cập nhật nhanh chóng, đảm bảo các quyết định kịp thời liên quan đến điều trị tiếp theo, nếu cần.' , N'Kết quả kiểm tra nhanh chóng' , GETDATE(), 5 ),
	( 'd968f7543b03fafc1e2c306edbe73cd5' , 'b7ad6a62013acd21497265b6f7ff74eb' , N'Tôi đánh giá cao cách tiếp cận toàn diện của phòng khám đối với sức khỏe. Họ nhấn mạnh các biện pháp phòng ngừa, khuyến nghị về lối sống và các liệu pháp bổ sung bên cạnh các phương pháp điều trị y tế truyền thống.' , N'Phương pháp tiếp cận toàn diện đối với sức khỏe' , GETDATE(), 5 ),
	( 'bc049c5b9cc23a7252cd02aaef7d6571' , '3427f117121dd0789b94a37ef63b64dc' , N'Phòng khám này thể hiện cam kết cải tiến liên tục. Họ tích cực tìm kiếm phản hồi từ khách hàng để nâng cao dịch vụ của họ và trải nghiệm tổng thể của khách hàng và chim.' , N'Cam kết cải tiến liên tục' , GETDATE(), 4.5),
	( '1c693b7b7f4f3967d56242710d4a6925' , 'b7ad6137ff75b214972a6acd6206f4eb' , N'Các nhân viên điều dưỡng tại phòng khám này được đào tạo bài bản và chu đáo. Họ đã cung cấp dịch vụ chăm sóc tuyệt vời và luôn sẵn sàng giải quyết bất kỳ mối lo ngại nào.' , N'Nhân viên điều dưỡng được đào tạo bài bản' , GETDATE(), 4 ),
	( '4b9e4136b9380ce6264eba99e7cbecaa' , 'f1174d213346307894a92d177efbb6dc' , N'Dịch vụ chăm sóc hậu phẫu của phòng khám thật đặc biệt. Các nhân viên cung cấp các hướng dẫn rõ ràng về chăm sóc sau điều trị và sẵn sàng giải đáp mọi thắc mắc hoặc lo lắng.' , N'Chăm sóc hỗ trợ sau thủ thuật' , GETDATE(), 4.5 ),

	( 'ffdd5d149613f6b608c52ed5ebf4c55c' , 'fbvwiebfewfgqiugfiwgfiyvefiyefue' , N'Phòng khám này cung cấp các dịch vụ y tế rất tốt, đầy đủ các loại dịch vụ cần thiết.' , N'Dịch vụ Y tế tốt' , GETDATE(), 4.5 ),
	( '6hbdgdgrgffdd5d149613fd5ebf4c55c' , 'fabdskf8wg3fb87fgbq87fh87f387hf4' , N'Các nhân viên ở đây rất nhiệt tính giúp đỡ tôi.' , N'Thái độ của nhân viên' , GETDATE(), 4 ),
	( '6by57tjuyhrtgt54y6t13fd5ebf4c55c' , 'ihsbgeyb87rwf80hwf8hf983hf837hf8' , N'Cơ sở vật chất khá tốt mặc dù còn nhiều điểm còn cần cải thiện thêm' , N'cơ sở vật chất' , GETDATE(), 3.5 ),
	( '6b608c587u6ygrrghetgegwrwfr4c55c' , 'fiabfibvfaiwuyebfawe8fb8aa37fa77' , N'Thủ tục ở đây rất hiệu quả và nhanh chóng.' , N'thủ tục' , GETDATE(), 4.5 ),
	( 'gsfdfsffrrrgd5d149613fd5ebf4c55c' , 'frfhbafihfioahfewaufiuwefa7fhah2' , N'Có lẻ tôi không được chào đón ở đây, bác sĩ lẫn nhân viên đều có thái độ không tốt với khách hàng.' , N'Thái độ của nhân viên và bác sĩ' , GETDATE(), 3 ),
	( '5g608c52effdd5dhu76tyrtg54y6htrr' , 'foijdaofhdfouha9fhewafh8hf9f983h' , N'Các bác sĩ khám bệnh cho chim rất tận tâm và tận tụy.' , N'Bác sĩ' , GETDATE(), 5 ),
	( '6b608c52effrte7y4uh4g3g4f34rf3fc' , '8ajwijwefjao8a98a9fa9unfr9nr9238' , N'Giá dịch vụ ở đây quá đắt đỏ, thuốc thì có lẻ bình ổn hơn.' , N'Giá dịch vụ' , GETDATE(), 3 ),
	( 'sghj65h6hdd5d14etgerefd5ebf4c55c' , '8ry98h23r923jd9h23f9b3fa8ufb8fuf' , N'Tiền thuốc có lẻ hơi cao so với các phòng khám khác.' , N'Tiền thuốc' , GETDATE(), 3.5 ),
	( '54y6h52effdd5d14rgerwf4f43f33444' , 'fajwnfjdnfiduhfa9hf984f398334934' , N'Giá dịch vụ và thuốc không quá mắc, chất lượng tốt.' , N'giá dịch vụ, thuốc và chất lượng' , GETDATE(), 5 ),
	( 'y65uygegrt54y6h49ergrfrwfefec55c' , '892809f2jf92n39f923fnh92hf9h9dn3' , N'Phòng khám có vẻ lạc hậu, với trang thiết bị cũ và không đầy đủ, dẫn đến việc chăm sóc y tế cho vật nuôi dưới mức trung bình.' , N'Thiếu thiết bị phù hợp' , GETDATE(), 2 ),
	( 't546y5uythggert35465uyhrtegt5555' , 'fafjndjfnaieufniudfnaewufha9f483' , N'Các cuộc hẹn thường xuyên bị trì hoãn và thời gian chờ đợi quá lâu, gây căng thẳng không cần thiết cho cả vật nuôi và chủ của chúng.' , N'Thời gian chờ đợi lâu' , GETDATE(), 3.5 ),
	( '798uyhgtrt5y6htgrft56yhtgrfrt5gg' , '9229jf2nfj92nf9e2fuefe2fn9en9ksn' , N'Các bác sĩ ở đây chữa bệnh rất mát tay, tay nghề rất tốt.' , N'kỹ năng bác sĩ' , GETDATE(), 4.5 ),
	( '0987hnbrgehryjytrfsfyetgregtgtgt' , 'ffjndiojf98f98f9jffi9j39f3f94394' , N'Phòng khám này cung cấp các dịch vụ y tế tạm được, chỉ phục vụ cho các nhu cầu y tế, không có quá nhiều dịch vụ.' , N'Dịch vụ Y tế tạm được' , GETDATE(), 3 ),
	( 'r4354675ijhgert54y65u77uyergre55' , 'smxokwmxowmsxowncuecu2cun8328444' , N'Không chỉ có các bác sĩ mà những nhân viên ở đây đều rất nhiệt tình và tận tụy.' , N'Thái độ của bác sĩ và nhân viên' , GETDATE(), 5 ),
	( '567i8kuythngerfwt54y65ujtyhgerty' , '98r923r9j3eifn92nu9rewidjf3uf93j' , N'Các bác sĩ thú y dường như thiếu kinh nghiệm và không đủ năng lực, dẫn đến chẩn đoán sai và điều trị không đúng cách cho thú cưng của chúng ta.' , N'Bác sĩ thú y không đủ năng lực' , GETDATE(), 3 ),
	( '9i87uyhgbrt5y6uyhgtrt5y6hfrrt56y' , 'fofijewijfew9fn9uewfnue9ue2f9ef9' , N'Bác sĩ không được nhiệt huyết cho lắm nhưng lại có kỹ năng và kiến thức tốt.' , N'Thái độ của bác sĩ' , GETDATE(), 4 ),
	( '797uyetgsghtreu5674ey5w434wagret' , 'ff8u929fjimd2f9n9fmunr94r8fu3nfu' , N'Một phòng khám được trang bị tốt phải có các thiết bị và dụng cụ y tế cần thiết để chẩn đoán và điều trị các tình trạng bệnh lý khác nhau.' , N'Trang thiết bị y tế' , GETDATE(), 4.5 ),
	( '9878675ytgbgetyujthyrgteyjthngte' , 'f9r2jr03imfnrviefn93uf3urfuruuur' , N'Bên ngoài phòng khám không được sạch sẽ cho lắm.' , N'phòng khám' , GETDATE(), 4 ),
	( '987uyhngbfvert5y6u7jyhtgrfe4t5yh' , '78439i4j5tjfkide8u34j5rkfidueree' , N'Phòng khám thường xuyên không sạch sẽ và thiếu vệ sinh phù hợp, điều này làm dấy lên lo ngại về sự lây lan của các bệnh nhiễm trùng.' , N'Vệ sinh kém' , GETDATE(), 3.5 ),
	( '12456ujnfbfertyu8765thgbfr56yggg' , '45678ikjhgfdertyhjnbvcdftyujmnbv' , N'Nhà thuốc có đầy đủ hàng hóa là điều cần thiết để cung cấp thuốc điều trị kịp thời cho vật nuôi.' , N'Nhà thuốc' , GETDATE(), 5 );
	
INSERT INTO Blog (blogID, imageID, title, uploadDatetime, category, _description , blogContent)
VALUES
	( '36c8417c829ea8b07014eb3ca7946fb0', '6EF02AE8CD5103C4C74B8CAAF1471D90', N'Stylish and Social, Winter Waxwings Provide a Wonderful ID Challenge', GETDATE()
	, N'distinguish', 
	N'Bohemian and Cedar Waxwings look very similar and are more likely to intermingle in the colder months. Here’s how to tell them apart.',

	N'<p>When you hear a chorus of high-pitched&nbsp;<em>see!</em>&nbsp;notes overhead, expect a good time: A rambunctious flock of waxwings is on its way. Highly social birds that appear to have no sense of personal space, North America&rsquo;s two waxwing species&mdash;Bohemian and Cedar&mdash;also look very similar.&nbsp;Telling these elegant birds apart makes for an excellent ID challenge.</p>

<p>During the breeding season, location can provide an initial gut check. Cedar Waxwings are predominant throughout the northern continental United States and southern Canada, inhabiting open areas or forest edges. Bohemian Waxwings are found mostly in boreal forests and muskeg in Alaska and western Canada, with some records in the northwestern United States, too.</p>

<p>But the species overlap in parts of their ranges, and that common ground grows during the winter, when both rove far and wide in search of food. Because of their fruit-heavy diet, you&rsquo;re not likely to find either species at a bird feeder, but you might encounter them at any fruiting tree in their range, even ornamental trees in yards and parking lots.</p>

<p>During the winter months, Cedar Waxwings range further south than Bohemians on average, showing up throughout southern Canada, the continental United States, Mexico, and sometimes Central America. While Bohemian Waxwings are generally scarce and irregular south of the Canadian border, they can become locally numerous in the northern Rocky Mountains east to northern Minnesota. In years when food is scarce, they may wander southward along the Rockies or into the Midwest, New York, New England, and rarely even further south. These southward-straying Bohemians sometimes join up with flocks of the more common Cedars.</p>

<p>When you come across a flock with both species, size might be the most obvious differentiator. Cedar Waxwings are smaller, similar in size to a large sparrow. Bohemians are nearly an inch longer and twice as heavy; in flight, they may give the impression of a European Starling. However, size can also deceive. A Cedar Waxwing may look larger when flying solo or when fluffed up against the cold.</p>

<p>Certain plumage characteristics offer diagnostic identification points, too. Bohemians take on a cooler gray tone overall with a red-orange face, while Cedars appear sandy or tan. Bohemians also have more intricate patterning on their wings, with more white marks and a yellow streak running down their primary wing feathers. Finally, and perhaps most tellingly, Bohemians have rust-colored undertail coverts&mdash;the feathers that meet the tail on the bird&rsquo;s underside&mdash;while Cedars&rsquo; undertail coverts are white.&nbsp;</p>

<p><img src="https://media.audubon.org/bohemian-waxwing_silver-leapers_flickr-cc-by-2.0.jpg" /></p>

<ul>
	<li>Red-orange face</li>
	<li>Larger overall, with a cool gray tone</li>
	<li>White marks and yellow stripe on wing</li>
	<li>Rust-colored undertail coverts</li>
</ul>

<p>Bohemian Waxwing. Photo:&nbsp;<a >Silver Leapers</a>/Flickr (CC BY 2.0)</p>

<p><img src="http://imageshack.com/a/img923/3241/QUI3kz.jpg" /></p>

<ul>
	<li>Smaller overall, with a tan or sandy tone</li>
	<li>Wings lack white and yellow markings</li>
	<li>White undertail coverts</li>
</ul>

<p>Cedar Waxwing. Photo: Jonathan Nikkila/Audubon Photography Awards</p>

<p>The sexes look similar in both species, but male Cedar and Bohemian Waxwings both tend to have more extensive black in their chins than the females do. Males also have bigger waxy red tips&mdash;yes, it&#39;s actually a waxy secretion&mdash;on their feathers than females, on average. Note that both features can be difficult to discern in the field. Meanwhile, juveniles of both species are grayer and streaky, and don&rsquo;t take on their signature wingtips until they mature. It&rsquo;s not totally clear what the wax wings are for, but older birds have more of them, so it&rsquo;s possible that they signal the health, age, and social status of birds to other members of the flock.</p>

<p>The two birds sound similar and occasionally identical, but with practice you can usually differentiate them by voice. Cedar Waxwings make extremely high-pitched whistles and trills, which can sound almost insectlike. Bohemian Waxwings generally make a more guttural rattling trill, like a wet metal whistle.&nbsp;</p>

<p>As the winter approaches and migratory birds head south, the potential for a waxwing sighting provides a source of excitement and motivation to go out birding in the cold. Hopefully you&rsquo;ll be rewarded this winter with opportunities to see and study both waxwing species, enjoy their antics, and gain a deeper appreciation of these charismatic birds.</p>
')


,   ( '40f3cc38ef656d749d2e2a368b59711e', 'A5B46B0BE55F8F58150695E37716B424', N'Favorite Female Bird Shots',  GETDATE(), N'Bird Shots',
	N'Marvel at the beauty and ingenuity of 14 birds that often get overlooked.',

	N'<p>Female birds continue to delight and inspire us. From the subtle beauty of a Spruce Grouse hen to the bold russet patches on a Red-necked Phalarope, the female birds featured in this gallery captured the eyes and imaginations of photographers from across North America who entered the female bird category of the&nbsp;<a </a>.</p>

<p>Launched in 2021 to call attention to some of the most overlooked birds in the world, the female bird category challenges photographers to focus their cameras and attention on the sex that is too often ignored. Although these shots didn&#39;t take any of the top prizes&mdash;you can see all of the winners&nbsp;<a>here</a>&mdash;we couldn&#39;t help but share these equally inspiring images. You can also find more amazing photography from this year&#39;s competition in our annual&nbsp;<a>Top 100</a>&nbsp;review.&nbsp;</p>

<p>If after perusing the below gallery you find yourself inspired to pick up a camera and photograph avians on your own, our&nbsp;<a>photography section</a>&nbsp;has&nbsp;everything you need to get started, including&nbsp;<a>tips and how-to&#39;s</a>&nbsp;and Audubon&#39;s&nbsp;<a>ethical guidelines</a>&nbsp;for wildlife photography. Then get out there&nbsp;and start documenting your favorite winged&nbsp;subjects&mdash;male<em>&nbsp;and</em>&nbsp;female.&nbsp;</p>

<h3>Northern Cardinal by Nicole Land (above)</h3>

<p><strong>Location:&nbsp;</strong>Cotulla, Texas<br />
<strong>Behind the Shot:</strong>&nbsp;I was taking a photography workshop and exploring different camera bodies and lenses when I took this photograph. While using the Canon R5 (600mm lens) in shutter mode, we focused on the common birds in front of us&mdash;which happened to be a beautiful female Northern Cardinal bathing at the bird blind. Bath time is a great opportunity to practice photography skills like the importance of shutter speeds versus aperture settings. This&nbsp;cardinal saw me shooting and didn&rsquo;t seem to care. The bath was way more important, so I was able to get many shots of various bathing poses.&nbsp;<br />
<strong>Female ID tip:&nbsp;</strong>Female Northern Cardinals are readily identifiable with their gorgeous beige and subtle red plumage.&nbsp;</p>

<h3>Belted Kingfisher by Jerry amEnde</h3>

<p><img alt="From a large snag crossing the frame to the right, a female Belted Kingfisher launches into the air leftward with its wings outstretched. The bird’s heavy bill, spiky crest, and chunky head and body are in profile, its rusty breast stripe on full display." src="https://media.audubon.org/2023-07/2_Web_Aud_APA-2023_Belted-Kingfisher_A1_25981-0_Photo-Jerry-amEnde.jpg?width=2400&amp;auto=webp&amp;quality=90&amp;fit=bounds&amp;disable=upscale&amp;blur=200" /></p>

<p>Belted Kingfisher.&nbsp;Photo:&nbsp;Jerry amEnde/Audubon Photography Awards</p>

<p><strong>Location:&nbsp;</strong>Bombay Hook National Wildlife Refuge, Delaware<br />
<strong>Behind the Shot:&nbsp;</strong>Belted Kingfishers are one of the most skittish birds to photograph. As soon as you get out of the car, they are almost sure to fly away. Therefore, the technique I&rsquo;ve developed to photograph them is to find a favorite perch that the birds regularly return to, park a respectful distance away, and wait while using the car as a blind. I found one such perch at Bombay Hook National Wildlife Refuge and shot several images of this female. Then, suddenly, she flew off the perch, and I was able to catch a photo of her in lovely morning light.<br />
<strong>Female ID Tip:&nbsp;</strong>In Belted Kingfishers, the&nbsp;reddish patches on the chest and sides are only present in females.</p>

<h3>Costa&#39;s Hummingbird by Melissa Harnish</h3>

<p><img alt="A green and brown female Costa’s Hummingbird, wings still and extended forward, hovers in the middle of the frame as it uses its long beak to feed from bright orange flowers that are in focus in the forefront and blurry in the background. " src="https://media.audubon.org/2023-07/3_Web_Aud_APA-2023_Female-Costa%27s-Hummingbird_Mexican-Bird-of-Paradise_A1_25960-1_Photo-Melissa-Harnish.jpg?width=2400&amp;auto=webp&amp;quality=90&amp;fit=bounds&amp;disable=upscale&amp;blur=200" /></p>

<p>Costa&#39;s Hummingbird.&nbsp;Photo:&nbsp;Melissa Harnish/Audubon Photography Awards</p>

<p><strong>Location:</strong>&nbsp;Oro Valley, Arizona<br />
<strong>Behind the Shot:&nbsp;</strong>Photographing hummingbirds has always been an obsession of mine. There is something about the detail of their tiny feathers and straw-like tongues that fascinates me. On this particular morning, I had gone outside my home, coffee in hand, when I noticed this female Costa&rsquo;s Hummingbird flitting from flower to flower. There was something about her simple green iridescent feathers against the bright orange flowers of the Mexican Bird of Paradise that compelled me to grab my camera. Little did I know that capturing this image would occupy my time for several hours; every time I raised my camera to click the shutter, she would dart away, leaving me to patiently wait for her return. After several hours, I finally got the shot.&nbsp;&nbsp;<br />
<strong>Female ID tip:&nbsp;</strong>Female Costa&rsquo;s Hummingbirds are overall green and gray, and lack the male&#39;s bright magenta-purple gorget and head feathers.&nbsp;</p>

<h3>Pine Grosbeak by Yan Zhang</h3>

<p><img alt="Against a blurred green and red background a creamy-gray female Pine Grosbeak hangs upside down from a single branch feeding on its red berries in the center of the frame. The bird’s yellowish cap and cheeks give away the bird’s sex. " src="https://media.audubon.org/2023-07/4_Web_Aud_APA-2023_Pine-grosbeak-_Crabapple-tree_A1_24631-1_Photo-Yan-Zhang.jpg?width=2400&amp;auto=webp&amp;quality=90&amp;fit=bounds&amp;disable=upscale&amp;blur=200" /></p>

<p>Pine Grosbeak.&nbsp;Photo:&nbsp;Yan Zhang/Audubon Photography Awards</p>

<p><strong>Location:</strong>&nbsp;Pickering, Ontario, Canada<br />
<strong>Behind the Shot:&nbsp;</strong>Pine Grosbeaks are a magnificent winter bird, but they are fairly uncommon in Southern Ontario, as they breed in Northern Canada and the western high mountain areas across North America. This image was taken during an &ldquo;irruption year,&rdquo; when Pine Grosbeaks fly south in search of food. Photographing this female was really challenging because the birds were shy and so busy eating the berries on the trees. Fortunately, after flying away, they came back within an hour, and I captured this image using a 600mm lens to keep my distance.<br />
<strong>Female ID Tip:</strong>&nbsp;Female Pine Grosbeak can be identified by their gray and yellow feathers; males are pinkish red.</p>

<h3>Gambel&#39;s Quail by Jen Shepherd</h3>

<p><img alt="A gray female Gambel’s Quail, its back toward the camera, looks to the left as its black head plume pokes forward like an avian fascinator. Bright pink flower petals surround the bird and contrast with the brown stony ground. " src="https://media.audubon.org/2023-07/5_Web_Aud_APA-2023_Gambel%27s-Quail_A1_22557-2_Photo-Jen-Shepherd_0.jpg?width=2400&amp;auto=webp&amp;quality=90&amp;fit=bounds&amp;disable=upscale&amp;blur=200" /></p>

<p>Gambel&#39;s Quail.&nbsp;Photo:&nbsp;Jen Shepherd/Audubon Photography Awards</p>

<p><strong>Location:</strong>&nbsp;Scottsdale, Arizona<br />
<strong>Behind the Shot:&nbsp;</strong>In January, my two daughters and I spent a week in gorgeous Scottsdale for our winter vacation. Back in the 1990s l lived in the desert and loved every moment. As a lifelong photographer, I hoped to take some wildlife images on this trip and packed my Sony Alpha 7 IV with a 200-600mm lens. Before sunrise, I decided to hike up a small ridge to see what animals might be waking up. I spotted a group of birds skittering about but couldn&rsquo;t identify them because it was still too dark. Soon, though, it was bright enough for me to see that they were Gambel&rsquo;s Quail. This female paused near some rose petals, so I crouched down as low as I could and began photographing. I waited patiently until she turned her head slightly and then snapped the shutter. One second later the group ambled away.&nbsp;<br />
<strong>Female ID Tip:&nbsp;</strong>The lighter brown feathers and short plume indicate a female Gambel&rsquo;s Quail; males have black facial feathers and a much more prominent, curled plume.</p>

<h3>Wood Duck by Tammy Kokjohn</h3>

<p><img alt="A brown and white female Wood Duck sits on the ground with two chicks, its iridescent blue-purple feathers visible just above the grass line. One chick stands on the mom’s back, rubbing its head against her check, its mouth barely open." src="https://media.audubon.org/2023-07/6a_Web_Aud_APA-2023_Wood-Duck-hen_A0_24549-1_Photo-Tammy-Kokjohn.jpg?width=2400&amp;auto=webp&amp;quality=90&amp;fit=bounds&amp;disable=upscale&amp;blur=200" /></p>

<p>Wood Ducks.&nbsp;Photo:&nbsp;Tammy Kokjohn/Audubon Photography Awards</p>

<p><strong>Location:</strong>&nbsp;Santee, California<br />
<strong>Behind the Shot:&nbsp;</strong>Every spring I return to one of my favorite local lakes to see the newly hatched Wood Duck ducklings. One April morning I quickly spotted a Wood Duck hen with ducklings in the distance. I found a soft patch of grass some distance away to sit; maintaining a respectful distance is crucial in allowing adults and their ducklings to not feel threatened and for me to witness their true behavior. When I first spotted this family, they were foraging along the shoreline, nibbling the freshly sprouted grasses. Soon the hen herded her babies together and guided them up the slope to lay in the patch of grass for nap time.&nbsp;As they began to relax, one little duckling curled up close to the mother, and a second hopped on her back, sharing what looked to me like an expression of love. These adorable baby ducklings melted my heart.&nbsp;<br />
<strong>ID Tip:</strong>&nbsp;Female Wood Ducks look like a much more understated version of the male. They have the same backswept crest and stately shape, but where the males are boldly plumed the females sport delicate beige and iridescent blue-purple. Females also sport a strong white eye ring.&nbsp;</p>

<h3>American Kestrel by Robert Kaplan</h3>

<p><img alt="Against a blurry brown background an American Kestrel appears to hang in mid-air, its streaked underside facing the viewer, striped wings outstretched, and heavily barred tail fanned out. In its beak is a large red insect it just caught. " src="https://media.audubon.org/2023-07/6b_Web_Aud_APA-2023_American-Kestrel_A1_25457-0_Photo-Robert-Kaplan.jpg?width=2400&amp;auto=webp&amp;quality=90&amp;fit=bounds&amp;disable=upscale&amp;blur=200" /></p>

<p>American Kestrel.&nbsp;Photo:&nbsp;Robert Kaplan/Audubon Photography Awards</p>

<p><strong>Location:</strong>&nbsp;Brooklyn, New York<br />
<strong>Behind the Shot:&nbsp;</strong>Kestrels have always been one of my favorite birds to photograph&mdash;small, colorful, and very photogenic. For the last several years there have been one or two locations around New York where kestrels reliably feed on voles and insects. One of those places is at Floyd Bennett Field in Brooklyn. The challenge in capturing this shot was making an educated guess to which of the available perches the kestrel was going to land on. I positioned myself with the sun at my back and tracked the flight of the bird as it approached a nearby perch. When he flew off it and went to the ground in search of food, I was prepared, capturing the bird&#39;s return flight and the bug in its beak. I was gratified to see later that I had also captured, in my experience, a unique wing position. In documenting this behavior, I hope the public will see the beauty and ferociousness in North America&#39;s littlest falcon.<br />
<strong>Female ID Tip:</strong>&nbsp;Female American Kestrels have a number of plumage differences from males, but the most visible one in this photo is the dark barring along each tail feather. Male American Kestrel tail feathers are entirely red with a black tip.</p>

<h3>Bushtit by Ethan Cleveland</h3>

<p><img alt=" A gray, puffed up Bushtit, its tail pointing skyward, perches in the center of the frame on a thin brown branch that extends forward and off the right side of the image. A mix of in-focus and blurry branches make up the background and foreground. " src="https://media.audubon.org/2023-07/7_Web_Aud_APA-2023_Bushtit_Y0_25809-2_Photo-Ethan-Cleveland.jpg?width=2400&amp;auto=webp&amp;quality=90&amp;fit=bounds&amp;disable=upscale&amp;blur=200" /></p>

<p>Bushtit.&nbsp;Photo:&nbsp;Ethan Cleveland/Audubon Photography Awards</p>

<p><strong>Location:&nbsp;</strong>Denver, Colorado<br />
<strong>Behind the Shot:&nbsp;</strong>Early one morning I stepped out on my back deck to watch the small flock of Bushtits I saw patrolling my bird feeder. I pulled out my Nikon D3200 and a 300mm F4 lens that my grandpa had lended me and started taking some experimental shots of the birds. I was enjoying identifying the different eyes of the males and the females when I noticed one particular yellow-eyed female edging confidently along a twig toward where I was crouching, intent on the bird feeder. I raised my camera, carefully placed my focus point on the bird&#39;s eye, adjusted my shutter speed to 1/1000 of a second, and was lucky enough to achieve this sharp image!<br />
<strong>Female ID Tip:&nbsp;</strong>Female Bushtits are easy to identify once you know what to look for: Unlike males and juveniles, which have dark brown irises, female Bushtits have light yellowish-olive eyes.</p>

<h3>Black-throated Blue Warbler by ML Strahlendorff</h3>

<p><img alt="An olive-colored female Black-throated Blue Warbler curiously peaks around a rock at a blurry Black-and-White Warbler bathing in the foreground. The water the bird is bathing in runs from the right of the image to the left and off the rock. " src="https://media.audubon.org/2023-07/8_Web_Aud_APA-2023_Black-throated-Blue-Warbler_A0_25905-3_Photo-ML-Strahlendorff.jpg?width=2400&amp;auto=webp&amp;quality=90&amp;fit=bounds&amp;disable=upscale&amp;blur=200" /></p>

<p>Black-throated Blue Warbler and Black-and-white Warbler.&nbsp;Photo:&nbsp;ML Strahlendorff/Audubon Photography Awards</p>

<p><strong>Location:</strong>&nbsp;Metuchen, New Jersey<br />
<strong>Behind the Shot:&nbsp;</strong>About 10 years ago I started turning what had been a conventional suburban yard into a chemical-free habitat garden filled with native plants and birdbaths. One of my great rewards has been the visits by migratory birds who stop to glean insects, eat seeds and berries, drink, and bathe. One of the most popular spots in the garden is this bubbler fountain constructed from rocks salvaged from a local excavation job. The large rock that serves as the platform has a natural, shallow depression just deep enough for small birds to safely splash. I had been watching the Black-and-white Warbler in the front when I saw the Black-throated Blue female peering out from behind the top rock, intently eying the Black-and-white and the spot it was enjoying.&nbsp;<br />
<strong>Female ID Tip:</strong>&nbsp;Female Black-throated Blue Warblers look quite different from their male counterparts, but both sexes share one field mark that lets you know what species you&rsquo;re looking at: a small white patch on each wing. No other North American warbler has this handy plumage detail.</p>

<h3>Yellow Warbler by Heather Mall</h3>

<p><img alt="A highlighter-bright female Yellow Warbler with only black on its wings sits tall on a conifer branch to the right of the frame. The bird is surrounded by vibrant green needles and small brown pinecones. " src="https://media.audubon.org/2023-07/9_Web_Aud_APA-2023_Yellow-Warbler_A1_26651-1_Photo-Heather-Mall.jpg?width=2400&amp;auto=webp&amp;quality=90&amp;fit=bounds&amp;disable=upscale&amp;blur=200" /></p>

<p>Yellow Warbler.&nbsp;Photo:&nbsp;Heather Mall/Audubon Photography Awards</p>

<p><strong>Location:</strong>&nbsp;Richard Bong State Recreation Area, Wisconsin<br />
<strong>Behind the Shot:</strong>&nbsp;We visited<strong>&nbsp;</strong>Richard Bong State Recreation Area in hopes of photographing Yellow-headed Blackbirds. While driving through, there were several birds we were hearing, but few we were seeing. It looked like it was going to start raining, so we parked our car at one of the stops and listened to the beautiful bird calls. I was looking out the car window with my camera when I noticed movement in the bushes in front of me. A female Yellow Warbler popped up and began foraging through the boughs. I was in awe of her beautiful plumage against the greenery and started taking photos. Looking back at my shots, I saw this one. It&#39;s one of my favorite images that I&rsquo;ve ever taken, and for me, it&#39;s a reminder that something small can impact your life in a big, beautiful way.<br />
<strong>Female ID Tip:&nbsp;</strong>Female Yellow Warblers are bright pure yellow and lack the reddish chest streaks frequently seen on male Yellow Warblers.</p>

<h3>&nbsp;Eastern Bluebird by Yan Zhang</h3>

<p><img alt="A female Eastern Bluebird sits in the middle of the frame in profile and facing left, its softly colored blue back and rusty belly looking almost frosty. Surrounding the bird and filling the frame are branches and red berries covered in a layer of ice." src="https://media.audubon.org/2023-07/10a_Web_Aud_APA-2023_Eastern-bluebird_Crabapple-tree_A1_24675-0_Photo-Yan-Zhang_0.jpg?width=2400&amp;auto=webp&amp;quality=90&amp;fit=bounds&amp;disable=upscale&amp;blur=200" /></p>

<p>Eastern Bluebird.&nbsp;Photo:&nbsp;Yan Zhang/Audubon Photography Awards</p>

<p><strong>Location:&nbsp;</strong>Pickering, Ontario, Canada<br />
<strong>Behind the Shot:&nbsp;</strong>After a day of freezing rain and a sudden drop in temperature,&nbsp;the trees and plants were completely covered in ice. Everything was frozen! For me, photography is about more than getting beautiful images; I prefer to learn about bird behavior and document it through my lens. So I went to see how the birds survived such a severe change in weather. Fortunately, I found this female Eastern Bluebird perched on the branch of a fruit tree.<br />
<strong>Female ID Tip:</strong>&nbsp;Eastern Bluebird females like this one are generally lighter in color than their similarly marked male counterparts.</p>

<h3>Red-necked Phalarope by Mike Diersing</h3>

<p><img alt="A Red-necked Phalarope with its white belly and outstretched wings facing the viewer looks frozen in mid-air as it fills the center of the image. The bird’s beak is slightly open against a blurry brown, green, and blue background." src="https://media.audubon.org/2023-07/10b_Web_Aud_APA-2023_Red-necked-Phalarope_A1_26861-4_Photo-Mike-Diersing.jpg?width=975&amp;auto=webp&amp;quality=90&amp;fit=bounds&amp;disable=upscale&amp;blur=200" /></p>

<p>Red-necked Phalarope.&nbsp;Photo:&nbsp;Mike Diersing/Audubon Photography Awards</p>

<p><strong>Location:&nbsp;</strong>Nome, Alaska<br />
<strong>Behind the Shot:&nbsp;</strong>Sitting at the edge of a pond in chest waders, I was looking to photograph grebes. Toward the center of the pond, just beyond some grasses, I saw a cluster of Red-necked Phalaropes foraging in their distinct zig-zag pattern. Then, out of the corner of my eye, I noticed a lone female phalarope in stunning full breeding plumage making a beeline toward the group. Thinking I was probably too late, I managed to acquire focus and get a sharp shot of her banking in a ventral pose, calling to announce, &quot;Hey folks, I&#39;m back!&quot; I was so thrilled to get a sharp flight shot that I overlooked the five or so gallons of ice-cold Alaskan pond water that came over the top of my waders!&nbsp;<br />
<strong>Female ID Tip:</strong>&nbsp;Like the Belted Kingfisher, phalaropes are the rare North American species where the females are more colorful than the males. In this case, the bright red neck and dark facial feathers indicate that this bird is female.</p>

<h2>Spruce Grouse by Mark Staples</h2>

<p><img alt="Against a green blurry background the profile of a female Spruce Grouse’s head and body faces left and fills the frame. The bird’s eye and heavily patterned tan and brown plumage is crisply captured in this close-up. " src="https://media.audubon.org/2023-07/11_Web_Aud_APA-2023_Spruce-Grouse_A0_24635-2_Photo-Mark-Staples.jpg?width=975&amp;auto=webp&amp;quality=90&amp;fit=bounds&amp;disable=upscale&amp;blur=200" /></p>

<p>Spruce Grouse.&nbsp;Photo:&nbsp;Mark Staples/Audubon Photography Awards</p>

<p><strong>Location:&nbsp;</strong>Superior National Forest, Minnesota<br />
<strong>Behind the Shot:&nbsp;</strong>While on a July hike in Superior National Forest, I noticed several young Spruce Grouse chicks had suddenly appeared among the undergrowth, calmly foraging along the hiking trail. They seemed totally unaffected by my accidental intrusion and continued to wander in all directions in search of food. As I reached for my camera, the mom hopped onto a nearby log to get a closer look at me. Before she returned to her brood, I was able to make an intimate portrait of the hen and her intricate feather pattern against a vibrant green backdrop. As both a birder and a conservationist, it was an incredible experience to watch this resident of the coniferous forest thrive in a protected habitat.<br />
<strong>Female ID Tip:&nbsp;</strong>Female Spruce Grouse are overall speckled brown, while males&rsquo; heads and necks are mostly black.</p>

<h3>Laysan Albatross by Hob Osterlund</h3>

<p><img alt="The stark white heads and gray bodies of two female Laysan Albatrosses fill the frame as each bird faces the opposite way, their breasts touching and beaks crossed to create a heart shape against the blurry green background. " src="https://media.audubon.org/2023-07/12_Web_Aud_APA-2023_Laysan-Albatross_A1_24789-1_Photo-Hob-Osterlund.jpg?width=975&amp;auto=webp&amp;quality=90&amp;fit=bounds&amp;disable=upscale&amp;blur=200" /></p>

<p>Laysan Albatross.&nbsp;Photo:&nbsp;Hob Osterlund/Audubon Photography Awards</p>

<p><strong>Location</strong>: Kīlauea, Kaua&rsquo;i, Hawaii<br />
<strong>Behind the Shot:&nbsp;</strong>Laysan Albatross, like all other albatross species, are known for affectionate behaviors with their mates and chicks. Unmated pairs can also be very demonstrative with each other, and so can mated pairs who happen to be taking the year off from nesting. These two females, a known mated pair that skipped the breeding season, met up at the edge of a field in a colony where they typically nest, away from the other birds, for a session of preening, snuggling, and napping. These displays are common among mōlī, as they are known in the Hawaiian language. Since it was a late winter afternoon, the sun&rsquo;s long rays put a spotlight on their bodies but kept the woods and the ravine behind them dark. I sat on the ground about 50 feet away and took a series of shots. The birds appeared oblivious to me.&nbsp;<br />
<strong>Female ID Tip:</strong>&nbsp;Laysan Albatross males and females have very similar plumage, but males can be up to 25 percent more massive than females. Female-female pairs can be identified by the presence of two eggs in a single nest.&nbsp;</p>
')


,   ('ff9086582c62af630123c568ca5db776', '882BDE1798D4D1516641A2D190D58CAC', N'Apparently Magpies and Crows Are Using "Anti-Bird Spikes" to Make Their Nests', GETDATE(), N'interesting facts',
	N'Birds often incorporate human-made materials while nest building, but a new study shows European corvids are taking the idea to the extreme.',

	N'<p>Humans have made the world less hospitable for birds in many ways. One obvious and intentional example of this can be found in towns and cities worldwide: anti-bird spikes. The pointy wires you might see attached to roofs, ledges, and light poles are meant to deter urban species like pigeons from landing, pooping, and even nesting where people don&rsquo;t want them to. But in an avian act of poetic justice, a handful of European birds have struck back.</p>

<p>Apparently Carrion Crows and Eurasian Magpies are stealing and repurposing the spikes as a nest-building material. Nests featuring the deterrent were documented in&nbsp;<a>a study</a>&nbsp;published Tuesday in the Dutch journal&nbsp;<em>Deinsea</em>, an online periodical from the Natural History Museum Rotterdam.&nbsp;<br />
<br />
Many birds are known to use human-made elements in their nests. In fact, 176 different species have been documented nest building with synthetic materials, according to&nbsp;<a>another study</a>&nbsp;published this week in the journal&nbsp;<em>Philosophical Transactions of the Royal Society B</em>. Yet the birds in the Dutch study are exceptional for having taken something so purposefully built to minimize their presence and using it to rear the next generation.<br />
<br />
&ldquo;It feels very rebellious,&rdquo; says Auke-Florian Hiemstra, lead study author and a biologist researching animal architecture at the Naturalis Biodiversity Center in Leiden, Netherlands. Kevin McGowan, an ornithologist who studies corvid behavior at the Cornell Lab of Ornithology and wasn&rsquo;t involved in the new research, agrees. The behavior conveys a &ldquo;sort of a Bugs Bunny attitude,&rdquo; McGowan says&mdash;though he&nbsp;wasn&rsquo;t particularly surprised to see magpies or crows using the spikes in this way. As he explains, both are&nbsp;<a>smart species</a>&nbsp;and other studies have demonstrated corvids&rsquo; abilities to recognize the function and use of different materials.<br />
<br />
In the Tuesday publication, Hiemstra and his co-researchers describe three Eurasian Magpie nests and one Carrion Crow nest that heavily incorporated anti-bird spikes into their construction. These four nests were found between 2021 and 2023, each in a different European city: Rotterdam and Enschede in The Netherlands, Glasgow, Scotland, and Antwerp, Belgium. In addition, the researchers also came across one previously documented&nbsp;<a>2009 instance</a>&nbsp;of a Carrion Crow nest building with roost-deterrent wires&mdash;one of many other names for the spikes&mdash;in their literature review.</p>

<p><img alt="" src="https://media.audubon.org/2023-07/Crow-nest%2C-Rotterdam-%28NL%29-photo-Kees-Moeliker.jpg?width=975&amp;auto=webp&amp;quality=90&amp;fit=bounds&amp;disable=upscale&amp;blur=200" /></p>

<p>An unfinished Carrion Crow nest using anti-bird spikes in the collection of the Natural History Museum Rotterdam.&nbsp;Photo:&nbsp;Kees Moeliker</p>

<p>When Cornelis Moeliker, director of the Natural History Museum Rotterdam and one of the study authors, saw the nests, he was &ldquo;totally baffled,&rdquo; he says. &ldquo;I&rsquo;ve been watching wildlife, and especially urban nature, for about half a century, and I&rsquo;ve never seen something like this. It&rsquo;s almost unbelievable that it actually happens&ndash;I mean, the sheer irony of it.&rdquo;</p>

<h4>One of the recently discovered magpie nests includes about 1,500 visible metal spikes.</h4>

<p>&nbsp;</p>

<p>One of the recently discovered magpie nests now lives at the Leiden museum and includes about 1,500 visible metal spikes. &ldquo;It&rsquo;s quite solid,&rdquo; Hiemstra says, though still light enough to easily pick up. He describes the nest as &ldquo;magnificent and weird looking, but also so well-built and creative.&rdquo; The nest was first noticed by a patient looking out of his Antwerp hospital window in 2021. Soon after, Hiemstra received an email from the man imploring him to come see it.</p>

<p>Meanwhile, in Rotterdam, maintenance workers had found an odd, unfinished crow&rsquo;s nest in a tree and contacted the local natural history museum. From there, the researchers teamed up and tracked down other similar nest observations by scouring the scientific literature, local news reports, and even social media posts.<br />
<br />
Based on the the scientists&#39; research, the two corvid species appear to use the anti-bird spikes in slightly different ways. For the crows, the spikes seem purely structural, a material used to fashion a solid foundation. In both crow nests, the wires were incorporated into the base&ndash;interwoven with the points facing inward, below where a softer nest cup would sit. But for the magpies, there was an additional layer of intrigue; not only were the birds using the spikes to build nests, but it&rsquo;s possible they were also employing the devices for their intended purpose&mdash;to ward off other birds. &ldquo;It&rsquo;s a very natural behavior,&rdquo; Hiemstra says. &ldquo;We think these spikes are for nest defense.&quot;<br />
<br />
Magpies fabricate domed nests that&nbsp;<a>often incorporate</a>&nbsp;<a>thorny branches</a>&nbsp;and bramble canes into their construction, explains the biologist. The building strategy is thought to help protect their nests from would-be interlopers. Usually, the birds use natural materials, but in at least a few cases, human-made components like knitting needles and barbed wire have been observed in magpie domes.</p>

<p><img alt="" src="https://media.audubon.org/2023-07/Magpie-nest%2C-Partick-Scotland%2C-photo-Max-Crawford.jpg?width=975&amp;auto=webp&amp;quality=90&amp;fit=bounds&amp;disable=upscale&amp;blur=200" /></p>

<p>Eurasian Magpie nest in Scotland with anti-bird spikes especially placed on top of the nest.&nbsp;Photo:&nbsp;Max Crawford</p>

<p>It also appears that the birds specifically sought out the spikes. Two of the newly documented nests, collected by the researchers and brought back to the museum for preservation and display, still had sticky adhesive lingering on the hardware, implying that the animals tore the spikes off of buildings. Although magpies and crows haven&rsquo;t been documented doing this, other birds have. In 2019, a video of a Sulphur-Crested Cockatoo pulling a spiky strip from the ledge of a building in Australia was&nbsp;<a>widely shared</a>&nbsp;online. For the magpies and crows, the spikes are apparently valuable, Hiemstra notes. They must be &ldquo;worth putting in the extra effort.&rdquo;<br />
<br />
The idea that the birds could favor these spikes for nesting raises questions the study couldn&#39;t answer. Are they a necessary substitute, made in the absence of sufficient, thorny plants, or is this an adaptive choice? Do the synthetic spikes work better than the natural materials? Addressing those questions, Hiemstra says, would require many more data points and long-term study comparing the nest success of various breeding pairs.<br />
<br />
Even if the use of the spikes is simply urban adaptation at play, neither Hiemstra nor McGowan are convinced it&rsquo;s good for the corvids. Both scientists point out that anti-bird spikes can impale birds and other wildlife. Other research, too,&nbsp;<a>has demonstrated</a>&nbsp;that human-made materials in bird nests can cause injuries. In the crows&rsquo; nest, now at the Rotterdam museum, the researchers found a piece of another bird deterrent: anti-bird netting, often placed over garden plots. The netting is known to be dangerous for animals, who often end up entangled in it. To see it in a nest is similarly worrying, notes Moeliker.<br />
<br />
For Hiemstra, while the new discoveries are fascinating and inherently humorous, they also highlight a broader issue: the unfortunate prevalence of anti-bird spikes in the first place. &ldquo;I just think it&rsquo;s kind of sad to keep fighting against nature, instead of embracing it as being part of the city.&rdquo;&nbsp;</p>

<div class="bootstrapiso notranslate" data-original-title="" id="mttContainer" style="transform:translate(320px, 267px)" title="">&nbsp;</div>
')


,	( '9b5aefbcffbf716f526dda302be5cdef' , '3C2E0D1CFC3BC009465195E4B5AEC73F', N'Last Gasp for Sandhill Cranes—Act Now!' , GETDATE() , N'protect bird' ,
	N'As you’ll remember, Kentucky’s Department of Fish and Wildlife Resources unanimously passed its sandhill crane hunting proposal. All eight hunters on the commission think it’s a good idea to shoot cranes in Kentucky. The proposal now goes to the U.S. Fish and Wildlife Service for final approval or denial. The public comment period on the Kentucky sandhill crane hunting proposal ends AUGUST 1 2011. Here are six top reasons to protest this hunt. You’ll find snail and email addresses at the bottom, where you can send your comments. Please act now. If you love the rolling purr of sandhill cranes, let the Feds hear your squawk NOW!',

	N'<p><a ><img alt="" src="http://10000birds.com/wp-content/uploads/2011/07/julvickiecranes.jpg" style="height:611px; width:750px" /></a></p>

<p>photo by Vickie Henderson</p>

<p>&nbsp;<strong>Six Top Reasons to Protest Eastern Flyway Crane Hunting:</strong></p>

<ol>
	<li>Sandhill cranes have a very low recruitment rate. Our best studies show one in three pairs of nesting cranes successfully producing one fledgling. Remember, they were hunted nearly to extinction in the East before. Why put additional pressure on a recovering species?</li>
	<li>Current methods of counting the Eastern flyway population are badly flawed, conducted on a volunteer basis and poorly coordinated. A good freezeup can send Central flyway birds into the Eastern flyway, bloating apparent numbers by tens of thousands, only to have them all disappear the next winter.</li>
	<li>Sandhill cranes look a lot like endangered whooping cranes in questionable light, as at dawn and dusk, when they&rsquo;re most likely to be shot. The eastern population of migratory whooping cranes exists only because of the Herculean efforts of crane conservationists. Why allow hunters to shoot right into the middle of them? Recreational shooting claimed five of our one hundred precious Eastern whooping cranes in the past winter in states&nbsp;<em>without</em>&nbsp;crane seasons. Four were chicks, still clad in brown plumage. One was &ldquo;Superdad,&rdquo; one of the few successful breeding whooping cranes in the entire eastern population. A hunting season on sandhill cranes vastly increases the chance that collateral kill of endangered whooping cranes will occur. We&rsquo;ve only got 400 on the planet. Why increase the odds against them? (Look quickly at the picture at the bottom of this post to see how difficult it can be to discern which species a crane is.)</li>
	<li>Eastern flyway breeding populations appear to be maxing out their available habitat, and are subject to abundant natural limitations such as ground predation by coyotes, foxes, raccoons and opossums. The handful of pairs that are attempting to nest in Ohio appear to winter in Tennessee. What if they&rsquo;re shot? Could Ohio lose its entire pioneer breeding population?</li>
	<li>The demonstrated value of live cranes to ecotourism is immense. Vastly more people enjoy simply watching cranes than shooting them. Wildlife managers&rsquo; assertions that crane hunting outside refuges will concentrate the birds inside refuges, &ldquo;improving viewing opportunities for passive wildlife enthusiasts&rdquo; absurdly miss the point that concentrating birds on refuges isn&rsquo;t good for the birds, and insult the sensibilities of wildlife watchers.</li>
	<li>The imposition of a hunting season on a widely-revered, charismatic, long-lived and visually compelling bird like a crane sets up an artificial and unnecessary friction between hunters and tens of thousands of wildlife watchers, for the benefit of a few hundred hunters in each state. How can that be worth doing for wildlife departments looking to cultivate support from nonconsumptive wildlife observers and enthusiasts? State game departments have a mandate to serve&nbsp;<em>all</em>&nbsp;the citizens of their state, not just the ones with guns.</li>
</ol>

<p><a ><img alt="" src="http://10000birds.com/wp-content/uploads/2011/07/Julcyndi.jpeg" style="height:480px; width:553px" /></a></p>

<p>The public comment period on the Kentucky Department of Fish and Wildlife Resources sandhill crane hunting season proposal ends August 1, 2011.</p>
')


,	( 'b1fa395c5fa8c10d20990274f0e57a85' , '2B5FD6349E04AB0C1099C266B2A62704', N'Green Herons and their Groovy Necks' , GETDATE() , N'interesting facts' ,
	N'Back when we used to run the 10,000 Birds ID Clinic (as opposed to just answering lots of e-mails about bird identification!), we received an inquiry about a bird “about the size of a small duck, much bigger than a jay… a crest similar to a jay or a roadrunner and it has a remarkably long neck.” The querent included many other details about location, coloration, and what not but once I heard about that neck, one bird sprung immediately to mind… Green Heron! And wouldn’t you know it, I was right.',

	N'<p>The&nbsp;<strong>Green Heron</strong>&nbsp;(<em>Butorides virescens</em>) is a spectacular species familiar to anyone who pays attention to the places where water meets land. There are so many impressive aspects to this handsome heron. One could dwell on how convoluted its family tree is&hellip; the&nbsp;<em>Butorides&nbsp;</em>complex, as it&rsquo;s called, is surprisingly complex. While&nbsp;<em>Butorides</em>&nbsp;spans the globe, it is either recognized as a single species called&nbsp;<strong>Green-backed Heron</strong>&nbsp;or as three distinct species, the aforementioned New World heron&nbsp;<em>B. virescens</em>&nbsp;along with the Old World&nbsp;<strong>Striated Heron</strong>&nbsp;(<em>B. striatus</em>) and the slate-gray&nbsp;<strong>Lava Heron</strong>&nbsp;(<em>B. sundevalli</em>) of the Galapagos. In either case, green herons are silly with subspecies, which may themselves eventually be recognized as full species.</p>

<p>If taxonomy isn&rsquo;t your bag, you may be impressed to learn that these striking herons are&nbsp;<a >among the few tool-using birds</a>, employing a variety of baits and lures like crusts of bread, insects, and feathers and then lurking motionless in wait for prey to attack the bait.</p>

<p>Still, for me, it&rsquo;s all about the neck&hellip;</p>

<p><a ><img alt="Green Heron neck" src="http://10000birds.com/wp-content/uploads/2008/08/green-heron-neck.jpg" style="height:350px; width:600px" title="Green Heron neck" /></a></p>

<p>Corey&rsquo;s recent post recounting&nbsp;<a >Jamaica Bay in June</a>&nbsp;includes a sweet shot of a heron sipping sinuously while perched in hanging branches. Watching green herons deploy that impossible neck is always a shock, but never more so than that first time one sees it since this bird usually adopts a hunched, short-necked profile. Here is a green heron (of the subspecies&nbsp;<em>B. virescens bahamensis</em>&nbsp;if you&rsquo;re keeping track) in its usual stance:</p>

<p><a ><img alt="" src="http://10000birds.com/wp-content/uploads/2008/06/greenheronslack.jpg" style="height:366px; width:600px" title="Green Heron at rest" /></a></p>

<p>Here is the same bird at full extension:</p>

<p><a ><img alt="" src="http://10000birds.com/wp-content/uploads/2008/06/greenheronstretch.jpg" style="height:418px; width:600px" title="Green Heron stretching" /></a></p>

<p>Pretty cool, huh? That is a lot of neck! The combination of pine green and rust red isn&rsquo;t bad either. Let&rsquo;s do that again&hellip;</p>

<p><a ><img alt="" src="http://10000birds.com/wp-content/uploads/2008/06/Green-Heron-short-neck.jpg" style="height:400px; width:600px" title="Green Heron in short neck stance by Corey Finger" /></a><br />
Short</p>

<p><a ><img alt="" src="http://10000birds.com/wp-content/uploads/2008/06/Green-Heron-long-neck.jpg" style="height:400px; width:600px" title="Green Heron in long neck stance by Corey Finger" /></a><br />
Long</p>

<p>As I said, the green heron is hardly rare. No matter where you live, you stand a decent chance of spotting one fishing along a fresh- or saltwater bank, particularly in summer.</p>

<p><img alt="" src="http://10000birds.com/wp-content/uploads/2011/09/fall-Green-Heron.jpg" style="height:1200px; width:600px" title="Green Heron by Corey Finger, who seems way too into these birds!" /></p>

<p><strong>If you manage to catch a great photo of a green heron doing something impressive with its neck, or if you already have such a shot, I invite you to share it with me (mike AT 10000birds DOT com) and I&rsquo;ll add it to this post</strong>. The world needs a gallery devoted to green herons and their groovy necks, wouldn&rsquo;t you agree?</p>

<p><a ><img alt="" src="http://10000birds.com/wp-content/uploads/2008/06/greenherondown1.jpg" style="height:687px; width:499px" title="Green Heron fishing" /></a><br />
<a >Klaus</a>&nbsp;rose to the occasion with this Green Heron fishing</p>

<p><a ><img alt="" src="http://10000birds.com/wp-content/uploads/2008/06/greenheron_miller.jpg" style="height:662px; width:499px" title="Green Heron waiting" /></a><br />
<a >Liza Lee</a>&lsquo;s heron is waiting to pounce</p>
')


,	( 'db635b18aeddd06818d3eaee86183bab' , '5010DD042DF3EC8733B0CD78AAFD4E5C', N'Do Birds Have Penises?' , GETDATE() , N'interesting facts' , 
	N'Most of us have heard the song, “Birds Do It, Bees Do It” but have you every really thought about how a bird fits tab A into slot B? Let’s look at the equipment.',

	N'<p>Most birds do not have a penis. Most birds have a little lump called a cloaca. During the breeding season when hormones are flowing the cloaca swells and birds can get a cloacal protuberance.</p>

<p><a ><img alt="" src="http://10000birds.com/wp-content/uploads/2012/04/cloaca-e1335204890300.jpg" style="height:411px; width:600px" /></a><br />
Above, a bird bander blows on a&nbsp;<strong>Tufted Titmouse</strong>&nbsp;belly and note the spot below the bare patch&ndash;that&rsquo;s a cloaca. Both sexes have the cloaca, so for most birds sex literally is about bumping uglies. They do not have lengthy love making periods, but fast 1 to 3 second copulations that can happen hundreds of times a day. With birds, it&rsquo;s generally not about quality, it&rsquo;s about quantity.</p>

<p>However, for a few species, things gets&hellip;weird. For example, the&nbsp;<strong>Red-billed Buffalo Weaver</strong>&nbsp;has a pseudo-penis, not quite a cloaca, not quite a penis. He will rub this against the female&rsquo;s genitalia for 10 to 20 seconds and this is supposed to increase the chances that his sperm will stay.</p>

<p><a ><img alt="" src="http://10000birds.com/wp-content/uploads/2012/04/602px-Jurong_Southern_Cassowary-e1335205812850.jpg" style="height:765px; width:600px" /></a></p>

<p><strong>Cassowary</strong>&nbsp;photo by&nbsp;<a  title="User:Uspn">Bj&oslash;rn Christian T&oslash;rrissen</a>&nbsp;via Wikipedia. Beneath that comical exterior lies a super freak of Rick James proportions.</p>

<p>Cassowaries give the Buffalo Weaver a run for his money as both sexes have a penis and clitoris. But the freakiness doesn&rsquo;t end there. Both male and female birds have a phallus but it&rsquo;s not connected to reproductive tissue in either bird. When the male Cassowary inserts what looks like a penis into the female, the semen ejaculates from the cloaca from the base, not the tip.</p>

<p><a ><img alt="" src="http://10000birds.com/wp-content/uploads/2012/04/Blue-winged-Teal.jpg" style="height:450px; width:600px" /></a></p>

<p>All looks quiet and cute for this the&nbsp;<strong>Blue-winged Teal</strong>&nbsp;pair, but what kinky escapades could they be capable of?</p>

<p>But the bird that takes genitalia to a whole new level is the duck. Some people get upset when they see several males gang up on one female (or in some cases a young male) but underneath the feathers of both sexes is a sexual arms race of epic proportions that&rsquo;s been waging for thousands of years. It may look like the males are harming the females but they have their own arsenal of weaponry that James Bond (the spy, not the ornithologist) would envy.</p>

<p>Male ducks have an actual penis, but it&rsquo;s not an ordinary penis, it&rsquo;s an explosive spiral penis and in some cases it&rsquo;s spiny (not necessarily for her pleasure). By bird standards it&rsquo;s huge and some species go the extra mile like the&nbsp;<strong>Argentinian Lake Duck</strong>&nbsp;with its over 16 inch long member (when stretched out,&nbsp;<a >is a little longer than the duck itself</a>).</p>

<p>So, why would a male duck need such a crazy appendage that works at lightning speed to mate with a female? Hens can have a vagina that has multiple compartments and dead ends, kind of like a labyrinth only without Muppets and David Bowie. By closing off certain pockets, she can control where the ballistic spiral penis deposits the semen. Some studies even suggest that most of the forced copulation by males<a >&nbsp;results in their deposits going no where</a>. Like any healthy bird, she wants to make sure that she gets the best of the best when that appendage fertilizes her eggs.</p>

<p>Considering how it is so different from the cloacas other birds use to make eggs, researchers have been fascinated and wanted to know more.&nbsp;<a >And if you have to have a graduate project, why not make it on explosive penises</a>?</p>
')


,	( 'a66a0292d3af450e99bd42136898c36b' , '76FA6E278CE75EB33427682E6C0C360D', N'Domestic or Manky Mallards' , GETDATE() , N'Others bird' , 
	N'Years ago, Charlie Moores coined the colorful term “manky mallard” to describe the motley menagerie of feral and domestic mallards (If you’re wondering, manky means many things in British parlance from dirty and disgusting to inferior and worthless.) Here at 10,000 Birds, we’ve always celebrated odd ducks, which means manky mallards feel right at home!',
	N'<p>How varied are the forms of&nbsp;<em>Anas platyrhynchos</em>? You&rsquo;d be surprised. You might first consider the&nbsp;<a >mallard complex</a>&nbsp;and the unseemly hullabaloo of&nbsp;<a >hybrid mallards</a>. However, the&nbsp;<a >malleability of the mallard gene</a>&nbsp;really shines through the&nbsp;dazzling diversity of domestic mallards&hellip;</p>

<p><img alt="" src="http://10000birds.com/wp-content/uploads/2011/02/mankymallard-2.jpg" style="height:400px; width:600px" title="Manky Mallard by Corey Finger" /></p>

<h2>What are the different breeds of domestic duck?</h2>

<p><strong>ABACOT RANGER</strong><br />
Abacot Ranger or Streicher ducks are often referred to as hooded rangers because of the buff feathering of the hen&rsquo;s head. The ranger drake sports a brown cowl as well as a dappled chestnut chest. Both have white bodies.</p>

<p><strong>ANCONA</strong><br />
Ancona ducks are among the mankiest of the domestic ducks with mottled monochromatic plumage. Anconas forage actively despite their flightlessness.</p>

<p><strong>AYLESBURY</strong><br />
The Aylesbury duck was the original white farm duck of Europe, before the Pekin toppled it from its lofty perch. Aylesbury birds are pure white with orange legs, but distinguished from Pekins by their pink bills.</p>

<p><strong>BUFF ORPINGTON</strong>&nbsp;or&nbsp;<strong>BUFF</strong><br />
Buff Orpington ducks are drab ducks named for the&nbsp;<a  title="What color is buff?">buffy</a>&nbsp;coloration of the females. The male has a brown hood and buff body.&nbsp;Buff Orpington also describes a breed of barnyard chicken.</p>

<p><img alt="" src="http://10000birds.com/wp-content/uploads/2011/02/bufforpington.jpg" style="height:409px; width:600px" title="Buff Orpington by Miles Groth" /><br />
female Buff Orpington in&nbsp;Salida, CO &copy; Miles Groth</p>

<p><img alt="" src="http://10000birds.com/wp-content/uploads/2011/02/abacotswedishganky.jpg" style="height:443px; width:600px" title="Manky mixed flock by Jay Richmond" /><br />
Probable Buff Orpington hen flanked by a&nbsp;<strong><a >Ganky Goose</a></strong>&nbsp;and Duclair drake<br />
Manky mixed flock in NY &copy; Jay Richmond</p>

<p><strong>CALL</strong><br />
Call ducks are quite compact, smaller than any other domestic and wild mallards. Thanks to their modest proportions, these mini-mallards are better flyers than other mankies.</p>

<p><strong>CAYUGA</strong><br />
The Cayuga duck takes the striking metallic green plumage of a wild mallard drake&rsquo;s cowl and wears it from tip to tail. In fact, Cayuga males and females both flaunt this dramatic feathering. Interestingly, the entire breed of black ducks, as Cayugas are called, can be traced to a single pair raised in Duchess County, NY.</p>

<p><a ><img alt="Crested Cayuga Duck © Lisette Lebaillif" src="http://10000birds.com/wp-content/uploads/crestedcayugaduck-630x425.jpg" style="height:425px; width:630px" /></a>Crested Cayuga from Dallas/Ft. Worth&nbsp;&copy; Lisette Lebaillif</p>

<p><strong>DUCLAIR</strong><br />
Duclair ducks are classic manky Mallards with green heads, white bibs, and solid brown, black, or even blue-gray bodies. The distinction between Duclairs and the rarer Pommeranians is lost on me.</p>

<p><img alt="" src="http://10000birds.com/wp-content/uploads/2011/02/brownieandgreenie.jpg" style="height:387px; width:600px" title="Brownie and Greenie - Happy Ducks - by Bonnie Shulman" /><br />
Brownie and Greenie, probably an Abacot Ranger and a Duclair &copy;&nbsp;<a >Bonnie Shulman</a></p>

<p><strong>INDIAN RUNNERS</strong>&nbsp;or&nbsp;<strong>RUNNERS</strong><br />
Indian Runners appear attenuated, as if someone stretched a regular duck on a rack. These upright feathered bowling pins come in a variety of colors.</p>

<p><a ><img alt="Indian Runners © Lisette Lebaillif" src="http://10000birds.com/wp-content/uploads/indianrunners-630x366.jpg" style="height:366px; width:630px" /></a>Indian Runners&nbsp;&copy; Lisette Lebaillif</p>

<p><img alt="" src="http://10000birds.com/wp-content/uploads/2011/02/blackindianrunner.jpg" style="height:381px; width:600px" title="Black Indian Runner by Karen" /></p>

<p>These lovelies look like Black Indian Runner x Cayuga. Photo &copy; Karen Davis</p>

<p><strong>KHAKI CAMPBELL</strong><br />
Khaki Campbell ducks, named for both their primary color and the original breeder, bear a superficial resemblance to wild Mallards. However, their oddly-shaped, heavy bodies and drab plumage give them away. Females have distinctive dark heads and bills.</p>

<p><img alt="" src="http://10000birds.com/wp-content/uploads/2011/02/khakicambellhen.jpg" style="height:395px; width:600px" title="Khaki Cambell hen by Jay Richmond" /><br />
Khaki Campbell Hen in Central Park &copy; Jay Richmond</p>

<p><strong>MAGPIE</strong><br />
Magpie ducks , much like actual&nbsp;<a >magpies</a>, make the scene in brilliant black and white, although variations exisit. Magpies are distinguished from Anconas by their more predictable patterning, which includes a smart black tonsure. Magpie ducks don&rsquo;t bulk up as much as many domestic breeds do.</p>

<p><img alt="" src="http://10000birds.com/wp-content/uploads/2011/02/magpieduck.jpg" style="height:450px; width:600px" title="Magpie duck by Meredith Matthews" /><br />
Magpie duck &copy; Meredith Matthews</p>

<p><strong>PEKIN DUCKS</strong><br />
Pekin ducks embody exactly what most people envision as the classic domesticated duck. These barnyard beauties have large pure white bodies with orange bills and feet.</p>

<p><strong>ROUEN</strong><br />
Rouens look a lot like Mallards stuffed with more Mallards, which is to say they are much heavier than their wild kin. In fact, most Rouens can barely fly</p>

<p><a ><img alt="" src="http://10000birds.com/wp-content/uploads/2011/02/mallardswildandrouen1.jpg" style="width:600px" title="Mallards wild and Rouen by Mia McPherson" /></a><br />
This photo &copy; Mia McPherson of&nbsp;<a >on the wing photography</a>&nbsp;(used with permission) shows how a Rouen differs subtly from a wild Mallard: look for overall beefiness, a sloping forehead, and almost perfect plumage!</p>

<p><strong>SAXONY</strong><br />
Saxony duck drakes look like large, faded wild Mallards but the females and young are far more fetching in their fawn-colored plumage with white facial markings.</p>

<p><a ><img alt="Sexy Saxony Duck by Mike Fuller" src="http://10000birds.com/wp-content/uploads/2013/02/saxonyhen1.jpg" style="height:452px; width:630px" /></a><a >Sexy Saxony hen</a>&nbsp;from&nbsp;the Grantham Canal at West Bridgford, Nottingham&nbsp;&copy; Mike Fuller</p>

<p><img alt="" src="http://10000birds.com/wp-content/uploads/2011/02/saxonymallard.jpg" style="height:440px; width:600px" title="Saxony hen by Corey Finger" /><br />
Looks like a Saxony hen &copy; Corey Finger</p>
')


,	( '0aa6e189009d5d7cf2a981e8387fff4d' , 'B7B7A82190F83DF905868B2C1A45CC9B', N'What the Owl Knows: The New Science of the World’s Most Enigmatic Birds: A Book Review' , GETDATE() , N'interesting facts' , 
	N'How much do you know about owls? This is not a rhetorical question, think about it. I have been fortunate to come across many owls in my birding life, sometimes because I was looking for them, sometimes happily by chance. I''ve observed nesting owls, baby owls, owls eating small rodents, owls coughing up their pellets, a Great Horned Owl flying silently past me, a large Gray Owl sitting still on a pole as a boy approaches, a pair of Owls barking duet in the early evening outside my northern Australian hut as I brush my teeth.
',

	N'<p>I&rsquo;m sure many of you have had similar experiences. But what do we know beyond these commonly seen and heard behaviors? And how much do we know about why and how they behave this way? Jennifer Ackerman points out in the introduction to&nbsp;<strong><em>What the Owl Knows: The New Science of the World&rsquo;s Most Enigmatic Birds</em></strong>, that we don&rsquo;t know much, but that very soon we may know a lot more.</p>

<p>Ackerman&rsquo;s new book is about owls and owl research&ndash;the knowledge recently and currently being discovered through DNA analysis, new-tech tracking and monitoring, and old-fashioned fieldwork under the auspices of organizations like the Global Owl Project and the Owl Research Institute. It&rsquo;s also about human-owl interaction on an individual level and a wider sociocultural level, and ultimately how we can use all this for habitat and bird conservation. I&rsquo;m wondering as I write if you are shaking your head, uneasy that all these FACTS will interfere with your love of observing owls, an experience that easily borders on the mystical for some of us. I don&rsquo;t think so. Jennifer Ackerman brings a sense of curiosity and wonder to her material, whether she&rsquo;s interviewing evolutionary ecologist Christopher Clark about the mechanics of an owl&rsquo;s silent flight or looking for Northern Pygmy Owl nests in Montana with a team from the Owl Research Institute. She excels at bringing together complicated strands of a scientific question and its answers, but is first and last a storyteller.&nbsp;<em>What the Owl Knows: The New Science of the World&rsquo;s Most Enigmatic Birds&nbsp;</em>is a joyous, fascinating read.</p>

<p><a ><img alt="" src="https://www.10000birds.com/wp-content/uploads/ackerman.page-14-and-15.1000-630x460.jpg" style="height:460px; width:630px" /></a><em>&copy; 2023, Jennifer Ackerman; page 14 photograph &ldquo;courtesy of Ambika Angela Bone&rdquo;; page 15 photograph &ldquo;courtesy of Matt Poole.&rdquo;</em></p>

<p>Writing about owls means writing about roughly 250 species (I counted 245 on the 2022 Clements spreadsheet, but I might have missed a few, and we all know that each classification system is different). The species are taxonomically divided into two families: Tytonidae, Barn-Owls, and Strigidae, Owls, encompassed in one order, Strigiformes. When you look at Clements latest taxonomic spreadsheet, you get a sense of the depth of their relationships to each other and the world. Owls live and migrate from Arctic circumpolar to Colorado prairie to South American rainforest to Southeast Asian islands, Galapagos islands, Canary islands&ndash;many many islands&ndash;to coastal Australia and onward. Their common names reflect their size, appearance, residence, and sometimes their sound, ranging from the simple to the eponymous: Little Owl, Powerful Owl, Pharaoh Eagle-Owl, Cloud-Forest Pygmy-Owl, Pearl-spotted Owlet,&nbsp; Morepork, Christmas Island Boobook, Blakiston&rsquo;s Fish-Owl. Owl numbers and names expand when you look at subspecies: at least 29 Barn Owl subspecies, 16 Burrowing Owl subspecies, 13 Little Owl subspecies, to name the most outstanding. As the names and habitats imply, not all owl species are alike, in behavior, adaptation, relationship to humans, and in how humans perceive them. The range of differences is partly what makes this book so captivating, and also must have been both challenging and intriguing to Ackerman.</p>

<p><em>What the Owl Knows</em>&nbsp;is organized into nine chapters: introduction, adaptation (including vision and flight), research and researchers, vocalization, courtship and breeding, roosting and migration, cognition, and two chapters on owls and humans&ndash;captive owls (not zoos, educational owls) and owls in our cultural history. There is also an afterward on conservation, though it&rsquo;s not clear why this isn&rsquo;t a tenth chapter. The chapters on courtship and breeding and roosting and migration are the longest, which isn&rsquo;t surprising. These are behaviors that are most likely to vary across species and topics that make for compelling stories. But there really isn&rsquo;t a chapter that doesn&rsquo;t offer a good story. Ackerman understands how to set a scene, fill it with charismatic real-life characters, and top it off with magic&ndash;the hoot of a distant Great Gray Owl, a Burrowing Owl evading capture, an old barn sheltering young Barn Owls, a tree full of Long-eared Owls in the middle of a small town in northern Serbia.</p>

<p>Two figures that show up in almost every chapter are David Johnson, director of the Global Owl Project, and Derek Holt, founder and president of the Owl Research Institute, both of whom are involved in so many projects you wonder if they&rsquo;ve mastered the art of slowing down time. Johnson is collecting myths about owls from cultures around the world and is also presiding over a 12-year Burrowing Owl Project that seeks to collect DNA samples, vocalizations, morphological data and map locations for every Burrowing Owl subspecies the world over. Holt and his staff, several of which are also &lsquo;characters&rsquo; in the book, do hard-core field work, finding owls, owl nests, documenting them and working with concerned and unconcerned organizations to inform public policy decision-making. Holt also travels up to Utqiavik, Alaska every June, and has been for over 30 years, to study Snowy Owls and Brown Lemmings. There&rsquo;s also people like Steve Hiro, a retired heart surgeon who volunteers with ORI and has focused on studying the Northern Pygmy Owl;&nbsp; Marjorn Savelsberg, a talented musician who had to give up a professional career when she developed heart disease and who now spends her nights recording Eurasian Eagle Owls in a quarry in the Netherlands; and Gail Buhl of the Raptor Center at the University of Minnesota, who trains rehabilitated captive owls.</p>

<p>&ldquo;Well, that&rsquo;s great,&rdquo; you may be saying, &ldquo;but what does that have to do with owls? I want to read about owls, not people.&rdquo; It is all about the owls. From Holt we learn, amongst many things, his theory about why adult male Snowy Owls are white (hint, it&rsquo;s about what the female Snowy Owl thinks). From Hiro, we learn how Northern Pygmy Owls are &ldquo;rule breakers,&rdquo; not incubating eggs till all are hatched and then raising owlets that mature at the same rate even though the eggs were laid asynchronously (as most owl eggs are). From Savelsberg, we get insight into the mating behavior of Eurasian Eagle Owls, toppling set ideas about owl monogamy; her work has also laid the groundwork for using auditory technology and analysis for other owl studies. From Gail Buhl, we get a point-by-point speech on owl behavior, including how to recognize if an owl is disturbed and afraid. It&rsquo;s a lecture that should be reprinted and posted to every birding social media site.</p>

<p>Johnson&rsquo;s work on cultural folklore is an important element in &ldquo;Half-Bird, Half-Spirit: Owls and the Human Imagination,&rdquo; the chapter examining how we, humans as a group, have looked at owls as symbols of both darkness and light. In some ways, this is a puzzling chapter. It&rsquo;s a huge subject, especially when you start looking at owl symbolism as it appears in art. Humans were drawing owls 36,000 years ago, as Ackerman points out! Ackerman interviews Robyn Fleming, a research librarian at the Metropolitan Museum of Art in New York City, who is documenting every owl-related artwork in the museum&rsquo;s halls and storerooms, so far identifying 550 pieces. The tip of the iceberg when it coming to counting every artwork in the world that depicts owls, but a fair representation of the diverse ways artists and artisans have painted, sculpted, etched, and drawn them across countries and cultures.</p>

<p>Johnson&rsquo;s team has interviewed people about their thoughts and feelings about owls in 26 countries, amassing 6,000 interviews. There is good reason for the interviews, beyond simply amassing information, and this becomes clear in the final chapter, the Afterward, about conservation. Owls are in danger from the usual threats&ndash;habitat destruction, climate change, human intrusion. They are also threatened by cultural beliefs that lead to killing them because they&rsquo;re seen as harbingers of death and bad luck. They are also hunted. People and organizations in Nepal, Zambia, and South Africa have sought to change cultural attitudes, having the most success with school children. Ackerman skirts around a related problem, the trade in owls in markets in southeast Asia and Japan, an outgrowth of Harry Potter mania. It would have been interesting to know more about this gray area&ndash;I&rsquo;m thinking of writer Jon Dunn who poked into South American markets in search of hummingbird artifacts in&nbsp;<em>The Glitter in the Green</em>&ndash;but I can see where this is one direction the author would not want to take.</p>

<p>Black-and-white photographs are scattered throughout the book, illustrating stories, research finds, and artwork (see above). If any bird lends itself to the beauty of black-and-white photographs, it&rsquo;s owls, but I&rsquo;m happy there is also an eight-page color insert displaying 23 photographs of live owls and artwork owls. Color helps show the subtle gorgeous variabilities of different species&rsquo; gray-brown-black-white plumage (particularly notable in a page featuring side-by-side portraits of four totally different species by Brad Wilson, a professional photographer who specializes in dramatic animal portraits) and gives an immediacy to action shots. Photo credits are given in the back of the book; photographers include researchers interviewed in the book as well as birder photographers and professional photographers from around the world&ndash; Matt, Poole, Jeff Grotte, Ceda Vuckovic (who 10,000 Birds readers might know from Dragan&rsquo;s posts), Melissa Groo, There are some stunning images here and Ackerman thanks them graciously in her Acknowledgements.</p>

<p>The &ldquo;Further Reading&rdquo; chapter lists, chapter-by-chapter, books and articles&ndash;scholarly and popular, mostly scholarly&ndash;that I assume were Ackerman&rsquo;s sources of information. The citations are impeccable aside from a practice of listing first name initials before the surname. I just wish there was some kind of footnoting or other indication in the text to help the reader go from fact to source. If you didn&rsquo;t carefully read the table of contents or browse through the book (which you can&rsquo;t easily if you&rsquo;re reading a digital version), you wouldn&rsquo;t even know these sources were there till you were finished with the text, and then you&rsquo;d have to go back and try to match the fact or theory with the source. It&rsquo;s a lot of work. I also would have liked more information about where to find some of the resources described in the text but not listed in &ldquo;Further Reading,&rdquo; for example, the &ldquo;interactive web presentation of vocal individuality in owl species&rdquo; developed by ecologist Pavel Linhart and his colleagues (p. 95). It sounds like fun, but I can&rsquo;t find it anywhere. The Index, the other essential back-of-the-book section, is very well done and useful once you realize that owls are listed by their whole common name (i.e., &lsquo;Powerful Owl&rsquo; is under P). Most of the people interviewed and quoted are listed, illustrations are indicated in italics, and cross-references are smartly employed.</p>

<p>Jennifer Ackerman is one of my favorite bird authors. Her previous books include&nbsp;<a ><em>The Bird Way: A New Look at How Bird Talk, Work, Play, Parent, and Think</em></a>&nbsp;(Penguin, 2020),&nbsp;<em>The Genius of Birds</em>&nbsp;(Penguin, 2016), and&nbsp;<em>Birds by the Shore</em>&nbsp;(Penguin Press, 2019; originally published in 1995 as&nbsp;<em>Notes from the Shore</em>&nbsp;by Viking Penguin); she&rsquo;s written many articles and essays, and can be heard on&nbsp;<a >NPR</a>, the&nbsp;<a >ABA Podcast</a>, and, I&rsquo;m sure, others. In addition to telling stories, she brilliantly evokes sense of place and immediacy of experience. Here is a favorite paragraph from a field trip to a forested mountain north of Charlo, Montana in the company of an ORI team:</p>

<p>This is beautiful Great Gray territory. On the forest floor are small shrubs of snowberry and Mountain Spray, bright patches of spring beauty, and Sagebrush Buttercup. Lichens known as Old-Man&rsquo;s Beard droop from the pines. Sprigs of Wolf Lichen spring from the Douglas firs, a gorgeous, almost iridescent lime green. Wolf Lichen is rich in toxic vulpinic acid and in the old days was boiled up with meat and used to poison wolves. Though it&rsquo;s dry terrain and hunting might be hard here, there are good nesting sites, cool and shady, with some impressive snags rising thirty or forty feet, with bowls large enough to accommodate the massive belly of a brooding female Great Gray. Le Fay [an ORI intern] circles them to spot feathers or pellets. (p. 137)</p>

<p>Though a writer by education and experience, she is knowledgeable about the scientific process and excels at interpreting scientific finding to the popular audience through a combination of on-site visits, interviews, and background research. The former must have been difficult for this book; conceived during the pandemic, Ackerman still managed to visit wildlife centers, banding stations, and field stations in the United States, South American, and Europe. I&rsquo;m wondering if the subject of this book itself presented a challenge. Unlike some of her previous subjects&ndash;Ravens, Kea Parrots, Satin Bowerbirds&ndash;owls don&rsquo;t do much. They roost and hunt, at night (mostly) when we can&rsquo;t see them. I&rsquo;m impressed but not surprised that Ackerman was able to scratch the surface of the maybe wise, always inscrutable face of the owls of the Barn Owl and Owl families and find riches of behavioral diversity and intelligence. This is a great summer read. It is also a book that will inform and elevate one&rsquo;s encounters with owls, by design or by happenstance, and make you think carefully about how we, as humans, interact with them.</p>
')


,	( '3f37126f037169bb080a309c88524d38' , 'AB8EF54222AF80947BD5BCBA22C8C8C5', N'Pacific Black Ducks' , GETDATE() , N'Others bird' , 
	N'Here in Broome we observe a good selection of ducks and the most prolific at the Broome Poo Ponds is usually the Plumed Whistling-Duck. One of our favourite ducks is the Pink-eared Duck. There are also Hardheads, Wandering Whistling-Ducks, Grey Teal, Australian Wood Ducks and the occasional influx of Freckled Ducks or an Australian Shoveler. The other duck species that we observe often is the Pacific Black Duck and this duck is one of the most versatile ducks in Australia and can be found in most places.',

	N'<p><strong>Pacific Black Ducks</strong>&nbsp;lay up to 16 eggs and sometimes two clutches are raised in a year. However, not all of these ducklings will survive or we&rsquo;d be invaded with ducks! Many bird species have bred around Broome over recent months and the&nbsp;<strong>Pacific Black Ducks</strong>&nbsp;were no different. Every visit to the flooded Roebuck Plains we encountered a growing population of all bird species including the&nbsp;<strong>Pacific Black Ducks</strong>.</p>

<p>In the header photo the light has captured the glossy green feathers in the secondary flight feathers. Some of the larger families of&nbsp;<strong>Pacific Black Ducks</strong>&nbsp;are already reduced in size and by the time the young ducklings look like the adults their numbers have diminished. The stripe around their eyes makes them quite a distinctive duck.</p>

<p><img alt="" src="https://www.10000birds.com/wp-content/uploads/Pacific-Black-Ducks-1-1.jpg" style="height:473px; width:630px" /></p>

<p>&nbsp;</p>

<p><img alt="" src="https://www.10000birds.com/wp-content/uploads/Pacific-Black-Ducks-2-1.jpg" style="height:473px; width:630px" /></p>

<p>&nbsp;</p>

<p><img alt="" src="https://www.10000birds.com/wp-content/uploads/Pacific-Black-Ducks-4-2.jpg" style="height:473px; width:630px" /></p>

<p>&nbsp;</p>

<p><img alt="" src="https://www.10000birds.com/wp-content/uploads/Pacific-Black-Ducks-7.jpg" style="height:473px; width:630px" /></p>

<p>&nbsp;</p>

<p><img alt="" src="https://www.10000birds.com/wp-content/uploads/Pacific-Black-Ducks-8.jpg" style="height:473px; width:630px" /></p>

<p>&nbsp;</p>

<p><img alt="" src="https://www.10000birds.com/wp-content/uploads/Pacific-Black-Ducks-3-2.jpg" style="height:473px; width:630px" /></p>

<p>&nbsp;</p>

<p><img alt="" src="https://www.10000birds.com/wp-content/uploads/Pacific-Black-Ducks-5.jpg" style="height:473px; width:630px" /></p>

<p>&nbsp;</p>

<p><img alt="" src="https://www.10000birds.com/wp-content/uploads/Pacific-Black-Ducks-6.jpg" style="height:449px; width:630px" /></p>

<p>&nbsp;</p>

<p><img alt="" src="https://www.10000birds.com/wp-content/uploads/Pacific-Black-Duck.jpg" style="height:473px; width:630px" /></p>

<p><strong>Pacific Black Ducks</strong></p>

<p>One of the larger families of&nbsp;<strong>Pacific Black Ducks</strong>&nbsp;that we have observed this year appears to have been able to use the culvert under the highway as a place to hide from predators. Often we would see them swim under the highway and reappear on the other side. I am not sure if it was really what helped them be more successful, but it was a great escape route anyway!</p>
')



,	( '0251849dac885e1123e573388a937b6d' , '64947A9C9DDEBF65E48B683464B7FBC3', N'Migration of birds' , GETDATE() , N'interesting facts' , 
	N'Over the summer months, migration is almost at a standstill – at this time of year, breeding is the main focus with parent birds busily raising their offspring.',

	N'<h3>Cuckoos</h3>

<p>Cuckoos are an exception to this, leaving their young to be raised&nbsp;in the nests of other birds.&nbsp;Arriving&nbsp;in Britain and Ireland to breed&nbsp;from the end of April, the bulk of the population has reached our shores by mid May. By the end of June, sometimes only six or so weeks after arrival,&nbsp;many of these birds will have started their return journey to central Africa.&nbsp;Satellite tracking data, collected as part of our&nbsp;<a >Cuckoo Tracking Project</a>, have&nbsp;shown&nbsp;that there is some variation in the timing of individual birds&rsquo;&nbsp;departure, with some leaving 2&ndash;3 weeks before others.</p>

<p>The data also show that birds take one of two main routes&nbsp;when migrating back to the Congo Basin. One course takes Cuckoos south-east of Britain and down through Italy before crossing the Mediterranean Sea;&nbsp;another takes a more westerly line through Spain and then across to north-west Africa. At the time of writing, at least two of this year&rsquo;s tagged Cuckoos appear to be heading for the westerly route, which is&nbsp;<a >associated with higher rates of mortality</a>.</p>

<p>Follow the birds&nbsp;in real-time as they head towards their perilous Sahara crossing on the&nbsp;<a >Cuckoo Tracking Project map</a>.&nbsp;</p>

<h3>Waders</h3>

<p>The past couple of weeks have also seen waders begin to head south.&nbsp;<a >Green Sandpiper</a>&nbsp;and&nbsp;<a >Spotted Redshank</a>&nbsp;are typically the first species to start their migration&nbsp;after breeding in waterlogged wooded areas in northern Europe and across the arctic tundra respectively. Spotted Redshanks arriving in Britain and Ireland at this time of year are typically female birds; chick-rearing is left solely to the males, which remain behind to raise their offspring and so depart from the breeding grounds later.</p>

<blockquote>Passage waders seen at this time of year are likely to be failed breeders, or immature birds which did not complete their migration to their breeding grounds.</blockquote>

<p>Reports of both Green Sandpiper and Spotted Redshank have increased recently, and we can expect them to continue to do so until late August and into September as adult birds are followed by this year&rsquo;s young.&nbsp;</p>

<p>The number of reports of other waders has also increased as&nbsp;<a >Ruff</a>,&nbsp;<a >Curlew</a>, and&nbsp;<a >Dunlin</a>&nbsp;start to pass through. These birds will mostly be failed breeders, or immature birds that never completed the full migration to their breeding grounds.</p>

<h3>Seabirds</h3>

<h2><a >corys_shearwater_neil_bowman.png</a></h2>

<p><img alt="Cory''s Shearwater. Neil Bowman " src="https://www.bto.org/sites/default/files/corys_shearwater_neil_bowman.png" style="height:667px; width:1000px" title="Cory’s Shearwater. Neil Bowman " /></p>

<p>Cory&rsquo;s Shearwater is the largest shearwater species in the world.</p>

<p>The start of July saw the first hints of seabird passage, with a scattering of reports of both&nbsp;the larger shearwaters,&nbsp;<a >Cory&rsquo;s</a>&nbsp;and&nbsp;<a >Great Shearwater</a>. Neither of these species breeds in Britain and Ireland, but they do visit our waters as part of their migration.</p>

<p>Cory&rsquo;s Shearwater breeds on many of the Atlantic islands, including the Azores and the Canaries. Between June and October, large gatherings of these shearwaters can build off south-western Britain. The exact origins of these birds are still unknown, but the large flocks can result in a large number of records from coastal locations in that area. So far this year the number of Cory&rsquo;s Shearwaters reported has been low, but it is still a little early in the season.</p>

<p>In contrast, Great Shearwaters breed on islands in the southern hemisphere. At this time of year, these birds&nbsp;undertake a huge migration up the west coast of Africa and across to the eastern seaboard of the USA, then east to the waters of western and south-western Britain and Ireland. As for Cory&rsquo;s Shearwater, reports of Great Shearwater have been low but are likely to increase in the next month.</p>

<h2><a >wilsons_petrel_birds_online.png</a></h2>

<p><img alt="Wilson''s Petrel. Birds Online" src="https://www.bto.org/sites/default/files/wilsons_petrel_birds_online.png" style="height:667px; width:1000px" title="Wilson’s Petrel. Birds Online" /></p>

<p>Wilson&rsquo;s Petrel has an almost mythical status among birdwatchers.</p>

<p>One species that was fairly well reported from typical seawatching hotspots such as Pendeen and Porthgwarra (Cornwall) and Galley Head (County&nbsp;Cork) was&nbsp;<a >Wilson&rsquo;s Petrel</a>.</p>

<p>Like Great Shearwater, Wilson&rsquo;s Petrel breeds in the southern hemisphere and migrates across the Equator to spend several months in the waters of the North Atlantic.&nbsp;Sightings of this seabird are&nbsp;much-prized by birdwatchers in Britain, and the species has an almost mythical status for many.</p>

<p>Once, it was only possible to see this species from special boat trips from&nbsp;the Isles of Scilly, but in the past few years the number of annual records has increased and birds are even seen regularly from land. This year is no exception, with over 30 birds seen from watchpoints in south-western Britain and Ireland so far.</p>

<h3>Swifts</h3>

<p>You didn&rsquo;t need to head to Cornwall or southern Ireland to witness migration, though.</p>

<blockquote>Screaming flocks of Swifts are a wonderful feature of birding at this time of year.&nbsp;</blockquote>

<p>Late June and early July saw a steady increase in reports of&nbsp;<a >Swifts</a>. Screaming flocks of Swifts are a wonderful feature of birding at this time of year, as adults are joined by their young and groups merge&nbsp;and&nbsp;roam together before starting their southward migration.</p>

<p>By the end of July, almost all of our breeding Swifts will have departed, and it will mostly be later breeding birds migrating through Britain and Ireland from more northerly populations that are seen in our skies.</p>

<h3>Passerines</h3>

<h2><a >sedge_warbler_graham_catley_bto.png</a></h2>

<p><img alt="Sedge Warbler. Graham Catley / BTO" src="https://www.bto.org/sites/default/files/sedge_warbler_graham_catley_bto.png" style="height:667px; width:1000px" title="Sedge Warbler. Graham Catley / BTO" /></p>

<p>Look out for young Sedge Warblers as they disperse from their hatching areas.</p>

<p>Many of our summer migrants will have fledged their first broods and will be in the throes of nesting again. Some species may even raise three broods of young, as in the case of&nbsp;<a >House Martin</a>.</p>

<p>Those young that have already fledged will begin to disperse away from the areas where they hatched and sometimes turn up far from their typical habitats. Species to look out for include&nbsp;<a >Sedge</a>&nbsp;and&nbsp;<a >Reed Warbler</a>,&nbsp;<a >Blackcap</a>&nbsp;(with the young having the same rusty cap as adult females),&nbsp;<a >Chiffchaff</a>,&nbsp;<a >Willow Warbler</a>, and&nbsp;<a >Whitethroat</a>.</p>

<p>A few rarities were seen during the last month with the 13th&nbsp;<a >Pacific Swift</a>&nbsp;for Britain being found in Shetland. An adult&nbsp;<a >Roller</a>&nbsp;on the Isle of Wight would have proved a bigger hit with twitchers had it been found on the other side of the Solent.</p>

<p>A brief&nbsp;<a >Marsh Sandpiper</a>&nbsp;in Kent was most welcome, as were a scattering of&nbsp;<a >Caspian Terns</a>&nbsp;including two groups of two in Norfolk and Northumberland.</p>

<p><img alt="" src="https://www.bto.org/sites/default/files/styles/content_page_-_picture_introduction/public/house_martin_philip_croft_bto.png?itok=F6B3jwak" style="height:800px; width:1250px" /></p>

<p>Philip Croft / BTO</p>

<p>&nbsp;</p>

<p>Some of our summer migrant birds will raise up to three broods each year, including House Martins.&nbsp;</p>

<h2>Looking ahead</h2>

<p><img alt="Yellow-legged Gull. Neil Calbrade / BTO" src="https://www.bto.org/sites/default/files/styles/400_wide/public/yellow-legged_gull_neil_calbrade_0.jpeg?itok=WfO8o8eP" title="Yellow-legged Gull. Neil Calbrade / BTO" /></p>

<p>Juvenile Yellow-legged Gulls often show a pale head with a dark mask running through the eye; juvenile Herring Gulls have more streaking on the head.&nbsp;</p>

<p>Late summer can be likened to late winter, in that the promise of migrant birds is just around the corner &ndash; but just as we see with spring migration in early March, in late July autumn migration can take a little while to get going. The next 3&ndash;4 weeks will follow a similar pattern to those just passed,&nbsp;with the main species migrating being waders and seabirds. However, it is also a good time of year to look out for gulls.&nbsp;</p>

<p><a >Yellow-legged</a>&nbsp;and&nbsp;<a >Caspian Gulls</a>&nbsp;are close relatives of the Herring Gull. Towards the end of summer, numbers of both these species start to build, mainly in the south-east of Britain, as juvenile birds disperse from their hatching grounds. Although they can be tricky to tell apart from other large gulls, with a bit of practice it is possible to pick both species out from their commoner cousins.</p>

<p>At the other end of the size scale,&nbsp;<a >Little Gull</a>&nbsp;is a regular passage migrant, and from late July flocks of these dainty birds can be found at both coastal and inland locations&nbsp;where they will hawk for insects over water. Flocks of gulls will often feast on swarms of emerging flying ants, and it is always worth checking these groups for Little Gulls. The adults&rsquo;&nbsp;pure white wing tips&nbsp;look almost translucent when seen from below and are a good distinguishing feature, together with the species&rsquo;&nbsp;smaller size.</p>

<p><img alt="Pectoral Sandpiper. Edmund Fellowes / BTO" src="https://www.bto.org/sites/default/files/styles/400_wide/public/bto-2019-b11-edmund-fellowes-17302.jpg?itok=NWgF2n13" title="Pectoral Sandpiper. Edmund Fellowes / BTO" /></p>

<p>The yellow legs and sharp demarcation of the streaking on the breast are helpful identification features for Pectoral Sandpiper.&nbsp;</p>

<p>The number and range of wader species&nbsp;on the move will continue to build through July and into August, with&nbsp;<a >Common Sandpiper</a>,&nbsp;<a >Whimbrel</a>,&nbsp;<a >Greenshank</a>, and&nbsp;<a >Ruff</a>&nbsp;all beginning migration. Juvenile birds will pass through a little later than adults, their&nbsp;fresh plumage distinguishing them&nbsp;from adult birds in&nbsp;worn-out breeding plumage or even moulting into their winter dress. Scarcer species to look out for include&nbsp;<a >Red-necked Phalarope</a>,&nbsp;<a >Pectoral Sandpiper</a>, and&nbsp;<a >White-rumped Sandpiper</a>.</p>

<p>If seabirds are your thing, then heading to the coast at this time of year can be rewarding with a range of species starting to turn up.&nbsp;<a >Balearic Shearwater</a>&nbsp;is a close relative of the more familiar&nbsp;<a >Manx Shearwater</a>, with its critically endangered population&nbsp;numbering a mere&nbsp;9,000&ndash;13,000 mature birds.</p>

<p>Each summer, Balearic Shearwaters undertake&nbsp;a post-breeding migration, leaving the Mediterranean Sea and gathering in the North Atlantic. It is at this time of year that birds start to be recorded off the coast of southern Britain, and sites like Portland (Dorset),&nbsp;Strumble Head (Pembrokeshire), and Selsey Bill (West Sussex) are prime locations to look for them, especially during strong south-westerlies.</p>
'),



	( 'b17fbe0d73b2ebacedfb6ac1b284767c' , 'DEE0822E0D723293B16ABCFE332C8C51', N'Bird care guide' , GETDATE() , N'take care of bird' , 
	N'Owning a bird will be one of the most enjoyable and rewarding things you will ever do. To enjoy all the benefits of owning a bird, it is vital you take these steps to ensure they stay healthy and happy.',
	N'<h2>HOUSING</h2>

<p>Birds are housed in aviaries or cages. Aviaries are great for colony housing and are generally considered better for the health of birds, as they allow them to get more exercise. Smaller cages are acceptable but should be big enough for your bird to stretch their wings and fly fully extended from one side of the cage to the other.</p>

<p>Get advice on the cage you buy - avoid cheap, galvanized metal cages as birds may chew them and contract zinc poisoning. Your bird shouldn&rsquo;t be able to fit its head through the bars of the cage and it should be strong enough so your bird can&rsquo;t bend them (a cocky will easily chew through the bars of a budgie cage!).</p>

<p>Cover the floor of the cage with sand grit, newspaper, or anything that is solid and can be removed for regular cleaning. You should clean the cage once a week with a pet safe disinfectant.</p>

<p><img alt="colourful bird " src="https://images.ctfassets.net/mlpi10u03bra/1W8GICAq37ZWTXvvJxQjx3/4d5bbc07e009a5a26c8e1c8e0777043d/bird_cage_body_image.jpg" /></p>

<h2>PERCHES</h2>

<p>Most cages come with wooden or plastic dowel perches. These are generally too smooth and predispose your bird to overgrown nails and skin lesions of the feet. Ensure you add large diameter sticks and ensure that they&rsquo;re rough! Branches from fruit trees make great perches. It&rsquo;s also a good idea to have at least three different width perches in your bird&rsquo;s enclosure, to mimic its normal habitat.</p>

<h2>BATHING</h2>

<p>We all need to bathe and birds are no exception! Provide a bird bath with fresh, clean water or keep a water spray bottle handy and spray your bird down regularly. This will reduce feather dust and keep your bird&rsquo;s plumage healthy.</p>

<h2>AIR QUALITY AND DRAFTS</h2>

<p>Aviaries and cages should not be placed in areas that are prone to dust, excessive tobacco smoke, or too close to a microwave. Cages should be kept away from drafts, such as open windows, doorways and air conditioning units, as your bird can catch a cold that may develop into life threatening pneumonia.</p>

<p>Aviaries should have a protected area where birds can escape cold, harsh conditions.</p>

<h2>EXERCISE &amp; TOYS</h2>

<p>Tamed cage birds should be let out regularly, to maintain fitness and avoid becoming overweight. Toys (zinc free) are very important to alleviate boredom. Toys provide entertainment and mirrors are particularly good as your bird will think it has a mate. Shiny toys really capture the imagination of birds and toys that can be shredded are beneficial for stimulation so include some of these, too.</p>

<h2>FEEDING</h2>

<p>Feeding can be very easy, as there&rsquo;s a variety of bird seed mixes readily available. PETstock offers a great range of quality seed and team members will ensure you get the right seed for your breed of bird.</p>

<p>Ensure you provide fresh water and change your bird&rsquo;s seed daily.</p>

<p>All birds should be offered fresh fruit and vegetables such as grated carrot, apples, broccoli and sprouts. Many more choices are available and it is best to consult a specific breed book to find the best greens for your bird. Birds are foragers by nature so it is best to offer a wide variety.</p>

<p>Cuttlefish should be constantly available as this is a great source of calcium and trace elements for your bird and important for beak health and shape.</p>

<p>Grit is also essential for aiding the breakdown of seed in the gut. It is also important in breeding birds, to help form egg shell.</p>

<p>Avian vitamin supplements are important and these are available in block or spray form.</p>

<h2>HANDLING</h2>

<p>Birds stress very easily, so let yours get used to you over several days. Sit by the cage without doing anything before building up to putting food through the bars and talking to your bird. Gradually open the cage door and put your hand in with food. Eventually your bird should step onto your finger.</p>

<p>If your bird is not tame and you must catch it, place a towel (for large parrots) or a handkerchief (for small parrots, finches and canaries) over it and move it quickly to where it needs to go.</p>
')


,	( 'adc8a1de829b5aca8cd6f8a94b4dbf0d' , '15F5C2BCEC0BC8554F7F105AA6528C51', N'HOW TO TO TAKE CARE OF A BIRD: PET BIRD CARE TIPS' , GETDATE() , N'take care of bird' , 
	N'Found your dream house sit but wondering whether bird sitting is too much of a… birden? Or maybe you’re a future pet parent, waiting in the wings for an impeckable match to fly your way. Either way, it’s vital you know how to take care of a bird properly, starting with the basics. So here, let’s eggsplore some top tips on general pet bird care to get your feathered journey flying high.',

	N'<h2>Get the right bird cage</h2>

<p>Once you&rsquo;ve taken the leap and decided to adopt a bird, the first thing you need to do before learning <strong>how to take care of a bird</strong> is to choose the right cage. When it comes to your bird&rsquo;s cage, bigger means better. The more space they&rsquo;ve got to move around in a large cage, the happier they&rsquo;ll be. And be sure to choose a rectangular cage so that your bird has somewhere to feel safe and cozy. If you&rsquo;re adopting more than one bird, the cage you choose will need to be even bigger - birds need their own space, just like us humans do.&nbsp;</p>

<p>Once you&rsquo;ve chosen the right cage, consider its placement in your home - a key area of pet <strong>bird care</strong> is meeting their social needs. Birds are super social creatures, and won&rsquo;t be happy in an isolated room with no noise or distractions to keep them stimulated. Windows are best avoided not only because your feathered friend may get chilly, but also because it may provide a little <em>too </em>much stimulation, with the constant foot traffic from strangers causing nerves and anxiety.</p>

<p>&nbsp;</p>

<h2>Don&rsquo;t smoke around your bird</h2>

<p>Rule 101 when learning <strong>how to take care of a bird</strong>: don&rsquo;t smoke around them. Deciding to smoke is of course a personal decision for us humans - a conscious one made with the facts we&rsquo;ve got in front of us. But when it comes to our feathered friends, the negative health impacts of smoking are too terrible to ignore. The tars, nicotine and hydrocarbons present in the cigarette smoke settle in their lungs and air sacs. What happens? Well it&#39;s the same for birds as it is for humans - causing a rise in blood pressure, reduced lung efficiency, damage to the heart (and lots more!). So while your feathered friend won&rsquo;t be smoking themselves, passive smoke is really damaging! If you&rsquo;re thinking about adopting, make sure that you&rsquo;ve got a strict no-smoking policy in your home.</p>

<p><img alt="Parrot lovebird sitting on hand on blurred living room background" src="https://images.prismic.io/trustedhousesitters/f980c91f-1e2c-44ae-9ee3-01d6779c39cb_bird+care.jpg?auto=compress,format&amp;rect=0,0,1920,800&amp;w=1920&amp;h=800" style="height:800px; width:1920px" /></p>

<h2>Feeding your bird</h2>

<p>Choosing the right food starts with knowing your feathered friend&rsquo;s breed inside-out, and it&rsquo;s a key area to be on top of when learning <strong>how to take care of a bird</strong>. Depending on the type of bird, some will be better suited to certain types of bird food - be it bagged, canned, dried or fresh, and their health depends on the right choices being made by pet parents to form a balanced diet.&nbsp;</p>

<p>If you&rsquo;re not sure what your bird can and can&rsquo;t eat, chat with your vet about the types of food suitable before welcoming your new buddy home. Many pet birds thrive off a diet of bird seed, pellets, crumbles and nuggets alongside fresh fruits and vegetables that are hydrating, tasty and fun to crunch on.&nbsp;</p>

<p>Whichever food you go for, be sure to keep it high up in the cage (alongside water) to avoid any droppings landing in food bowls! And when it comes to choosing the right time to feed your bird, the most important thing is to be consistent. Make sure you put the food down at a regular time each day, providing more meals for birds with higher metabolisms. If you&rsquo;re bird sitting, ask the pet parents for a detailed rundown on exactly what to feed their feathered family members and when, and stick to it!</p>

<p>&nbsp;</p>

<h2>Bird baths</h2>

<p>If you&rsquo;ve ever been distracted by your garden birds bathing or even pigeons in the street (and trust us, we have), you&rsquo;ll know that birds LOVE water. And even better, these feathered cuties are capable of taking care of their own grooming - making<strong> bird care</strong> a whole lot simpler. They love to take a dip when it&rsquo;s warm outside, so prop your feathered friend safely outside with a cool water dish that&rsquo;s large enough for a refreshing bath. In the cooler months, mount a perch onto your shower wall with suction cups, giving your buddy the chance to groom in the comfort of a warm home.</p>

<p><img alt="Parrot bathing" src="https://images.prismic.io/trustedhousesitters/5cb158ad-4a9b-4e01-b369-ea2f23cbf462_How+to+care+for+a+bird.jpg?auto=compress,format&amp;rect=0,0,1920,800&amp;w=1920&amp;h=800" style="height:800px; width:1920px" /></p>

<h2>Sunlight</h2>

<p>When learning how to care for a bird, knowing their body clock (and helping to keep it regular) is vital. To keep your feathered family member happy, healthy and in a good sleeping rhythm, give them access to natural light in the day time, then balance this out with around ten hours of darkness every night. While this can&rsquo;t be achieved naturally in all countries, consider investing in a blackout cover or curtains to make sure your bird is getting the rest they need.</p>

<p>&nbsp;</p>

<h2>Exercise</h2>

<p>Making sure your feathered friend has time each week to spread their wings (literally) is super important for their health and happiness. Choose a safe space where your bird has no chance of flying away (which is of course super dangerous for domesticated birds!), or keep them on a harness if you need to. Alongside out-of-cage antics, invest in a few bird toys to keep them occupied and to allow for bonding time between you, those you live with and your pet bird - your feathered friends might enjoy a bell, perch, pine cones or rope. And as your buddy will spend most of their time on their perch, set a few at different heights and positions around the cage for variety.</p>

<p><img alt="Parrot playing with a bell" src="https://images.prismic.io/trustedhousesitters/ccf7417d-e8e0-4f2f-9b38-9011f924b6f0_Safe+for+birds.jpg?auto=compress,format&amp;rect=0,0,1920,800&amp;w=1920&amp;h=800" style="height:800px; width:1920px" /></p>

<h2>Hygiene</h2>

<p>While your feathered friend is more than qualified to groom themselves, it&rsquo;s up to you as the pet parent or bird sitter to keep their cage clean. Keep something flat at the bottom of the cage so that cleaning droppings, food and feathers is simple. Replace food dishes daily and make sure no traces of soap are left behind. Also, be sure to find out if any products you use to clean the cage or areas of your home are safe for birds - unfortunately, many are toxic to them.</p>

<h2>Social interaction</h2>

<p>If you&rsquo;re pet sitting a bird or you&rsquo;re thinking about adopting one, it&rsquo;s vital you consider whether you&rsquo;ve got the time to socialize with your feathered friend. They&rsquo;re highly sociable animals, so need interaction, fun and attention to stay happy and healthy. Some birds are quicker learners than others, but have a go at playing games and teaching tricks to keep those birdy minds stimulated! Plus you can eat meals at the same time and pet them gently while handling for the ultimate quality time. If you&rsquo;ve got the space, screening of an area of your porch or garden is a great way to help your feathered friends feel like they&rsquo;re part of the fun from the safe confines of home.</p>
')


,	( '48981d702b321f55a52652da71155e67' , '7A07BA85FEBCA8A149A01893F84A2AB8', N'Lessons from a mayfly' , GETDATE() , N'interesting facts' , 
	N'Recently I attended the Aldo Leopold Chapter of Trout Unlimited fundraiser. This chapter''s leadership was essential in enabling Groundswell Conservancy to purchase 40 acres on Dell Creek in Sauk County. The Dell Creek watershed has the chance to become a stronghold for wild brook trout and much of the 40 acres is excellent bird habitat in the form of healthy oak woods.',

	N'<p>TU fundraisers, like those for many hunting and fishing organizations, consist of auctions and raffles, with a favorite being the bucket raffle.&nbsp;Lots of buckets paired with great prizes; attendees choose the prizes they want to win by putting their tickets in the appropriate buckets.</p>

<p><img alt="" src="https://images.squarespace-cdn.com/content/v1/55c0d7e5e4b05b835010c1f4/334586ca-e2d1-40f1-8c89-ef03e26438f7/9138000379_ccf76bc1f0_c.jpg" style="height:640px; width:800px" /></p>

<p>Mayfly, photo by <em>Aaron Carlson FCC</em></p>

<p>Since I don&#39;t tie flies and since TU chapters always have some highly skilled tyers&nbsp;donate some great collections, that&#39;s what I try to win: a truly lovely collection of flies by a member of the Leopold Chapter.&nbsp;I paused, though, when I realized most of the flies imitated the gorgeous mayflies that used to inhabit southern Wisconsin streams. You probably noticed that sad word, &quot;used.&quot; They don&#39;t anymore and I realized I&#39;d never use those flies. &nbsp;</p>

<p>A nearby bucket offered a prized bourbon as the prize.&nbsp;There went my tickets and I won!</p>

<p>You&#39;re probably wondering by now, what is the connection between that whiskey and Cedar Waxwings? In <a target="_blank">my last blog</a>, a Cedar Waxwing, my favorite bird, is photographed eating a serviceberry.&nbsp;That&#39;s the characteristic pose of the fruit-loving beauty. I have a different favorite image of the Cedar Waxwing.&nbsp;For much of the summer, small flocks of Cedar Waxwings gather in trees along trout streams.&nbsp;They wait to feed on mayflies that have hatched from the stream and are flying into streamside vegetation before they return to the waters to mate and lay eggs.</p>

<p>The waxwings then fly with amazing agility as they hover, turn, and swoop to catch the mayflies. I fear this cherished and anticipated sight will become a memory.<strong><em>&nbsp;</em></strong></p>

<p><img alt="" src="https://images.squarespace-cdn.com/content/v1/55c0d7e5e4b05b835010c1f4/5b3fa83f-eef2-4de1-8f51-75d99f7dface/10797792626_4fa465b3b3_k.jpg" style="height:1365px; width:2048px" /></p>

<p>Cedar Waxwing, <em>photo by Kelly Colgan Azar</em></p>

<p>Science is just beginning to quantify, document, and analyze what trout anglers in southern Wisconsin and elsewhere around the country have noticed for years; many species of mayflies have disappeared or vanished.&nbsp;Anglers and the myriad birds and bats that gathered at Black Earth Creek for the spectacular hatch of <em>Hexigenia limbata</em>, our largest mayfly, wait in vain or don&#39;t bother.&nbsp;You might remember old magazine covers or sporting art that showed trout leaping out of the water to catch a flying mayfly.&nbsp;That used to really happen (I saw it frequently and it was always a thrill) and the mayfly was probably the Hendrickson.&nbsp;It too is just about gone from southern Wisconsin streams.</p>

<p>We don&#39;t know with any certainty much about these losses.&nbsp;From a bird lover&#39;s perspective, I don&#39;t know how much harm the loss of such abundant, seasonal protein means to birds such as swallows and Cedar Waxwings that feed heavily on the hatches. Since some of the hatches occur in the late afternoon or early evening I&#39;m not even sure if we know which birds focused on those hatches. A friend has asked anglers on Black Earth Creek to participate in a survey on <em>Hexagenia limbata</em>. From the few and early reports I&#39;ve seen the results are discouraging.</p>

<p>One signal for anglers around here that the hexagenia would be hatching would hover over one&#39;s lawn in the evening: lightening bugs, on everyone&#39;s Top Ten list of favorite insects. I just had the sad realization that I have not seen a single lightening bug this summer.&nbsp;And don&#39;t even ask about monarchs.&nbsp;We have a lot of work to do.</p>

<p>We also don&#39;t know why the flies are disappearing.&nbsp;The neonicotinoid pesticides which seem to be devastating many pollinator species are prime suspects.&nbsp;The Wisconsin DNR is beginning to research this possibility. The problems with these pesticides are many:&nbsp;they&#39;re highly toxic to a variety of insects, they persist, they easily move from plants and soil to the water, and they are everywhere one finds commercial agriculture. As of last year, just about all of the field corn and soybean seeds sold in Wisconsin were treated with neonics.&nbsp;For some of the key crops, the neonics have left the plants and entered the environment before they affected the targeted pests.&nbsp;As a result they did not improve farmers&#39; yields.</p>

<p>I have noted that my friends who fish the northern Wisconsin streams where commercial agriculture is much less prevalent or absent still witness the mayflies we no longer see.</p>

<p><img alt="" src="https://images.squarespace-cdn.com/content/v1/55c0d7e5e4b05b835010c1f4/9bb8c4b8-aa32-4488-b26c-3439953aa6c8/25925751887_1001264699_h.jpg" style="height:894px; width:1437px" /></p>

<p>American Kestrel eating a grasshopper, <em>photo by Gary Leavens FCC</em></p>

<p>By the way, the problem probably extends beyond pollinators and aquatic insects.&nbsp;The New York Times published a long report on the decline of kestrels. Young kestrels aren&rsquo;t skilled enough to hunt the bigger prey of the adults (little birds and mammals, for example) and need easier prey.&nbsp;Grasshoppers might be a key food and they too are vulnerable to neonics.</p>

<p>From an advocacy perspective, the first course of action is to accelerate research.&nbsp;The real work will come if neonics should be subject to more thorough and careful regulation in order to protect bugs and birds.&nbsp;This might be our generation&#39;s version of the battle that conservationists waged against DDT. If so, we&#39;d better have the gumption and persistence they demonstrated.</p>
')
,	


( '309d3c8fc90b2cf25bf851f62e428ec7' , '1BAC1B56627B5894B16E885461AC366E', N'A better future for local bird conservation' , GETDATE() , N'protect bird' ,
	N'Birds are the heart of our organization’s mission, and they always will be. Protecting and restoring habitats, reducing dangers to our feathered friends in urban areas, and creating spaces to share in the joy of nature together are essential. Conservation is a big project, bigger than any one person. We need all the support, from all the people who care, to build a better future for the birds we love.',
	
	N'<p>Honestly, birds are really special&mdash;they bring joy to so many people and bring so many people into the conservation community. Whether it&rsquo;s as simple as seeing a Northern Cardinal that reminds you of a loved one, or as grand as witnessing the incredible spectacle of Sandhill Crane migration through the Platte River, everyone has a bird story. If birds are such a natural entry point, how bird conservation organizations (like ours) conduct themselves&mdash;even what they call themselves&mdash;affects <em>who</em> in the community feels welcome to engage in this critical effort. It is vital that we both create pathways and eliminate barriers so that anyone who cares enough about birds to seek out and join our shared work feels like they belong.</p>

<p><img alt="" src="https://images.squarespace-cdn.com/content/v1/55c0d7e5e4b05b835010c1f4/98198d97-31b6-41e6-86ed-c8b8f72c505b/51156816032_1aa7b180be_4k.jpg" style="height:2615px; width:4095px" /></p>

<p>We must make it absolutely clear that our organization welcomes everyone&mdash;those already involved in bird conservation, and those that could be. That&rsquo;s why we&rsquo;re making a crucial change.</p>

<p>This past week, our members received a letter in the mail with an important announcement.<em> </em>After rigorous deliberation and thorough discussion, Madison Audubon&rsquo;s board of directors voted unanimously to drop the &ldquo;Audubon&rdquo; name and identify a process to seek a new name for the organization.&nbsp;</p>

<p>Ultimately, Audubon&#39;s racist history creates a painful legacy for many in our community and also severely limits our ability to carry out our mission inclusively, meaningfully, and sustainably. A name change simply allows more people to enjoy, participate in, and improve our work together to conserve birds and habitat.</p>

<p>Our mission remains the same: we will continue to focus on bird conservation, habitat protection, youth education, and community engagement. We&nbsp;look forward to having a name that truly celebrates <em>that</em>.</p>
')



,	( 'e9dd9c14ec255e2700d76c05c70d0236' , 'D9608C097B4AC716401B25D55D657DF5', N'Beauty and Guilt' , GETDATE() , N'Bird shots' , 
	N'The Milwaukee Journal Sentinel revealed yesterday what southern Wisconsin birders have known for several days.  The Lake Michigan shoreline in Milwaukee is hosting a male Mandarin Duck, arguably the world''s most spectacular and beautiful duck.',

	N'<p>If you don&#39;t want to drive to Milwaukee and join dozens of other birders, check out the photos below. WOW, WOW, WOW.</p>

<p><img alt="" src="https://images.squarespace-cdn.com/content/v1/55c0d7e5e4b05b835010c1f4/a338563c-4011-4ae5-98cc-0a3611cd9c66/45767824741_e67cfba391_c.jpg" style="height:558px; width:800px" /></p>

<p><em>Mandarin Duck photo by Andy Reago &amp; Chrissy McClarren</em></p>

<p><img alt="" src="https://images.squarespace-cdn.com/content/v1/55c0d7e5e4b05b835010c1f4/5d032e6e-2c81-4749-93c7-d87043e44a10/51882267308_55eacebfab_c.jpg" style="height:551px; width:800px" /></p>

<p><em>Mandrin Duck preening photo by Andy Reago &amp; Chrissy McClarren</em></p>

<p><img alt="" src="https://images.squarespace-cdn.com/content/v1/55c0d7e5e4b05b835010c1f4/bea8364c-20e2-428d-b495-6f96a3346c26/4396449810_3dc59908a4_c.jpg" style="height:531px; width:800px" /></p>

<p><em>Mandarin Duck at the zoo in Basel, Switzerland, photo by Tambako The Jaguar FCC</em></p>

<p>I&#39;m feeling a bit guilty about all this, mostly because of my initial response.&nbsp;Which was, &ldquo;This is so cool, so neat, what a bird, what a looker, we are SO lucky.&rdquo; Then, the next reflection and guilt.&nbsp;Gee, the bird is not supposed to be here. Is it an escapee that doesn&#39;t have a chance to survive?&nbsp;Does it pose any threat to native species?&nbsp;Shouldn&#39;t I be saving my admiration for our native species, all too many of which are endangered, threatened, or declining?</p>

<p>I can rest assured on some counts.&nbsp;Mandarin Ducks do not appear to pose any threat to native species of waterfowl.&nbsp;Escapees from public or private collections seem to have a decent chance to survive. In several places in the continental United States, Mandarin Ducks have established feral, self-sustaining populations, again without apparent harm to other wildlife.</p>

<p>At the basis of my guilt is the strong part beauty plays in my appreciation and support of wildlife&mdash;too strong perhaps? Back to fish (of course).&nbsp;The tiger trout, a hybrid of brown and brook trout, is one of Wisconsin&#39;s striking. It combines the vivid colors and pattern of brook and brown trout in spectacular fashion.&nbsp;But it&#39;s not supposed to be here.&nbsp;Brown trout are an exotic, some&nbsp;would say invasive species; in many streams, they wholly or substantially replace the native brook trout. Nevertheless, I was delighted when I caught my first and only tiger trout two years ago and my fishing friends and I are always tickled to learn of someone catching one.&nbsp;They are extremely rare in Wisconsin and are not bred or stocked here.</p>

<p>Birds and fish.&nbsp;I think House Finches are cute and lovely and I&#39;m always happy to see them in the yard. Pink salmon, a startling fish in its spawning colors and body shape and another exotic, has established itself in Lake Michigan and I&#39;d love to catch one.&nbsp;Sorry to confess, I find starlings handsome fellows.</p>

<p><img alt="" src="https://images.squarespace-cdn.com/content/v1/55c0d7e5e4b05b835010c1f4/51b6c967-1acf-441c-9f6e-9aa64785a093/House+Finch+KCA.jpg" style="height:1016px; width:1533px" /></p>

<p><em>House Finch photo by Kelly Colgan Azar</em></p>

<p><img alt="" src="https://images.squarespace-cdn.com/content/v1/55c0d7e5e4b05b835010c1f4/191861c2-c568-49f5-a45b-65dd7aa50d5e/8692726913_ec2f438817_c.jpg" style="height:600px; width:800px" /></p>

<p><em>Pink salmon photo by Kimberly Holzer/Waterkeeper Alliance Inc. FCC</em></p>

<p><img alt="" src="https://images.squarespace-cdn.com/content/v1/55c0d7e5e4b05b835010c1f4/847b8b0c-9cc8-421d-9393-3de0774baf5b/33721607850_6601875d9b_c.jpg" style="height:533px; width:799px" /></p>

<p><em>European Starling photo by Mick Thompson</em></p>

<p>While I don&#39;t know that many of you are starling fans, I suspect my affinity for lovely creatures is widely shared. <strong>Thank goodness because that emotion is one of the building blocks of our concern for and care of wildlife.</strong>&nbsp;We are as emotional as we are rational.&nbsp;A conservation ethic needs an emotional foundation as much as a rational one.&nbsp;Madison Audubon members would not donate time and money to our birds, their habitat, and their fellow creatures if they did not love them. The beauty of those creatures and their homes nourishes that love.</p>

<p>Enjoy the Mandarin in person or in photographs. Let&#39;s embrace him as one of the colorful and happy surprises Nature can offer, even during dreary January. &nbsp;</p>

<p>Thanks for your care of the natural beauty that surrounds us and take care,<br />
<em>Topf Wells, Madison Audubon advocacy committee</em></p>

<p>&nbsp;</p>

<h3>ADDITIONAL NOTE FROM THE AUTHOR:</h3>

<p>Though I reference&nbsp;bird species that are not native to Wisconsin,&nbsp;my reflection on how nature can be incredibly beautiful and inspire conservation is not a form of advocacy for these species. While appreciating a bird&rsquo;s plumage exemplifies how our attraction to beauty supports our conservation ethic, it&rsquo;s not the only support. Appreciating and understanding how creatures function in a healthy or not so healthy environment are also part of that ethic&rsquo;s foundation.&nbsp;</p>

<p>In some cases, invasive or exotic species can cause serious harm to native wildlife populations. Thinking about them closely, in addition to perhaps marvelling at their beauty, can lead to a better understanding of the complexity of our current natural world, and what it needs to be healthier. We need to better protect native species of all sorts&mdash;I know from battling invasive honeysuckle, buckthorn, reed canary grass, and even starlings for a couple of years at the kestrel boxes I was monitoring. But scientists also acknowledge that many invasive species are here to stay&mdash;we need to better understand their impact to evaluate what options we have for managing them.&nbsp;</p>
')


,	( '553acd22fd496a02446c6258b3ba027e' , '530A0ABFDEDF30ECFBE3E6618FB2CF48', N'How To Choose The Right Kind Of Bird Feeder' , GETDATE() , N'take care of bird' , 
	N'The ideal bird feeder is sturdy enough to withstand winter weather and squirrels, tight enough to keep seeds dry, easy to assemble and, most important of all, easy to keep clean.',

	N'<h3>Tray Or Platform Feeders</h3>

<p><img alt="house finches at a platform feeder" src="https://www.allaboutbirds.org/news/wp-content/uploads/2015/05/platform_feeder.jpg" style="height:204px; width:552px" /></p>

<p>House Finches at a platform feeder.&nbsp;<em>Photo by Susan Spear/Cornell Lab.</em></p>

<p>Trays attract the widest variety of seed-eating feeder birds, including pigeons, starlings, and House Sparrows, but also grosbeaks and native sparrows. Tray feeders offer no protection against rain and snow; without excellent drainage, seeds may become wet enough to sprout, and wet seeds may also foster fungal and bacterial growth. Bird droppings can quickly soil the seed in tray feeders. The best tray feeders have a screened, rather than solid, bottom to promote complete drainage; at the very least, tray feeders should have several drainage holes. Even with drainage, the bottom should be removable for fairly frequent hosing. Offer only enough seed in tray feeders for birds to finish every day or two, and shake out the bottom every time you add new seeds.</p>

<p>Unless constructed with an effective squirrel baffle on the pole or suspension chain, tray feeders are an open invitation to squirrels and chipmunks.</p>

<p>Tray feeders placed near the ground are most likely to attract ground-feeding birds such as juncos, doves, jays, blackbirds, and sparrows (along with squirrels, deer, raccoons, and other critters). Tray feeders can also be mounted on deck railings, posts, or stumps, or can be suspended. Some models have a roof to provide some protection from the weather.</p>

<p><a >Back to Top</a></p>

<h3>Hopper Or &ldquo;House&rdquo; Feeders</h3>

<p><img alt="gray-crowned rosy-finch at hopper feeder" src="https://www.allaboutbirds.org/news/wp-content/uploads/2015/05/rosy_finch.jpg" style="height:191px; width:300px" /></p>

<p><em>Gray-crowned Rosy-Finch by&nbsp;<a >Ron McCluskey</a>.</em></p>

<p>This kind of feeder protects seeds fairly well against the weather and bird droppings, but if the seed within the hopper does get wet, bacteria and fungus can thrive. Hopper feeders are attractive to most feeder birds, including finches, jays, cardinals, buntings, grosbeaks, sparrows, chickadees, and titmice; they&rsquo;re also squirrel magnets. Many hoppers can hold enough seed to last for several days, which can make them very convenient for people, but dangerous for birds if the seed within is allowed to get wet. Most hopper feeders are much harder to clean than tray feeders. Hopper feeders can be mounted on a pole or suspended. Again, a squirrel baffle is important if you don&rsquo;t want to feed them.</p>

<p><a >Back to Top</a></p>

<h3>Window Feeders</h3>

<p>Small plastic feeders affixed to window glass with suction cups, and platform feeders hooked into window frames, attract finches, chickadees, titmice, and some sparrows. They afford us wonderful, close-up views of birds, and their placement makes them the safest of all feeder types for preventing window collisions. Because many birds feed while standing on the seeds in window feeders, the food risks becoming soiled, so the seed in these feeders should be changed daily and the feeders kept very clean. Fortunately, for most window designs these are the easiest of all feeders to access for filling and cleaning.</p>

<p><a >Back to Top</a></p>

<h3>Tube Feeders</h3>

<p><img alt="pine siskin at tube feeder" src="https://www.allaboutbirds.org/news/wp-content/uploads/2015/05/pine_siskin.jpg" style="height:270px; width:235px" /></p>

<p><em>Pine Siskin by&nbsp;<a >Barnmom</a>.</em></p>

<p>Hollow tubes keep seed fairly clean and dry and, if they have metal feeding ports, may be somewhat squirrel resistant (though squirrels often chew through the end caps or the plastic tube itself). Depending on the size of the perches under the feeding ports, you may attract small birds such as sparrows, grosbeaks, chickadees, titmice, and finches while excluding larger species such as grackles and jays. Styles with perches above the feeding ports are designed for seed-eating birds that can feed hanging upside down, such as goldfinches and chickadees, while dissuading others. Depending on the size of the feeding ports, you can offer tiny nyjer seeds or larger seeds.</p>

<p>Unfortunately, the seed-containing tube on most tube feeders extends an inch or more below the bottom-most feeding ports. Seed that collects here may become a breeding ground for mold and bacteria. It&rsquo;s best to block the bottom of the tube below the bottom feeding ports. Some tube feeders are huge, accommodating a dozen or more birds at a time. But these are best used only during times when many birds are using them. During periods when only a handful of birds use these feeders, use smaller models so the seed is used up fairly frequently.</p>

<p>When adding new seed to tube feeders, always empty the old seed out first.</p>
')
,	( 'd6d001e31f4065bbe402bc2eac44ca22' , 'F0757015A9AF8FD8C5E01EC4C4C82D3D', N'How To Choose The Right Kind Of Bird Feeder' , GETDATE() , N'take care of bird' , 
	N'The ideal bird feeder is sturdy enough to withstand winter weather and squirrels, tight enough to keep seeds dry, easy to assemble and, most important of all, easy to keep clean.<br>

To attract the greatest variety of birds to your yard, provide several different feeder types offering a variety of foods. You’ll find that some species are more likely to use one kind of feeder over another.',

	N'<h3>Tray Or Platform Feeders</h3>

<p><img alt="house finches at a platform feeder" src="https://www.allaboutbirds.org/news/wp-content/uploads/2015/05/platform_feeder.jpg" style="height:204px; width:552px" /></p>

<p>House Finches at a platform feeder.&nbsp;<em>Photo by Susan Spear/Cornell Lab.</em></p>

<p>Trays attract the widest variety of seed-eating feeder birds, including pigeons, starlings, and House Sparrows, but also grosbeaks and native sparrows. Tray feeders offer no protection against rain and snow; without excellent drainage, seeds may become wet enough to sprout, and wet seeds may also foster fungal and bacterial growth. Bird droppings can quickly soil the seed in tray feeders. The best tray feeders have a screened, rather than solid, bottom to promote complete drainage; at the very least, tray feeders should have several drainage holes. Even with drainage, the bottom should be removable for fairly frequent hosing. Offer only enough seed in tray feeders for birds to finish every day or two, and shake out the bottom every time you add new seeds.</p>

<p>Unless constructed with an effective squirrel baffle on the pole or suspension chain, tray feeders are an open invitation to squirrels and chipmunks.</p>

<p>Tray feeders placed near the ground are most likely to attract ground-feeding birds such as juncos, doves, jays, blackbirds, and sparrows (along with squirrels, deer, raccoons, and other critters). Tray feeders can also be mounted on deck railings, posts, or stumps, or can be suspended. Some models have a roof to provide some protection from the weather.</p>

<p><a >Back to Top</a></p>

<h3>Hopper Or &ldquo;House&rdquo; Feeders</h3>

<p><img alt="gray-crowned rosy-finch at hopper feeder" src="https://www.allaboutbirds.org/news/wp-content/uploads/2015/05/rosy_finch.jpg" style="height:191px; width:300px" /></p>

<p><em>Gray-crowned Rosy-Finch by&nbsp;<a >Ron McCluskey</a>.</em></p>

<p>This kind of feeder protects seeds fairly well against the weather and bird droppings, but if the seed within the hopper does get wet, bacteria and fungus can thrive. Hopper feeders are attractive to most feeder birds, including finches, jays, cardinals, buntings, grosbeaks, sparrows, chickadees, and titmice; they&rsquo;re also squirrel magnets. Many hoppers can hold enough seed to last for several days, which can make them very convenient for people, but dangerous for birds if the seed within is allowed to get wet. Most hopper feeders are much harder to clean than tray feeders. Hopper feeders can be mounted on a pole or suspended. Again, a squirrel baffle is important if you don&rsquo;t want to feed them.</p>

<p><a >Back to Top</a></p>

<h3>Window Feeders</h3>

<p>Small plastic feeders affixed to window glass with suction cups, and platform feeders hooked into window frames, attract finches, chickadees, titmice, and some sparrows. They afford us wonderful, close-up views of birds, and their placement makes them the safest of all feeder types for preventing window collisions. Because many birds feed while standing on the seeds in window feeders, the food risks becoming soiled, so the seed in these feeders should be changed daily and the feeders kept very clean. Fortunately, for most window designs these are the easiest of all feeders to access for filling and cleaning.</p>

<p><a >Back to Top</a></p>

<h3>Tube Feeders</h3>

<p><img alt="pine siskin at tube feeder" src="https://www.allaboutbirds.org/news/wp-content/uploads/2015/05/pine_siskin.jpg" style="height:270px; width:235px" /></p>

<p><em>Pine Siskin by&nbsp;<a >Barnmom</a>.</em></p>

<p>Hollow tubes keep seed fairly clean and dry and, if they have metal feeding ports, may be somewhat squirrel resistant (though squirrels often chew through the end caps or the plastic tube itself). Depending on the size of the perches under the feeding ports, you may attract small birds such as sparrows, grosbeaks, chickadees, titmice, and finches while excluding larger species such as grackles and jays. Styles with perches above the feeding ports are designed for seed-eating birds that can feed hanging upside down, such as goldfinches and chickadees, while dissuading others. Depending on the size of the feeding ports, you can offer tiny nyjer seeds or larger seeds.</p>

<p>Unfortunately, the seed-containing tube on most tube feeders extends an inch or more below the bottom-most feeding ports. Seed that collects here may become a breeding ground for mold and bacteria. It&rsquo;s best to block the bottom of the tube below the bottom feeding ports. Some tube feeders are huge, accommodating a dozen or more birds at a time. But these are best used only during times when many birds are using them. During periods when only a handful of birds use these feeders, use smaller models so the seed is used up fairly frequently.</p>

<p>When adding new seed to tube feeders, always empty the old seed out first.</p>
');




	

