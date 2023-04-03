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

alter table Tbl_Courier drop column Co_Age  /*Kuryenin ya� bilgisi bu veritaban� i�in gereksiz oldu�undan alter ve drop komutlar�n� 
kullanarak Co_Age s�tunu silindi.*/

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
	--I_ID int primary key identity (1,1), a�a��da alter ile eklendi. 
	FK_P_ID int foreign key references Tbl_Pizza(P_ID) not null,
	FK_O_ID int foreign key references Tbl_Order(O_ID) not null
)

alter table Tbl_Include add I_ID int primary key identity (1,1) not null /* primary key eklenmesi gerekti�i i�in alter ve add 
komutlar� kullanarak eklendi.*/

create table Tbl_Ingredients(    --bu tabloyu kullan�lmayaca�� i�in a�a��da drop komutu kullan�larak silindi. 
	In_ID int primary key identity(1,1),
	In_sausage bit,
	In_cheese bit,
	In_olive bit,
	In_mushroom bit
)
drop table Tbl_Ingredients 

--Customer veri giri�i a�a��da ger�ekle�tirilmi�tir. 

insert into Tbl_Customer values ('Aylin','Ta�k�ran','905324182020','aylintaskıran@mail.com','aylin123')
insert into Tbl_Customer values ('Elif','Kahraman','905367070707','elifkahraman@mail.com','elif123')
insert into Tbl_Customer values ('Beg�m','�bri�im','905315515151','begumibrisim@mail.com','beg�m123')
insert into Tbl_Customer values ('Tuana','Avcu','905324564445','tuanaavcu@mail.com','tuana123')
insert into Tbl_Customer values ('G�rkem','�ks�zo�lu','905320202020','gorkemoksuzoglu@mail.com','g�rkem123')
insert into Tbl_Customer values ('Tunahan','Ta���','905315175455','tunahantasci@mail.com','tunahan123')
insert into Tbl_Customer values ('Talha','Osmano�lu','905315171212','talhaosmanoglu@mail.com','talha123')
insert into Tbl_Customer values ('Emirhan','Kabak��','905315179698','emirhankabakci@mail.com','emirhan123')
insert into Tbl_Customer values ('Emir','Y�lmaz','905315177875','emir@mail.com','emir123')
insert into Tbl_Customer values ('Hakan','G�k','905315178282','hakan@mail.com','hakan123')
insert into Tbl_Customer values ('Asya','Y�lmaz','905315151212','asyay�lmaz@mail.com','asya123')
insert into Tbl_Customer values ('Volkan','Arslan','905315176269','volkan@mail.com','volkan123')
insert into Tbl_Customer values ('Melek','Su','905315172027','meleksu@mail.com','melek123')
insert into Tbl_Customer values ('Kemal','Er','905315179695','kemal@mail.com','kemal123')
insert into Tbl_Customer values ('�lke','�z','905315177541','ilkeoz@mail.com','ilke123')
insert into Tbl_Customer values ('Ahmet','Er','905315172423','ahmeter@mail.com','ahmet123')
insert into Tbl_Customer values ('Nam�k','Kemal','905315172441','namikkemal@mail.com','namikk123')
insert into Tbl_Customer values ('Asya','�i�ek','905315175156','asyacicek@mail.com','asyacicek123')
insert into Tbl_Customer values ('Su','Ate�','905315174546','suates@mail.com','su123')
insert into Tbl_Customer values ('G�rkem2','�ks�zo�lu','905324565668','gorkemoksuzoglu@mail.com','g�rkem123')
insert into Tbl_Customer values ('Uras','�elik','905324565112','urascelik@mail.com','uras123')

select * from Tbl_Customer --Customer tablosunu g�r�ntelemek i�in select komutunu kulland�k.

delete from Tbl_Customer where C_Name='G�rkem2' --G�rkem2 ismi ge�ersiz oldu�u i�in delete komutuyla veri tablosundan silindi.

--Address veri giri�i a�a��da ger�ekle�tirilmi�tir.

insert into Tbl_Address(A_Province, A_District, A_Detailed_Address, FK_C_ID) values ('Istanbul', 'Bak�rk�y' , '�i�ek Sok. No:50', 1)
insert into Tbl_Address(A_Province, A_District, A_Detailed_Address, FK_C_ID) values ('Istanbul', 'Bah�elievler' , 'Papatya Sok. No:06', 2)
insert into Tbl_Address(A_Province, A_District, A_Detailed_Address, FK_C_ID) values ('Istanbul', 'Bah�elievler' , 'G�ne� Sok. No:40', 3)
insert into Tbl_Address(A_Province, A_District, A_Detailed_Address, FK_C_ID) values ('Istanbul', 'Ba�c�lar' , 'Ay Sok. No:70', 4)
insert into Tbl_Address(A_Province, A_District, A_Detailed_Address, FK_C_ID) values ('Istanbul', 'Kad�k�y' , 'Nar Sok. No:51', 21)
insert into Tbl_Address(A_Province, A_District, A_Detailed_Address, FK_C_ID) values ('Istanbul', 'Kad�k�y' , '�ilek Sok. No:12', 5)
insert into Tbl_Address(A_Province, A_District, A_Detailed_Address, FK_C_ID) values ('Istanbul', 'Esenler' , 'G�l Sok. No:95', 6)
insert into Tbl_Address(A_Province, A_District, A_Detailed_Address, FK_C_ID) values ('Istanbul', 'B�y�k�ekmece' , 'Karanfil Sok. No:65', 7)
insert into Tbl_Address(A_Province, A_District, A_Detailed_Address, FK_C_ID) values ('Istanbul', 'K���k�ekmece' , 'Kral Sok. No:34', 8)
insert into Tbl_Address(A_Province, A_District, A_Detailed_Address, FK_C_ID) values ('Istanbul', 'Sar�yer' , 'Kedi Sok. No:44', 9)
insert into Tbl_Address(A_Province, A_District, A_Detailed_Address, FK_C_ID) values ('Istanbul', 'Arnavutk�y' , 'Orkide Sok. No:32', 19)
insert into Tbl_Address(A_Province, A_District, A_Detailed_Address, FK_C_ID) values ('Istanbul','Pendik','Krali�e Sok. No:64', 10)
insert into Tbl_Address(A_Province, A_District, A_Detailed_Address, FK_C_ID) values ('Istanbul','Be�ikta�','Limon Sok. No:86', 11)
insert into Tbl_Address(A_Province, A_District, A_Detailed_Address, FK_C_ID) values ('Istanbul','Etiler','Portakal Sok. No:37', 12)
insert into Tbl_Address(A_Province, A_District, A_Detailed_Address, FK_C_ID) values ('Istanbul','Levent','Pa�a Sok. No:89', 13)
insert into Tbl_Address(A_Province, A_District, A_Detailed_Address, FK_C_ID) values ('Istanbul','Kartal','Ay Sok. No:47', 14)
insert into Tbl_Address(A_Province, A_District, A_Detailed_Address, FK_C_ID) values ('Istanbul','Bayrampa�a','Dere Sok. No:67', 15)
insert into Tbl_Address(A_Province, A_District, A_Detailed_Address, FK_C_ID) values ('Istanbul','�atalca','�rdek Sok. No:21', 16)
insert into Tbl_Address(A_Province, A_District, A_Detailed_Address, FK_C_ID) values ('Istanbul','G�ne�li','Araba Sok. No:72', 17)
insert into Tbl_Address(A_Province, A_District, A_Detailed_Address, FK_C_ID) values ('Istanbul','Beylikd�z�','Civciv Sok. No:48', 18)

select * from Tbl_Address

update Tbl_Address set A_Detailed_Address='G�k Sok. No:16' where A_ID=1 /*Detayl� adres, 1 numaral� ID'e sahip m��teri ta��nd��� 
ve adres de�i�ikli�i yapt��� i�in update komutu kullanarak g�ncellendi.*/

--Payment veri giri�i a�a��da ger�ekle�tirilmi�tir.

insert into Tbl_Payment(Pay_Type, Pay_TotalPrice) values ('Kap�da �deme' , '20')
insert into Tbl_Payment(Pay_Type, Pay_TotalPrice) values ('Online �deme' , '20')
insert into Tbl_Payment(Pay_Type, Pay_TotalPrice) values ('Nakit' , '60')
insert into Tbl_Payment(Pay_Type, Pay_TotalPrice) values ('Kap�da �deme' , '0')
insert into Tbl_Payment(Pay_Type, Pay_TotalPrice) values ('Online �deme' , '40')
insert into Tbl_Payment(Pay_Type, Pay_TotalPrice) values ('Nakit' , '20')
insert into Tbl_Payment(Pay_Type, Pay_TotalPrice) values ('Online �deme' , '60')
insert into Tbl_Payment(Pay_Type, Pay_TotalPrice) values ('Kap�da �deme' , '120')
insert into Tbl_Payment(Pay_Type, Pay_TotalPrice) values ('Online �deme' , '140')
insert into Tbl_Payment(Pay_Type, Pay_TotalPrice) values ('Online �deme' , '20')
insert into Tbl_Payment values ('Online �deme','0')
insert into Tbl_Payment values ('Nakit','60')
insert into Tbl_Payment values ('Kap�da �deme','80')
insert into Tbl_Payment values ('Online �deme','40')
insert into Tbl_Payment values ('Kap�da �deme','120')
insert into Tbl_Payment values ('Nakit','0')
insert into Tbl_Payment values ('Online �deme','40')
insert into Tbl_Payment values ('Nakit','60')
insert into Tbl_Payment values ('Online �deme','100')
insert into Tbl_Payment values ('Kap�da �deme','20')
insert into Tbl_Payment values ('Nakit','40')
insert into Tbl_Payment values ('Kap�da �deme','40')

select * from Tbl_Payment
delete from Tbl_Payment where Pay_TotalPrice=0   /* TotalPrice 0 olarak girilmi� ve bu i�lemler yanl�� oldu�u i�in
Delete komutu ile 0 girilenler silindi. */

--FeedBack veri giri�i a�a��da ger�ekle�tirilmi�tir.

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

--Pizza veri giri�i a�a��da ger�ekle�tirilmi�tir.

insert into Tbl_Pizza(P_Name, P_Base, P_Price, P_Ingredients, P_Amount) values ('Kar���k', 'Kal�n', '20', 'Sucuk', '2')
insert into Tbl_Pizza(P_Name, P_Base, P_Price, P_Ingredients,P_Amount) values ('Sosyal', '�nce', '20', 'Salam', '3')
insert into Tbl_Pizza(P_Name, P_Base, P_Price, P_Ingredients,P_Amount) values ('Kar���k', '�nce', '20', 'Sucuk', '1')
insert into Tbl_Pizza values ('Sosyal','Kal�n', '20', 'Salam', '5')
insert into Tbl_Pizza values ('Vejeteryan','Kal�n', '40', 'Brokoli', '4')
insert into Tbl_Pizza values ('Vejeteryan','�nce', '40', 'Brokoli', '3')

select * from Tbl_Pizza

--Branch veri giri�i a�a��da ger�ekle�tirilmi�tir. 8 �ube oldu�undan dolay� 8 adet veri giri�i yap�lm��t�r.

insert into Tbl_Branch(B_Name, B_PhoneNum, B_Province) values ('Kartal �ube', '02164564541', 'Istanbul')
insert into Tbl_Branch(B_Name, B_PhoneNum, B_Province) values ('Kad�k�y �ube', '02164564773', 'Istanbul')
insert into Tbl_Branch(B_Name, B_PhoneNum, B_Province) values ('Sar�yer �ube', '02164564746', 'Istanbul')
insert into Tbl_Branch(B_Name, B_PhoneNum, B_Province) values ('Be�ikta� �ube', '02164567443', 'Istanbul')
insert into Tbl_Branch values ('Bak�rk�y �ube ','02127478985', 'Istanbul')
insert into Tbl_Branch values ('�atalca �ube ','02127474696', 'Istanbul')
insert into Tbl_Branch values ('Beylikd�z� �ube ','02127472324', 'Istanbul')
insert into Tbl_Branch values ('B�y�k�ekmece �ube ','02127474547', 'Istanbul')

select * from Tbl_Branch

--Courier veri giri�i a�a��da ger�ekle�tirilmi�tir.  8 �ube ve her �ubede 2 kurye oldu�undan dolay� toplam 16 kuryenin veri giri�i yap�lm��t�r. 

insert into Tbl_Courier(Co_Name, Co_SurName, Co_PhoneNum, FK_B_ID) values ('Ali', 'Veli', '905324567172', 2)
insert into Tbl_Courier(Co_Name, Co_SurName, Co_PhoneNum, FK_B_ID) values ('Fatma', 'Kay�k', '905324564746',5)
insert into Tbl_Courier(Co_Name, Co_SurName, Co_PhoneNum, FK_B_ID) values ('Lale', '�i�ek', '905324562324',7)
insert into Tbl_Courier(Co_Name, Co_SurName, Co_PhoneNum, FK_B_ID) values ('Fatmag�l', 'Ta�', '905324567974',4)
insert into Tbl_Courier(Co_Name, Co_SurName, Co_PhoneNum, FK_B_ID) values ('Burak', 'Yal��n', '905324567476',3)
insert into Tbl_Courier(Co_Name, Co_SurName, Co_PhoneNum, FK_B_ID) values ('Y�lmaz', 'Er', '905324567176',3)
insert into Tbl_Courier(Co_Name, Co_SurName, Co_PhoneNum, FK_B_ID) values ('Ay�e ','G�l', '905327890256',8)
insert into Tbl_Courier(Co_Name, Co_SurName, Co_PhoneNum, FK_B_ID) values ('Kerem ','�am', '905327897875',5)
insert into Tbl_Courier(Co_Name, Co_SurName, Co_PhoneNum, FK_B_ID) values ('�elale ','�im�ek', '905327894369',8)
insert into Tbl_Courier(Co_Name, Co_SurName, Co_PhoneNum, FK_B_ID) values ('Aysen ','B�cek', '905327894574',1)
insert into Tbl_Courier(Co_Name, Co_SurName, Co_PhoneNum, FK_B_ID) values ('Kerem ','Cem', '905327897475',6)
insert into Tbl_Courier(Co_Name, Co_SurName, Co_PhoneNum, FK_B_ID) values ('�zge ','Turan', '905327897578',1)
insert into Tbl_Courier(Co_Name, Co_SurName, Co_PhoneNum, FK_B_ID) values ('Kemal ','G�n�l', '905327894543',3)
insert into Tbl_Courier(Co_Name, Co_SurName, Co_PhoneNum, FK_B_ID) values ('Nermin','Kral', '905327897576',6)
insert into Tbl_Courier(Co_Name, Co_SurName, Co_PhoneNum, FK_B_ID) values ('Seyfi ','Tu�la', '905327897674',5)
insert into Tbl_Courier(Co_Name, Co_SurName, Co_PhoneNum, FK_B_ID) values ('Necmi ','Tu�', '905327897473',1)

select * from Tbl_Courier

update Tbl_Courier set Co_PhoneNum='905324578899' where Co_Name='Kerem' and Co_SurName='�am' /* Kuryenin telefon numaras�n� de�i�tirmesi 
sebebiyle update komutu ile numara bilgisi de�i�tirildi. */

--Order veri giri�i a�a��da ger�ekle�tirilmi�tir.

insert into Tbl_Order values ('Haz�rlan�yor', '2021-02-12 21:05:01', '20',2,1,1,1)
insert into Tbl_Order values ('Haz�rlan�yor', '2021-03-10 21:05:01', '60',4,8,2,2)
insert into Tbl_Order values ('Yolda', '2021-05-11 10:15:03', '40',8,9,3,3)
insert into Tbl_Order values ('Haz�rlan�yor', '2021-05-10 15:05:01', '40',5,7,4,5)
insert into Tbl_Order values ('Teslim Edildi', '2021-01-07 13:10:05', '60',6,3,5,21)
insert into Tbl_Order values ('Yolda', '2021-05-08 14:08:02', '40',7,6,6,6)
insert into Tbl_Order values ('Teslim Edildi', '2021-06-17 17:40:02', '80',2,4,7,7)
insert into Tbl_Order values ('Haz�rlan�yor', '2021-05-07 13:15:01', '40',1,2,8,8)
insert into Tbl_Order values ('Yolda', '2021-01-09 14:45:04', '40',3,5,9,9)
insert into Tbl_Order values ('Haz�rlan�yor', '2021-05-13 18:17:02', '40',1,10,10,10)
insert into Tbl_Order values ('Yolda', '2021-05-17 19:05:11', '60',3,11,11,12)
insert into Tbl_Order values ('Teslim Edildi', '2021-06-19 09:05:00', '60',7,12,12,13)
insert into Tbl_Order values ('Haz�rlan�yor', '2021-12-19 08:20:01', '20',5,13,13,14)
insert into Tbl_Order values ('Teslim Edildi', '2021-03-11 17:05:01', '60',7,14,14,15)
insert into Tbl_Order values ('Haz�rlan�yor', '2021-12-14 09:18:01', '80',8,15,15,17)
insert into Tbl_Order values ('Haz�rlan�yor', '2021-09-10 06:05:01', '100',7,16,16,18)
insert into Tbl_Order values ('Yolda', '2021-09-13 06:05:03', '40',4,17,17,19)
insert into Tbl_Order values ('Haz�rlan�yor', '2021-03-16 20:12:01', '100',5,18,18,20)
insert into Tbl_Order values ('Teslim Edildi', '2021-06-11 22:15:01', '60',2,19,19,21)
insert into Tbl_Order values ('Yolda', '2021-05-16 15:45:05', '60',8,21,20,22)

select * from Tbl_Order

update Tbl_Order set O_OrderStatus='Yolda' where  O_ID=1 or O_ID=10  /* Kurye yola ��k���nda sipari� durumu yolda olacak �ekilde
update komutunu kullanarak g�ncellendi.*/ 

--Include veri giri�i a�a��da ger�ekle�tirilmi�tir.

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


/* Bir m��terinin bir sipari�e �dedi�i minimum tutar. */
select min(Pay_TotalPrice) as Min_Deger from Tbl_Payment where Pay_TotalPrice= (select min(Pay_TotalPrice) from Tbl_Payment)  

/* En pahal� pizzan�n fiyat�. */
select max(P_Price) as Max_Deger from Tbl_Pizza

/* Al�nan geri d�n��lere g�re 2 ile 3 y�ld�z alan sipari�ler ve 4 ile 5 y�ld�z alan kuryelerin listelenmesi */
select F_ID,F_Order from Tbl_FeedBack where F_Order in (2,3) 
select F_ID,F_Courier from Tbl_FeedBack where F_Courier in (4,5) 

/* Verilen tarihler aras�ndaki sipari� kontrol zamanlar�n� listeler. */
select O_Id,O_CheckTime from Tbl_Order where O_CheckTime between '2021-05-07 13:15:01' and '2021-06-17 17:40:02'

/* Ocak ve �ubat ay� aras�nda verilen sipari�lerin toplam fiyat�n� listeler. */
select sum(O_TotalPrice) as Sum_Price from Tbl_Order where O_CheckTime between '2021-01-01 00:00:00' and '2021-02-28 23:59:59'

/* Ayn� il�ede ikamet eden m��teri say�s� */
select count (*) as Ayni_Ilce from Tbl_Address where A_District like 'Bah�elievler' 

/* �deme t�rlerini listeler. */
select distinct Pay_Type from Tbl_Payment 

/* Kuryenin alfabetik s�raya g�re ilk 5 ki�isi.  */
select top 5 Co_Name, Co_SurName from Tbl_Courier order by Co_Name asc

/*  100 liraya kadar en y�ksek �denen 3 tutar */
select top 3 Pay_TotalPrice from Tbl_Payment where Pay_TotalPrice between '1' and '100' order by Pay_TotalPrice desc

/* M��terilemizin ad ve soyadlar�n�n alfabetik s�ralanmas�n� listeler. */
select C_ID , C_Name , C_Surname from Tbl_Customer  order by C_Name asc

/*  0 �zerinde ka� adet �deme tipi yap�ld���n� listeler. */
select Pay_Type, count(Pay_Type) as Adet from Tbl_Payment group by Pay_Type having count(Pay_Type)>0

/* 40 TL ve alt� olan sipari� durumlar�n�n adetini listeler */
select O_OrderStatus, count(O_OrderStatus) as Adet from Tbl_Order group by O_OrderStatus having count(O_TotalPrice)<=40

/* Kuryeye sipari� teslimat� i�in gerekli bilgiler listelenmi�tir.*/
select c.C_Id , c.C_name, c.C_Surname, c.C_PhoneNum, a.A_Province, a.A_District, a.A_Detailed_Address from Tbl_Customer as c 
		join Tbl_Address as a on c.C_ID = a.FK_C_ID 

/* Son 1 g�ndeki sipari� kay�tlar�n� listeler. */
select c.C_Id , c.C_name, c.C_Surname, o.O_CheckTime from Tbl_Customer as c  
		join Tbl_Order as o on c.C_ID = o.FK_C_ID where O.O_CheckTime>dateadd(day,-1,getdate())

/* Kuryelerin hangi �ubede oldu�unu listeler. */
select b.B_Name, k.Co_Name, k.Co_Surname, k.Co_PhoneNum from Tbl_Courier  as k
		join Tbl_Branch  as b on b.B_ID = k.FK_B_ID 
		group by b.B_Name, k.Co_Name, k.Co_Surname, k.Co_PhoneNum 

/* Bir �ubenin kazand��� toplam fiyat */
select  b.B_Name, b.B_Province, SUM(O_TotalPrice) as Total_Price from Tbl_Branch  as b
		join Tbl_Order  as o on b.B_ID = o.FK_B_ID
		group by b.B_Name, b.B_Province
		order by SUM(O_TotalPrice) desc

/* Teslim edilen sipari�lerin m��terilen verdikleri geri d�n�tlerden puanlanan sipari� say�s� */ 
select  o.O_OrderStatus, f.F_Order, count(F_Order) as Amount from Tbl_FeedBack  as f
		join Tbl_Order  as o on f.F_ID  = o.FK_F_ID
		group by o.O_OrderStatus, f.F_Order
		having o.O_OrderStatus like 'Teslim Edildi'

/* Verilen sipari�lerdeki pizzalar�n �zelliklerinin listelenmesi. */ 
select  o.O_ID, p.P_Name, p.P_Base, p.P_Ingredients, p.P_Price from Tbl_Include as i
		join  Tbl_Pizza as p on p.P_ID=  i.FK_P_Id
		join Tbl_Order  as o on o.O_ID = i.FK_O_ID
		group by p.P_Name, o.O_ID, p.P_Base, p.P_Ingredients, p.P_Price

/* Verilen sipari�lerden 50 TL ve �st� �demes� olan m��terileri listeler. */
select  c.C_Name, c.C_Surname, p.Pay_Type, p.Pay_TotalPrice from Tbl_Order as o
		join  Tbl_Customer as c on c.C_ID = o.FK_C_ID
		join Tbl_Payment as p on p.Pay_ID = o.FK_Pay_ID
		group by p.Pay_Type, c.C_Name, c.C_Surname, p.Pay_TotalPrice
		having p.Pay_TotalPrice>=50

/* M��terinin; verilen sipari�e, sipari�in haz�rland��� �ubeye ve sipari�i teslim eden kuryeye 3 ve �zeri verdi�i geri d�n�tleri listeler. */
select  p.P_Name, f.F_Order, b.B_Name, f.F_Branch, c.Co_Name, c.Co_SurName, f.F_Courier from Tbl_Order as o
		join  Tbl_FeedBack as f on f.F_ID= o.FK_F_ID
		join Tbl_Branch as b on b.B_ID = o.FK_B_ID
		join Tbl_Courier as c on c.FK_B_ID = b.B_ID
		join Tbl_Include  as i on i.FK_O_ID = o.O_ID
		join  Tbl_Pizza as p on p.P_ID=  i.FK_P_Id
		where f.F_Order>2 and f.F_Branch>2 and
		f.F_Courier>2 

/* �ubenin m��terinin �ifresi d���nda bilgilerini g�r�nt�lemesini sa�lar. */ 
create view Customer as select C_Id, C_Name, C_SurName, C_PhoneNum, C_email from Tbl_Customer 
select * from Customer

exec sp_helptext Customer
exec sp_depends Tbl_Customer

/* Y�lmaz soyad�na sahip olan ki�ilerin sadece ad� ve soyad� listelenir. */
alter view Customer  as select C_Name, C_SurName from dbo.Tbl_Customer where C_Surname = 'Y�lmaz'

/* Sipari�in toplam tutar� olan veri t�r�n�n de�i�ikli�i yap�lmamas� i�in t�r�n�n de�i�tirilmesi engellenmi�tir. */
create view Paym with schemabinding as select Pay_TotalPrice from dbo.Tbl_Payment 
select * from Paym

/* Toplam tutar�n t�r� int olarak de�i�tirilmek istenmi�ir. Fakat yukar�da engel getirildi�i i�in de�i�memi�tir. */
alter table Paym alter column Pay_TotalPrice int 

exec sp_helptext Paymn
exec sp_depends Tbl_Payment

/* M��teri sisteme mail adresi ile giri� yapt��� i�in mail adresinin silinmesi engellenir. */
create trigger NoDeleteMail on Tbl_Customer instead of delete as 
begin print ('Mail adresi silinemez!') 
end 

delete from Tbl_Customer where C_ID=14 

/* Sipari� tablosunda olu�turulan ve g�ncelle�tirilen sipari� durumlar�n�n m��terilere mail olarak g�nderilmesi i�lemi.*/
create trigger orderstatus on Tbl_Order after Insert, Update as
exec msdb.dbo.sp_send_dbmail
	 @Name='Pizza Kingdom' ,
	 @Mail='pizzakingdom@gmail.com',
	 @Text='Sipari� durumunuz g�ncellenmi�tir.',
	 @Subject='Sipari� Durumunuz' ;
go 

/* Yeni pizza t�r� ��kt���nda tabloya prosed�r ile pizzay� ekleme. */
create procedure PizzaAdd (@PizzaName NVarchar(30), @PizzaBase Varchar(5), @PizzaPrice Smallmoney, @Pizza�ngredients NVarchar(max), @PizzaAmount tinyint) as
				insert into Tbl_Pizza  values (@PizzaName, @PizzaBase, @PizzaPrice, @Pizza�ngredients, @PizzaAmount)

exec PizzaAdd 'D�rt Peynirli' , '�nce' , '40', 'Peynir'  , '5'
select * from Tbl_Pizza

/* Kap�da �deme y�ntemi ile bir sipari�te en y�ksek �denen fiyat. */
create procedure TopTotalPrice (@Type Nvarchar(15)) as begin 
				declare @MmaxPrice Smallmoney;
				select @MmaxPrice = max(Pay_TotalPrice) from Tbl_Payment where Pay_Type=@Type;
				return @MmaxPrice end 

declare @Result SmallMoney
exec @Result= TopTotalPrice 'Kap�da �deme'
print @Result

/* �ubat ay�ndan sonra verilen pizza sipari� fiyatlar�n�n ortalama tutar�.  */
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

/* Pizza Kingdom �stanbul i�inde �ubeleri oldu�u i�in, m��teri il d���nda �ehir girdi�inde H harfini g�sterir.  */
create function AddressControl(@province NvarChar(20))
returns Char
begin 
declare @mesaj char(50) 
if (@province = '�stanbul') select  @mesaj = 'E'
else select @mesaj = 'H' 
return @mesaj
end 

drop function AddressControl
select dbo.AddressControl('Ankara')
select dbo.AddressControl('�stanbul')


