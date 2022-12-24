Create database Pizza_Kingdom

Drop database Pizza_Kingdom

Create Table Tbl_Customer(
	C_ID int primary key identity (1,1), 
	C_Name NVarchar(30) not null, 
	C_Surname NVarchar(30) not null, 
	C_PhoneNum  Char (12) not null,
	C_email Varchar(50) not null,  
	C_Password Varchar(12) not null, 
)

Create Table Tbl_Address(
	A_ID int primary key identity (1,1), 
	A_Province NVarchar(20) not null,  
	A_District NVarchar(30) not null, 
	A_Detailed_Address  NVarChar (max) not null,  
	FK_C_ID int foreign key references Tbl_Customer(C_ID) not null
)

Create Table Tbl_Payment(
	Pay_ID int primary key identity (1,1), 
	Pay_Type NVarchar(15) not null,
	Pay_TotalPrice Smallmoney not null
)

Create Table Tbl_FeedBack(
	F_ID int primary key identity (1,1), 
	F_Order tinyint,
	F_Branch tinyint,
	F_Courier tinyint
)

Create Table Tbl_Pizza(
	P_ID int primary key identity (1,1), 
	P_Name NVarchar(30) not null,
	P_Base Varchar(5) not null,
	P_Price Smallmoney not null,
	P_Ingredients NVarchar(max) not null,
	P_Amount tinyint not null
)

Create Table Tbl_Branch(
	B_ID int primary key identity (1,1), 
	B_Name NVarchar(30) not null,
	B_PhoneNum Char(12) not null,
	B_Province NVarchar(20) not null
)

Create Table Tbl_Courier(
	Co_ID int primary key identity (1,1), 
	Co_Name NVarchar(30) not null,
	Co_SurName NVarChar(30) not null,
	Co_PhoneNum Char(12) not null,
	FK_B_ID int foreign key references Tbl_Branch(B_ID) not null,
	Co_Age tinyint
)

alter table Tbl_Courier drop column Co_Age  /*Kuryenin yaþ bilgisi bu veritabaný için gereksiz olduðundan alter ve drop komutlarýný 
kullanarak Co_Age sütunu silindi.*/

Create Table Tbl_Order(
	O_ID int primary key identity (1,1), 
	O_OrderStatus NVarchar(30) not null,
	O_CheckTime datetime not null,
	O_TotalPrice Smallmoney not null,
	FK_B_ID int foreign key references Tbl_Branch(B_ID) not null,
	FK_C_ID int foreign key references Tbl_Customer(C_ID) not null,
	FK_F_ID int foreign key references Tbl_FeedBack(F_ID) not null,
	FK_Pay_ID int foreign key references Tbl_Payment(Pay_ID) not null
)

Create Table Tbl_Include(
	--I_ID int primary key identity (1,1), aþaðýda alter ile eklendi. 
	FK_P_ID int foreign key references Tbl_Pizza(P_ID) not null,
	FK_O_ID int foreign key references Tbl_Order(O_ID) not null
)

alter table Tbl_Include add I_ID int primary key identity (1,1) not null /* primary key eklenmesi gerektiði için alter ve add 
komutlarý kullanarak eklendi.*/

create table Tbl_Ingredients(    --bu tabloyu kullanýlmayacaðý için aþaðýda drop komutu kullanýlarak silindi. 
	In_ID int primary key identity(1,1),
	In_sausage bit,
	In_cheese bit,
	In_olive bit,
	In_mushroom bit
)
drop table Tbl_Ingredients 

--Customer veri giriþi aþaðýda gerçekleþtirilmiþtir. 

insert into Tbl_Customer values ('Aylin','Taþkýran','905333716763','aylintskran@gmail.com','aylin123')
insert into Tbl_Customer values ('Elif','Kahraman','905367090521','elifkahramanx@gmail.com','elif123')
insert into Tbl_Customer values ('Begüm','Ýbriþim','905315175352','begumibrisim@gmail.com','begüm123')
insert into Tbl_Customer values ('Tuana','Avcu','905324564445','tuanaavcu@gmail.com','tuana123')
insert into Tbl_Customer values ('Görkem','Öksüzoðlu','905324565668','gorkemoksuzoglu@gmail.com','görkem123')
insert into Tbl_Customer values ('Tunahan','Taþçý','905315175455','tunahantasci@gmail.com','tunahan123')
insert into Tbl_Customer values ('Talha','Osmanoðlu','905315171212','talhaosmanoglu@gmail.com','talha123')
insert into Tbl_Customer values ('Emirhan','Kabakçý','905315179698','emirhankabakci@gmail.com','emirhan123')
insert into Tbl_Customer values ('Emir','Yýlmaz','905315177875','emir@gmail.com','emir123')
insert into Tbl_Customer values ('Hakan','Gök','905315178282','hakan@gmail.com','hakan123')
insert into Tbl_Customer values ('Asya','Yýlmaz','905315151212','asyayýlmaz@gmail.com','asya123')
insert into Tbl_Customer values ('Volkan','Arslan','905315176269','volkan@gmail.com','volkan123')
insert into Tbl_Customer values ('Melek','Su','905315172027','meleksu@gmail.com','melek123')
insert into Tbl_Customer values ('Kemal','Er','905315179695','kemal@gmail.com','kemal123')
insert into Tbl_Customer values ('Ýlke','Öz','905315177541','ilkeoz@gmail.com','ilke123')
insert into Tbl_Customer values ('Ahmet','Er','905315172423','ahmeter@gmail.com','ahmet123')
insert into Tbl_Customer values ('Namýk','Kemal','905315172441','namikkemal@gmail.com','namikk123')
insert into Tbl_Customer values ('Asya','Çiçek','905315175156','asyacicek@gmail.com','asyacicek123')
insert into Tbl_Customer values ('Su','Ateþ','905315174546','suates@gmail.com','su123')
insert into Tbl_Customer values ('Görkem2','Öksüzoðlu','905324565668','gorkemoksuzoglu@gmail.com','görkem123')
insert into Tbl_Customer values ('Uras','Çelik','905324565112','urascelik@gmail.com','uras123')

select * from Tbl_Customer --Customer tablosunu görüntelemek için select komutunu kullandýk.

delete from Tbl_Customer where C_Name='Görkem2' --Görkem2 ismi geçersiz olduðu için delete komutuyla veri tablosundan silindi.

--Address veri giriþi aþaðýda gerçekleþtirilmiþtir.

insert into Tbl_Address(A_Province, A_District, A_Detailed_Address, FK_C_ID) values ('Istanbul', 'Bakýrköy' , 'Çiçek Sok. No:50', 1)
insert into Tbl_Address(A_Province, A_District, A_Detailed_Address, FK_C_ID) values ('Istanbul', 'Bahçelievler' , 'Papatya Sok. No:06', 2)
insert into Tbl_Address(A_Province, A_District, A_Detailed_Address, FK_C_ID) values ('Istanbul', 'Bahçelievler' , 'Güneþ Sok. No:40', 3)
insert into Tbl_Address(A_Province, A_District, A_Detailed_Address, FK_C_ID) values ('Istanbul', 'Baðcýlar' , 'Ay Sok. No:70', 4)
insert into Tbl_Address(A_Province, A_District, A_Detailed_Address, FK_C_ID) values ('Istanbul', 'Kadýköy' , 'Nar Sok. No:51', 21)
insert into Tbl_Address(A_Province, A_District, A_Detailed_Address, FK_C_ID) values ('Istanbul', 'Kadýköy' , 'Çilek Sok. No:12', 5)
insert into Tbl_Address(A_Province, A_District, A_Detailed_Address, FK_C_ID) values ('Istanbul', 'Esenler' , 'Gül Sok. No:95', 6)
insert into Tbl_Address(A_Province, A_District, A_Detailed_Address, FK_C_ID) values ('Istanbul', 'Büyükçekmece' , 'Karanfil Sok. No:65', 7)
insert into Tbl_Address(A_Province, A_District, A_Detailed_Address, FK_C_ID) values ('Istanbul', 'Küçükçekmece' , 'Kral Sok. No:34', 8)
insert into Tbl_Address(A_Province, A_District, A_Detailed_Address, FK_C_ID) values ('Istanbul', 'Sarýyer' , 'Kedi Sok. No:44', 9)
insert into Tbl_Address(A_Province, A_District, A_Detailed_Address, FK_C_ID) values ('Istanbul', 'Arnavutköy' , 'Orkide Sok. No:32', 19)
insert into Tbl_Address(A_Province, A_District, A_Detailed_Address, FK_C_ID) values ('Istanbul','Pendik','Kraliçe Sok. No:64', 10)
insert into Tbl_Address(A_Province, A_District, A_Detailed_Address, FK_C_ID) values ('Istanbul','Beþiktaþ','Limon Sok. No:86', 11)
insert into Tbl_Address(A_Province, A_District, A_Detailed_Address, FK_C_ID) values ('Istanbul','Etiler','Portakal Sok. No:37', 12)
insert into Tbl_Address(A_Province, A_District, A_Detailed_Address, FK_C_ID) values ('Istanbul','Levent','Paþa Sok. No:89', 13)
insert into Tbl_Address(A_Province, A_District, A_Detailed_Address, FK_C_ID) values ('Istanbul','Kartal','Ay Sok. No:47', 14)
insert into Tbl_Address(A_Province, A_District, A_Detailed_Address, FK_C_ID) values ('Istanbul','Bayrampaþa','Dere Sok. No:67', 15)
insert into Tbl_Address(A_Province, A_District, A_Detailed_Address, FK_C_ID) values ('Istanbul','Çatalca','Ördek Sok. No:21', 16)
insert into Tbl_Address(A_Province, A_District, A_Detailed_Address, FK_C_ID) values ('Istanbul','Güneþli','Araba Sok. No:72', 17)
insert into Tbl_Address(A_Province, A_District, A_Detailed_Address, FK_C_ID) values ('Istanbul','Beylikdüzü','Civciv Sok. No:48', 18)

select * from Tbl_Address

update Tbl_Address set A_Detailed_Address='Gök Sok. No:16' where A_ID=1 /*Detaylý adres, 1 numaralý ID'e sahip müþteri taþýndýðý 
ve adres deðiþikliði yaptýðý için update komutu kullanarak güncellendi.*/

--Payment veri giriþi aþaðýda gerçekleþtirilmiþtir.

insert into Tbl_Payment(Pay_Type, Pay_TotalPrice) values ('Kapýda Ödeme' , '20')
insert into Tbl_Payment(Pay_Type, Pay_TotalPrice) values ('Online Ödeme' , '20')
insert into Tbl_Payment(Pay_Type, Pay_TotalPrice) values ('Nakit' , '60')
insert into Tbl_Payment(Pay_Type, Pay_TotalPrice) values ('Kapýda Ödeme' , '0')
insert into Tbl_Payment(Pay_Type, Pay_TotalPrice) values ('Online Ödeme' , '40')
insert into Tbl_Payment(Pay_Type, Pay_TotalPrice) values ('Nakit' , '20')
insert into Tbl_Payment(Pay_Type, Pay_TotalPrice) values ('Online Ödeme' , '60')
insert into Tbl_Payment(Pay_Type, Pay_TotalPrice) values ('Kapýda Ödeme' , '120')
insert into Tbl_Payment(Pay_Type, Pay_TotalPrice) values ('Online Ödeme' , '140')
insert into Tbl_Payment(Pay_Type, Pay_TotalPrice) values ('Online Ödeme' , '20')
insert into Tbl_Payment values ('Online Ödeme','0')
insert into Tbl_Payment values ('Nakit','60')
insert into Tbl_Payment values ('Kapýda Ödeme','80')
insert into Tbl_Payment values ('Online Ödeme','40')
insert into Tbl_Payment values ('Kapýda Ödeme','120')
insert into Tbl_Payment values ('Nakit','0')
insert into Tbl_Payment values ('Online Ödeme','40')
insert into Tbl_Payment values ('Nakit','60')
insert into Tbl_Payment values ('Online Ödeme','100')
insert into Tbl_Payment values ('Kapýda Ödeme','20')
insert into Tbl_Payment values ('Nakit','40')
insert into Tbl_Payment values ('Kapýda Ödeme','40')

select * from Tbl_Payment
delete from Tbl_Payment where Pay_TotalPrice=0   /* TotalPrice 0 olarak girilmiþ ve bu iþlemler yanlýþ olduðu için
Delete komutu ile 0 girilenler silindi. */

--FeedBack veri giriþi aþaðýda gerçekleþtirilmiþtir.

insert into Tbl_FeedBack(F_Order, F_Branch, F_Courier) values ('2', '4', '5')
insert into Tbl_FeedBack(F_Order, F_Branch, F_Courier) values ('3', '2', '0')
insert into Tbl_FeedBack(F_Order, F_Branch, F_Courier) values ('1', '4', '3')
insert into Tbl_FeedBack(F_Order, F_Branch, F_Courier) values ('3', '', '4')
insert into Tbl_FeedBack(F_Order, F_Branch, F_Courier) values ('2', '3', '5')
insert into Tbl_FeedBack(F_Order, F_Branch, F_Courier) values ('5', '4', '5')
insert into Tbl_FeedBack(F_Order, F_Branch, F_Courier) values ('2', '3', '5')
insert into Tbl_FeedBack(F_Order, F_Branch, F_Courier) values ('2', '1', '2')
insert into Tbl_FeedBack(F_Order, F_Branch, F_Courier) values ('1', '1', '5')
insert into Tbl_FeedBack(F_Order, F_Branch, F_Courier) values ('2', '3', '5')
insert into Tbl_FeedBack(F_Order, F_Branch, F_Courier) values ('3', '4', '0')
insert into Tbl_FeedBack(F_Order, F_Branch, F_Courier) values ('3', '1', '3')
insert into Tbl_FeedBack(F_Order, F_Branch, F_Courier) values ('', '', '')
insert into Tbl_FeedBack(F_Order, F_Branch, F_Courier) values ('0', '4', '1')
insert into Tbl_FeedBack(F_Order, F_Branch, F_Courier) values ('3', '0', '4')
insert into Tbl_FeedBack(F_Order, F_Branch, F_Courier) values ('5', '5', '5')
insert into Tbl_FeedBack(F_Order, F_Branch, F_Courier) values ('5', '0', '5')
insert into Tbl_FeedBack(F_Order, F_Branch, F_Courier) values ('2', '1', '3')
insert into Tbl_FeedBack(F_Order, F_Branch, F_Courier) values ('2', '0', '5')
insert into Tbl_FeedBack(F_Order, F_Branch, F_Courier) values ('2', '1', '3')

select * from Tbl_FeedBack

--Pizza veri giriþi aþaðýda gerçekleþtirilmiþtir.

insert into Tbl_Pizza(P_Name, P_Base, P_Price, P_Ingredients, P_Amount) values ('Karýþýk', 'Kalýn', '20', 'Sucuk', '2')
insert into Tbl_Pizza(P_Name, P_Base, P_Price, P_Ingredients,P_Amount) values ('Sosyal', 'Ýnce', '20', 'Salam', '3')
insert into Tbl_Pizza(P_Name, P_Base, P_Price, P_Ingredients,P_Amount) values ('Karýþýk', 'Ýnce', '20', 'Sucuk', '1')
insert into Tbl_Pizza values ('Sosyal','Kalýn', '20', 'Salam', '5')
insert into Tbl_Pizza values ('Vejeteryan','Kalýn', '40', 'Brokoli', '4')
insert into Tbl_Pizza values ('Vejeteryan','Ýnce', '40', 'Brokoli', '3')

select * from Tbl_Pizza

--Branch veri giriþi aþaðýda gerçekleþtirilmiþtir. 8 Þube olduðundan dolayý 8 adet veri giriþi yapýlmýþtýr.

insert into Tbl_Branch(B_Name, B_PhoneNum, B_Province) values ('Kartal Þube', '02164564541', 'Istanbul')
insert into Tbl_Branch(B_Name, B_PhoneNum, B_Province) values ('Kadýköy Þube', '02164564773', 'Istanbul')
insert into Tbl_Branch(B_Name, B_PhoneNum, B_Province) values ('Sarýyer Þube', '02164564746', 'Istanbul')
insert into Tbl_Branch(B_Name, B_PhoneNum, B_Province) values ('Beþiktaþ Þube', '02164567443', 'Istanbul')
insert into Tbl_Branch values ('Bakýrköy Þube ','02127478985', 'Istanbul')
insert into Tbl_Branch values ('Çatalca Þube ','02127474696', 'Istanbul')
insert into Tbl_Branch values ('Beylikdüzü Þube ','02127472324', 'Istanbul')
insert into Tbl_Branch values ('Büyükçekmece Þube ','02127474547', 'Istanbul')

select * from Tbl_Branch

--Courier veri giriþi aþaðýda gerçekleþtirilmiþtir.  8 Þube ve her þubede 2 kurye olduðundan dolayý toplam 16 kuryenin veri giriþi yapýlmýþtýr. 

insert into Tbl_Courier(Co_Name, Co_SurName, Co_PhoneNum, FK_B_ID) values ('Ali', 'Veli', '905324567172', 2)
insert into Tbl_Courier(Co_Name, Co_SurName, Co_PhoneNum, FK_B_ID) values ('Fatma', 'Kayýk', '905324564746',5)
insert into Tbl_Courier(Co_Name, Co_SurName, Co_PhoneNum, FK_B_ID) values ('Lale', 'Çiçek', '905324562324',7)
insert into Tbl_Courier(Co_Name, Co_SurName, Co_PhoneNum, FK_B_ID) values ('Fatmagül', 'Taþ', '905324567974',4)
insert into Tbl_Courier(Co_Name, Co_SurName, Co_PhoneNum, FK_B_ID) values ('Burak', 'Yalçýn', '905324567476',3)
insert into Tbl_Courier(Co_Name, Co_SurName, Co_PhoneNum, FK_B_ID) values ('Yýlmaz', 'Er', '905324567176',3)
insert into Tbl_Courier(Co_Name, Co_SurName, Co_PhoneNum, FK_B_ID) values ('Ayþe ','Gül', '905327890256',8)
insert into Tbl_Courier(Co_Name, Co_SurName, Co_PhoneNum, FK_B_ID) values ('Kerem ','Çam', '905327897875',5)
insert into Tbl_Courier(Co_Name, Co_SurName, Co_PhoneNum, FK_B_ID) values ('Þelale ','Þimþek', '905327894369',8)
insert into Tbl_Courier(Co_Name, Co_SurName, Co_PhoneNum, FK_B_ID) values ('Aysen ','Böcek', '905327894574',1)
insert into Tbl_Courier(Co_Name, Co_SurName, Co_PhoneNum, FK_B_ID) values ('Kerem ','Cem', '905327897475',6)
insert into Tbl_Courier(Co_Name, Co_SurName, Co_PhoneNum, FK_B_ID) values ('Özge ','Turan', '905327897578',1)
insert into Tbl_Courier(Co_Name, Co_SurName, Co_PhoneNum, FK_B_ID) values ('Kemal ','Gönül', '905327894543',3)
insert into Tbl_Courier(Co_Name, Co_SurName, Co_PhoneNum, FK_B_ID) values ('Nermin','Kral', '905327897576',6)
insert into Tbl_Courier(Co_Name, Co_SurName, Co_PhoneNum, FK_B_ID) values ('Seyfi ','Tuðla', '905327897674',5)
insert into Tbl_Courier(Co_Name, Co_SurName, Co_PhoneNum, FK_B_ID) values ('Necmi ','Tuþ', '905327897473',1)

select * from Tbl_Courier

update Tbl_Courier set Co_PhoneNum='905324578899' where Co_Name='Kerem' and Co_SurName='Çam' /* Kuryenin telefon numarasýný deðiþtirmesi 
sebebiyle update komutu ile numara bilgisi deðiþtirildi. */

--Order veri giriþi aþaðýda gerçekleþtirilmiþtir.

insert into Tbl_Order values ('Hazýrlanýyor', '2021-02-12 21:05:01', '20',2,1,1,1)
insert into Tbl_Order values ('Hazýrlanýyor', '2021-03-10 21:05:01', '60',4,8,2,2)
insert into Tbl_Order values ('Yolda', '2021-05-11 10:15:03', '40',8,9,3,3)
insert into Tbl_Order values ('Hazýrlanýyor', '2021-05-10 15:05:01', '40',5,7,4,5)
insert into Tbl_Order values ('Teslim Edildi', '2021-01-07 13:10:05', '60',6,3,5,21)
insert into Tbl_Order values ('Yolda', '2021-05-08 14:08:02', '40',7,6,6,6)
insert into Tbl_Order values ('Teslim Edildi', '2021-06-17 17:40:02', '80',2,4,7,7)
insert into Tbl_Order values ('Hazýrlanýyor', '2021-05-07 13:15:01', '40',1,2,8,8)
insert into Tbl_Order values ('Yolda', '2021-01-09 14:45:04', '40',3,5,9,9)
insert into Tbl_Order values ('Hazýrlanýyor', '2021-05-13 18:17:02', '40',1,10,10,10)
insert into Tbl_Order values ('Yolda', '2021-05-17 19:05:11', '60',3,11,11,12)
insert into Tbl_Order values ('Teslim Edildi', '2021-06-19 09:05:00', '60',7,12,12,13)
insert into Tbl_Order values ('Hazýrlanýyor', '2021-12-19 08:20:01', '20',5,13,13,14)
insert into Tbl_Order values ('Teslim Edildi', '2021-03-11 17:05:01', '60',7,14,14,15)
insert into Tbl_Order values ('Hazýrlanýyor', '2021-12-14 09:18:01', '80',8,15,15,17)
insert into Tbl_Order values ('Hazýrlanýyor', '2021-09-10 06:05:01', '100',7,16,16,18)
insert into Tbl_Order values ('Yolda', '2021-09-13 06:05:03', '40',4,17,17,19)
insert into Tbl_Order values ('Hazýrlanýyor', '2021-03-16 20:12:01', '100',5,18,18,20)
insert into Tbl_Order values ('Teslim Edildi', '2021-06-11 22:15:01', '60',2,19,19,21)
insert into Tbl_Order values ('Yolda', '2021-05-16 15:45:05', '60',8,21,20,22)

select * from Tbl_Order

update Tbl_Order set O_OrderStatus='Yolda' where  O_ID=1 or O_ID=10  /* Kurye yola çýkýðýnda sipariþ durumu yolda olacak þekilde
update komutunu kullanarak güncellendi.*/ 

--Include veri giriþi aþaðýda gerçekleþtirilmiþtir.

insert into Tbl_Include values (1,1)
insert into Tbl_Include values (3,2)
insert into Tbl_Include values (4,3)
insert into Tbl_Include values (4,4)
insert into Tbl_Include values (6,5)
insert into Tbl_Include values (6,6)
insert into Tbl_Include values (1,7)
insert into Tbl_Include values (2,8)
insert into Tbl_Include values (4,9)
insert into Tbl_Include values (4,10)
insert into Tbl_Include values (5,11)
insert into Tbl_Include values (6,12)
insert into Tbl_Include values (1,13)
insert into Tbl_Include values (1,14)
insert into Tbl_Include values (2,15)
insert into Tbl_Include values (2,16)
insert into Tbl_Include values (3,17)
insert into Tbl_Include values (4,18)
insert into Tbl_Include values (5,19)
insert into Tbl_Include values (5,20)

select * from Tbl_Include


/* Bir müþterinin bir sipariþe ödediði minimum tutar. */
select min(Pay_TotalPrice) as Min_Deger from Tbl_Payment where Pay_TotalPrice= (select min(Pay_TotalPrice) from Tbl_Payment)  

/* En pahalý pizzanýn fiyatý. */
select max(P_Price) as Max_Deger from Tbl_Pizza

/* Alýnan geri dönüþlere göre 2 ile 3 yýldýz alan sipariþler ve 4 ile 5 yýldýz alan kuryelerin listelenmesi */
select F_ID,F_Order from Tbl_FeedBack where F_Order in (2,3) 
select F_ID,F_Courier from Tbl_FeedBack where F_Courier in (4,5) 

/* Verilen tarihler arasýndaki sipariþ kontrol zamanlarýný listeler. */
select O_Id,O_CheckTime from Tbl_Order where O_CheckTime between '2021-05-07 13:15:01' and '2021-06-17 17:40:02'

/* Ocak ve Þubat ayý arasýnda verilen sipariþlerin toplam fiyatýný listeler. */
select sum(O_TotalPrice) as Sum_Price from Tbl_Order where O_CheckTime between '2021-01-01 00:00:00' and '2021-02-28 23:59:59'

/* Ayný ilçede ikamet eden müþteri sayýsý */
select count (*) as Ayni_Ilce from Tbl_Address where A_District like 'Bahçelievler' 

/* Ödeme türlerini listeler. */
select distinct Pay_Type from Tbl_Payment 

/* Kuryenin alfabetik sýraya göre ilk 5 kiþisi.  */
select top 5 Co_Name, Co_SurName from Tbl_Courier order by Co_Name asc

/*  100 liraya kadar en yüksek ödenen 3 tutar */
select top 3 Pay_TotalPrice from Tbl_Payment where Pay_TotalPrice between '1' and '100' order by Pay_TotalPrice desc

/* Müþterilemizin ad ve soyadlarýnýn alfabetik sýralanmasýný listeler. */
select C_ID , C_Name , C_Surname from Tbl_Customer  order by C_Name asc

/*  0 üzerinde kaç adet ödeme tipi yapýldýðýný listeler. */
select Pay_Type, count(Pay_Type) as Adet from Tbl_Payment group by Pay_Type having count(Pay_Type)>0

/* 40 TL ve altý olan sipariþ durumlarýnýn adetini listeler */
select O_OrderStatus, count(O_OrderStatus) as Adet from Tbl_Order group by O_OrderStatus having count(O_TotalPrice)<=40

/* Kuryeye sipariþ teslimatý için gerekli bilgiler listelenmiþtir.*/
select c.C_Id , c.C_name, c.C_Surname, c.C_PhoneNum, a.A_Province, a.A_District, a.A_Detailed_Address from Tbl_Customer as c 
		join Tbl_Address as a on c.C_ID = a.FK_C_ID 

/* Son 1 gündeki sipariþ kayýtlarýný listeler. */
select c.C_Id , c.C_name, c.C_Surname, o.O_CheckTime from Tbl_Customer as c  
		join Tbl_Order as o on c.C_ID = o.FK_C_ID where O.O_CheckTime>dateadd(day,-1,getdate())

/* Kuryelerin hangi þubede olduðunu listeler. */
select b.B_Name, k.Co_Name, k.Co_Surname, k.Co_PhoneNum from Tbl_Courier  as k
		join Tbl_Branch  as b on b.B_ID = k.FK_B_ID 
		group by b.B_Name, k.Co_Name, k.Co_Surname, k.Co_PhoneNum 

/* Bir þubenin kazandýðý toplam fiyat */
select  b.B_Name, b.B_Province, SUM(O_TotalPrice) as Total_Price from Tbl_Branch  as b
		join Tbl_Order  as o on b.B_ID = o.FK_B_ID
		group by b.B_Name, b.B_Province
		order by SUM(O_TotalPrice) desc

/* Teslim edilen sipariþlerin müþterilen verdikleri geri dönütlerden puanlanan sipariþ sayýsý */ 
select  o.O_OrderStatus, f.F_Order, count(F_Order) as Amount from Tbl_FeedBack  as f
		join Tbl_Order  as o on f.F_ID  = o.FK_F_ID
		group by o.O_OrderStatus, f.F_Order
		having o.O_OrderStatus like 'Teslim Edildi'

/* Verilen sipariþlerdeki pizzalarýn özelliklerinin listelenmesi. */ 
select  o.O_ID, p.P_Name, p.P_Base, p.P_Ingredients, p.P_Price from Tbl_Include as i
		join  Tbl_Pizza as p on p.P_ID=  i.FK_P_Id
		join Tbl_Order  as o on o.O_ID = i.FK_O_ID
		group by p.P_Name, o.O_ID, p.P_Base, p.P_Ingredients, p.P_Price

/* Verilen sipariþlerden 50 TL ve üstü ödemesþ olan müþterileri listeler. */
select  c.C_Name, c.C_Surname, p.Pay_Type, p.Pay_TotalPrice from Tbl_Order as o
		join  Tbl_Customer as c on c.C_ID = o.FK_C_ID
		join Tbl_Payment as p on p.Pay_ID = o.FK_Pay_ID
		group by p.Pay_Type, c.C_Name, c.C_Surname, p.Pay_TotalPrice
		having p.Pay_TotalPrice>=50

/* Müþterinin; verilen sipariþe, sipariþin hazýrlandýðý þubeye ve sipariþi teslim eden kuryeye 3 ve üzeri verdiði geri dönütleri listeler. */
select  p.P_Name, f.F_Order, b.B_Name, f.F_Branch, c.Co_Name, c.Co_SurName, f.F_Courier from Tbl_Order as o
		join  Tbl_FeedBack as f on f.F_ID= o.FK_F_ID
		join Tbl_Branch as b on b.B_ID = o.FK_B_ID
		join Tbl_Courier as c on c.FK_B_ID = b.B_ID
		join Tbl_Include  as i on i.FK_O_ID = o.O_ID
		join  Tbl_Pizza as p on p.P_ID=  i.FK_P_Id
		where f.F_Order>2 and f.F_Branch>2 and
		f.F_Courier>2 

/* Þubenin müþterinin þifresi dýþýnda bilgilerini görüntülemesini saðlar. */ 
create view Customer as select C_Id, C_Name, C_SurName, C_PhoneNum, C_email from Tbl_Customer 
select * from Customer

exec sp_helptext Customer
exec sp_depends Tbl_Customer

/* Yýlmaz soyadýna sahip olan kiþilerin sadece adý ve soyadý listelenir. */
alter view Customer  as select C_Name, C_SurName from dbo.Tbl_Customer where C_Surname = 'Yýlmaz'

/* Sipariþin toplam tutarý olan veri türünün deðiþikliði yapýlmamasý için türünün deðiþtirilmesi engellenmiþtir. */
create view Paym with schemabinding as select Pay_TotalPrice from dbo.Tbl_Payment 
select * from Paym

/* Toplam tutarýn türü int olarak deðiþtirilmek istenmiþir. Fakat yukarýda engel getirildiði için deðiþmemiþtir. */
alter table Paym alter column Pay_TotalPrice int 

exec sp_helptext Paymn
exec sp_depends Tbl_Payment

/* Müþteri sisteme mail adresi ile giriþ yaptýðý için mail adresinin silinmesi engellenir. */
create trigger NoDeleteMail on Tbl_Customer instead of delete as 
begin print ('Mail adresi silinemez!') 
end 

delete from Tbl_Customer where C_ID=14 

/* Sipariþ tablosunda oluþturulan ve güncelleþtirilen sipariþ durumlarýnýn müþterilere mail olarak gönderilmesi iþlemi.*/
create trigger orderstatus on Tbl_Order after Insert, Update as
exec msdb.dbo.sp_send_dbmail
	 @Name='Pizza Kingdom' ,
	 @Mail='pizzakingdom@gmail.com',
	 @Text='Sipariþ durumunuz güncellenmiþtir.',
	 @Subject='Sipariþ Durumunuz' ;
go 

/* Yeni pizza türü çýktýðýnda tabloya prosedür ile pizzayý ekleme. */
create procedure PizzaAdd (@PizzaName NVarchar(30), @PizzaBase Varchar(5), @PizzaPrice Smallmoney, @PizzaÝngredients NVarchar(max), @PizzaAmount tinyint) as
				insert into Tbl_Pizza  values (@PizzaName, @PizzaBase, @PizzaPrice, @PizzaÝngredients, @PizzaAmount)

exec PizzaAdd 'Dört Peynirli' , 'Ýnce' , '40', 'Peynir'  , '5'
select * from Tbl_Pizza

/* Kapýda Ödeme yöntemi ile bir sipariþte en yüksek ödenen fiyat. */
create procedure TopTotalPrice (@Type Nvarchar(15)) as begin 
				declare @MmaxPrice Smallmoney;
				select @MmaxPrice = max(Pay_TotalPrice) from Tbl_Payment where Pay_Type=@Type;
				return @MmaxPrice end 

declare @Result SmallMoney
exec @Result= TopTotalPrice 'Kapýda Ödeme'
print @Result

/* Þubat ayýndan sonra verilen pizza sipariþ fiyatlarýnýn ortalama tutarý.  */
create function AvgOrderPrice (@Date_O SmallDateTime)
returns SmallMoney as begin 
declare @AvgMoney SmallMoney
set @AvgMoney = (select avg  (O_TotalPrice) from Pizza_Kingdom.dbo.Tbl_Order
where O_CheckTime > @Date_O )
return (@AvgMoney) 
end 

declare @Date_O SmallDateTime
set @Date_O = '2021-02-01 00:00:00'
select  dbo.AvgOrderPrice (@Date_O) as Average_Price 

/* Pizza Kingdom Ýstanbul içinde þubeleri olduðu için, müþteri il dýþýnda þehir girdiðinde H harfini gösterir.  */
create function AddressControl(@province NvarChar(20))
returns Char
begin 
declare @mesaj char(50) 
if (@province = 'Ýstanbul') select  @mesaj = 'E'
else select @mesaj = 'H' 
return @mesaj
end 

drop function AddressControl
select dbo.AddressControl('Ankara')
select dbo.AddressControl('Ýstanbul')


