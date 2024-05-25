USE [master]

GO
IF EXISTS (SELECT * FROM sys.databases WHERE name = 'TPS')
	DROP DATABASE TPS
GO
CREATE DATABASE TPS

GO
USE TPS
GO

CREATE TABLE [dbo].[Categories](
[CategoryID] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
[CategoryName] [nvarchar](50) NOT NULL,
[Description] [ntext] NULL,
)



INSERT INTO [dbo].[Categories] ([CategoryName],[Description])
VALUES
('Men','What do gentlemen look for perfume for? Probably to smell good, be masculine and enhance their style, right ? Namperfume understands our gentlemen , brings to men decent, neat, attractive, sometimes overwhelmingly powerful scents, and certainly cannot forget the typical liberal dustiness of men.'),
('Women','Perfume from the early days was created to serve women, so it seems that in the world of scent, the choices for women are richer and more colorful. That"s why, namperfume always wants to bring beautiful ladies great options, from seductive, luxurious, powerful to gentle, innocent, and indispensable a bit of flirty sexiness. recline...'),
('Unisex','Unisex perfume is a perfume line suitable for all genders, whether men or women can use this product. Same perfume, but when men use it, they will become elegant. A girl who possesses adorable charms will become even more attractive.'),
('Giftset','Giftset - also known as gift set, is a collection of many different types of products. They are all highly applicable to serve work and daily life. All The products in the Giftset are all related to each other and have high aesthetics to bring satisfaction to the recipient.');

CREATE TABLE [dbo].[SubCategories](
[SubCategoryID] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
[SubCategoryName] [nvarchar](255) NOT NULL,
[CategoryID] int NOT NULL,
FOREIGN KEY (CategoryID) REFERENCES [dbo].[Categories]([CategoryID])
)
INSERT INTO [dbo].[SubCategories] ([SubCategoryName],[CategoryID])
VALUES
('Citrus',1),
('Floral',1),
('Fresh',1),
('Fruity',1),
('Romantic',1),
('Spicy',1),
('Woody',1),
('Citrus',2),
('Floral',2),
('Fresh',2),
('Fruity',2),
('Romantic',2),
('Spicy',3),
('Woody',3),
('Citrus',3),
('Floral',3),
('Fresh',3),
('Fruity',3),
('Romantic',3),
('Spicy',3),
('Woody',3);


CREATE TABLE [dbo].[ProductImage] (
[ProductImageID] [int] PRIMARY KEY IDENTITY(1,1),
[Url] [nvarchar](255) NOT NULL,
[Name] [nvarchar](50) NULL
)
INSERT INTO [dbo].[ProductImage] ([Url])
VALUES
('images/Products/Men/1.0.jpg'),
('images/Products/Men/2.0.jpg'),
('images/Products/Men/3.0.jpg'),
('images/Products/Men/4.0.jpg'),
('images/Products/Men/5.0.jpg'),
('images/Products/Women/1.0.jpg'),
('images/Products/Women/2.0.jpg'),
('images/Products/Women/3.0.jpg'),
('images/Products/Women/4.0.jpg'),
('images/Products/Women/5.0.jpg'),
('images/Products/Unisex/1.0.jpg'),
('images/Products/Unisex/2.0.jpg'),
('images/Products/Unisex/3.0.jpg'),
('images/Products/Unisex/4.0.jpg'),
('images/Products/Unisex/5.0.jpg')

CREATE TABLE [dbo].[Accounts](
[AccountID] [int] IDENTITY(1,1) PRIMARY KEY,
[FirstName] [nvarchar](50) NOT NULL,
[LastName] [nvarchar](50) NOT NULL,
[Password] [nvarchar](512) NOT NULL,
[Image] [nvarchar](50) NULL,
[Gender] bit NOT NULL,
[BirthDay] date NOT NULL,
[Phone] [nvarchar](11) NOT NULL,
[Email] [nvarchar](50) NULL,
[Address] [nvarchar](225) NULL,
[Status] bit NOT NULL,
[CreateDate] date NOT NULL,
[RoleID] [int] NOT NULL,
FOREIGN KEY (roleID) REFERENCES [dbo].[Roles](roleID)
)



INSERT INTO [dbo].[Accounts] ([FirstName],[LastName],[Email],[Password],[Image],[Gender],[BirthDay],[Phone],[Address],[CreateDate],[RoleID],[Status]) 
VALUES
(N'Hà',N'Phạm','pna2906@gmai.com','123456','images/users/Ha.png',1,'2003-06-29','0862981785',N'Hà Nội','2024-05-24',1,1),
(N'Bích',N'Nguyễn','123@gmail.com','123456','images/users/Bich.png',1,'2003-11-01','0123456789',N'Hà Nội','2024-05-23',1,1),
(N'Hoàng',N'Nguyễn','hoang@gmai.com','123456','images/users/Hoang.png',1,'2003-06-29','0862981785',N'Hà Nội','2024-05-24',1,1);


CREATE TABLE [dbo].[Roles] (
    roleID INT PRIMARY KEY IDENTITY(1,1),
    roleName NVARCHAR(50) NOT NULL UNIQUE
)
INSERT INTO [dbo].[Roles] (roleName) VALUES
('Admin'),
('Sale'),
('Marketing'),
('Customer');

CREATE TABLE [dbo].[Feedbacks] (
    fbID INT PRIMARY KEY IDENTITY(1,1),
    fbAccountID INT NOT NULL,
    fbProductID INT NOT NULL,
    fbStar INT NOT NULL,
    fbContent NVARCHAR(255) NULL,
    fbImage NVARCHAR(255) NULL,
    fbDate DATE NOT NULL,
    fbStatus INT NOT NULL,
    FOREIGN KEY (fbAccountID) REFERENCES [dbo].[Accounts](AccountID)
)
CREATE TABLE [dbo].[Brands] (
    [BrandID] INT PRIMARY KEY IDENTITY(1,1),
    [BrandName] NVARCHAR(100) NOT NULL UNIQUE,
    [Description] NVARCHAR(MAX)
)
INSERT INTO [dbo].[Brands]([BrandName],[Description])
VALUES
('GUCCI','Gucci perfume is one of the most revered brands in the world. Founded in the 1920s in Florence, Italy, Gucci has always understood that fashion and perfume are two inseparable things. The company offers clothes with modern, modern styles for both men and women. Gucci famous interlocking letter logo has become a fashion icon that is always seen in all of the company products, from bag collections, sportswear, seasonal high and thin heels to perfume bottles. Gucci perfumes have a variety of scents, from sensual and indulgent to sweet and fresh. Along with the company clothing and accessories lines, which have long become classic scents.'),
('CHANEL','Chanel is a famous perfume brand known for its elegance, sophistication and class. Chanel perfume products often have unique scents, combining natural ingredients. natural and synthetic to create unique and long-lasting scents.'),
('XERJOFF','Xerjoff is a famous high-end perfume brand with the perfect combination of craftsmanship and rare ingredients. Xerjoff perfume lines bring unique fragrance experiences. unique, complex and full of sophistication.'),
('LOUIS VUITTON', 'Louis Vuitton, famous for its luxury and class in fashion and accessories, also offers high-end perfume lines with delicate and unique scents. Louis Vuitton perfumes are Created by leading perfumers, using rare and high quality ingredients.'),
('DIOR','Dior is a famous brand in the field of perfume, with many iconic product lines. Dior perfume stands out with its sophisticated combination of high-quality ingredients, bringing the fragrance is diverse and rich.'),
('TOMMY HILFIGER','Tommy Hilfiger is a famous brand, not only in the fashion field but also in the perfume industry. Tommy Hilfiger perfumes often have a youthful, dynamic and fresh style.' ),
('ISSEY MIYAKE',N'Issey Miyake is a famous brand with modern, minimalist and sophisticated perfume lines. Issey Miyake perfumes often stand out with their fresh, elegant and creative, inspired by nature and natural elements.'),
('CREED', 'Creed is a high-end French perfume brand, famous for its handmade, sophisticated and luxurious perfume lines. Each Creed product is usually made from quality natural ingredients. high quality, providing a unique and long-lasting fragrance.'),
('YVES SAINT LAURENT (YSL)','Yves Saint Laurent (YSL) is a famous perfume brand, standing out with products that have a seductive, bold and modern style. YSL perfumes are often highly appreciated for the creativity in blending aromas, bringing unique and impressive scents.'),
('ARMAF','Armaf is a famous perfume brand with high quality products at affordable prices. Armaf perfumes often have diverse styles, from fresh to passionate, suitable for everyone. Suitable for many different tastes and occasions.'),
('ROJA PARFUMS', 'Roja Parfums is a high-end and luxurious perfume brand of perfume creator Roja Dove. Roja Parfums products are often known for their sophistication in the way they combine scents. materials, ensuring the highest quality and uniqueness. Each bottle of Roja Parfums perfume is often handmade and limited, creating works of art in the world of perfume.'),
('LE LABO','Le Labo is a high-end and unique perfume brand, famous for creating handmade and personalized products. Each bottle of Le Labo perfume is made in-house products, ensuring sophistication and quality. This brand focuses on using natural and high-quality ingredients, along with unique flavor blends.');

CREATE TABLE [dbo].[Products] (
    [ProductID] [INT] PRIMARY KEY IDENTITY(1,1),
    [SubCategoryID] [INT] NOT NULL,
    [ProductName] [NVARCHAR](255) NOT NULL,
    [ProductCreateDate] DATE NOT NULL,
    [ProductDetailID] [INT] NULL,
    [ProductStatus] BIT NOT NULL,
    [ProductImageID] [INT] NULL,
    [OrderID] [INT] NULL,	
    [fbID] [INT] NULL,
    [ProductPrice] [float] NOT NULL,
	[BrandID] [int] NULL,
    FOREIGN KEY (SubCategoryID) REFERENCES [dbo].[SubCategories]([SubCategoryID]),
    FOREIGN KEY (fbID) REFERENCES [dbo].[Feedbacks]([fbID]),
    FOREIGN KEY (ProductImageID) REFERENCES [dbo].[ProductImage]([ProductImageID]),
	FOREIGN KEY (BrandID) REFERENCES [dbo].[Brands](BrandID),
)
INSERT INTO [dbo].[Products] (
[ProductName],
[ProductDetailID],
[ProductPrice],
[ProductCreateDate],
[SubCategoryID],
[ProductStatus],
[BrandID])
VALUES
--5 perfumes for Men
('XERJOFF CASAMORATI MEFISTO EDP FOR MEN',1,220,'2024',1,1,3),
('LOUIS VUITTON MÉTÉORE EDP FOR MEN',2,346,'2024',1,1,4),
('TOMMY ENDLESS BLUE FOR MEN',3,92,'2024',2,1,6),
('ISSEY MIYAKE LEAU DISSEY INTENSE FOR MEN',4,100,'2024',7,1,7),
('CREED AVENTUS EDP FOR MEN',5,380,'2024',4,1,8),

--5 perfumes for Women
('CHANEL CHANCE EDP FOR WOMEN',6,192,'2024',9,1,2),
('DIOR JOY EDP FOR WOMEN',7,140,'2024',11,1,5),
('YSL LIBRE EDP FOR WOMEN',8,140,'2024',9,1,9),
('LOUIS VUITTON SPELL ON YOU EDP FOR WOMEN',9,398,'2024',9,1,4),
('CHANEL CHANCE EAU FRAICHE EDP FOR WOMEN',10,206,'2024',8,1,2),

--5 perfumes for Unisex
('XERJOFF NAXOS EDP FOR UNISEX',11,260,'2024',13,1,3),
('ARMAF STERLING CLUB DE NUIT MILESTONE EDP FOR UNISEX',12,96,'2024',16,1,10),
('GUCCI A SONG FOR THE ROSE EDP FOR UNISEX',13,262,'2024',16,1,1),
('LE LABO THE NOIR 29 EDP FOR UNISEX',14,292,'2024',21,1,12),
('LOUIS VUITTON OMBRE NOMADE EDP FOR UNISEX',15,520,'2024',21,1,4);
--5 Giftset 

CREATE TABLE [dbo].[ProductDetail] (
    [ProductDetailID] [int] PRIMARY KEY IDENTITY(1,1),
    [pdProductID] [int] NOT NULL,
	[ProductDetail] [NVARCHAR](max) NULL,
    [ProductMI] [float] NULL,	
    [ProductSold] [int] NULL,
    [ProductAvaiable] [int] NULL,
    [ProductCreateDate] DATE NULL,
    [ProductStatus] BIT NOT NULL,
    [ProductImageID] [INT] NULL,
    FOREIGN KEY ([productImageID]) REFERENCES [dbo].[ProductImage]([ProductImageID]),
	FOREIGN KEY ([pdProductID]) REFERENCES [dbo].[Products]([ProductID])
)
INSERT INTO [dbo].ProductDetail ([pdProductID],[ProductDetail],[ProductMI],[ProductSold],[ProductAvaiable],[ProductCreateDate],[ProductStatus],[ProductImageID])
VALUES
(1,'Inspired by the Italian coast, in 2009 the Xerjoff brand launched a perfume for men called Xerjoff Casamorati Mefisto EDP. This is one of the perfume bottles located in the famous and very popular Casamorati collection.'
,'30ml 100ml',0,100,2024,1,1),
(2,'Louis Vuitton Météore EDP is part of Louis Vuitton "Les Parfum" collection just launched in 2020. As soon as it was released, this perfume bottle attracted attention. The idea of ​​boys with a luxurious and sophisticated design. Inspired by snow and ice crystals, the perfume bottle is designed with a round cylinder shape and soft rounded edges.'
,'30ml 100ml',0,100,2024,1,2),
(3,'Tommy Endless Blue is a perfume line of Tommy Hilfiger for men, launched in 2017. This men perfume bottle features a harmonious scent between sweetness of Tonka Beans, the spiciness of black pepper and the peaceful scent of herbs with a spicy kick of cognac.'
,'30ml 100ml',0,100,2024,1,3),
(4,'Issey Miyake L EAU D ISSEY Intense is a work of art as a men perfume by Issey Miyake, launched to create a fragrant experience. This fragrance is full of charm and depth. This is not simply a perfume, but also a story about emotions and the beauty of contrasts.'
,'30ml 100ml',0,100,2024,1,4),
(5,'Creed Aventus - A name that is no longer strange to trendy scent followers. Appointed as the king of men perfume. For being at the forefront of creating a scent Citrus, easy to use but indescribably unique. Attractive with a luxurious and attractive scent, adding a bit of generosity and bravery. The perfume line is inspired by the dramatic life of King Napoleon symbolizes war, peace and romance.',
'30ml 100ml',0,100,2024,1,5),
(6,'Chanel Chance EDP has been famous for many years, Chanel is sought after and used by many people because of its classy scent. Chanel Chance Eau De Parfum is one of the perfume lines most sought after by women, including me.'
,'30ml 100ml',0,100,2024,1,6),
(7,'Dior Joy is a work that Dior has cherished for a long time, but has just released it. A new scent, completely different from previous perfumes. If these scents The previous scent was classic and elegant. Dior Joy is a scent full of joy and happiness that Dior wants to send to women.'
,'30ml 100ml',0,100,2024,1,7),
(8,'YSL Libre is a women perfume product line of high-end fashion house Yves Saint Laurent launched in 2019. YSL Libre belongs to the oriental scent group for women and is Created by two mixologists Anne Flipo and Carlos Benaim, Libre means "freedom" in French, inspired by the desire for freedom of independent, luxurious and sexy women. '
,'30ml 100ml',0,100,2024,1,8),
(9,'Louis Vuitton Spell On You EDP is a high-end women perfume product from the famous fashion brand Louis Vuitton. Launched in 2021, Spell On You promises is a safe choice for every girl because of its fresh, delicate, gentle scent.'
,'30ml 100ml',0,100,2024,1,9),
(10,'Chance Eau Fraiche captivates the world with its playful, lively and sparkling fragrance. Recently, Chanel launched a new line of women perfume Chance Eau Fraiche - brilliant Brilliant and elegant. A new opportunity is at hand.'
,'30ml 100ml',0,100,2024,1,10),
(11,'Xerjoff Naxos EDP perfume is a unisex perfume line in the special collection of the Xerjoff brand. Launched in 2015, inspired by the essence of beauty. An island located in the middle of the Mediterranean Sea, Sicily.'
,'30ml 100ml',0,100,2024,1,11),
(12,'Armaf Sterling Club De Nuit Milestone EDP perfume is the best-selling product line of Armaf perfume with a sweet and modern scent, a delicate blend of unique scent notes.'
,'30ml 100ml',0,100,2024,1,12),
(13,'In 2019, the Gucci brand launched the Gucci A Song For The Rose EDP perfume line, this is a unisex perfume for both men and women. Distilled scent From the floral scent group thyme creates a sweet and seductive scent.'
,'30ml 100ml',0,100,2024,1,13),
(14,'Like other perfume lines of the Le Labo brand, the Le Labo The Noir 29 EDP perfume line has a minimalist, stylish bottle design. to a luxurious, sophisticated feeling. The perfume bottle is made of transparent glass, the color of the perfume inside can be seen. In particular, the owner of this perfume bottle can print his or her name on it sticker, this represents the personalization of the product, bringing a new and unique experience to customers.'
,'30ml 100ml',0,100,2024,1,14),
(15,'Are you looking for a perfume line for both women and men with a truly luxurious scent as well as making an impression at the first moment? Then Louis Vuitton Ombre Nomade EDP is the right choice right now. This is a unisex perfume line from the luxury brand Louis Vuitton.'
,'30ml 100ml',0,100,2024,1,15);


CREATE TABLE [dbo].[Cart] (
    CartID INT PRIMARY KEY IDENTITY(1,1),
    ProductDetailID INT NOT NULL,
    Quantity INT NOT NULL,
    AccountID INT NOT NULL,
    CreateDate DATE NOT NULL,
    TotalPrice FLOAT NOT NULL,
    FOREIGN KEY (ProductDetailID) REFERENCES [dbo].[ProductDetail]([ProductDetailID]),
    FOREIGN KEY (AccountID) REFERENCES [dbo].[Accounts]([AccountID])
)


CREATE TABLE [dbo].[StatusOrder] (
    SOID INT PRIMARY KEY IDENTITY(1,1),
    SOName NVARCHAR(255) NOT NULL,
    SOStatus INT NOT NULL
)



CREATE TABLE [dbo].[Orders] (
    OrderID INT PRIMARY KEY IDENTITY(1,1),
    AccountID INT NOT NULL,
    OrderDate DATE NOT NULL,
    OrderTotalPrice FLOAT NOT NULL,
    OrderContactName NVARCHAR(255) NOT NULL,
    OrderPhone NVARCHAR(255) NOT NULL,
    OrderAddress NVARCHAR(255) NOT NULL,
    OrderStatus INT NOT NULL,
    OrderReceiveDate DATE NULL,
    OrderNote NVARCHAR(255) NULL,
    OrderSoID INT NOT NULL,
    FOREIGN KEY (AccountID) REFERENCES [dbo].[Accounts](AccountID),
    FOREIGN KEY (OrderSoID) REFERENCES [dbo].[StatusOrder](SOID)
)
CREATE TABLE [dbo].[OrderDetail] (
    odID INT PRIMARY KEY IDENTITY(1,1),
    odOrderID INT NOT NULL,
    odProductID INT NOT NULL,
    odQuantity INT NOT NULL,
    odPrice FLOAT NOT NULL,
    FOREIGN KEY (odOrderID) REFERENCES [dbo].[Orders](OrderID),
    FOREIGN KEY (odProductID) REFERENCES [dbo].[Products](ProductID)
)

--drop table

