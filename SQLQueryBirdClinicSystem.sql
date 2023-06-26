
CREATE TABLE Images (
  imageID CHAR(32) NOT NULL,
  imageURLName varchar(50) NOT NULL,
  
  CONSTRAINT PK_Images PRIMARY KEY CLUSTERED 
(
	imageID ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] 
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE Users (
  userID CHAR(32) NOT NULL,
  imageID CHAR(32) NOT NULL,
  userName VARCHAR(30) NOT NULL,
  userPassword CHAR(30) NOT NULL,
  fullName NVARCHAR(50) NOT NULL,
  phoneNumber CHAR(10) NOT NULL,
  gender VARCHAR(7) NOT NULL,
  email VARCHAR(40) NOT NULL, 
  userRole VARCHAR(10) NOT NULL, 
  status_ VARCHAR(10) NOT NULL,
  FOREIGN KEY (imageID) REFERENCES Images(imageID),
  CONSTRAINT PK_Users PRIMARY KEY CLUSTERED 
(
	userID ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] 
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE Customer (
  customerID CHAR(32) NOT NULL,
  dob DATE NOT NULL,
  customerAddress VARCHAR(70) NOT NULL, 
  CONSTRAINT PK_Customer PRIMARY KEY CLUSTERED 
  (
    customerID ASC
  ) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
  CONSTRAINT FK_Customer_Users FOREIGN KEY (customerID) REFERENCES Users(userID)
) ON [PRIMARY]

CREATE TABLE Speciality (
  specialityID CHAR(32) NOT NULL,
  specialityName VARCHAR(30) NOT NULL,
  CONSTRAINT PK_Speciality PRIMARY KEY CLUSTERED 
(
	specialityID ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] 
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE Doctor (
  doctorID CHAR(32) NOT NULL,
  specialityID CHAR(32) NOT NULL,
  docAge TINYINT NOT NULL,
  yearsOfExperience TINYINT NOT NULL,
  academicTitle VARCHAR(20),
  degree VARCHAR(10),
  FOREIGN KEY (specialityID) REFERENCES Speciality(specialityID),
  CONSTRAINT PK_Doctor PRIMARY KEY CLUSTERED 
(
	doctorID ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
CONSTRAINT FK_Doctor_Users FOREIGN KEY (doctorID) REFERENCES Users(userID)
) ON [PRIMARY] 
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE TimeSlot (
  timeSlotID CHAR(32) NOT NULL,
  timeSlot TIME NOT NULL,
  day_ NVARCHAR(11) NOT NULL,
  CONSTRAINT PK_TimeSlot PRIMARY KEY CLUSTERED 
(
	timeSlotID ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] 
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
  CONSTRAINT PK_Medicine PRIMARY KEY CLUSTERED 
(
	medicineID ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] 
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] 
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE Bird (
  birdID CHAR(32) NOT NULL,
  customerID CHAR(32) NOT NULL,
  imageID CHAR(32) NOT NULL,
  birdFullname NVARCHAR(30),
  birdGender VARCHAR(6) NOT NULL,
  breed VARCHAR(20) NOT NULL,
  band_chip CHAR(6),
  birdWeight INT NOT NULL,
  sexingMethod VARCHAR(60) NOT NULL,
  medicalHistory VARCHAR(60),
  hatchingDate DATE NOT NULL,
  featherColor VARCHAR(50) NOT NULL,
  FOREIGN KEY (customerID) REFERENCES Customer(customerID),
  FOREIGN KEY (imageID) REFERENCES Images(imageID),
  CONSTRAINT PK_Bird PRIMARY KEY CLUSTERED 
(
	birdID ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE Appointment (
  appointmentID CHAR(32) NOT NULL,
  birdID CHAR(32) NOT NULL,
  doctorID CHAR(32) NOT NULL,
  timeSlotID CHAR(32) NOT NULL,
  serviceID CHAR(32) NOT NULL,
  appTime DATETIME NOT NULL,
  notes NVARCHAR(200),
  payment NVARCHAR(20) NOT NULL,
  appStatus VARCHAR(20) NOT NULL,
  FOREIGN KEY (birdID) REFERENCES Bird(birdID),
  FOREIGN KEY (doctorID) REFERENCES Doctor(doctorID),
  FOREIGN KEY (timeSlotID) REFERENCES TimeSlot(timeSlotID),
  FOREIGN KEY (serviceID) REFERENCES Service_(serviceID),
  CONSTRAINT PK_Appointment PRIMARY KEY CLUSTERED
(
	appointmentID ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE MedicalRecord (
  medicalRecordID CHAR(32) NOT NULL,
  appointmentID CHAR(32) NOT NULL,
  birdID CHAR(32) NOT NULL,
  doctorID CHAR(32) NOT NULL,
  recordTime DATETIME NOT NULL,
  diagnosis VARCHAR(100) NOT NULL,
  FOREIGN KEY (appointmentID) REFERENCES Appointment(appointmentID),
  FOREIGN KEY (birdID) REFERENCES Bird(birdID),
  FOREIGN KEY (doctorID) REFERENCES Doctor(doctorID),
  CONSTRAINT PK_MedicalRecord PRIMARY KEY CLUSTERED 
(
	medicalRecordID ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE RecordServices (
  medicalRecordID CHAR(32) NOT NULL,
  serviceID CHAR(32) NOT NULL,
  FOREIGN KEY (medicalRecordID) REFERENCES MedicalRecord(medicalRecordID),
  FOREIGN KEY (serviceID) REFERENCES service_(serviceID),
)

CREATE TABLE RecordMedicine (
  medicalRecordID CHAR(32) NOT NULL,
  medicineID CHAR(32),
  quantity INT,
  descriptions NVARCHAR(200),
  FOREIGN KEY (medicalRecordID) REFERENCES MedicalRecord(medicalRecordID),
  FOREIGN KEY (medicineID) REFERENCES Medicine(medicineID)
);

CREATE TABLE Feedback (
  feedbackID CHAR(32) NOT NULL,
  appointmentID CHAR(32) NOT NULL,
  feedbackContent NVARCHAR(500),
  title NVARCHAR(100),
  feedbackTime DATETIME,
  FOREIGN KEY (appointmentID) REFERENCES Appointment(appointmentID),
  CONSTRAINT PK_Feedback PRIMARY KEY CLUSTERED 
(
	feedbackID ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE Blog (
  blogID CHAR(32) NOT NULL,
  title NVARCHAR(100) NOT NULL,
  upload DATETIME,
  category NVARCHAR(50) NOT NULL,
  blogContent NVARCHAR(4000) NOT NULL,
  CONSTRAINT PK_Blog PRIMARY KEY CLUSTERED 
(
	blogID ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

INSERT INTO Images(imageID, imageURLName)
VALUES
    ('4twgbi3qw84bgqhorwoee83hf93jj30f', 'admin.jpg'),
    ('janfuewhfnhfn3ga98h943ghafa92rhf', 'maleuser.png'),
    ('gha948ga489hra3r9fh32f32f9838r93', 'femaleuser.png'),
    ('fhawfbwa98fha98hf9na9uwbga9ubvg9', 'lgbtuser.png'),
	('cjndsjkcfnzslkjvnawjefn8jfh38fu3', 'bs1.png'),
	('vnaeojvner9gh39g4waofh28f28hfa93', 'bs2.png'),
	('fhafgbyfg87gf83bfiwifhweufhwe5g5', 'bs3.png'),
	('g73f93hf9bwfb3v384ub83bg3487fb43', 'bs4.png'),
	('biserhbf9473hf9b94gb49f93f38f984', 'bs5.png'),
	('gsbheirbfg7a843hgfa943bfu9fb3f93', 'bs6.png'),
	('fbriehafbihfa7hfa3hf983hf98qff82', 'bs7.png'),
	('rfhiarebfniuaerhnfuah9f48h34f843', 'bs8.png'),
	('fherajfhriuehfraufha94hf98fh93hf', 'bs9.png'),
	('fnerajfha974fhy4973haf9ha49hf338', 'bs10.png'),
    ('fafnbuhfauhfweoufha8hfa9hfa48hf8', 'Chim yến.png'),
    ('avewifbaiuwefnwajenfhiuahenf998f', 'Chim công xanh.jpg'),
	('fewabf9qb439fufh9h438q9h34fq34t4', 'Chim én.jpg'),
	('frheafiuewhf9hf983h3f4ha438f94f4', 'Chim trĩ.jpg'),
	('4rt43t5y56y465t4r3e24r435y65u76i', 'Chim sẻ.jpg'),
	('efrgtrytuiykjhmngfbvdfewr4567898', 'Chim hồng yến.jpg'),
	('48c967910f7eb39ea5f7b7602a3df9ea', 'Chim hạc trắng.jpg'),
	('3b94ace86063b245916a6e906221e6a8', 'Chim khuyên trắng.jpg'),
	('249fb9cb11171ae6ab41794bee070a8f', 'Chim Yến Phụng.jpg'),
	('b3b9752ec51a5433b44e27b8d9b81c76', 'Chim bồ câu.jpg'),
	('ee38603c9cfdb54fb0a0ab4a197f92a3', 'Chim Vẹt.jpg'),
	('ef94fe9d57eed266b24c3fc1203c1e17', 'Chim hoàng yến.jpg'),
	('a8cf052632950deb5ab9c1f5ec36334d', 'Chim chích chòe lửa.png'),
	('7b1bc65da7abbaceaaadc0ea9564c175', 'Chim chào mào.png'),
	('95f7e5a8c051e6b60905912bd8aedf7d', 'Chim oanh cổ đỏ.png'),
	('365c43bd856cf86e0e0b4cd4b7bc0462', 'Chim Khướu bạc má.png'),
	('b51f1bb2e54d243e60e32563b2b1a7ed', 'Chim chích bông.png'),
	('08eed66a05827e8dc02d6ff1392f9bf6', 'Chim diệc đầu đen.png'),
	('ddfff0e1f9009fe5d621e2ed07348a51', 'Chim cúc cu.png'),
	('cbe26c3a3f34407ed023e3f02399d2fa', 'Chim nhạn đen.png'),
	('05b5b4345d8ac2f73ece3df15be03230', 'Chim họa mi đồng cỏ.png'),
	('2bda592b2aada870747dd4366a3dff18', 'Chim nhạn trắng.png'),
	('e28e1458f599f2391b91bfd61338483e', 'Chim bìm bịp Đông Dương.png'),
	('84cb52eda2e4f0b66f8509c37e857e8c', 'Chim sáo bụng đen.png'),
	('8721d5a5f3f44bd01529d24dcf519239', 'Chim Chìa Vôi họng trắng.png'),
	('66a5473e01debb47bff7f215d6c4a228', 'Chim cắt Mindoro.png'),
	('6d47ad177fb45c2d87e1b54fc363676b', 'Chim đớp ruồi cằm đen.png'),
	('25abf9603856427e295b7bd1137fd04a', 'Chim thiên nga đen.png'),
	('ed1ed3634186fc66ee692da3ba98272f' , 'Chim sơn ca.png'),
	('e47ccaddaa9e2cd4c25e84cae624b077' , 'Chim Vàng Anh.png');

-- Insert data into the Users table
INSERT INTO Users (userID, imageID, userName, userPassword, fullName, phoneNumber, gender, email, userRole, status_)
VALUES
    ('df906a974056cd590d0b9fc4ddc37c22', '4twgbi3qw84bgqhorwoee83hf93jj30f', 'tiendkmSE172051', 'password', 'Nguyễn Kim Minh Tiến', '0987896754', 'male', 'tiendkmse172051@fpt.edu.vn', 'admin', 'active' ),
    ('2c9320b8639fc9e1c784880bbecfdfa1', 'janfuewhfnhfn3ga98h943ghafa92rhf', 'tuanntaSE140515', 'password', 'Nguyễn Thanh Anh Tuấn', '0748195317', 'male', 'tuanntase140515@fpt.edu.vn', 'user', 'active' ),
    ('3ff56e23cc31e9c9a85bc037341a65ee', 'janfuewhfnhfn3ga98h943ghafa92rhf', 'bachnhSE172021', 'password', 'Nguyễn Huy Bách', '0987656788', 'male', 'bachnhSE172021@fpt.edu.vn', 'user', 'active' ),
	('3ff5njfnijhfdsf8845bc037341a65ee', 'janfuewhfnhfn3ga98h943ghafa92rhf', 'minhdnaSE172977', 'password', 'Đặng Võ Anh Minh', '0876549456', 'male', 'minhdnaSE172977@fpt.edu.vn', 'user', 'active' ),
	('82d5cf38dc655bd1722ac5d4d350bce3', 'janfuewhfnhfn3ga98h943ghafa92rhf', 'PhuctqhSE171472', 'password', '	Trương Quang Hồng Phúc', '0897412324', 'male', 'PhuctqhSE171472@fpt.edu.vn', 'user', 'banned' ),
	('1c4f04058f291642c159e27e1554ddf8', 'janfuewhfnhfn3ga98h943ghafa92rhf', 'anptSE172048', 'password', 'Phan Thiên Ân', '0987656788', 'male', 'anptSE172048@fpt.edu.vn', 'user', 'active' ),
	('c0637bb4f3d7531d936f2686b9672a66', 'janfuewhfnhfn3ga98h943ghafa92rhf', 'nghoangphuc01', 'password', 'Nguyễn Hoàng Phúc', '1234567890', 'male', 'phucnh01@gmail.com', 'user', 'active' ),
    ('11eee90acf45377f4cc3ca0758f2bf30', 'janfuewhfnhfn3ga98h943ghafa92rhf', 'tuannt02', 'password', 'Nguyễn Thanh Tuấn', '0987654321', 'male', 'tuannt02@gmail.com', 'user', 'active' ),
    ('48b31829bc7599f232d06a1e686534bd', 'fhawfbwa98fha98hf9na9uwbga9ubvg9', 'anhttl03', 'password', 'Trần Thị Lan Anh', '0123456789', 'unknown', 'anhttl03@gmail.com', 'user', 'active' ),
    ('4e192dacb208ceb2413376e2ad3b3db8', 'gha948ga489hra3r9fh32f32f9838r93', 'rienglt01', 'password', 'Lê Thị Riêng', '9876543210', 'female', 'riengtl01@gmail.com', 'user', 'active' ),
    ('6cb9c7dba65dd3d9e1946c5dd265dbcd', 'janfuewhfnhfn3ga98h943ghafa92rhf', 'hungnm02', 'password', 'Nguyễn Mạnh Hùng', '5678901234', 'male', 'hungnm02@gmail.com', 'user', 'active' ),
	('45b76de8eb0fd35e124955a2ff2473db', 'gha948ga489hra3r9fh32f32f9838r93', 'thaophy04', 'password', 'Phan Hồng Yến Thảo', '6565743635', 'female', 'thaophy04@gmail.com', 'user', 'banned' ),
    ('ea03ec90c8836f413784ee96e50a4f11', 'janfuewhfnhfn3ga98h943ghafa92rhf', 'toanhm07', 'password', 'Huỳnh Minh Toàn', '0976534156', 'male', 'toanmt07@gmail.com', 'user', 'active' ),
    ('bc6c32dbbb8bd0660d158b08d7cad96f', 'fhawfbwa98fha98hf9na9uwbga9ubvg9', 'haileduc56', 'password', 'Lê Đức Hải', '0965783451', 'unknown', 'haild56@gmail.com', 'user', 'active' ),
    ('7e55fcb3a457634cfa78b49bdb774b3a', 'gha948ga489hra3r9fh32f32f9838r93', 'yennth09', 'password', 'Nguyễn Thị Hải Yến', '0914135352', 'female', 'yennth09@gmail.com', 'user', 'active' ),
    ('d8869200b4fbde66a3475d6e730e1b6d', 'janfuewhfnhfn3ga98h943ghafa92rhf', 'minhngtr04', 'password', 'Nguyẽn Trần Minh', '0765678234', 'male', 'minhngtr04@gmail.com', 'user', 'banned' ),
	('128ce6812392dce1ca5a6919f03a26a2', 'gha948ga489hra3r9fh32f32f9838r93', 'thuthitran06', 'password', 'Trần Thị Thu', '0908070605', 'female', 'thuthitran06@gmail.com', 'user', 'active' ),
    ('87ccfc84f4eb846b5aeb0e04f6ea12ea', 'janfuewhfnhfn3ga98h943ghafa92rhf', 'bayvanng08', 'password', 'Nguyễn Văn Bảy', '0990807067', 'male', 'bayvanng08@gmail.com', 'user', 'active' ),
    ('715c43d86b98da2212d7a9c9ce9d3062', 'fhawfbwa98fha98hf9na9uwbga9ubvg9', 'phattrduc04', 'password', 'Trần Đức Phát', '0975432654', 'unknown', 'phattrduc04@gmail.com', 'user', 'banned' ),
    ('a69b4087d281cb16efaa6bc91308f64d', 'gha948ga489hra3r9fh32f32f9838r93', 'giangngquy03', 'password', 'Nguyễn Quỳnh Giang', '0914153645', 'female', 'giangngquy03@gmail.com', 'user', 'active' ),
    ('61dd2b9c89fdcc1dce9fb553bf29cd8d', 'janfuewhfnhfn3ga98h943ghafa92rhf', 'minhngqua07', 'password', 'Nguyễn Quang Minh', '0998877665', 'male', 'minhngqua07@gmail.com', 'user', 'active' ),
	('03b016eef369ef40bba639aa4f04341b', 'gha948ga489hra3r9fh32f32f9838r93', 'anhtrdan06', 'password', 'Đặng Trâm Anh', '0908866442', 'female', 'anhtrdan06@gmail.com', 'user', 'active' ),
    ('f8b0ed4e38a71924a7d2bca97029778a', 'janfuewhfnhfn3ga98h943ghafa92rhf', 'datquocle05', 'password', 'Lê Quốc Đạt', '0913254465', 'male', 'datqule05@gmail.com', 'user', 'active' ),
    ('5cbae581d99c1c3d17b8c09b07c54892', 'fhawfbwa98fha98hf9na9uwbga9ubvg9', 'yenkinguy45', 'password', 'Nguyễn Kim Yến', '0914253647', 'unknown', 'yenkinguy45@gmail.com', 'user', 'active' ),
    ('20e843f249d75ada67c1a2eef0dac92e', 'gha948ga489hra3r9fh32f32f9838r93', 'yenlethai35', 'password', 'Lê Thị Hải Yến', '0912233445', 'female', 'yenlethai35@gmail.com', 'user', 'banned' ),
    ('712da4f1096f6ae70d0f3c091b84ae7c', 'janfuewhfnhfn3ga98h943ghafa92rhf', 'phucngminh17', 'password', 'Nguyễn Minh Phúc', '0945566748', 'male', 'phucngminh17@gmail.com', 'user', 'active' ),
	('b03c6f5a51ee06d3dbd17d0e38507ede', 'gha948ga489hra3r9fh32f32f9838r93', 'vyngphuo57', 'password', 'Nguyễn Phương Vy', '0908123452', 'female', 'vyngphuo57@gmail.com', 'user', 'active' ),
    ('b83bb75b898592b75232c4816842d824', 'janfuewhfnhfn3ga98h943ghafa92rhf', 'longngvu14', 'password', 'Nguyễn Vũ Long', '0987432456', 'male', 'longngvu14@gmail.com', 'user', 'active' ),
    ('a68757602ea7419f0e2313a842be9abf', 'fhawfbwa98fha98hf9na9uwbga9ubvg9', 'ngocvanng45', 'password', 'Nguyễn Văn Ngọc', '0965478154', 'unknown', 'ngocvanng45@gmail.com', 'user', 'active' ),
    ('2b1850783245c06d0b782a4c9cd6a0a0', 'gha948ga489hra3r9fh32f32f9838r93', 'tratrthihuo37', 'password', 'Trần Thị Hương Trà', '9876543210', 'female', 'tratrthihuo37@gmail.com', 'user', 'banned' ),
    ('eb70ed9c4c32afea8f482dc873be4f6a', 'gha948ga489hra3r9fh32f32f9838r93', 'tranglethihuo75', 'password', 'Lê Thị Hương Trang', '0904534256', 'female', 'tranglethihuo75@gmail.com', 'user', 'active' ),
	('ae114dac5897fbcfd25797bf4be08fd3', 'cjndsjkcfnzslkjvnawjefn8jfh38fu3', 'yentrthith87', 'password', 'Trần Thị Thanh Yến', '0789145356', 'female', 'yentrthith87@gmail.com', 'user', 'active' ),
	('9eae70b054be6eba305323d8c9106cfb', 'vnaeojvner9gh39g4waofh28f28hfa93', 'anhdongtr09', 'password', 'Đỗ Nguyễn Trâm Anh', '0345762433', 'female', 'anhdongtr09@gmail.com', 'user', 'banned' ),
	('c8aa14ffb7da0912c84635aa2ee0bb62', 'fhafgbyfg87gf83bfiwifhweufhwe5g5', 'anhdoquynh35', 'password', 'Đỗ Quỳnh Anh', '0543749273', 'female', 'anhdoquynh35@gmail.com', 'user', 'active' ),
	('dd0e3f50648088bfecc501f809a06ca8', 'g73f93hf9bwfb3v384ub83bg3487fb43', 'tiennamtr36', 'password', 'Trần Nam Tiến', '0546328472', 'male', 'tiennamtr36@gmail.com', 'user', 'active' ),
	('62fe46dae9470f311d52973a6eeb6a1a', 'biserhbf9473hf9b94gb49f93f38f984', 'anhquochoa67', 'password', 'Hoàng Quốc Anh', '0534732843', 'male', 'anhquochoa67@gmail.com', 'user', 'active' ),
	('9c6189a20beb35a93df963e3b48eb9b0', 'gsbheirbfg7a843hgfa943bfu9fb3f93', 'sangkim16', 'password', 'Ngô Kim Sa', '0534254324', 'female', 'sangkim16@gmail.com', 'user', 'banned' ),
	('1c38dd30f9e415b3a34879be077381ce', 'fbriehafbihfa7hfa3hf983hf98qff82', 'taileanh78', 'password', 'Lê Anh Tài', '0523423234', 'male', 'taileanh78@gmail.com', 'user', 'active' ),
	('21fc9daf44e2637d7972bd248c83577d', 'rfhiarebfniuaerhnfuah9f48h34f843', 'nhiluoman19', 'password', 'Lương Mẫn Nhi', '0556475242', 'female', 'nhiluoman19@gmail.com', 'user', 'active' ),
	('01c1fa1b81297a2de21056f35303ad84', 'fherajfhriuehfraufha94hf98fh93hf', 'kietnganhmin47', 'password', 'Nguyễn Minh Anh Kiệt', '0556253524', 'male', 'kietnganhmin47@gmail.com', 'user', 'active' ),
	('fe30e1ff175e10b1c538613084ab2417', 'fnerajfha974fhy4973haf9ha49hf338', 'thaodothithu64', 'password', 'Đoàn Thị Thu Thảo', '0534719873', 'male', 'thaodothithu64@gmail.com', 'user', 'banned' );

-- Insert data into the Customer table
INSERT INTO Customer (customerID, dob, customerAddress)
VALUES
    ('2c9320b8639fc9e1c784880bbecfdfa1', '1990-02-15', '123 Nguyễn Văn A, Phường Bến Nghé, Quận 1, TP.HCM'),
    ('3ff56e23cc31e9c9a85bc037341a65ee', '1985-07-28', '456 Lê Lợi, Phường Bến Nghé, Quận 1, TP.HCM'),
    ('3ff5njfnijhfdsf8845bc037341a65ee', '1978-11-03', '258/3 Ngô Quyền, Phường Phạm Ngũ Lão, Quận 1, TP.HCM'),
	('82d5cf38dc655bd1722ac5d4d350bce3', '1992-09-10', '369/2 Hàm Nghi, Phường Nguyễn Thái Bình, Quận 1, TP.HCM'),
	('1c4f04058f291642c159e27e1554ddf8', '1987-04-21', '753/1 Trần Quang Khải, Phường Tân Định, Quận 1, TP.HCM'),
	('c0637bb4f3d7531d936f2686b9672a66', '1995-12-06', '123 Nguyễn Cư Trinh, Phường Nguyễn Cư Trinh, Quận 1, TP.HCM'),
	('11eee90acf45377f4cc3ca0758f2bf30', '1982-03-17', '456 Bùi Thị Xuân, Phường Phạm Ngũ Lão, Quận 1, TP.HCM'),
	('48b31829bc7599f232d06a1e686534bd', '1998-08-24', '789 Huỳnh Thúc Kháng, Phường Bến Nghé, Quận 1, TP.HCM'),
	('4e192dacb208ceb2413376e2ad3b3db8', '1975-01-09', '321 Phạm Ngũ Lão, Phường Phạm Ngũ Lão, Quận 1, TP.HCM'),
	('6cb9c7dba65dd3d9e1946c5dd265dbcd', '1993-06-12', '654 Nguyễn Công Trứ, Phường Nguyễn Cư Trinh, Quận 1, TP.HCM'),
	('45b76de8eb0fd35e124955a2ff2473db', '1989-10-27', '987 Nguyễn Du, Phường Bến Thành, Quận 1, TP.HCM'),
	('ea03ec90c8836f413784ee96e50a4f11', '1996-05-02', '147 Hồ Tùng Mậu, Phường Bến Nghé, Quận 1, TP.HCM'),
	('bc6c32dbbb8bd0660d158b08d7cad96f', '1983-08-14', '258 Lê Thánh Tôn, Phường Bến Nghé, Quận 1, TP.HCM'),
	('7e55fcb3a457634cfa78b49bdb774b3a', '1979-12-19', '369 Lê Thị Riêng, Phường Bến Thành, Quận 1, TP.HCM'),
	('d8869200b4fbde66a3475d6e730e1b6d', '1991-03-23', '753 Công Trường Mê Linh, Phường Bến Nghé, Quận 1, TP.HCM'),
	('128ce6812392dce1ca5a6919f03a26a2', '1986-09-05', '753 Đề Thám, Phường 1, Quận 5, TP.HCM'),
	('87ccfc84f4eb846b5aeb0e04f6ea12ea', '1994-02-18', '951 Trần Phú, Phường 2, Quận 5, TP.HCM'),
	('715c43d86b98da2212d7a9c9ce9d3062', '1977-07-31', '369 Nguyễn Chí Thanh, Phường 9, Quận 5, TP.HCM'),
	('a69b4087d281cb16efaa6bc91308f64d', '1999-11-11', '654 Hậu Giang, Phường 12, Quận 6, TP.HCM'),
	('61dd2b9c89fdcc1dce9fb553bf29cd8d', '1984-04-26', '987 An Dương Vương, Phường 16, Quận 6, TP.HCM'),
	('03b016eef369ef40bba639aa4f04341b', '1997-01-07', '123 Võ Văn Kiệt, Phường Cầu Ông Lãnh, Quận 8, TP.HCM'),
	('f8b0ed4e38a71924a7d2bca97029778a', '1981-06-16', '456 Lê Đại Hành, Phường 15, Quận 8, TP.HCM'),
	('5cbae581d99c1c3d17b8c09b07c54892', '1976-11-29', '789 Phạm Hùng, Phường 14, Quận 8, TP.HCM'),
	('20e843f249d75ada67c1a2eef0dac92e', '1992-03-03', '321 Tỉnh Lộ 10, Phường Bình Hưng Hòa, Quận 8, TP.HCM'),
	('712da4f1096f6ae70d0f3c091b84ae7c', '1988-08-08', '123/4 Nguyễn Văn A, Phường Bến Nghé, Quận 1, TP.HCM'),
	('b03c6f5a51ee06d3dbd17d0e38507ede', '1995-12-13', '456/7 Lê Lợi, Phường Bến Nghé, Quận 1, TP.HCM'),
	('b83bb75b898592b75232c4816842d824', '1980-05-25', '987/6 Nguyễn Huệ, Phường Bến Nghé, Quận 1, TP.HCM'),
	('a68757602ea7419f0e2313a842be9abf', '1993-10-09', '753/1 Trần Quang Khải, Phường Tân Định, Quận 1, TP.HCM'),
	('2b1850783245c06d0b782a4c9cd6a0a0', '1987-02-22', '147/9 Lý Tự Trọng, Phường Bến Thành, Quận 1, TP.HCM'),
	('eb70ed9c4c32afea8f482dc873be4f6a', '1999-07-05' , '5 Trần Khắc Chân, Phường Tân Định, Quận 1, TP.HCM');

INSERT INTO Speciality (specialityID, specialityName)
VALUES
    ('e6157a31d2c5e20dc446f4f42fc0d40f', 'Đa khoa'),
    ('52f6743e4719de9a35e1e2e1c09d6d52', 'phẫu thuật'),
    ('8c15dfb7f4f3d4789ed0c043b1512e34', 'hồi sức cấp cứu'),
    ('4a30b3f33f96b639ab20dce9f0b8b8db', 'chẩn đoán hình ảnh'),
    ('7e2dc1364e2e1bdc9efc1669a17a9e45', 'làm đẹp'),
	('bfiwafjnbeaffaiuwhfa9fhawfa56565', 'di truyền học');
	
INSERT INTO Doctor (doctorID,specialityID, docAge, academicTitle,degree,yearsOfExperience)
VALUES
	('ae114dac5897fbcfd25797bf4be08fd3', 'e6157a31d2c5e20dc446f4f42fc0d40f', 35,'','',10),
	('9eae70b054be6eba305323d8c9106cfb', 'e6157a31d2c5e20dc446f4f42fc0d40f', 37,'','thạc sĩ',12),
	('c8aa14ffb7da0912c84635aa2ee0bb62', '52f6743e4719de9a35e1e2e1c09d6d52', 50,'giáo sư','tiến sĩ',25),
	('dd0e3f50648088bfecc501f809a06ca8' , '4a30b3f33f96b639ab20dce9f0b8b8db' , 30 , '' , '' , 5 ),
	('62fe46dae9470f311d52973a6eeb6a1a' , '4a30b3f33f96b639ab20dce9f0b8b8db' , 35 , '' , '' , 10 ),
	('9c6189a20beb35a93df963e3b48eb9b0' , '7e2dc1364e2e1bdc9efc1669a17a9e45' , 40 , '' , 'thạc sĩ' , 15 ),
	('1c38dd30f9e415b3a34879be077381ce' , '8c15dfb7f4f3d4789ed0c043b1512e34' , 45 , 'phó giáo sư' , 'thạc sĩ' , 20 ),
	('21fc9daf44e2637d7972bd248c83577d' , 'e6157a31d2c5e20dc446f4f42fc0d40f' , 50 , 'phó giáo sư' , 'thạc sĩ' , 25 ),
	('01c1fa1b81297a2de21056f35303ad84' , '52f6743e4719de9a35e1e2e1c09d6d52' , 55 , 'giáo sư' , 'tiến sĩ' , 30 ),
	('fe30e1ff175e10b1c538613084ab2417' , '52f6743e4719de9a35e1e2e1c09d6d52' , 46 , '' , 'tiến sĩ' , 19 );
	
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
    -- Saturday
    SELECT 'ae114dac5897fbcfd25797bf4be08fd3' AS doctorID, timeSlotID, ROW_NUMBER() OVER (ORDER BY timeSlotID) AS row_num
    FROM TimeSlot
    WHERE day_ = 'Saturday'
) AS subquery
WHERE row_num <= 8
UNION ALL
SELECT doctorID, timeSlotID
FROM
(
    -- Sunday
    SELECT 'ae114dac5897fbcfd25797bf4be08fd3' AS doctorID, timeSlotID, ROW_NUMBER() OVER (ORDER BY timeSlotID) AS row_num
    FROM TimeSlot
    WHERE day_ = 'Sunday'
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
    -- Sunday
    SELECT '9eae70b054be6eba305323d8c9106cfb' AS doctorID, timeSlotID, ROW_NUMBER() OVER (ORDER BY timeSlotID) AS row_num
    FROM TimeSlot
    WHERE day_ = 'Sunday'
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
(
    -- Tuesday
    SELECT 'c8aa14ffb7da0912c84635aa2ee0bb62' AS doctorID, timeSlotID, ROW_NUMBER() OVER (ORDER BY timeSlotID) AS row_num
    FROM TimeSlot
    WHERE day_ = 'Tuesday'
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
    -- Sunday
    SELECT 'c8aa14ffb7da0912c84635aa2ee0bb62' AS doctorID, timeSlotID, ROW_NUMBER() OVER (ORDER BY timeSlotID) AS row_num
    FROM TimeSlot
    WHERE day_ = 'Sunday'
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
    -- Friday
    SELECT 'dd0e3f50648088bfecc501f809a06ca8' AS doctorID, timeSlotID, ROW_NUMBER() OVER (ORDER BY timeSlotID) AS row_num
    FROM TimeSlot
    WHERE day_ = 'Friday'
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
    -- Sunday
    SELECT 'dd0e3f50648088bfecc501f809a06ca8' AS doctorID, timeSlotID, ROW_NUMBER() OVER (ORDER BY timeSlotID) AS row_num
    FROM TimeSlot
    WHERE day_ = 'Sunday'
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
(    -- Wednesday
    SELECT '9c6189a20beb35a93df963e3b48eb9b0' AS doctorID, timeSlotID, ROW_NUMBER() OVER (ORDER BY timeSlotID) AS row_num
    FROM TimeSlot
    WHERE day_ = 'Wednesday'
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
    -- Sunday
    SELECT '1c38dd30f9e415b3a34879be077381ce' AS doctorID, timeSlotID, ROW_NUMBER() OVER (ORDER BY timeSlotID) AS row_num
    FROM TimeSlot
    WHERE day_ = 'Sunday'
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
(    -- Wednesday
    SELECT '21fc9daf44e2637d7972bd248c83577d' AS doctorID, timeSlotID, ROW_NUMBER() OVER (ORDER BY timeSlotID) AS row_num
    FROM TimeSlot
    WHERE day_ = 'Wednesday'
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
    -- Sunday
    SELECT 'fe30e1ff175e10b1c538613084ab2417' AS doctorID, timeSlotID, ROW_NUMBER() OVER (ORDER BY timeSlotID) AS row_num
    FROM TimeSlot
    WHERE day_ = 'Sunday'
) AS subquery
WHERE row_num <= 8;

INSERT INTO Medicine (medicineID,medicineName,medicinePrice)
VALUES
	('1a27a82eb264532c271baf05c7a6e10d','Penicillin','53.01'),
	('c93c634859e543a562441ca36f9bd9f0','AMTYL','18.99'),
	('d0141bd1067e2f534fd908b54a72a1ff','Aureomycin','16.35'),
	('c69f4b52c792233f31e11393012e5e19','Antibiotics','42.67'),
	('5f7fb0d98491f5efdf52623a7d4839aa','Enrofloxacin','16.69'),
	('8e89704ade7f8e48da32ce2d6bb15054','Coccivet','23.55'),
	('7c7f0e401b7926cb956e1e798e7d6664','Aureomycin','16.35'),
	('2b1937a02cb1cc8255ecfeb8dc38c5d2','Cough','14.99'),
	('589ff60828e99f431d7f07d8ef62baff','4 in 1 Powder Generic','27.00'),
	('f9a7dfe69faaaf1f0c2dc348c0254d50','Medistatin','21.73'),
	('e365252333bf5bd19b86b828e64b0eb0','Psittavet','15.99'),
	('9dc94408c0e9b062a5cdd03830011d72','Ronidazole','10.49'),
	('7c6164ddf235787f5d1e2d8f4540c838','Ronivet-S','30.95'),
	('124b0999a2e3a37b30f8b4d4196d5666','SCATT','28.00'),
	('5587ecc8c67f1ba9f77488eedc2d1164','Spectovet Powder','45.95'),
	('9e9af1d637a369cdaf6bac028b8bd813','Terramycin Ointment','14.95'),
	('9faeec1795e05223ab80bf4d06971616','Tetrasol','13.95'),
	('976f58180ccfd7c80f492b1665fd003a','Triple C','28.00');

INSERT INTO Service_ (serviceID,specialityID,serviceName,servicePrice)
VALUES
	('f8c17d469d7dfd4fa84eae659923536b','e6157a31d2c5e20dc446f4f42fc0d40f','Khám và kiểm tra sức khỏe',100.00),
	('c739c1e62319f52411908f874c0698bf','e6157a31d2c5e20dc446f4f42fc0d40f','kiểm tra chẩn đoán',101.00),
	('a074614583162a3d58b89c13699d70a1','52f6743e4719de9a35e1e2e1c09d6d52','phẫu thuật',102.00),
	('cd9bfc9d6bb22a47f6dcdc2a5c99b2fd','e6157a31d2c5e20dc446f4f42fc0d40f','lời khuyên và tư vấn dinh dưỡng',103.00),
	('744722e0fb1eb8e7f4fc5c4682159800','e6157a31d2c5e20dc446f4f42fc0d40f','dịch vụ nội trú',104.00),
	('84fbf5e32cfdb21cf48721cf849b0c20','8c15dfb7f4f3d4789ed0c043b1512e34','Chăm sóc khẩn cấp và hỗ trợ ngoài giờ',105.00),
	('517d8993ec9bcdb8c33fc50ea7ec5da8','52f6743e4719de9a35e1e2e1c09d6d52','Dịch vụ vi mạch và nhận dạng',106.00),
	('291129122c3e6bbbd76a76b428f2809a','4a30b3f33f96b639ab20dce9f0b8b8db','Nội soi và chụp X-quang',107.00),
	('52b7bedca394c621f40a99d03a564341','7e2dc1364e2e1bdc9efc1669a17a9e45','Dịch vụ chăm sóc gia cầm',108.00),
	('e41d8b0c31b65cc94f5eb4bbb7b76907','bfiwafjnbeaffaiuwhfa9fhawfa56565','Giới tính DNA và xét nghiệm bệnh tật',109.00),
	('507e4c66da1ccd4fcf621069065494bc','e6157a31d2c5e20dc446f4f42fc0d40f','Chích vaccine',110.00);

INSERT INTO Bird(birdID, customerID,imageID, birdFullname, birdGender, breed, band_chip, birdWeight, sexingMethod, medicalHistory, hatchingDate, featherColor)
VALUES
	('2bbb77362ead86434fd59f94b282eae1' , '2c9320b8639fc9e1c784880bbecfdfa1' , 'fafnbuhfauhfweoufha8hfa9hfa48hf8', 'cảm cúm' ,'male','Apodidae', 'qưerty', 0.02,'Quan sát hình dáng và màu sắc', '', '2019-01-01', 'đen'),
	('507c2afab061a1c2cf1dee7142e557be' , '3ff56e23cc31e9c9a85bc037341a65ee' , 'avewifbaiuwefnwajenfhiuahenf998f', 'Bệnh viêm tuyến nhờn' ,'','Phasianidae', 'wertyu', 0.02, 'Kiểm tra hành vi', '', '2019-02-01', 'lam-lục'),
	('15d35bb9396992d02127345380e38d73' , '3ff5njfnijhfdsf8845bc037341a65ee' , 'fewabf9qb439fufh9h438q9h34fq34t4', '' ,'female','Én', 'ertyui', 0.03, 'Quan sát hình dáng và màu sắc', '', '2019-03-01', 'đen'),
	('e9e0f3bcddc65940e089972ce4088e59' , '82d5cf38dc655bd1722ac5d4d350bce3' , 'frheafiuewhf9hf983h3f4ha438f94f4', 'Bệnh cầu trùng' , 'rtyuio' , 'Phasianidae' , 'no' , 0.02 , 'Kiểm tra hành vi' , '' , '2019-04-01' , 'vàng-đỏ-lam'),
	('2e4076dd7f277dc8f29b4cdb922052c0' , '1c4f04058f291642c159e27e1554ddf8' , '4rt43t5y56y465t4r3e24r435y65u76i', '' , 'male' , 'Sẻ', 'tyuiop' , 0.02 , 'Quan sát hình dáng và màu sắc' , '' , '2019-05-01' , 'nâu'),
	('27009754484e5b64300b05706c954565' , 'c0637bb4f3d7531d936f2686b9672a66' , 'efrgtrytuiykjhmngfbvdfewr4567898', 'Bệnh tiêu chảy' , 'yuiopa' , 'Finches', 'no' , 0.2 , 'Kiểm tra hành vi' , '' , '2019-06-01' , 'đỏ'),
	('49f34170b6590fea6bce454059764c12' , '11eee90acf45377f4cc3ca0758f2bf30' , '48c967910f7eb39ea5f7b7602a3df9ea', '' , 'male' , 'Ciconiidae', 'uiopas' , 15 , 'Kiểm tra vùng sinh sản' , '' , '2019-07-01' , 'trắng-đen'),
	('2e9d61c3330f9e10e3a0bc3fb8a4b4a2' , '48b31829bc7599f232d06a1e686534bd' , '3b94ace86063b245916a6e906221e6a8', 'Bệnh cảm cúm' , 'female' , 'Canidae', 'iopasd' , 3 , 'Kiểm tra vùng sinh sản' , '' , '2019-08-01' , 'vàng-trắng'),
	('e939af928268bda5f11f7bf215d452eb' , '4e192dacb208ceb2413376e2ad3b3db8' , '249fb9cb11171ae6ab41794bee070a8f', '' , 'male' , 'Vẹt', 'opasdf' , 0.2 , 'Quan sát hình dáng và màu sắc' , '' , '2019-09-01' , 'lục-vàng-đen'),
	('43e02d9e3ce088b73229155e462e32d9' , '6cb9c7dba65dd3d9e1946c5dd265dbcd' , 'b3b9752ec51a5433b44e27b8d9b81c76', 'Bệnh cảm cúm' , 'female' , 'Bồ câu', 'pasdfg' , 0.4 , 'Phân tích ADN' , '' , '2019-10-01' , 'xám'),
	('00c38b52d5cdedc2667af4a83e346a85' , '45b76de8eb0fd35e124955a2ff2473db' , 'ee38603c9cfdb54fb0a0ab4a197f92a3', '' , 'male' , 'Vẹt', 'asdfgh' , 0.02 , 'Kiểm tra hành vi' , '' , '2019-11-01' , 'đỏ-lam-vàng'),
	('1587900aee161437134c2e2479de5b64' , 'ea03ec90c8836f413784ee96e50a4f11' , 'ef94fe9d57eed266b24c3fc1203c1e17', 'Bệnh viêm tuyến nhờn' , 'female' , 'Sẻ thông', 'sdfghj' , 0.02 , 'Phân tích ADN' , '' , '2019-12-01' , 'vàng'),
	('277dd0cf43f2cc494be796373fd7bf2b' , 'bc6c32dbbb8bd0660d158b08d7cad96f' , 'a8cf052632950deb5ab9c1f5ec36334d', 'Bệnh cảm cúm' , 'male' , 'Muscicapidae', 'dfghjk' , 0.03 , 'Kiểm tra vùng sinh sản' , '' , '2020-01-01' , 'đen-nâu'),
	('08605ccab7ad051603412533c59e46c7' , '7e55fcb3a457634cfa78b49bdb774b3a' , '7b1bc65da7abbaceaaadc0ea9564c175', '' , 'female' , 'Chào mào', 'fghjkl' , 0.05 , 'Quan sát hình dáng và màu sắc' , '' , '2020-02-01' , 'trắng-nâu'),
	('acdbf948aa576959e791abe5ec2f124d' , 'd8869200b4fbde66a3475d6e730e1b6d' , '95f7e5a8c051e6b60905912bd8aedf7d', '' , 'male' , 'Đớp ruồi', 'ghjklz' , 0.03 , 'Kiểm tra hành vi' , '' , '2020-03-01' , 'xám-trắng-đỏ'),
	('4b4c133439471c8d694b5c3e47edb446' , '128ce6812392dce1ca5a6919f03a26a2' , '365c43bd856cf86e0e0b4cd4b7bc0462', 'Bệnh cầu trùng' , 'female' , 'Sẻ', 'hjklzx' , 0.03 , 'Quan sát hình dáng và màu sắc' , '' , '2020-04-01' , 'trắng-đen-xám'),
	('0d0dd3c14756ae8316e7054b205896c9' , '87ccfc84f4eb846b5aeb0e04f6ea12ea' , 'b51f1bb2e54d243e60e32563b2b1a7ed', '' , 'female' , 'Chiền chiện', 'jklzxc' , 0.03 , 'Phân tích ADN' , '' , '2020-05-01' , 'vàng-đen'),
	('861c51821e55ecad053b072323fac994' , '715c43d86b98da2212d7a9c9ce9d3062' , '08eed66a05827e8dc02d6ff1392f9bf6', '' , 'female' , 'Diệc', 'klzxcv' , 0.2 , 'Phân tích ADN' , '' , '2020-06-01' , 'đen'),
	('380965fe9f1584559ea8a90b9c8d680c' , 'a69b4087d281cb16efaa6bc91308f64d' , 'ddfff0e1f9009fe5d621e2ed07348a51', 'Bệnh cầu trùng' , 'female' , 'Cu cu', 'lzxcvb' , 0.08 , 'Kiểm tra vùng sinh sản' , '' , '2020-07-01' , 'xám'),
	('17787dd14e0fda883a36016cada64123' , '61dd2b9c89fdcc1dce9fb553bf29cd8d' , 'cbe26c3a3f34407ed023e3f02399d2fa', '' , 'male' , 'Nhạn', 'zxcvbn' , 0.5 , 'Quan sát hình dáng và màu sắc' , '' , '2020-08-01' , 'đen'),
	('d5ea83ec7f100a6803bd39e14c619299' , '03b016eef369ef40bba639aa4f04341b' , '05b5b4345d8ac2f73ece3df15be03230', 'Bệnh cầu trùng' , 'female' , 'Kim oanh', 'xcvbnm' , 0.1 , 'Phân tích ADN' , '' , '2020-09-01' , 'nâu đất'),
	('25c448b0241244364f7653f08cb8aff6' , 'f8b0ed4e38a71924a7d2bca97029778a' , '2bda592b2aada870747dd4366a3dff18', '' , 'male' , 'Nhạn', 'cvbnmq' , 3 , 'Kiểm tra hành vi' , '' , '2020-10-01' , 'trắng'),
	('bc0b9fe1f4df72fa1289f4437e6a3953' , '5cbae581d99c1c3d17b8c09b07c54892' , 'e28e1458f599f2391b91bfd61338483e', '' , 'male' , 'Cu cu', 'vbnmqw' , 0.08 , 'Quan sát hình dáng và màu sắc' , '' , '2020-11-01' , 'đen-cam'),
	('43aaf0240284fd15416b429bed0ef321' , '20e843f249d75ada67c1a2eef0dac92e' , '84cb52eda2e4f0b66f8509c37e857e8c', '' , 'female' , 'Sáo', 'bnmqwe' , 0.015 , 'Phân tích ADN' , '' , '2020-12-01' , 'đen'),
	('ca8406790940dec227193cc7dca16212' , '712da4f1096f6ae70d0f3c091b84ae7c' , '8721d5a5f3f44bd01529d24dcf519239', 'Bệnh cầu trùng' , 'male' , 'Chìa vôi', 'nmqwer' , 0.04 , 'Phân tích ADN' , '' , '2021-01-01' , 'đen-trắng'),
	('752ee3ce65129a7bd54292accb28983e' , 'b03c6f5a51ee06d3dbd17d0e38507ede' , '66a5473e01debb47bff7f215d6c4a228', '' , 'male' , 'Cắt', 'mqwert' , 0.15 , 'Phân tích ADN' , '' , '2021-02-01' , 'nâu'),
	('c91f8b119029caa4ec2046bcc5c69bb5' , 'b83bb75b898592b75232c4816842d824' , '6d47ad177fb45c2d87e1b54fc363676b', 'Bệnh viêm tuyến nhờn' , 'female' , 'Đớp ruồi', 'mnbvcx' , 0.05 , 'Quan sát hình dáng và màu sắc' , '' , '2021-03-01' , 'lam-vàng'),
	('16c5bd4d79c66e16042bee6bbf128c6f' , 'a68757602ea7419f0e2313a842be9abf' , '25abf9603856427e295b7bd1137fd04a', '' , 'male' , 'Vịt', 'nbvcxz' , 6 , 'Phân tích ADN' , '' , '2021-04-01' , 'đen'),
	('56a7207dd933fe09f539083edb711548' , '2b1850783245c06d0b782a4c9cd6a0a0' , 'ed1ed3634186fc66ee692da3ba98272f', 'Bệnh cầu trùng' , 'male' , 'sơn ca', 'bvcxzl' , 0.01 , 'Phân tích ADN' , '' , '2021-05-01' , 'trắng-đen-vàng-đỏ'),
	('6a045cdabdccb76073091f263cbf3e52' , 'eb70ed9c4c32afea8f482dc873be4f6a' , 'e47ccaddaa9e2cd4c25e84cae624b077', '' , 'female' , 'Vàng Anh', 'vcxzlk' , 0.04 , 'Kiểm tra hành vi' , '' , '2021-06-01' , 'vàng-đen');

INSERT INTO Appointment(appointmentID, birdID, doctorID, timeSlotID, serviceID, appTime, notes, payment, appStatus)
VALUES
	('a6a837e5d05e57e160dea29c335f30d0' , '2bbb77362ead86434fd59f94b282eae1', 'ae114dac5897fbcfd25797bf4be08fd3', '7274b557467ff107537ffe6f642cde39' , 'f8c17d469d7dfd4fa84eae659923536b' , GETDATE() , '', 'banking account', 'complete'),
	('95b579fe61c622b5c50def9dccb66bdc' , '507c2afab061a1c2cf1dee7142e557be', '9eae70b054be6eba305323d8c9106cfb', 'a54060a06aa0e97217726362a5b580d3' , 'c739c1e62319f52411908f874c0698bf' , GETDATE() , '',  'banking account', 'complete'),
	('86ae960dc44eba248c481d76520846c3' , '15d35bb9396992d02127345380e38d73', 'c8aa14ffb7da0912c84635aa2ee0bb62', 'e2283b7f6695530a79793e3fe172155c'  , 'a074614583162a3d58b89c13699d70a1' , GETDATE() , '',  'cash', 'complete'),
	('801b58e3d0b00f7f9f9eac80058f99f0' , 'e9e0f3bcddc65940e089972ce4088e59' , 'dd0e3f50648088bfecc501f809a06ca8', '4e4b39473c2dfc3e918ee79b1c28fc6f' , 'cd9bfc9d6bb22a47f6dcdc2a5c99b2fd' , GETDATE() , '' , 'banking account' , 'complete'),
	('ca768c1b1876a2f286496e62666dfada' , '2e4076dd7f277dc8f29b4cdb922052c0' , '62fe46dae9470f311d52973a6eeb6a1a', '0f34a633c6767c1e46e90dad2700ce76' , '744722e0fb1eb8e7f4fc5c4682159800' , GETDATE() , '' , 'banking account' , 'check-in'),
	('0a7a30124b6b4f266459a6b69677152c' , '27009754484e5b64300b05706c954565' , '9c6189a20beb35a93df963e3b48eb9b0', '6ba12b34e7c18eff6380f8b22ae6211e' , '84fbf5e32cfdb21cf48721cf849b0c20' , GETDATE() , '' , 'banking account' , 'complete'),
	('ebcf025d47ee19d929f6707029df09d0' , '49f34170b6590fea6bce454059764c12' , '1c38dd30f9e415b3a34879be077381ce', '1468c48caf3c8acd45c13732fa1c7797' , '517d8993ec9bcdb8c33fc50ea7ec5da8' , GETDATE() , '' , 'banking account' , 'complete'),
	('b7e4621ca7d7273ea67ba0b40992d189' , '2e9d61c3330f9e10e3a0bc3fb8a4b4a2' , '21fc9daf44e2637d7972bd248c83577d', '5c9ba69a58918129f033a2c25e250584' , '291129122c3e6bbbd76a76b428f2809a' , GETDATE() , '' , 'cash' , 'complete'),
	('35847b5a3a8de7e0af06281b1d889bcf' , 'e939af928268bda5f11f7bf215d452eb' , '01c1fa1b81297a2de21056f35303ad84', '0d5408947d23dd60557de6b616352275' , '52b7bedca394c621f40a99d03a564341' , GETDATE() , '' , 'banking account' , 'confirm'),
	('ca05b981160139795fbf616bfd5d491b' , '43e02d9e3ce088b73229155e462e32d9' , 'fe30e1ff175e10b1c538613084ab2417', '3deb11e87f2a937320bc503ceff3bda0' , 'e41d8b0c31b65cc94f5eb4bbb7b76907' , GETDATE() , '' , 'cash' , 'complete'),
	('3967200752865b1bb65a63f386925d14' , '00c38b52d5cdedc2667af4a83e346a85' , 'ae114dac5897fbcfd25797bf4be08fd3', '657be9bfb1eed80938b24e3b154863cb' , '507e4c66da1ccd4fcf621069065494bc' , GETDATE() , '' , 'banking account' , 'cancelled'),
	('943b4c67a61164d245ea5af7f3848a37' , '1587900aee161437134c2e2479de5b64' , '9eae70b054be6eba305323d8c9106cfb', '7b84cc4412f9e9a4213a9f979be42063' , 'f8c17d469d7dfd4fa84eae659923536b' , GETDATE() , '' , 'banking account' , 'confirm'),
	('040c93cff9c0cc5cd6d008fb02e17b69' , '277dd0cf43f2cc494be796373fd7bf2b' , 'c8aa14ffb7da0912c84635aa2ee0bb62', 'b57c1f7068f9c8220f290b95b7183fc9' , 'c739c1e62319f52411908f874c0698bf' , GETDATE() , '' , 'cash' , 'confirm'),
	('3841cd8942a581d2092ff1d3739fcebc' , '08605ccab7ad051603412533c59e46c7' , 'dd0e3f50648088bfecc501f809a06ca8', 'c397d73df0a2ad5dcb930bd8d26cc2f6' , 'a074614583162a3d58b89c13699d70a1' , GETDATE() , '' , 'banking account' , 'confirm'),
	('4a160bb951e81bb14485ab90391d0c58' , 'acdbf948aa576959e791abe5ec2f124d' , '62fe46dae9470f311d52973a6eeb6a1a', 'b312f680c0e4eac9c2a3bd9bf2260267' , 'cd9bfc9d6bb22a47f6dcdc2a5c99b2fd' , GETDATE() , '' , 'banking account' , 'check-in'),
	('0bb8e03d00ecc7642c5142de8f12a335' , '4b4c133439471c8d694b5c3e47edb446' , '9c6189a20beb35a93df963e3b48eb9b0', '58ceaa7c941c896dcea4d42bbd40b463' , '744722e0fb1eb8e7f4fc5c4682159800' , GETDATE() , '' , 'banking account' , 'cancelled'),
	('aeed52468a0d9880fa013c611816e897' , '0d0dd3c14756ae8316e7054b205896c9' , '1c38dd30f9e415b3a34879be077381ce', 'b798d08ebebbcabf9315bcef98e8263b' , '84fbf5e32cfdb21cf48721cf849b0c20' , GETDATE() , '' , 'cash' , 'confirm'),
	('cde92de8a056398e6a281dba87bdffb1' , '861c51821e55ecad053b072323fac994' , '21fc9daf44e2637d7972bd248c83577d', '9436e53cce52225010e09858fc287123' , '517d8993ec9bcdb8c33fc50ea7ec5da8' , GETDATE() , '' , 'banking account' , 'processing'),
	('6c3b331b0cde4d503944f2f16f979c93' , '380965fe9f1584559ea8a90b9c8d680c' , '01c1fa1b81297a2de21056f35303ad84', 'c789ff5a8a615b3cbd55b12d431c1a51' , '291129122c3e6bbbd76a76b428f2809a' , GETDATE() , '' , 'cash' , 'confirm'),
	('b6b447b56dbe005a626c4b5e3fdb97be' , '17787dd14e0fda883a36016cada64123' , 'fe30e1ff175e10b1c538613084ab2417', '0227321c75909512447393796f173788' , '52b7bedca394c621f40a99d03a564341' , GETDATE() , '' , 'banking account' , 'confirm'),
	('a61de36f81c0f699a8653863ea9e3d2f' , 'd5ea83ec7f100a6803bd39e14c619299' , 'ae114dac5897fbcfd25797bf4be08fd3', '86fc882bb1aadc489464a8ecb5f43a30' , 'e41d8b0c31b65cc94f5eb4bbb7b76907' , GETDATE() , '' , 'cash' , 'confirm'),
	('47b601885ddc891de11eb62451a97b43' , '25c448b0241244364f7653f08cb8aff6' , '9eae70b054be6eba305323d8c9106cfb', 'b82fece225c99d7b1faa427866745620' , '507e4c66da1ccd4fcf621069065494bc' , GETDATE() , '' , 'banking account' , 'check-in'),
	('2f7294ec43136a43ca696ad6f06e1635' , 'bc0b9fe1f4df72fa1289f4437e6a3953' , 'c8aa14ffb7da0912c84635aa2ee0bb62', '3e895d7bd28f3f7687197d2dd2c5558e' , 'f8c17d469d7dfd4fa84eae659923536b' , GETDATE() , '' , 'cash' , 'processing'),
	('090f345a844fedfb9ca86ff69b59d969' , '43aaf0240284fd15416b429bed0ef321' , 'dd0e3f50648088bfecc501f809a06ca8', '0b0ac0d3db2f67dd2626c726e51b0612' , 'c739c1e62319f52411908f874c0698bf' , GETDATE() , '' , 'cash' , 'processing'),
	('d2601ee48263e69982e4dbd809c0358a' , 'ca8406790940dec227193cc7dca16212' , '62fe46dae9470f311d52973a6eeb6a1a', '0f6c341110df21c899097b659454e1ab' , 'a074614583162a3d58b89c13699d70a1' , GETDATE() , '' , 'banking account' , 'check-in'),
	('e221bebf131b7773da0045982e018fba' , '752ee3ce65129a7bd54292accb28983e' , '9c6189a20beb35a93df963e3b48eb9b0', '71071e13d9c8cd2902737b7e39f32a5a' , 'cd9bfc9d6bb22a47f6dcdc2a5c99b2fd' , GETDATE() , '' , 'cash' , 'processing'),
	('85c10fd22fe836139fd76fbaee831673' , 'c91f8b119029caa4ec2046bcc5c69bb5' , '1c38dd30f9e415b3a34879be077381ce', '3cd774fd522ed4a7b81dc2e3ed0373bd' , '744722e0fb1eb8e7f4fc5c4682159800' , GETDATE() , '' , 'banking account' , 'processing'),
	('7caa694dda6e1cf8c0993cf301c84bba' , '16c5bd4d79c66e16042bee6bbf128c6f' , '21fc9daf44e2637d7972bd248c83577d', '516ab8138f50bbbb0be18ceed38b6ad3' , '84fbf5e32cfdb21cf48721cf849b0c20' , GETDATE() , '' , 'banking account' , 'processing'),
	('b7ad6a62013acd21497265b6f7ff74eb' , '56a7207dd933fe09f539083edb711548' , '01c1fa1b81297a2de21056f35303ad84', '9eea7e14fbd37b455d69e7114399aa0a' , '517d8993ec9bcdb8c33fc50ea7ec5da8' , GETDATE() , '' , 'banking account' , 'processing'),
	('3427f117121dd0789b94a37ef63b64dc' , '6a045cdabdccb76073091f263cbf3e52' , 'fe30e1ff175e10b1c538613084ab2417', '4db7ce38baceaddfc93e9bdcfe0a7f57' , '291129122c3e6bbbd76a76b428f2809a' , GETDATE() , '' , 'banking account' , 'processing');

INSERT INTO MedicalRecord (medicalRecordID, birdID, doctorID, appointmentID, recordTime, diagnosis)
VALUES
	('3b153a85daab45c693cdd0e1f02631c9' , '2bbb77362ead86434fd59f94b282eae1' , 'ae114dac5897fbcfd25797bf4be08fd3' , 'a6a837e5d05e57e160dea29c335f30d0', GETDATE(), 'không phát hiện bất thường'),
	('87599195136fd0440b341eed32d36c84' , '507c2afab061a1c2cf1dee7142e557be' , '9eae70b054be6eba305323d8c9106cfb' , '95b579fe61c622b5c50def9dccb66bdc', GETDATE(), 'Thiếu hụt dinh dưỡng'),
	('4d0ac1b5e6f8e2e4ee256c4c2031b1d2' , '15d35bb9396992d02127345380e38d73' , 'c8aa14ffb7da0912c84635aa2ee0bb62' , '86ae960dc44eba248c481d76520846c3', GETDATE(), 'chấn thương chân'),
	('b356f8672801e4820bd72b17dbda7764' , 'e9e0f3bcddc65940e089972ce4088e59' , 'dd0e3f50648088bfecc501f809a06ca8' , '801b58e3d0b00f7f9f9eac80058f99f0' , GETDATE() , 'thiếu vitamin A' ),
	('a0540a74c856251ad819d931fee6b078' , '2e4076dd7f277dc8f29b4cdb922052c0' , '62fe46dae9470f311d52973a6eeb6a1a' , 'ca768c1b1876a2f286496e62666dfada' , GETDATE() , 'nội trú'),
	('32fe2542e25434a1acde0f6edff2f0b4' , '27009754484e5b64300b05706c954565' , '9c6189a20beb35a93df963e3b48eb9b0' , '0a7a30124b6b4f266459a6b69677152c' , GETDATE() , 'gãy cánh' ),
	('2f6c8e2ec915f490a91c6c7e888126f6' , '49f34170b6590fea6bce454059764c12' , '1c38dd30f9e415b3a34879be077381ce' , 'ebcf025d47ee19d929f6707029df09d0' , GETDATE() , 'gắn chip' ),
	('21def0e373e1e8d57d1ab5f339726167' , '2e9d61c3330f9e10e3a0bc3fb8a4b4a2' , '21fc9daf44e2637d7972bd248c83577d' , 'b7e4621ca7d7273ea67ba0b40992d189' , GETDATE() , 'dị vật trong dạ dày' ),
	('ff398a2c8cdd28c7c9e31446c0e2a629' , 'e939af928268bda5f11f7bf215d452eb' , '01c1fa1b81297a2de21056f35303ad84' , '35847b5a3a8de7e0af06281b1d889bcf' , GETDATE() , 'chăm sóc' ),
	('753906196d6e7bdd8f8d874efaacfa8d' , '43e02d9e3ce088b73229155e462e32d9' , 'fe30e1ff175e10b1c538613084ab2417' , 'ca05b981160139795fbf616bfd5d491b' , GETDATE() , 'xác định giới tính' ),
	('9a590d8f7d706608bc3081a042d2e0dc' , '00c38b52d5cdedc2667af4a83e346a85' , 'ae114dac5897fbcfd25797bf4be08fd3' , '3967200752865b1bb65a63f386925d14' , GETDATE() , 'chích vaccine' ),
	('4aa48bfce29088db4424a1b921e2be55' , '1587900aee161437134c2e2479de5b64' , '9eae70b054be6eba305323d8c9106cfb' , '943b4c67a61164d245ea5af7f3848a37' , GETDATE() , 'Bệnh cảm cúm' ),
	('154aa8864b0445239a1c8cf636ce8164' , '277dd0cf43f2cc494be796373fd7bf2b' , 'c8aa14ffb7da0912c84635aa2ee0bb62' , '040c93cff9c0cc5cd6d008fb02e17b69' , GETDATE() , 'Bệnh cầu trùng' ),
	('b72e56f3705781fdfaa652dabbefd8b4' , '08605ccab7ad051603412533c59e46c7' , 'dd0e3f50648088bfecc501f809a06ca8' , '3841cd8942a581d2092ff1d3739fcebc' , GETDATE() , 'chấn thương phần đầu' ),
	('96f71fd09596eeda17b234c2a87b783f' , 'acdbf948aa576959e791abe5ec2f124d' , '62fe46dae9470f311d52973a6eeb6a1a' , '4a160bb951e81bb14485ab90391d0c58' , GETDATE() , 'thiếu vitamin D' ),
	('c26b9ff4973daa21f4ec2fa61207639f' , '4b4c133439471c8d694b5c3e47edb446' , '9c6189a20beb35a93df963e3b48eb9b0' , '0bb8e03d00ecc7642c5142de8f12a335' , GETDATE() , 'nội trú' ),
	('de9aa8254527b52b336a60f9373740ea' , '0d0dd3c14756ae8316e7054b205896c9' , '1c38dd30f9e415b3a34879be077381ce' , 'aeed52468a0d9880fa013c611816e897' , GETDATE() , 'mỏ bị gãy' ),
	('737cebac25159c2b8e46f50881a7abcb' , '861c51821e55ecad053b072323fac994' , '21fc9daf44e2637d7972bd248c83577d' , 'cde92de8a056398e6a281dba87bdffb1' , GETDATE() , 'gắn chip' ),
	('1450707c9e9a8ea70f8d341e19e5a9bb' , '380965fe9f1584559ea8a90b9c8d680c' , '01c1fa1b81297a2de21056f35303ad84' , '6c3b331b0cde4d503944f2f16f979c93' , GETDATE() , 'dị vật ở ngực'),
	('321d5d0f522e1ba28bbb2243b6b18de8' , '17787dd14e0fda883a36016cada64123' , 'fe30e1ff175e10b1c538613084ab2417' , 'b6b447b56dbe005a626c4b5e3fdb97be' , GETDATE() , 'chăm sóc' ),
	('008be4115afd1511f4cc2ae97c9834f0' , 'd5ea83ec7f100a6803bd39e14c619299' , 'ae114dac5897fbcfd25797bf4be08fd3' , 'a61de36f81c0f699a8653863ea9e3d2f' , GETDATE() , 'xác định giới tính' ),
	('3ff90b1c47898c6e576e8f109eba0bef' , '25c448b0241244364f7653f08cb8aff6' , '9eae70b054be6eba305323d8c9106cfb' , '47b601885ddc891de11eb62451a97b43' , GETDATE() , 'chích vaccine' ),
	('21879306649bc1429b0f6d9d57217356' , 'bc0b9fe1f4df72fa1289f4437e6a3953' , 'c8aa14ffb7da0912c84635aa2ee0bb62' , '2f7294ec43136a43ca696ad6f06e1635' , GETDATE() , 'Bệnh béo phì' ),
	('56e00973cbc998b7ddce6cdc45b3cd25' , '43aaf0240284fd15416b429bed0ef321' , 'dd0e3f50648088bfecc501f809a06ca8' , '090f345a844fedfb9ca86ff69b59d969' , GETDATE() , 'Bệnh mổ lông' ),
	('8c6abf5a30122f683a29871b67190785' , 'ca8406790940dec227193cc7dca16212' , '62fe46dae9470f311d52973a6eeb6a1a' , 'd2601ee48263e69982e4dbd809c0358a' , GETDATE() , 'khối u ở chân' ),
	('65a4f559051183b9a50cda6876422baa' , '752ee3ce65129a7bd54292accb28983e' , '9c6189a20beb35a93df963e3b48eb9b0' , 'e221bebf131b7773da0045982e018fba' , GETDATE() , 'thiếu vitamin E' ),
	('5fe272ab8622289deb002353518c8941' , 'c91f8b119029caa4ec2046bcc5c69bb5' , '1c38dd30f9e415b3a34879be077381ce' , '85c10fd22fe836139fd76fbaee831673' , GETDATE() , 'nội trú' ),
	('3db65ac8adaadf9ff8fc0d6ef26111a6' , '16c5bd4d79c66e16042bee6bbf128c6f' , '21fc9daf44e2637d7972bd248c83577d' , '7caa694dda6e1cf8c0993cf301c84bba' , GETDATE() , 'bị chấn thương chân trái' ),
	('ffd4d1092d5e6de12dc9d4fe82c4029e' , '56a7207dd933fe09f539083edb711548' , '01c1fa1b81297a2de21056f35303ad84' , 'b7ad6a62013acd21497265b6f7ff74eb' , GETDATE() , 'gắn chip' ),
	('52f50c616b0653a3fab725e6c2421692' , '6a045cdabdccb76073091f263cbf3e52' , 'fe30e1ff175e10b1c538613084ab2417'  , '3427f117121dd0789b94a37ef63b64dc' , GETDATE() , 'không phát hiện dị vật' );

INSERT INTO RecordServices (medicalRecordID, serviceID)
VALUES
	( '3b153a85daab45c693cdd0e1f02631c9', 'f8c17d469d7dfd4fa84eae659923536b'),
	( '87599195136fd0440b341eed32d36c84', 'c739c1e62319f52411908f874c0698bf'),
	( '4d0ac1b5e6f8e2e4ee256c4c2031b1d2', 'a074614583162a3d58b89c13699d70a1'),
	( 'b356f8672801e4820bd72b17dbda7764' , 'cd9bfc9d6bb22a47f6dcdc2a5c99b2fd' ),
	( 'a0540a74c856251ad819d931fee6b078' , '744722e0fb1eb8e7f4fc5c4682159800' ),
	( '32fe2542e25434a1acde0f6edff2f0b4' , '84fbf5e32cfdb21cf48721cf849b0c20' ),
	( '2f6c8e2ec915f490a91c6c7e888126f6' , '517d8993ec9bcdb8c33fc50ea7ec5da8' ),
	( '21def0e373e1e8d57d1ab5f339726167' , '291129122c3e6bbbd76a76b428f2809a' ),
	( 'ff398a2c8cdd28c7c9e31446c0e2a629' , '52b7bedca394c621f40a99d03a564341' ),
	( '753906196d6e7bdd8f8d874efaacfa8d' , 'e41d8b0c31b65cc94f5eb4bbb7b76907' ),
	( '9a590d8f7d706608bc3081a042d2e0dc' , '507e4c66da1ccd4fcf621069065494bc' ),
	( '4aa48bfce29088db4424a1b921e2be55' , 'f8c17d469d7dfd4fa84eae659923536b' ),
	( '154aa8864b0445239a1c8cf636ce8164' , 'c739c1e62319f52411908f874c0698bf' ),
	( 'b72e56f3705781fdfaa652dabbefd8b4' , 'a074614583162a3d58b89c13699d70a1' ),
	( '96f71fd09596eeda17b234c2a87b783f' , 'cd9bfc9d6bb22a47f6dcdc2a5c99b2fd' ),
	( 'c26b9ff4973daa21f4ec2fa61207639f' , '744722e0fb1eb8e7f4fc5c4682159800' ),
	( 'de9aa8254527b52b336a60f9373740ea' , '84fbf5e32cfdb21cf48721cf849b0c20' ),
	( '737cebac25159c2b8e46f50881a7abcb' , '517d8993ec9bcdb8c33fc50ea7ec5da8' ),
	( '1450707c9e9a8ea70f8d341e19e5a9bb' , '291129122c3e6bbbd76a76b428f2809a' ),
	( '321d5d0f522e1ba28bbb2243b6b18de8' , '52b7bedca394c621f40a99d03a564341' ),
	( '008be4115afd1511f4cc2ae97c9834f0' , 'e41d8b0c31b65cc94f5eb4bbb7b76907' ),
	( '3ff90b1c47898c6e576e8f109eba0bef' , '507e4c66da1ccd4fcf621069065494bc' ),
	( '21879306649bc1429b0f6d9d57217356' , 'f8c17d469d7dfd4fa84eae659923536b' ),
	( '56e00973cbc998b7ddce6cdc45b3cd25' , 'c739c1e62319f52411908f874c0698bf' ),
	( '8c6abf5a30122f683a29871b67190785' , 'a074614583162a3d58b89c13699d70a1' ),
	( '65a4f559051183b9a50cda6876422baa' , 'cd9bfc9d6bb22a47f6dcdc2a5c99b2fd' ),
	( '5fe272ab8622289deb002353518c8941' , '744722e0fb1eb8e7f4fc5c4682159800' ),
	( '3db65ac8adaadf9ff8fc0d6ef26111a6' , '84fbf5e32cfdb21cf48721cf849b0c20' ),
	( 'ffd4d1092d5e6de12dc9d4fe82c4029e' , '517d8993ec9bcdb8c33fc50ea7ec5da8' ),
	( '52f50c616b0653a3fab725e6c2421692' , '291129122c3e6bbbd76a76b428f2809a' );

INSERT INTO RecordMedicine (medicalRecordID, medicineID, quantity, descriptions)
VALUES
('87599195136fd0440b341eed32d36c84', '1a27a82eb264532c271baf05c7a6e10d', 9 , 'sáng: 1, trưa: 1, chiều: 1, tối: 0'),
('87599195136fd0440b341eed32d36c84', 'c93c634859e543a562441ca36f9bd9f0', 9 , 'sáng: 1, trưa: 1, chiều: 1, tối: 0'),
('87599195136fd0440b341eed32d36c84', 'd0141bd1067e2f534fd908b54a72a1ff', 9 , 'sáng: 1, trưa: 1, chiều: 1, tối: 0'),
('4d0ac1b5e6f8e2e4ee256c4c2031b1d2', '7c7f0e401b7926cb956e1e798e7d6664', 12 , 'sáng: 1, trưa: 1, chiều: 1, tối: 1'),
('4d0ac1b5e6f8e2e4ee256c4c2031b1d2', '2b1937a02cb1cc8255ecfeb8dc38c5d2', 6 , 'sáng: 1, trưa: 0, chiều: 1, tối: 0'),
('4d0ac1b5e6f8e2e4ee256c4c2031b1d2', '589ff60828e99f431d7f07d8ef62baff', 12 , 'sáng: 1, trưa: 1, chiều: 1, tối: 1'),
('4d0ac1b5e6f8e2e4ee256c4c2031b1d2', 'f9a7dfe69faaaf1f0c2dc348c0254d50', 9 , 'sáng: 0, trưa: 1, chiều: 1, tối: 1'),
('b356f8672801e4820bd72b17dbda7764', '5f7fb0d98491f5efdf52623a7d4839aa', 12 , 'sáng: 1, trưa: 1, chiều: 1, tối: 1'),
('b356f8672801e4820bd72b17dbda7764', '8e89704ade7f8e48da32ce2d6bb15054', 9 , 'sáng: 1, trưa: 0, chiều: 1, tối: 0'),
('b356f8672801e4820bd72b17dbda7764', '7c7f0e401b7926cb956e1e798e7d6664', 9 , 'sáng: 1, trưa: 1, chiều: 1, tối: 0'),
('b356f8672801e4820bd72b17dbda7764', 'e365252333bf5bd19b86b828e64b0eb0', 6 , 'sáng: 1, trưa: 1, chiều: 1, tối: 0'),
('b356f8672801e4820bd72b17dbda7764', '7c6164ddf235787f5d1e2d8f4540c838', 4 , 'sáng: 1, trưa: 0, chiều: 1, tối: 1'),
('32fe2542e25434a1acde0f6edff2f0b4', '9faeec1795e05223ab80bf4d06971616', 4 , 'sáng: 1, trưa: 0, chiều: 1, tối: 1'),
('21def0e373e1e8d57d1ab5f339726167', '9e9af1d637a369cdaf6bac028b8bd813', 3 , 'sáng: 1, trưa: 0, chiều: 0, tối: 0'),
('21def0e373e1e8d57d1ab5f339726167', '9faeec1795e05223ab80bf4d06971616', 3 , 'sáng: 1, trưa: 0, chiều: 0, tối: 0'),
('4aa48bfce29088db4424a1b921e2be55', '9dc94408c0e9b062a5cdd03830011d72', 4 , 'sáng: 0, trưa: 1, chiều: 1, tối: 0'),
('4aa48bfce29088db4424a1b921e2be55', '7c6164ddf235787f5d1e2d8f4540c838', 6 , 'sáng: 0, trưa: 1, chiều: 1, tối: 1'),
('4aa48bfce29088db4424a1b921e2be55', '124b0999a2e3a37b30f8b4d4196d5666', 4 , 'sáng: 0, trưa: 1, chiều: 1, tối: 0'),
('154aa8864b0445239a1c8cf636ce8164', '124b0999a2e3a37b30f8b4d4196d5666', 6 , 'sáng: 1, trưa: 1, chiều: 1, tối: 0'),
('154aa8864b0445239a1c8cf636ce8164', '9dc94408c0e9b062a5cdd03830011d72', 6 , 'sáng: 1, trưa: 1, chiều: 1, tối: 0'),
('154aa8864b0445239a1c8cf636ce8164', 'f9a7dfe69faaaf1f0c2dc348c0254d50', 6 , 'sáng: 1, trưa: 1, chiều: 1, tối: 0'),
('154aa8864b0445239a1c8cf636ce8164', '8e89704ade7f8e48da32ce2d6bb15054', 6 , 'sáng: 1, trưa: 1, chiều: 1, tối: 0'),
('b72e56f3705781fdfaa652dabbefd8b4', 'd0141bd1067e2f534fd908b54a72a1ff', 9 , 'sáng: 1, trưa: 1, chiều: 1, tối: 1'),
('b72e56f3705781fdfaa652dabbefd8b4', 'c69f4b52c792233f31e11393012e5e19', 9 , 'sáng: 1, trưa: 1, chiều: 1, tối: 1'),
('96f71fd09596eeda17b234c2a87b783f', '9dc94408c0e9b062a5cdd03830011d72', 9 , 'sáng: 1, trưa: 1, chiều: 1, tối: 1'),
('de9aa8254527b52b336a60f9373740ea', '9faeec1795e05223ab80bf4d06971616', 9 , 'sáng: 1, trưa: 1, chiều: 1, tối: 0'),
('de9aa8254527b52b336a60f9373740ea', 'f9a7dfe69faaaf1f0c2dc348c0254d50', 3 , 'sáng: 0, trưa: 0, chiều: 1, tối: 0'),
('de9aa8254527b52b336a60f9373740ea', '5f7fb0d98491f5efdf52623a7d4839aa', 3 , 'sáng: 0, trưa: 0, chiều: 1, tối: 0'),
('de9aa8254527b52b336a60f9373740ea', 'e365252333bf5bd19b86b828e64b0eb0', 3 , 'sáng: 0, trưa: 0, chiều: 1, tối: 0'),
('de9aa8254527b52b336a60f9373740ea', '8e89704ade7f8e48da32ce2d6bb15054', 3 , 'sáng: 0, trưa: 0, chiều: 1, tối: 0'),
('21879306649bc1429b0f6d9d57217356', '1a27a82eb264532c271baf05c7a6e10d', 10 , 'sáng: 1, trưa: 1, chiều: 1, tối: 0'),
('21879306649bc1429b0f6d9d57217356', 'c93c634859e543a562441ca36f9bd9f0', 10 , 'sáng: 1, trưa: 1, chiều: 1, tối: 0'),
('21879306649bc1429b0f6d9d57217356', '2b1937a02cb1cc8255ecfeb8dc38c5d2', 12 , 'sáng: 1, trưa: 1, chiều: 1, tối: 0'),
('56e00973cbc998b7ddce6cdc45b3cd25', '589ff60828e99f431d7f07d8ef62baff', 6 , 'sáng: 1, trưa: 1, chiều: 1, tối: 0'),
('56e00973cbc998b7ddce6cdc45b3cd25', '7c7f0e401b7926cb956e1e798e7d6664', 6 , 'sáng: 1, trưa: 1, chiều: 1, tối: 0'),
('56e00973cbc998b7ddce6cdc45b3cd25', 'd0141bd1067e2f534fd908b54a72a1ff', 4 , 'sáng: 1, trưa: 1, chiều: 1, tối: 0'),
('8c6abf5a30122f683a29871b67190785', '976f58180ccfd7c80f492b1665fd003a', 8 , 'sáng: 1, trưa: 1, chiều: 1, tối: 0'),
('8c6abf5a30122f683a29871b67190785', '9faeec1795e05223ab80bf4d06971616', 8 , 'sáng: 1, trưa: 1, chiều: 1, tối: 0'),
('8c6abf5a30122f683a29871b67190785', '9e9af1d637a369cdaf6bac028b8bd813', 8 , 'sáng: 1, trưa: 1, chiều: 1, tối: 0'),
('65a4f559051183b9a50cda6876422baa', '2b1937a02cb1cc8255ecfeb8dc38c5d2', 6 , 'sáng: 1, trưa: 0, chiều: 1, tối: 0'),
('65a4f559051183b9a50cda6876422baa', '5f7fb0d98491f5efdf52623a7d4839aa', 8 , 'sáng: 1, trưa: 1, chiều: 1, tối: 0'),
('3db65ac8adaadf9ff8fc0d6ef26111a6', 'd0141bd1067e2f534fd908b54a72a1ff', 4 , 'sáng: 1, trưa: 0, chiều: 0, tối: 1'),
('3db65ac8adaadf9ff8fc0d6ef26111a6', '9dc94408c0e9b062a5cdd03830011d72', 6 , 'sáng: 1, trưa: 1, chiều: 1, tối: 0'),
('3db65ac8adaadf9ff8fc0d6ef26111a6', '7c7f0e401b7926cb956e1e798e7d6664', 8 , 'sáng: 1, trưa: 1, chiều: 1, tối: 0');
INSERT INTO Feedback (feedbackID, appointmentID, feedbackContent, title, feedbackTime)	
VALUES
	( 'a4e6c35adb5663181253e2c610ceb080' , 'a6a837e5d05e57e160dea29c335f30d0', 'The clinic staff went above and beyond to ensure my comfort and satisfaction. From the warm welcome at the reception to the caring nurses and doctors, their exceptional customer service truly stood out.', 'Exceptional Customer Service', GETDATE()),
	( '1926f20e0d3c56f9a5e4d9dea3a1ca23' , '95b579fe61c622b5c50def9dccb66bdc', 'The clinic state-of-the-art facilities impressed me. The modern equipment and comfortable environment contributed to a positive and stress-free experience during my visit.', 'State-of-the-Art Facilities', GETDATE()),
	( 'c7c84d9b4f86cab7091dfc674da2d233' , '86ae960dc44eba248c481d76520846c3', 'The doctors at this clinic are highly knowledgeable in their respective fields. They took the time to explain my condition thoroughly, addressing all my concerns and providing appropriate treatment options.', 'Knowledgeable Doctors', GETDATE()),
	( 'b85f8bf4eef0d6343a8ac49e824fdb77' , '801b58e3d0b00f7f9f9eac80058f99f0' , 'The clinic appointment scheduling system is efficient and convenient. I appreciated how easy it was to book an appointment, and the staff ensured minimal waiting time, allowing me to manage my schedule effectively.' , 'Efficient Appointment Scheduling' , GETDATE() ),
	( '3871a21957320daf0208624dea20b3db' , 'ca768c1b1876a2f286496e62666dfada' , 'The clinic staff were incredibly friendly and supportive throughout my entire visit. Their compassionate approach and willingness to help created a welcoming atmosphere.' , 'Friendly and Supportive Staff' , GETDATE() ),
	( 'c3f1ad462249f3d02191d1a9a872e881' , '0a7a30124b6b4f266459a6b69677152c' , 'The clinic maintains a clean and hygienic environment, which is essential for any medical facility. I felt reassured knowing that proper sanitization measures were in place.' , 'Clean and Hygienic Environment' , GETDATE() ),
	( 'b529c5b6c02436d52646b251135a8580' , 'ebcf025d47ee19d929f6707029df09d0' , 'The doctors at this clinic provided a timely and accurate diagnosis, which allowed for prompt treatment. Their expertise and attention to detail were commendable.' , 'Timely and Accurate Diagnosis' , GETDATE() ),
	( '6b608c52effdd5d149613fd5ebf4c55c' , 'b7e4621ca7d7273ea67ba0b40992d189' , 'This clinic offers a wide range of comprehensive health services, catering to various medical needs. From routine check-ups to specialized treatments, they have it all under one roof.' , 'Comprehensive Health Services' , GETDATE() ),
	( 'e4da29dfa2d7f2e893b7068eba2f2665' , '35847b5a3a8de7e0af06281b1d889bcf' , ' The clinic excels in communication. The doctors and staff listened attentively to my concerns and communicated clearly, ensuring I understood the treatment process and any necessary follow-up steps.' , 'Excellent Communication' , GETDATE() ),
	( 'c208fe80be67e0ac443894edf9048959' , 'ca05b981160139795fbf616bfd5d491b' , 'The clinic provides personalized care tailored to each patient needs. They took the time to understand my unique circumstances, ensuring a personalized and effective treatment plan.' , 'Personalized Care' , GETDATE() ),
	( 'd968f7543b03fafc1e2c306edbe73cd5' , '3967200752865b1bb65a63f386925d14' , 'I appreciated the clinic holistic approach to health. They emphasized preventive measures, lifestyle recommendations, and complementary therapies alongside traditional medical treatments.' , 'Holistic Approach to Health' , GETDATE() ),
	( '95e8fffd6181170d848151e13d25c397' , '943b4c67a61164d245ea5af7f3848a37' , 'The clinic has a positive and welcoming atmosphere that immediately put me at ease. The friendly smiles and supportive environment contributed to a stress-free experience.' , 'Positive Atmosphere' , GETDATE() ),
	( 'bfbc8861190e55a089b0c4afc1c41a07' , '040c93cff9c0cc5cd6d008fb02e17b69' , 'The clinic maintains transparent pricing practices. They provided detailed explanations of the costs involved, ensuring there were no surprises or hidden fees.' , 'Transparent Pricing' , GETDATE() ),
	( '4dcb301699e281d9eda42ee915f8c91d' , '3841cd8942a581d2092ff1d3739fcebc' , 'The clinic efficient follow-up procedures impressed me. They promptly scheduled any necessary follow-up appointments and ensured continuity of care.' , 'Efficient Follow-up Procedures' , GETDATE() ),
	( '3f8c2d5acfcad832c564afe05fdc4dd2' , '4a160bb951e81bb14485ab90391d0c58' , 'This clinic integrates modern technology into their practice. From electronic medical records to advanced diagnostic tools, their commitment to innovation was evident.' , 'Modern Technology Integration' , GETDATE() ),
	( '1c693b7b7f4f3967d56242710d4a6925' , '0bb8e03d00ecc7642c5142de8f12a335' , 'The nursing staff at this clinic are well-trained and attentive. They provided excellent care and were always available to address any concerns.' , 'Well-Trained Nursing Staff' , GETDATE() ),
	( '02025191b401a33ee5d5dbf672b0d9cd' , 'aeed52468a0d9880fa013c611816e897' , 'The clinic places a strong emphasis on patient education. They provided me with valuable information about my condition, empowering me to make informed decisions about my health.' , 'Emphasis on Patient Education' , GETDATE() ),
	( 'f31300a92d53523f7c9e63f082429559' , 'cde92de8a056398e6a281dba87bdffb1' , 'The clinic convenient location made it easily accessible. Its proximity to public transportation and ample parking options were a great convenience.' , 'Convenient Location' , GETDATE() ),
	( '021c8752a33aa45ffaabbc24b9718c65' , '6c3b331b0cde4d503944f2f16f979c93' , 'The clinic fostered a respectful and non-judgmental environment. The staff treated everyone with dignity and respect, creating a safe space for patients.' , 'Respectful and Non-Judgmental Environment' , GETDATE() ),
	( '2b72c3de10429d9be2c5b7f6fb799eb7' , 'b6b447b56dbe005a626c4b5e3fdb97be' , 'The clinic provided comprehensive follow-up support. They were proactive in ensuring my progress and addressing any post-treatment concerns.' , 'Comprehensive Follow-up Support' , GETDATE() ),
	( 'b3ce71cf9331b8139a30efa95f01af8a' , 'a61de36f81c0f699a8653863ea9e3d2f' , ' The clinic prescription services were efficient and hassle-free. The staff promptly processed my prescriptions, minimizing any inconvenience.' , 'Efficient Prescription Services' , GETDATE() ),
	( 'c83755957ea168197e2362912cd8ebdc' , '47b601885ddc891de11eb62451a97b43' , 'The clinic empathetic approach towards patients is commendable. They genuinely cared about my well-being and showed understanding throughout my treatment.' , ' Empathetic Approach' , GETDATE() ),
	( 'a413ed3e5df4149bb41c5a55ab70cca8' , '2f7294ec43136a43ca696ad6f06e1635' , 'The clinic multilingual staff was a great advantage for patients from diverse backgrounds. The ability to communicate in different languages facilitated effective doctor-patient interactions.' , 'Multilingual Staff' , GETDATE() ),
	( 'b2e26005217a74208df092883606602e' , '090f345a844fedfb9ca86ff69b59d969' , 'This clinic offers comprehensive health assessments that provide a thorough understanding of a patient overall health. Their in-depth evaluations go beyond conventional check-ups.' , 'Comprehensive Health Assessments' , GETDATE() ),
	( '288269426198f8724d0da8a362f7cc2d' , 'd2601ee48263e69982e4dbd809c0358a' , 'The clinic excels in pain management. They provided effective treatments and therapies that significantly alleviated my discomfort.' , 'Effective Pain Management' , GETDATE() ),
	( '6d8e4dfa0f9a9938e767039bba8c43b4' , 'e221bebf131b7773da0045982e018fba' , 'The clinic waiting area is welcoming and comfortable. The pleasant ambiance and thoughtful amenities helped create a relaxed atmosphere.' , 'Welcoming Waiting Area' , GETDATE() ),
	( 'af5013fa896bf00600b23c7a8b4995d4' , '85c10fd22fe836139fd76fbaee831673' , 'I was impressed by the clinic efficiency in delivering test results. They provided prompt updates, ensuring timely decisions regarding further treatment, if needed.' , 'Prompt Test Results' , GETDATE() ),
	( '79fbd660392170136d71bf85a359acd2' , '7caa694dda6e1cf8c0993cf301c84bba' , 'The clinic collaborates with specialists across various medical disciplines, ensuring patients receive comprehensive and well-rounded care.' , 'Collaboration with Specialists' , GETDATE() ),
	( '4b9e4136b9380ce6264eba99e7cbecaa' , 'b7ad6a62013acd21497265b6f7ff74eb' , 'The clinic post-procedure care was exceptional. The staff provided clear instructions for post-treatment care and were available to answer any questions or concerns.' , 'Supportive Post-Procedure Care' , GETDATE() ),
	( 'bc049c5b9cc23a7252cd02aaef7d6571' , '3427f117121dd0789b94a37ef63b64dc' , 'This clinic demonstrates a commitment to continuous improvement. They actively seek feedback from patients to enhance their services and overall patient experience.' , 'Commitment to Continuous Improvement' , GETDATE());

INSERT INTO Blog (blogID, title, upload, category, blogContent)
VALUES
	( '36c8417c829ea8b07014eb3ca7946fb0', 'Những kinh nghiệm quý báu khi nuôi chim sâu xanh', GETDATE(), 'kinh nghiệm nuôi chim', 'Ngoài việc được biết đến là một loài chim có ích cho cuộc sống con người. Chim sâu xanh còn được biết đến là một loại chim cảnh. Mặc dù việc nuôi chim sâu xanh không phải là khó nhưng cũng đòi hỏi ở người nuôi sự tỉ mỉ kì công.
	Nhưng nếu bạn là một người có tình cảm đặc biệt với những chú chim này thì đó không phải là vấn đề gì quá khó khăn. Để giúp bạn có thêm kinh nghiệm trong việc chăm sóc những chú chim đáng yêu này mời bạn theo dõi bài viết của chúng tôi dưới đây.Nghe tên gọi thôi là chúng ta có thể đoán được loài chim cảnh nhỏ nhắn đáng yêu này thích ăn gì rồi phải không nào.
	Chúng có thể ăn được các loại sâu tồn tại trong thiên nhiên vì đây là một loại thức ăn chính để chúng tồn tại. Tuy nhiên trong điều kiện nuôi nhốt ở trong lồng ngoài việc cho ăn các loài sâu trong tự nhiên ra.
	Thì bạn cần phải bổ sung cho chúng thêm một số thức ăn khác như trứng kiến, hoặc cám. Những loại thức ăn này đều có thể mang tới cho chúng được một chế độ dinh dưỡng hợp lý để chúng có thể phát triển toàn diện nhất.
	Lồng nuôi cho chi sâu xanh tốt nhất là nên chọn lông tre có chiều cao vừa phải vì như chúng ta đã biết thì kích thước của chim sâu xanh khá nhỏ nên nếu không lựa chọn được lồng hợp lý sẽ khó có thể mang tới cho chúng môt cuộc sống thoải mái nhất. 
	Bên trong lồng nên để 1 khay đựng cám ( loại cám mà bạn hay mua ở những của hàng chim) một khay đựng sâu khô để đảm bảo được lượng thức ăn cho chúng. 
	Ngoài ra một điều kiện bắt buộc phải có đó chính là nước nước, nếu bạn ở thành thị nước máy thì bạn nên xử lý qua để bớt clo. Mặc dù món ăn khoái khẩu của loài chim này là sâu tuy nhiên sâu mà chúng ta mua tại các cửa hàng không thể chất lượng bằng sâu mà chúng tự kiếm trong thiên nhiên được nên phải hạn chế và cho chúng ăn một số lượng cụ thể đừng lạm dụng sẽ khiến cho sức khỏe của chúng không được ổn định'),
	( '40f3cc38ef656d749d2e2a368b59711e', 'Cách phân biệt chim sâu xanh trống mái chính xác nhất',  GETDATE(), 'phân biệt chim',
	'Việc phân biệt chim sâu xanh đối khó vì chúng khá giống nhau, vì bộ long chúng chưa hoàn thiện nên các bạn chỉ nhìn đảo qua một vài lần và so sánh. Không nên nhìn chằm chằm vào 1 con, nhìn lâu sinh ra hiện tượng hoa mắt, cuối cùng là con nào cũng như nhau, nên không phân biệt được.
	Mời bạn theo giỏi bài viết sau đây để nhận biết chim sâu xanh trống mái một cách chính xác nhất.1. Phân biệt sâu đầu xanh chuyền trống, mái.
	Với những chú chim sâu đang bay chuyển thì việc phân biệt chim không phải là điều đơn giản nhất là đối với những người không có quá nhiều kinh nghiệm. 
	Sở dĩ việc này rất khó bởi lúc chim đang chuyển là lúc chúng đang hoàn thiện về bộ lông. Bạn có thể phân biệt chim sâu xanh trông mái bằng cách nhìn viền lông trước ngực. 
	Nếu chú chim nào có ngực đen đậm cùng với đó 2 sợi lông đuôi dài hơn so với lông ở những chỗ khác thì đó là chú chim trống. 
	Còn ngược lại những chú chim sâu xanh thì lông ở viền ngực sẽ nhạt hơn rất nhiều không có 2 sợi như chú chim trống.'),
	( 'ff9086582c62af630123c568ca5db776', 'Top những loài chim cảnh biết nói thông minh nhất thế giới', GETDATE(), 'Top loài chim',
'1. Chim Yến Phụng.
	Yến Phụng là một loài chim cực kì thông minh và có khả năng bất bước tiếng người cực kì giỏi. Chỉ cần chủ nhân của chúng dành nhiều thời gian để dạy dỗ chúng có thể nhớ được rất nhiều từ. 
	Chúng cũng rất hiền lành và thân thiện với con người đặc biệt sở hữu một bộ lông sặc sỡ rất bắt mắt nên thường được lựa chọn để làm chim cảnh trong nhà. 
	Theo những người có kinh nghiệm nhận xét rằng một chú Vẹt Yến Phụng đực có khả năng bắt chước và phát âm chuẩn xác hơn so với những chú Vẹt Cái
2. Yểng.
	Trong số những loại chim cảnh biết nối thì Yểng được đánh giá cao nhất về khả năng phát âm chính xác và chuẩn về ngữ điều đến bất ngờ. Loài chim này cũng rất mau mồm mau miêng lúc hứng lên chúng có thể nói cả ngày không chán. 
	Chúng sở hữu một màu lông xanh đen với chiếc mở màu được tô điểm bới lông sọc vàng. Thức ăn yêu thích của loài Yểng này là côn trùng và trái cây. 
	Đây cũng là một loại chim cảnh rất được ưa chuộng tại Việt Nam'),
	( '9b5aefbcffbf716f526dda302be5cdef' , 'Nuôi chim họa mi quan trọng nhất điều gì' , GETDATE() , 'kinh nghiệm nuôi chim' ,
'1. Về thức ăn dành cho chim họa mi.
	Đúc kết kinh nghiệm từ những người nuôi chim họa mi trên khắp cả nước thức ăn dành cho chim họa mi đóng một vai trò không hề nhỏ quyết định đến ngoại hình, tính cách và giọng hót của chim. 
	Vốn dĩ là một loài chim ở rừng núi họa mi tự nhiên ăn khá tạp chúng thích ăn côn trùng. Khi được thuần hóa và trở thành chim cảnh trong nhà thì chim được người nuôi cho ăn 
	cám và giới chơi chim nói rằng nếu đã cho chim ăn cám thì mãi mãi chỉ cho chim ăn cám. Lượng thức ăn bên ngoài khác như thịt, trừng kiến...bổ xung khi chim cần đến dinh 
	dưỡng cao hơn trong các giai đoạn phát triển. Ngoài ra chất lượng thức ăn dành cho họa mi cũng có những yêu cầu khắt khe. Gạo cho họa i ăn phải trắng, phải thơm ngon tuyệt 
	đối không được mốc. Có như thế chim mới luôn khỏe mạnh.
2. Lồng nhốt cho chim họa mi :
	Khi nhốt chi họa mi trong lồng phải lựa chọn được lồng có độ cao cần thiết để phù hợp với dáng chim. Vì họa mi có kích thước cũng tương đối lớn so với những loài chim cảnh 
	khác. Treo lồng cũng cần phải có những mẹo để chim mau chóng thích nghi được môi trường. Nên thay đổi vị trí treo lồng ở những nơi khác nhau để chị mạnh dạn hơn. Phải sử 
	dụng áo lồng cho chim để tránh việc chim bị hoảng sợ. Chim họa mi là một loài chim rất dễ bị dị ứng nếu như lồng nuôi không đảm bảo được vệ sinh. Vị trí treo lồng cũng 
	phải được lựa chọn chu đáo vì nếu như treo ở những nơi ẩm thấp có khói bụi, hay những nơi có nhiệt độ cao sẽ ảnh hưởng đến sức khỏe của chim. 
3. Lưu ý đến việc tắm cho chim.
	Chim rất cần được tắm nắng để bổ xung những vitamin thiết yếu cho bộ lông. Việc tắm nắng cho chim cũng đòi hỏi những kĩ thuật tỉ mỉ. Không nên để chim ở những nơi có ánh 
	nắng quá gắt nên tắm nắng cho chim 1 ngày 1 lần. Tắm nước cũng vậy cũng rất cần thiết để chim vệ sinh bộ lông của mình giúp cho lông chim luôn được óng mượt. '),
	( 'b1fa395c5fa8c10d20990274f0e57a85' , 'Những điều thú vị về tiếng chim hoạ mi hót' , GETDATE() , 'Những điều thú vị' ,
	'Bất kì một người nuôi chim nào cũng mong muốn được nghe thứ âm thanh tuyệt vời ấy nhất là vào mỗi buổi sáng. Thứ âm thanh mà loại chim này mang lại cho người nghe cảm giác
	thoải mái, thư giản sau một ngày làm việc. Ẩn sâu trong tiếng hót mê hoặc ấy là những câu chuyện được giới chơi chim truyền lại. Vậy câu chuyện đó là gì? Hãy cùng tìm hiểu 
	những điều thú vị trong tiếng hót của chim hoạ mi.
	Nguồn gốc tiếng hót chim hoa mi qua câu truyện đầy thú vị.
	Từ thuở xa xưa, mọi loài trên thế gian đều được thượng đế ban tặng cho một đặc điểm riêng biệt. Với hoa hồng thì chẳng gì hấp dẫn hơn với vẻ đẹp hương sắc. Đại bàng thì 
	được ưu ái với ngoại hình dũng mãnh, sự mạnh mẽ xé tan bầu trời, đến cây cỏ thôi cũng có những sức hút ma mị làm vương vấn xuyến sao loài người… Chỉ duy nhất chim họa mi 
	là chẳng có gì cả. Loài chim này vốn dĩ rất tự tin khi phải khoác trên mình bộ lông nâu xám tẻ nhat. Càng tự ti hơn nữa khi giọng hót của chúng chỉ là những tiếng kêu khàn 
	khàn chẳng mang nổi 1 âm sắc. Dù rất cố gắng bắt chước giọng hót của những loại chim khác nhưng kết quả chỉ là sự bất lực. Nó rất khao khát để có được một giọng hót hay, 
	nó mong muốn điều đó một cách tha thiết và sẵn sàng đổi bằng chính mạng sống của bản thân mình.
	Những điều thú vị khác về tiếng hót chim họa mi
	Câu truyện thú vị đó dường như đã ăn sâu vào tiềm thức của những người đam mê chim chân chính và cũng 1 phần có thể lý giải được tại sao người ta lại yêu họa mi đến như thế.
	Vốn dĩ là một loài chim rụt rè nhút nhát, chim họa mi chỉ cất cao tiếng hát khi nó cảm thấy có cảm hứng cảm thấy mọi thứ xung quanh nó đều tốt đẹp.'),
	( 'db635b18aeddd06818d3eaee86183bab' , 'TOP 5 loài chim chào mào hót hay được các đại gia săn lùng hiện nay' , GETDATE() , 'Top loài chim' , 
	'Chim chào mào Huế
	Đến từ xứ Huế mộng mơ, mang trong mình giọng hót đặc trưng bởi vậy những chú chim xuất sắc luôn được các đại gia những người sành sỏi đi tìm. Đặc biệt giống chim này sở hữu
	một chất giọng cực độc theo giới chuyên môn gọi là giọng thổ to. Khi cất tiếng hót thì tiếng nào ra tiếng đó mỗi lần cất giọng lên là ra liền 6, 7 âm. Chính vì sự đặc biệt 
	của giống chim chào mào quý này đòi hỏi người chơi phải rất sành sỏi, lồng phải được thiết kế tỉ mỉ hơn so với lồng chim thông thường. Sở dĩ rất nhiều người yêu thích loài 
	chào mào này bởi khả năng thi đấu của nó rất tốt, nếu tuyển được một chú chào mào Huế chất lượng và được chăm sóc bởi những người sảnh sỏi nó có thể mang về cho chủ nhận 
	những chiến thằng đầy thuyết phục trong các cuộc thi lớn.
1.2: Chào mào Trung Mang
	Bất kì một người chơi chim sành sỏi nào cũng mong muốn sở hữu được một em Trung Mang, sở hữu cái độc đáo không đụng hàng của giống chim này. Thật may mắn khi những chú chim
	chào mào Trung mang được trời phú cho một chất giọng riêng biệt mà không một loài nào có thể có được. Mỗi khi những chú chào mào hay cất giọng vừa nhanh vừa uy lực trong 
	giọng hót. Sau những giờ làm việc căng thẳng được thả hồn vào trong tiếng chim và nhâm nhi tách trà thư giãn chắc chắn rằng sẽ mang đến những giây phút yên bình và một sự 
	bình an tĩnh lặng trong tâm hồn để nạp lại năng lượng cho những ngày làm việc mệt mỏi tiếp theo. Chính vì sự hiếm có, sự uy vũ trong ngoài hình, và tiếng hót độc lạ tất cả
	những điều trên có thể lý giải được tại sao đây cũng là giống chào mào được đại gia săn lùng và mong muốn được bổ xung 1 chú vào trong bộ sưu tập chim cảnh của mình.'),
	( 'a66a0292d3af450e99bd42136898c36b' , 'Chế độ dinh dưỡng cho chim chào mào đấu hót' , GETDATE() , 'kinh nghiệm nuôi chim' , 
'1. Thức ăn chính
	Đối với chào mào, đây là loại chim không quá cầu kì trong nhu cầu dinh dưỡng, tuy nhiên chúng ta cũng cần phải đảm bảo nguồn cung cấp bổ sung vi chất dinh dưỡng mỗi ngày.
	Cám chim là một trong số các loại thực phẩm chính cho chim chào mào hiện nay đang được nhiều người sử dụng, phần vì tính cơ động và đảm bảo được nguồn cung cấp dinh dưỡng 
	hằng ngày của chúng. Mặt khác, ta có thể trộn cám với một số thành phần bên ngoài để tăng lượng dinh dưỡng và khẩu vị như: trứng vịt, trứng gà, thịt rắn mối, thịt bò, tôm 
	tươi…
2. Thức ăn bổ sung
	Đối với chim chào mào, đây là nguồn năng lượng, nguồn thức ăn bổ sung không kém phần quan trọng. Chúng ta có thể kể đến như là trái cây,côn trùng, sâu quy…Đặc biệt trái cây
	chín là thức ăn ưa thích của chào mào, vì vậy người nào muốn học cách nuôi chim chào mào đấu thì không nên bỏ qua các bước tìm hiểu về loại thức ăn thơm ngon và giàu dinh 
	dưỡng này. Có thể kể đến như là chuối, khoai lang, ổi, cà rốt… nói chung là các loại trái cây chín có vị ngọt.
3. Nước uống
	Nước uống sạch là đủ rồi, không cần phải đun sôi để nguội gì cả, tuy nhiên nên sử dụng nước để trong lu hoặc chum, tránh sử dụng trực tiếp nước máy nhiều Clorua như hiện nay.
	Ngoài ra để chú chim của bạn khỏe mạnh mỗi ngày thì cần phải bổ sung chất vi chất dinh dưỡng - vô thuốc nữa. Tuy nhiên đây là con dao hai lưỡi, khi sử dụng thuốc phải hết sức 
	cẩn thận và theo dõi sát sao bầy chim, phải hiểu thật rõ thì mới làm tránh những trường hợp đáng tiếc xảy ra.'),
	( '0aa6e189009d5d7cf2a981e8387fff4d' , 'Cách nuôi chào mào đẻ chuẩn kĩ thuật nhất' , GETDATE() , 'kinh nghiệm nuôi chim' , 
'1. Giai đoạn chuẩn bị 

	Đầu tiên bạn cần phải chuẩn bị từ việc chon chào mào trống mái và tách ly riêng chúng để cho cúng 1 chế độ chăm sóc đặc biệt nhất. Đối với những chú chim trông thì bạn có 
	thể cho chúng ăn thêm một số loại đồ tươi để chúng có được một thể trạng tốt nhất trước khi ghép với chim mái. Còn những chú chim mái thì cầu kì hơn một chút ngoài những 
	loại thức ăn thông thường thì nên mua thêm những loại cám được bán sẵn để bổ xung thêm một lượng khoáng chất thiết yếu nhất giúp chúng có thể nuôi dưỡng trứng một cách tốt 
	nhất. Thức ăn giai đoạn này cũng phải đa dạng đừng cho chúng ăn quá nhiều lần 1 loại hoa quả nào. 

2. Giao đoạn chào mào sinh sản

	Đầu tiên bạn cần phải sắp xếp cho cúng 1 chiếc lồng đủ rộng để cho chúng có thể tự do bay nhảy, lồng không quá rộng cũng không quá hẹp và chuẩn bị cho chúng thêm 1 chiếc rổ
	để chúng có thể làm tổ. Trong ổ cũng nên bố trí cho chúng thêm các loại thức ăn để sau này những chú chim non ra đời có thể tập chuyển được một cách nhanh nhất.

	Sau khi giai đoạn chuẩn bị lồng đã xong thì việc tiếp theo là bạn cho chào mào bắt cặp trống mái, sau khi đã thả con chim trống vào chuồng rồi tiếp theo bạn cho chú chim mái và quan sát nếu chúng ưng ghép cặp với nhau thì sẽ có biểu hiện ve cánh và cúi đầu còn chúng có biểu hiện chống trả thì bạn nên tách riêng chúng ra nếu không chúng sẽ đánh nhau đến chết nên bạn cần phải lưu ý đặc biệt. '),
	( '3f37126f037169bb080a309c88524d38' , 'Cách lựa chọn chim chào mào đẹp nhất hiện nay' , GETDATE() , 'cách chọn chim' , 
'1: Đầu và mào

	 Tất nhiên rồi nhưng chú chim chào mào được lựa chọn thì phải theo tiêu đầu điên là chiếc mào. Về cách lựa chọn mào  thì không ai giống ai nhưng heo ý kiến đánh giá của một
	 số người đã có kinh nghiệm chơi chim lâu nắm thì bạn nên lựa chon những chú chim có gốc mào dày. Những chú chim này thường tỏ ra rất bản lĩnh và bền bỉ. Đầu chào mào thì 
	 cũng nên lựa chọn những con có chiếc đầu to, như vậy thì chúng sẽ khỏe mạnh và dữ dằn 
2: Tách chim

	Tách chim chào mào chính là những chấm đỏ mặc dù điều này không ảnh hưởng quá nhiều đến khả năng hót của chim tuy nhiên phải là một điểm nhấn để giúp những chú chim của bạn
	trong bắt mắt hơn về ngoại hình. Một chú chim hót hay mà lại sở hữu tách đỏ đẹp nữa thì lại là điều tuyệt vời

3: Mỏ chim
	Về tiêu chí này thì cũng không có một quy chuẩn chung nào cả bởi vì có những người thích những chú chim sở hữu những chất giọng uy lực đanh thép thì thường lựa chọn chi có
	mỏ dày nhưng có nhưng người khác thì lại lựa chọn những chú chim có mỏ mỏng với mong muốn lựa chọn được một chú chào mào mau miệng hót suốt ngày. Tuy nhiên không phải là 
	những chú chim nào có đặc điểm nêu trên thì cũng sở hữu chất giọng như thế. Nhưng đa phân những chú chim này 80% là như vậy nên những người chơi chim đến lấy những tiêu 
	chuẩn đó để làm thước đo tương đối
4: Mình chim
	Về mình chim thì bạn lựa chọn những chú chim nào không quá to cũng không quá bé, chỉ cần chúng trông thon gọn và thanh thoát thì sẽ giúp cho những chú chim có thể di 
	chuyển thanh thoát nhất.'),
	( '0251849dac885e1123e573388a937b6d' , 'Cách chăm chào mào bổi tốt nhất' , GETDATE() , 'kinh nghiệm nuôi chim' , 
	'Cách chăm chào mào bổi luôn được sự quan tâm rất lớn từ thế giới những người yêu chim. Bởi đơn giản đây là dòng chim khó nuôi, cần sự tinh tế và kinh nghiệm lâu năm của 
	người chăm sóc. Chim chào mào bổi sau khi huấn luyện xong nếu thành công bạn sẽ có những chú chim tuyệt vời nhất, vời hình thế vóc dáng lực lượng, oai phong và giọng hót
	hàng ngày cực nịnh người.
	Cách chăm chào mào bổi 
	Vì chim chào mào thường có cuộc sống khá thoải mái, chúng được sống trong môi trường cực phong phú với đủ cung bậc, có thể nhảy nhót, bay lượn hay làm bất gì mà chúng thích.
	Nhưng khi về với chủ nhân, phải sống trong lồng chật hẹp nên việc tinh tế trong cách nuôi chào mào bổi là rất cần thiết. Đầu tiên sau một khoảng thời gian tách lồng bạn nên 
	treo lồng chim ở một nơi có nhiều người qua lại  để chim dạn dĩ hơn với con người nhưng không nên treo quá cao, hoặc khi trùm lồng bạn cũng đừng trùm kín quá phải để hé ra. 
	
	Chim chào mào cần lượng thức ăn khôn nhiều nhưng liên tục. Bạn nên để sắn chút đồ ăn, hòa quả trong lồng chim để chúng tùy thích nạp năng lượng cho mình mỗi khi cần. 
	Hãy để chút hoa quả như chuối, đu đủ, xoài… trong lồng hoặc chút cám chim. Đặc biệt là nước rất quan trọng, lúc nào trong lồng chim cũng nên chó chút nước sạch để sẵn.

	Thời gian đầu chim chào mào bổi hơi nhát nên bạn đừng quá lo lắng nếu chúng khôn hót, hoặc không nhanh nhẹn như bình thường. Sau khoảng 1 tháng chim sẽ bắt đầu dạn dĩ dần.'),
	( 'b17fbe0d73b2ebacedfb6ac1b284767c' , 'Các loại chim cảnh đẹp ở Việt nam được yêu thích nhất' , GETDATE() , 'Top loài chim' , 
'1. Chim vàng anh

	Vàng anh là một trong những loại chim cảnh ở Việt Nam chiếm được cảm tình nhiều nhất của những người sành chim cảnh. Sở hữu một một bộ lông vàng với thân hình nhỏ nhắn lại 
	quá gần gũi với người việt khi từng được nhắc trong các câu truyện cỏ tích thì thời xa xưa. Không cần quá cầu kì trong cách nuôi dưỡng chăm sóc, không cần đòi hởi chủ nhân 
	của chúng phải chăm chút từng giờ những chú chim vàng anh vẫn khỏe mạnh và thánh thót trong từng âm vực trong giọng cả của mình. Loài chim này có thể ăn các loại côn trùng 
	và hoa quả rất dễ tìm kiếm. Nếu bạn đang muốn tìm các loại chim cảnh đẹp ở Việt nam thì bạn đừng nên bỏ qua loài chim tuyệt vời này.
2. Chim chích chòe

Mặc dù chẳng sở hữu một màu lông sắc sỡ nhưng chính màu săc đen trắng lại mang đến cho chú chim nhỏ này một ngoài hình vô cùng ấn tượng. Không chỉ được đánh giá la một trong 
các loại chim cảnh đẹp ở Việt nam mà chúng còn sở hữu được một chất giọng vô cùng trong trẻo, loài chim này chỉ thực sự phù hợp với những người đam mê chim cảnh và không cảm 
thấy phiền phức khi chúng có thể hót bất kì vào thời điểm nào ở trong ngày. Nên bạn cần phải cân nhắc có nên mua những chú chim này hay không nhé

	3. Chim khuyên

Với bộ lông vàng óng mượt của mình những chú chim khuyên nhỏ bé lại có một sức hút vô cùng lớn đối với những người yêu thích các loại chim cảnh tại nước ta. Khi bạn quyết định
nuôi loài chim này bạn cần phải chắc chắn rằng minh là một người có khả năng chăm sóc và có kinh nghiệm dày dặn. Bởi chúng rất khó nuôi và khó thuần, chính bởi điều đó những 
chú chim cảnh đẹp này thu hút được một sự quan tâm đặc biệt của những người đam mê. Giọng hót của loài chim này cũng được đánh giá rất tuyệt với với nhiều âm vực và độ ngân
nga luyến láy. Những chú chim khuyên cũng được chia ra thành 2 loại trong đó chim khuyên xanh được săn lùng và yêu thích hơn cả

	4. Chim chào mào

Đây là một trong các loại chim cảnh đẹp ở Việt Nam phổ biến nhất. Dám chắc rằng những ai đang có ý định muốn chơi chim cảnh đều không thể không sở hữu một chú chào mào ở trong 
nhà. Với ngoại hình đẹp, với cái mào đặc trưng và những tách đỏ rất nổi bật loài chim này luôn rất được lòng cộng đồng yêu chim. Giọng hót của những chú chào mào cũng có nhiều 
điểm rất đặc trưng kích thích rất nhiều người muốn tìm tòi khám phá. Hiện tại cộng đồng những người chơi chim chào mào tại nước ta vô cùng đồng đảo, đây cũng là một loài chim 
cảnh đáng tự hào khi có những cuộc thi được tổ chúc thường xuyên nhất. '),
	( 'adc8a1de829b5aca8cd6f8a94b4dbf0d' , 'Chia sẻ cách nuôi chim họa mi bổi' , GETDATE() , 'kinh nghiệm nuôi chim' , 
	'Chim họa mi nổi tiếng là loài chim khó thuần, đặc biệt đối với họa mi bổi thì việc thuần hóa chúng là một việc khó khăn đòi hỏi tính kiên trì và thời gian. Nhưng nếu như 
	bạn thành công thì chắc chắn rằng kết qua sẽ khiến bạn cảm thấy vô cùng hài lòng. Dưới đây xin chia sẻ với bạn cách nuôi chim họa mi bổi, đặc biệt lưu ý với loại chim này
	bạn cần nhiều thời gian và không thể đốt cháy giai đoạn được. 
	Chim họa mi bổi sống quen với môi trường hoang dã

Trước tiên, chim họa mi bổi là những chú chim mới được đưa từ rừng về, chúng đã có một thời gian dài sinh sống và trưởng thành với môi trường tự do của rừng núi. Chúng chưa bao 
giờ tiếp xúc với con người, vì vậy khi mới được đưa về, chim họa mi bổi rất hoảng sợ và nhút nhát. Bạn phải rất cẩn thận khi nuôi chim họa mi bổi.

Bước đầu sau khi đưa chim về bạn chuẩn bị chiếc lồng phù hợp để thuần hóa chim họa mi bổi. Chiếc lồng này chỉ nên nhỏ nhắn vừa để cho chim có thể xoay người, có thể sử dụng loại
lồng thổ dân tộc hoặc mẫu lồng giả côn minh size 30 -32-34. Vì như đã nói ở trên, chim bổi rất hoảng loạn và sợ hãi, dùng lồng kích thước nhỏ để hạn chế chim nhảy loạn xạ, gây 
toác mỏ, gãy cánh hoặc có thể tử vong. Kinh nghiệm được chia sẻ là : ở giai đoạn đầu này, người nuôi nên phủ áo lồng và treo chim ở nơi yên tĩnh hạn chế tiếp xúc với con người.
Tùy theo tính cách của từng con chim bạn có thể để hé lồng ít hay nhiều.
Tìm nơi vắng vẻ yên tĩnh để treo lồng chim

Ngoài ra, bạn cũng có thể dùng một con chim họa mi mái đã được thuần để “ấp” chim đực hoặc ngược lại, để cho chim bổi bớt hoảng sợ trong giai đoạn đầu. Cách “ốp đực” rất đơn giản, bạn chỉ cần treo chim mái
đã được thuần cạnh chim đực hay ngược lại, mở hé lồng chim để chúng nhìn thấy nhau. Theo độ hấp dẫn và thu hút của loài giống, sẽ khiến cho chim họa mi bổi quên hoảng sợ, 
nhanh được thuần và nhanh quen với cuộc sống trong lồng hơn. Tuy nhiên, bạn tuyệt đối không nên dùng chim họa mi đực đã được thuần với chim họa mi đực bổi bởi vì chim họa mi
là loài có tính hiếu thắng, ganh đua và cạnh tranh nhau, phân chia địa bàn trong tự nhiên, vì thế dùng chim họa mi đực thuần bởi đực bổi sẽ bị phản tác dụng.
Chuẩn bị một chiếc lồng nhỏ xinh khi thuần chim họa mi

Ngoài việc cung cấp thức ăn đủ chất dinh dưỡng và tạo không gian yên tĩnh, người nuôi cũng nên chú ý cho chim tắm nắng và tắm nước.  Tắm nắng để cung cấp vitamin D và tạo bộ 
lông mượt mà ấp áp. Tắm nước là thói quen của chim họa mi trong tự nhiên, chúng rất cẩn thận và thử nước trước khi tắm, tuy nhiên chim họa mi tắm rất nhanh, chỉ với vài phút.
Càng được tắm nhiều, bộ lông chim càng được mướt mát, tươi tắn, và sức khỏe của chim cũng khá hơn.'),
	( '48981d702b321f55a52652da71155e67' , 'Tuân thủ những cách chăm sóc họa mi căng lửa' , GETDATE() , 'kinh nghiệm nuôi chim' , 
	'Việc nuôi dưỡng và chăm sóc chim họa mi luôn giữ được phong độ là một điều tuy đơn giản nhưng không phải ai cũng có thể làm được vì đây là công việc nhẹ nhàng nhưng cần sự tỉ mỉ và kiên trì cao. Bài viết này xin bổ xung những cách chăm sóc chim họa mi căng lửa để bạn đọc tham khảo và áp dụng.
	Với những người nuôi chim họa mi, gặp phải trường hợp chim lên lửa, xuống lửa thất thường, ngày thì nghe hót rất nhiều, ngày thì không nghe thấy chim hót lần nào… đó 
	là việc hết sức bình thường khi người nuôi chim họa mi không có các kĩ năng và chưa đủ kinh nghiệm giữ lửa cho họa mi. Những điều ảnh hưởng lớn nhất tới tạo lửa và giữ 
	lửa cho chim mà bạn cần lưu ý như : môi trường sống, chế độ dinh dưỡng, cách chăm sóc..
	Đầu tiên khi mới mang chim họa mi về, nó thường lạ người, lạ môi trường sống, thức ăn và thói quen được chăm sóc nên bao giờ cũng sợ hãi và xuống lửa; dù cho là chim mộc
	hay chim đã thuần hóa, chúng sẽ thường bỏ hót sau một vài ngày được nuôi dưỡng. 
	Duy trì chế độ ăn đầy đủ dinh dưỡng và ổn định cho chim : nên tập cho chim họa mi những chế độ ăn dinh dưỡng theo những công thức nhất định và tránh thay đổi thức ăn cho
	chim quá đột ngột. Công thức thường được áp dụng cho chim họa mi là  : gạo và trứng gà ngon. 
	Chú ý vệ sinh lồng chim thường xuyên : dọn rửa lồng chuồng thật sạch, tuyệt đối không để phân chim, giấy lót lưu cữu trong lồng ngày nọ qua ngày kia rất mất vệ sinh cho cả 
	chim và người. Tuyệt đối không làm cách gọi là “ủ chim” vì động tác này rất mất vệ sinh và phản lại tập tính sinh hoạt của loài chim, về mùa nắng nóng có thể làm chết chim 
	vì ngột ngạt.
	Thường xuyên tắm nước và tắm nắng cho chim theo lịch trình đều đặn để loại bỏ kí sinh trùng và làm ấm bộ lông chim : người nuôi có thể áp dụng chế độ tắm nước cho chim 
	họa mi mỗi ngày một lần và vào lúc nhiệt độ môi trường cao nhất trong ngày, thường thì là từ 13h tới 15h hàng ngày.
	Bạn nên chọn nơi treo lồng chim là những nơi khuất, yên tĩnh và vắng bóng người qua lại, tuyệt đối không nên để những nơi mèo, chó có thể để ý tới hay tránh những người 
	lớn cầm que gậy, chổi lau nhà, trẻ em.. để gây ồn ào và làm cho chim họa mi sợ hãi, hoảng loạn và xuống lửa. Sau một thời gian khi chim họa mi đã quen dần với môi trường ,
	bạn có thể áp dụng cách thay đổi nơi treo lồng chim, để tập cho chim dạn hơn.
'),
	( '309d3c8fc90b2cf25bf851f62e428ec7' , 'Kĩ thuật và những cách nuôi chim họa mi hót nhiều' , GETDATE() , 'kinh nghiệm nuôi chim' , '
	Hiện nay trào lưu nuôi chim được lan rộng mạnh mẻ, hiển nhiên những kinh nghiệm mà các tay chơi lão luyện làm như thế nào để chim hót nhiều cũng đã được truyền lại. 
	Tuy nhiên, hôm nay hãy để chúng tôi bật mí những “bí kíp” dưới đây để thuần hóa chim họa mi được thành công hơn nhé!
	Chọn mua chim họa mi
Điều kiện đầu tiên của việc nuôi được một chú chim họa mi hót nhiều là bạn phải chọn được chim họa mi giống tốt , thứ hai là tới cách chăm họa mi hót. Người nuôi có thể đăng 
kí các đặc điểm sau của chim họa mi :

Mắt :  bạn chọn những chú chim họa mi có đôi mắt long lanh, mắt to nhưng con ngươi nhỏ và có phản ứng nhạy bén với những tác nhân chung quanh, da quanh mắt mỏng, màu sắc của 
mắt tươi, đuôi mắt có vệt lông nhỏ màu trắng kéo dài ra sau ót. Nên chọn con có chấm đen ở đồng tử nhỏ hơn những con khác. Từ đồng tử lóe ra 4 tia mắt, nên chọn tia càng to, 
càng rõ, càng dày càng tốt. Nếu có kinh nghiệm, những người chơi chim thường quan sát kĩ xa nhãn (nhãn cầu) của chim họa mi thuộc loại nào : kim xa nhãn, thiết xa nhãn, ngân 
xa nhãn, huy xa nhãn.

Thử phản ứng của chim : bạn thử bằng cách dùng ngón trỏ nhẹ nhàng vẽ hình tròn hoặc hình chữ thập để đánh giá phản ứng của chim. Có hai trường hợp sau : nếu đó là chim nuôi
chưa thuộc thì phản ứng của nó là nhảy loạn xạ trong lồng tìm lối thoát thân. Còn chim thuần thuộc thì nó cứ đứng yên trên cần đậu, đôi mắt và chiếc đầu của nó di chuyễn theo 
hướng ngón tay vẽ hình của bạn, chứng tỏ chim có cá tính mạnh, bạo dạn, tự tin và phản xạ nhạy bén.
2. Cách nuôi chim họa mi hót nhiều
Họa mi là loài chim rất nhát, bởi vậy cách chăm sóc chim họa mi hót hay cũng phải tỉ mỉ và kì công hơn nhiều loài chim cảnh khác. Bước đầu, người nuôi nên để chim tránh tiếp 
xúc với người lạ trong khoảng một tới hai tuần, trừ lúc cho chúng ăn; cách làm như sau : trùm áo hay vải vào lồng và để nơi ít tiếng ồn, người nuôi cho chim họa mi làm quen và
tiếp xúc dần với môi trường xung quanh, nên làm từ từ và kiên trì. Thường thì trong khoảng nửa năm chim sẽ dạn với người.
Kĩ năng để có một con chim họa mi hót giọng thánh thót và nhiều giọng, bạn nên cho chim họa mi của mình đi dượt, một chú chim già rừng thường có giọng hót rất cao và trong,
mang cái hồn của thiên nhiên núi rừng. Dù cho chim họa mi bạn nuôi là chim mộc mới mang từ rừng về, bạn cũng nên mang đi dượt chim, bằng cách trùm áo lồng thật kín để chúng
nghe ngóng những con chim khác để bắt giọng.
	'),
	( 'e9dd9c14ec255e2700d76c05c70d0236' , 'Kỹ thuật thuần hóa chim họa mi mộc' , GETDATE() , 'kinh nghiệm nuôi chim' , '
	“ chọn mặt gửi vàng” một con chim đá đủ chuẩn
Phần đầu: phải to nhưng to chưa chắc đã tốt nhé , nên chọn đầu hơi bằng, gần ngang với mỏ chim vì chin có cái đầu này thường lanh lẹ, vừa lì lơn là một tuyển thủ né đòn mau lẹ.
Phần mỏ: mỏi dài vừa phải, chót mỏ hơi khum như mỏ sẻ, chiếc mỏ này sẽ mổ đau và cắn mạnh đối thủ.
Phần chân: phải to khỏe, không bị thương tật, bàn chân to
Phần thân: lớn con, dài đòn, vóc dáng oai phong
Đuôi dài và dày, để duy trì cân bằng và khi bay lên đáp xuống lách lái được dễ hơn.
	2.Cách thuần chim  họa mi
Chim mua mang về không bao giờ có được một chú chim ưng ý cả: hoặc chúng không hót, hoặc thân hình tả tơi, hoặc nhảy loạn xạ,… Nếu như kiên nhẫn chăm sóc thì không sớm thì 
	muộn bạn sẽ sở hữu chú chim hót hay đá giỏi và công sức chăm sóc bỏ ra không bị phí hoài. Trong quá trình chăm sóc sự  ân cần, chu đáo, nhẹ nhàng sẽ giúp thuần hóa chim dễ
	dàng hơn. Nếu bạn thật sự thích loài chim này, vô cùng ngưỡng mộ chúng vậy thì công sức chăm sóc bỏ ra không hề phí hoài bạn sẽ nhận được kết quả tuyệt vời khi chú chim 
	cất cao giọng hót, trổ tài, khoe sắc sẽ khiến bạn hạnh phúc hơn.
	3. Huấn luyện chim họa mi chiến đấu
Thông thường áp dụng phương pháp thuần hóa chim họa mi mộc thường mất khoảng từ 4 đến 6 tháng trường hợp chim khó thuần chắc phải tới một năm hoặc hơn. Trong quá trình chăm 
chim người ta thường đưa chim đi dượt. Người chơi chim cảnh sẽ đem chim họa mi đến để họa mi quen với chim lạ, điều này sẽ rất hay vì chim có thể tập dượt để hót hay hơn, hăng 
hái hơn, sung độ hơn.

	'),
	( '553acd22fd496a02446c6258b3ba027e' , 'Cách chăm sóc chim chào mào thay lông chuẩn kỹ thuật nhất' , GETDATE() , 'kinh nghiệm nuôi chim' , '
	1. Chế độ dinh dưỡng

Nhưng chú chim chào mào thay lông có những biểu hiện rất rõ ràng và chắc chắn rằng bất kì một người yêu chim nào cũng có thể nắm được trong lúc này chúng rất cần được bổ xung 
thêm các loại thức ăn tươi như cào cào, ở giai đoạn này không nên chó chúng ăn sâu khô nhé vì sâu khô sẽ khiến cho bộ lông của chúng quăn và rất xấu. 

Bạn có thể cho chúng ăn thêm lạc rang xay nhỏ ra rồi trộn vào cám để những chất béo này sẽ kích thích lông cho chúng mọc nhanh và mượt. Về trái cây thì lựa chọn những loại có 
tính mát và có sắc tố màu tự nhiên như cam, dưa hấu hay đủ đủ và thay đổi loại hàng ngày để chim có thể hấp thu được các sắc tố màu này tự nhiên nhất. Đây là cách mà các nghệ
nhân thường áp dụng và cho một kết quả khá tốt
	2. Cách tắm

Cho những chú chim chào mào tắm nắng hoặc tắm nước là một trong những bước không thể thiếu được trong cách chăm sóc chi chào mào thay lông. Mỗi 1 ngày bạn cho chúng tắm nắng 
nhẹ để kích thích cho những chiếc lông mới mọc nhanh và tắm nước để những chiếc lông cũ nhanh rụng. 

	3. Môi trướng sống

Thông thường 1 chú chim chào mào thay lông hoàn chỉn trong khoảng tối đa 3 tháng thậm chí làcó thể sớm hơn tuy vào đặc điểm từng chú chim. Môi trường sống cũng khá quan trọng 
đối với chúng. Nếu như bạn không giữ được sự ổn định đôi khi chúng còn đột ngột ngừng việc thay lông. Điều này khiến chúng phải mất thêm 1 khoảng thời gian dài nữa rất bất tiện.

	'),
	( 'd6d001e31f4065bbe402bc2eac44ca22' , 'Những kinh nghiệm vàng trong cách nuôi chào mào bổi thành mồi' , GETDATE() , 'kinh nghiệm nuôi chim' , '
	Cách nuôi chào mào bổi thành mồi
Chào mào bổi cũng có con này con nọ không phải con nào cũng có thể sở hữu được một chất giọng hoàn hảo. Nếu bạn may mắn sở hữu được một chú bổi ngon lành chắc chắn rằng khi vào 
đấu trường chúng sẽ thể hiện được bản lĩnh thực sự của mình. 
	1. Cách tập cho chào mào bổi dạn.

Khi bạn đã sở hữu được một chú chào mào bổi chất lượng thì đầu tiên bạn phải huấn luyện chúng để chúng có thể quên đi cuộc sống ngoài thiên nhiên rộng lớn. Để chúng dạn người
hơn và làm quen với cuộc sống ở trong lồng. Muốn chào mào dạn nên treo chim ở những nơi có nhiều người qua lại nhưng áo lồng phải được mở từ từ. Không nên vội vàng nếu không
những chú chim này sẽ sợ hài.

	2. Tập cho chào mào bổi ăn 

Khi mới được bắt những chú chim chào mào bổi sẽ khó làm quen với các loại thức ăn như cám nên giai đoạn đầu bạn nên cho chúng ăn hoa quả + với những chú chào cào. Bạn có thể 
nhốt chung những chú chào mào bổi cũng với những chú chim mái để chúng được dạn dĩ hơn và cũng học được cách ăn cám tắm rửa của những chú chim này. Khi chim đã dạn hơn thì bạn
chuyển chúng đến các vị trí khác nhau để chúng có thể thích nghi với nhiều môi trường. Sau đó khoảng 1 thời gian sau bạn đã có thể cho chim đi dợt rồi.

Bạn cứ tiếp tục cho đến khi chim bổi đã được thuần, thuần đễn mức có người đến chún cũng không sở hãi trổ lồng nữa thì bạn mang chúng đi cùng những chú chim mồi khác để chúng
có thể làm quen dần với tiếng hót của những chú chim mồi thành thục.
');
	
