CREATE DATABASE IF NOT EXISTS food_ordering_db;
USE food_ordering_db;

DROP TABLE IF EXISTS Rating;
DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS Order_details;
DROP TABLE IF EXISTS delivery_details;
DROP TABLE IF EXISTS Payment_details;
DROP TABLE IF EXISTS Menu_items;
DROP TABLE IF EXISTS category;
DROP TABLE IF EXISTS restaurant;
DROP TABLE IF EXISTS customer;
DROP TABLE IF EXISTS Admin;

CREATE TABLE Admin (
  Admin_id INT PRIMARY KEY,
  Admin_name VARCHAR(50) NOT NULL,
  Admin_password VARCHAR(50) NOT NULL
);

INSERT INTO Admin (Admin_id, Admin_name, Admin_password)
VALUES (1, 'Team-MEM', 'MEM@123');

CREATE TABLE customer (
  customer_id INT PRIMARY KEY,
  customer_firstname VARCHAR(30) NOT NULL,
  customer_lastname VARCHAR(30) NOT NULL,
  customer_password VARCHAR(50) NOT NULL,
  customer_phoneno VARCHAR(20) NOT NULL,
  customer_address VARCHAR(200) NOT NULL,
  customer_email VARCHAR(100) NOT NULL,
  Admin_id INT,
  FOREIGN KEY (Admin_id) REFERENCES Admin(Admin_id)
);

INSERT INTO customer VALUES (101,'Harsh','Mehta','harsh@123','7435068222','1st Cross,Rammurthy nagar,Bangalore','harsh19@gmail.com',1);
INSERT INTO customer VALUES (102,'Jainam','Shah','Jainu@123','9924567892','117, Examiner Road, Fort,Mumbai, Maharashtra','1ainam33@gmail.com1',1);
INSERT INTO customer VALUES (103,'Aman','Pandya','Aman@123','7834578923','L 69 Sector 11,Delhi,Uttar Pradesh- 201301','aman@gmail.com',1);
INSERT INTO customer VALUES (104,'Heer','Madia','Her@123','8902345789','Bee H-138, Kodambakkam Road,Chennai, Tamil Nadu','heer1723@gmail.com',1);
INSERT INTO customer VALUES (105,'Akanksha','Yadav','Akayad@123','9934654001','295 AjRoad:10, West Hydrebad, Andhra Pradesh','akuu@gmail.com',1);
INSERT INTO customer VALUES (106,'Karan','Punjabi','karpun@123','9934688001','Nirmal House Opp Jain Mandir,Jalandhar,Punjab','karan12@gmail.com',1);
INSERT INTO customer VALUES (107,'Divya','Mulchandanr','divmul@123','9874688001','A/3, Tejpal Indl Estate,Andheri (west),Maharashtra','div3421@gmail.com',1);
INSERT INTO customer VALUES (108,'Celia','Anthony','Celia@123','7834654881','134,14,Nagarathpet Main Road,Banglore,Karnataka','Celia44@gmail.com',1);
INSERT INTO customer VALUES (109,'Johnson','Thomas','Jthomas@123','9931888912','A/108 Paldi,Ahmeadabad,Gujrat','1thomas550@gmail.com',1);
INSERT INTO customer VALUES (110,'Dhara','Mohan','BhatrDhara@1231','9875678001','66 Sector 24 Mujessar,Ram Colony,Delhi,Haryana','dbhatt45@gmail.com',1);

CREATE TABLE restaurant (
  Admin_id INT,
  restaurant_id INT PRIMARY KEY,
  restaurant_name VARCHAR(100) NOT NULL,
  restaurant_address VARCHAR(200) NOT NULL,
  restaurant_password VARCHAR(50) NOT NULL,
  restaurant_phoneno VARCHAR(20) NOT NULL,
  FOREIGN KEY (Admin_id) REFERENCES Admin(Admin_id)
);

INSERT INTO restaurant VALUES(1,111,'Hot chilly','66,Residency Rd. Bengaluru, Karnataka','hc@111','8066604545');
INSERT INTO restaurant VALUES(1,112,'Hatch','F-30,Sampige Rd,Bengaluru,Karnataka','Hat@112','8762203148');
INSERT INTO restaurant VALUES(1,113,'Spice Terrace','24,Ashok nagar , ludhiana ,Punjab','Spi@113','8067189999');
INSERT INTO restaurant VALUES(1,114,'Yay Mumbar','Raheja Tower, Bandra East, Mumbai,Maharashtra','Yay@l14','9222222800');
INSERT INTO restaurant VALUES(1,115,'UmniraoX','7-215 Andheri east,Maharashtra','Umn@123','9773817937');
INSERT INTO restaurant VALUES(1,116,'Sowento','Level-8, Connaught Place, New Delhi, Delhi','Sow@l16','1141191040');
INSERT INTO restaurant VALUES(1,117,'Taj Hotel','154 Khan Market, India Gate, New Delhi. Delhi','tajr@117','1166566162');
INSERT INTO restaurant VALUES(1,118,'Anna Restaurant','Spur Tank road. Chennai, Tamil Nadu','Anna@118','4428368333');
INSERT INTO restaurant VALUES(1,119,'Rajwadii','Behind uth-Temple, Ahmedabad, Gujarat','Raj@119','7926643839');
INSERT INTO restaurant VALUES(1,120,'Kobe sizzler','Vasna Rd. Wake.Society.Nagar Himachal pradesh','Kobe@120','8889323457');

CREATE TABLE category (
  category_id INT PRIMARY KEY,
  category_name VARCHAR(50) NOT NULL,
  restaurant_id INT,
  FOREIGN KEY (restaurant_id) REFERENCES restaurant(restaurant_id)
);

INSERT INTO category VALUES (201,'SOUTH-INDIAN',112);
INSERT INTO category VALUES (202,'NORTH-INDIAN',111);
INSERT INTO category VALUES (203,'ITALIAN',115);
INSERT INTO category VALUES (204,'CHINESE',113);
INSERT INTO category VALUES (205,'KATHIAWADI',114);
INSERT INTO category VALUES (206,'SNACKS',118);
INSERT INTO category VALUES (207,'BEVRAGES',119);
INSERT INTO category VALUES (208,'DESSERTS',120);
INSERT INTO category VALUES (209,'ALL',116);
INSERT INTO category VALUES (210,'CONTINENTAL',117);

CREATE TABLE Menu_items (
  item_code INT PRIMARY KEY,
  item_name VARCHAR(100) NOT NULL,
  Price INT NOT NULL,
  category_id INT,
  FOREIGN KEY (category_id) REFERENCES category(category_id)
);

INSERT INTO Menu_items VALUES(301,'White Pasta',230,203);
INSERT INTO Menu_items VALUES(302,'Arabita Pasta',200,203);
INSERT INTO Menu_items VALUES(303,'Magherita pizza',400,203);
INSERT INTO Menu_items VALUES(304,'gotala dosa',300,201);
INSERT INTO Menu_items VALUES(305,'uttampam',115,201);
INSERT INTO Menu_items VALUES(306,'idli-sambhar',120,201);
INSERT INTO Menu_items VALUES(307,'aloo-cheese paratha',120,202);
INSERT INTO Menu_items VALUES(308,'Paneer pasanda',250,202);
INSERT INTO Menu_items VALUES(309,'chole kulche',100,202);
INSERT INTO Menu_items VALUES(310,'Dry manchrian',200,204);
INSERT INTO Menu_items VALUES(311,'CHINESE BHEL',150,204);
INSERT INTO Menu_items VALUES(312,'Fried rice',210,204);
INSERT INTO Menu_items VALUES(313,'lasaniya bataka',250,205);
INSERT INTO Menu_items VALUES(314,'rigan no olo',300,205);
INSERT INTO Menu_items VALUES(315,'sev tameta nu shaak',220,205);
INSERT INTO Menu_items VALUES(316,'waffle',220,208);
INSERT INTO Menu_items VALUES(317,'chocolate brownie',115,208);
INSERT INTO Menu_items VALUES(318,'pancakes',120,208);
INSERT INTO Menu_items VALUES(319,'burger',55,206);
INSERT INTO Menu_items VALUES(320,'french fries',100,206);
INSERT INTO Menu_items VALUES(321,'muskabun',25,206);
INSERT INTO Menu_items VALUES(322,'peach mojito',180,207);
INSERT INTO Menu_items VALUES(323,'hazlenut coffee',135,207);
INSERT INTO Menu_items VALUES(324,'kewi juice',90,207);
INSERT INTO Menu_items VALUES(325,'French toast',100,210);
INSERT INTO Menu_items VALUES(326,'Pancakes',180,209);
INSERT INTO Menu_items VALUES(327,'Steaks',335,210);

CREATE TABLE Payment_details (
  payment_id INT PRIMARY KEY,
  payment_mode VARCHAR(20) NOT NULL,
  payment_timestamp DATETIME NOT NULL
);

INSERT INTO Payment_details VALUES (501,'Online','2022-01-15 11:12:33');
INSERT INTO Payment_details VALUES (502,'COD','2022-02-11 09:06:30');
INSERT INTO Payment_details VALUES (503,'CARD','2022-06-22 01:10:22');
INSERT INTO Payment_details VALUES (504,'COD','2021-04-02 05:12:03');
INSERT INTO Payment_details VALUES (506,'COD','2021-07-27 01:13:13');
INSERT INTO Payment_details VALUES (507,'CARD','2022-05-09 09:08:48');
INSERT INTO Payment_details VALUES (508,'COD','2021-12-28 10:07:53');
INSERT INTO Payment_details VALUES (509,'Online','2022-03-05 07:17:37');
INSERT INTO Payment_details VALUES (510,'CARD','2022-01-16 09:19:22');

CREATE TABLE delivery_details (
  delivery_id INT PRIMARY KEY,
  delivery_address VARCHAR(255) NOT NULL,
  delivery_status VARCHAR(50) NOT NULL
);

INSERT INTO delivery_details VALUES (401,'Akshya Nagar 1st Block 1st Cross nagar,Bangalore','Delivered');
INSERT INTO delivery_details VALUES (402,'Nirmal House, Thane ,Mumbai,Maharashta','Delivered');
INSERT INTO delivery_details VALUES (403,'L 69 Sector 11,Delhi,Uttar Pradesh','Preparing');
INSERT INTO delivery_details VALUES (404,'B_h 138, Kodambakkam High Road,Chennai,Tamil Nadu','Picked-up');
INSERT INTO delivery_details VALUES (405,'295 Aj-kauser Hydrebad,Andhra Pradesh','Delivered');
INSERT INTO delivery_details VALUES (406,'117,Nagindas Road,Mumbai,Maharashtra','preparing');
INSERT INTO delivery_details VALUES (407,'A13, Tejpal Indl Estate, Mumbai, Maharashta','Preparing');
INSERT INTO delivery_details VALUES (408,'134/135 Nagarathpet,Banglore,Karnataka','Delivered');
INSERT INTO delivery_details VALUES (409,'66 Sector 24, Ram Colony,Delhi,Haryana','Picked-up');
INSERT INTO delivery_details VALUES (410,'A/108, Paldi,Ahmeadabad,Gujrat','Picked-up');

CREATE TABLE Order_details (
  Order_id INT PRIMARY KEY,
  Order_time DATETIME,
  Order_amount INT NOT NULL,
  Order_status VARCHAR(50) NOT NULL,
  customer_id INT,
  delivery_id INT,
  payment_id INT,
  restaurant_id INT,
  FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
  FOREIGN KEY (delivery_id) REFERENCES delivery_details(delivery_id),
  FOREIGN KEY (payment_id) REFERENCES Payment_details(payment_id),
  FOREIGN KEY (restaurant_id) REFERENCES restaurant(restaurant_id)
);

INSERT INTO Order_details VALUES (601,'2022-02-11 09:06:30',240,'Preparing',101,401,501,111);
INSERT INTO Order_details VALUES (603,'2021-04-02 05:12:03',345,'delivered',103,409,503,117);
INSERT INTO Order_details VALUES (604,'2021-07-27 01:13:13',400,'preparing',104,404,504,112);
INSERT INTO Order_details VALUES (605,'2022-05-09 09:08:48',250,'delivered',104,404,509,119);
INSERT INTO Order_details VALUES (606,'2021-12-28 10:07:53',230,'preparing',106,406,506,114);
INSERT INTO Order_details VALUES (607,'2022-03-05 07:17:37',300,'delivered',108,408,507,113);
INSERT INTO Order_details VALUES (608,'2022-01-16 09:19:22',50,'preparing',109,410,508,120);

CREATE TABLE Orders (
  quantity INT NOT NULL,
  Order_id INT,
  item_code INT,
  FOREIGN KEY (Order_id) REFERENCES Order_details(Order_id),
  FOREIGN KEY (item_code) REFERENCES Menu_items(item_code)
);

INSERT INTO Orders VALUES (2,601,307);
INSERT INTO Orders VALUES (3,603,305);
INSERT INTO Orders VALUES (2,604,310);
INSERT INTO Orders VALUES (1,605,313);
INSERT INTO Orders VALUES (1,606,301);
INSERT INTO Orders VALUES (3,607,306);
INSERT INTO Orders VALUES (2,608,321);

CREATE TABLE Rating (
  ratings INT NOT NULL,
  customer_id INT,
  restaurant_id INT,
  FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
  FOREIGN KEY (restaurant_id) REFERENCES restaurant(restaurant_id)
);

INSERT INTO Rating VALUES (3,101,111);
INSERT INTO Rating VALUES (4,102,114);
INSERT INTO Rating VALUES (2,103,117);
INSERT INTO Rating VALUES (4,104,120);
INSERT INTO Rating VALUES (3,106,115);
INSERT INTO Rating VALUES (4,108,113);
INSERT INTO Rating VALUES (3,109,112);
INSERT INTO Rating VALUES (4,110,119);
INSERT INTO Rating VALUES (3,109,116);



