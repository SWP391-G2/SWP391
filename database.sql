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
('Spicy',2),
('Woody',2),
('Citrus',3),
('Floral',3),
('Fresh',3),
('Fruity',3),
('Romantic',3),
('Spicy',3),
('Woody',3);


CREATE TABLE [dbo].[Roles] (
    roleID INT PRIMARY KEY IDENTITY(1,1),
    roleName NVARCHAR(50) NOT NULL UNIQUE
)
INSERT INTO [dbo].[Roles] (roleName) VALUES
('Admin'),
('Sale'),
('Marketing'),
('Customer');

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
('LE LABO','Le Labo is a high-end and unique perfume brand, famous for creating handmade and personalized products. Each bottle of Le Labo perfume is made in-house products, ensuring sophistication and quality. This brand focuses on using natural and high-quality ingredients, along with unique flavor blends.'),
('BVLGARI','Bvlgari is a renowned luxury brand known for its exquisite fragrances and perfumes. Founded in 1884 by jewelry manufacturer Sotirio Bulgari, the brand offers both bold and modern scents as well as timeless classics. Bvlgari’s master perfumers create high-quality fragrances that reflect elegance and refinement. Their Eau Parfumee collection includes captivating scents for both men and women, making Bvlgari a go-to choice for those seeking sophistication and allure '),
('VERSACE','Versace is an Italian luxury fashion company founded by Gianni Versace in 1978. Known for its audacious and unapologetic style, Versace fuses street fashion with high-end designs, resulting in bombastic and avant-garde creations. The iconic Versace logo draws inspiration from Greek mythology, featuring the figure of Medusa. Versace produces Italian-made ready-to-wear clothing, accessories, and haute couture under its Atelier Versace brand, and licenses its name to Luxottica for eyewear. Their distinctive style combines materials like metal, mesh, and leather, often painted in bright colors, celebrating individuality and sensuality . '),
('LANCOME','Lancôme is a perfume and cosmetics brand with its roots in the heart of European fashion, Paris. Founded by Armand Petitjean during a major economic crisis in the mid-1930s, Lancôme has epitomized beauty with a French accent for over 80 years. What began as a brand helmed by knowledgeable ambassadresses quickly grew to include a thousand boutiques across France. Lancôme’s legacy of expertise continues today with their team of industry-leading National Makeup Artists, led by Lisa Eldridge. ');
CREATE TABLE [dbo].[Products] (
    [ProductID] [INT] PRIMARY KEY IDENTITY(1,1),
    [SubCategoryID] [INT] NULL,
    [ProductName] [NVARCHAR](255) NOT NULL,
    [ProductCreateDate] DATE NOT NULL,
    [ProductDetailID] [INT] NULL,
    [ProductStatus] BIT NOT NULL,
    [ProductImageUrl] [nvarchar](255) NOT NULL,
    [OrderID] [INT] NULL,	
    [fbID] [INT] NULL,
	[BrandID] [int] NULL,
    FOREIGN KEY (SubCategoryID) REFERENCES [dbo].[SubCategories]([SubCategoryID]),
    FOREIGN KEY (fbID) REFERENCES [dbo].[Feedbacks]([fbID]),
	FOREIGN KEY (BrandID) REFERENCES [dbo].[Brands](BrandID),
)
INSERT INTO [dbo].[Products] (
[ProductName],
[ProductDetailID],
[ProductCreateDate],
[SubCategoryID],
[ProductStatus],
[BrandID],
[ProductImageUrl])
VALUES
--5 perfumes for Men
('XERJOFF CASAMORATI MEFISTO EDP FOR MEN',1,'2024',1,1,3,'images/Products/Men/1_0.jpg'),
('LOUIS VUITTON MÉTÉORE EDP FOR MEN',2,'2024',1,1,4,'images/Products/Men/2_0.jpg'),
('TOMMY ENDLESS BLUE FOR MEN',3,'2024',2,1,6,'images/Products/Men/3_0.jpg'),
('ISSEY MIYAKE LEAU DISSEY INTENSE FOR MEN',4,'2024',7,1,7,'images/Products/Men/4_0.jpg'),
('CREED AVENTUS EDP FOR MEN',5,'2024',4,1,8,'images/Products/Men/5_0.jpg'),

--5 perfumes for Women
('CHANEL CHANCE EDP FOR WOMEN',6,'2024',9,1,2,'images/Products/Women/1_0.jpg'),
('DIOR JOY EDP FOR WOMEN',7,'2024',11,1,5,'images/Products/Women/2_0.jpg'),
('YSL LIBRE EDP FOR WOMEN',8,'2024',9,1,9,'images/Products/Women/3_0.jpg'),
('LOUIS VUITTON SPELL ON YOU EDP FOR WOMEN',9,'2024',9,1,4,'images/Products/Women/4_0.jpg'),
('CHANEL CHANCE EAU FRAICHE EDP FOR WOMEN',10,'2024',8,1,2,'images/Products/Women/5_0.jpg'),

--5 perfumes for Unisex

('XERJOFF NAXOS EDP FOR UNISEX',11,'2024',13,1,3,'images/Products/Unisex/1_0.jpg'),
('ARMAF STERLING CLUB DE NUIT MILESTONE EDP FOR UNISEX',12,'2024',16,1,10,'images/Products/Unisex/2_0.jpg'),
('GUCCI A SONG FOR THE ROSE EDP FOR UNISEX',13,'2024',16,1,1,'images/Products/Unisex/3_0.jpg'),
('LE LABO THE NOIR 29 EDP FOR UNISEX',14,'2024',21,1,12,'images/Products/Unisex/4_0.jpg'),
('LOUIS VUITTON OMBRE NOMADE EDP FOR UNISEX',15,'2024',21,1,4,'images/Products/Unisex/5_0.jpg'),

--5 Giftset 
('SET YSL BLACK OPIUM EDP FOR GIFT SET',16,'2024',NULL,1,9,'images/Products/Giftset/1_0.jpg'),
('SET BVLGARI OMNIA FOR GIFT SET',17,'2024',NULL,1,13,'images/Products/Giftset/2_0.jpg'),
('SET OF 5 LANCOME PARIS PERFUMES FOR GIFT SET',18,'2024',NULL,1,15,'images/Products/Giftset/3_0.jpg'),
('BVLGARI OMNIA AMETHYSTE FOR GIFT SET',19,'2024',NULL,1,13,'images/Products/Giftset/4_0.jpg'),
('VERSACE BRIGHT CRYSTAL ABSOLU FOR GIFT SET',20,'2024',NULL,1,14,'images/Products/Giftset/5_0.jpg');

CREATE TABLE [dbo].[ProductFullDetail] (
    [ProductFullDetailID] [int] PRIMARY KEY IDENTITY(1,1),
    [pdProductID] [int] NOT NULL,
    [ProductDescription] [NVARCHAR](max) NULL,
    [ProductCreateDate] DATE NULL,
    [ProductStatus] BIT NOT NULL,
    [ProductSize] [NVARCHAR](max) NULL,
    [ProductPrice] [decimal](18, 2) NOT NULL,
    [ProductAvaiable] [int] NOT NULL
	FOREIGN KEY ([pdProductID]) REFERENCES [dbo].[Products]([ProductID])
)
INSERT INTO [dbo].[ProductFullDetail] (
[pdProductID],
[ProductDescription],
[ProductCreateDate],
[ProductStatus],
[ProductSize],
[ProductPrice],
[ProductAvaiable])
VALUES
( 1, 'Inspired by the Italian coast, in 2009 the Xerjoff brand launched a perfume for men called Xerjoff Casamorati Mefisto EDP. This is one of the perfume bottles located in the famous and very popular Casamorati collection.', '2024-01-01', 1, '30ml', 50.00, 100),
( 1, 'Inspired by the Italian coast, in 2009 the Xerjoff brand launched a perfume for men called Xerjoff Casamorati Mefisto EDP. This is one of the perfume bottles located in the famous and very popular Casamorati collection.', '2024-01-01', 1, '100ml', 120.00, 100),
( 2, 'Louis Vuitton Météore EDP is part of Louis Vuitton "Les Parfum" collection just launched in 2020. As soon as it was released, this perfume bottle attracted attention. The idea of ​​boys with a luxurious and sophisticated design. Inspired by snow and ice crystals, the perfume bottle is designed with a round cylinder shape and soft rounded edges.', '2024-01-01', 1, '30ml', 60.00, 100),
( 2, 'Louis Vuitton Météore EDP is part of Louis Vuitton "Les Parfum" collection just launched in 2020. As soon as it was released, this perfume bottle attracted attention. The idea of ​​boys with a luxurious and sophisticated design. Inspired by snow and ice crystals, the perfume bottle is designed with a round cylinder shape and soft rounded edges.', '2024-01-01', 1, '100ml', 134.00, 100),
( 3, 'Tommy Endless Blue is a perfume line of Tommy Hilfiger for men, launched in 2017. This men perfume bottle features a harmonious scent between sweetness of Tonka Beans, the spiciness of black pepper and the peaceful scent of herbs with a spicy kick of cognac.', '2024-01-01', 1, '30ml', 30.00, 100),
( 3, 'Tommy Endless Blue is a perfume line of Tommy Hilfiger for men, launched in 2017. This men perfume bottle features a harmonious scent between sweetness of Tonka Beans, the spiciness of black pepper and the peaceful scent of herbs with a spicy kick of cognac.', '2024-01-01', 1, '100ml', 95.00, 100),
( 4, 'Issey Miyake L EAU D ISSEY Intense is a work of art as a men perfume by Issey Miyake, launched to create a fragrant experience. This fragrance is full of charm and depth. This is not simply a perfume, but also a story about emotions and the beauty of contrasts.', '2024-01-01', 1, '30ml', 46.00, 100),
( 4, 'Issey Miyake L EAU D ISSEY Intense is a work of art as a men perfume by Issey Miyake, launched to create a fragrant experience. This fragrance is full of charm and depth. This is not simply a perfume, but also a story about emotions and the beauty of contrasts.', '2024-01-01', 1, '100ml', 137.00, 100),
( 5, 'Creed Aventus - A name that is no longer strange to trendy scent followers. Appointed as the king of men perfume. For being at the forefront of creating a scent Citrus, easy to use but indescribably unique. Attractive with a luxurious and attractive scent, adding a bit of generosity and bravery. The perfume line is inspired by the dramatic life of King Napoleon symbolizes war, peace and romance.', '2024-01-01', 1, '30ml', 29.00, 100),
( 5, 'Creed Aventus - A name that is no longer strange to trendy scent followers. Appointed as the king of men perfume. For being at the forefront of creating a scent Citrus, easy to use but indescribably unique. Attractive with a luxurious and attractive scent, adding a bit of generosity and bravery. The perfume line is inspired by the dramatic life of King Napoleon symbolizes war, peace and romance.', '2024-01-01', 1, '100ml', 63.00, 100),
( 6, 'Chanel Chance EDP has been famous for many years, Chanel is sought after and used by many people because of its classy scent. Chanel Chance Eau De Parfum is one of the perfume lines most sought after by women, including me.', '2024-01-01', 1, '30ml', 70.00, 100),
( 6, 'Chanel Chance EDP has been famous for many years, Chanel is sought after and used by many people because of its classy scent. Chanel Chance Eau De Parfum is one of the perfume lines most sought after by women, including me.', '2024-01-01', 1, '100ml', 235.00, 100),
( 7, 'Dior Joy is a work that Dior has cherished for a long time, but has just released it. A new scent, completely different from previous perfumes. If these scents The previous scent was classic and elegant. Dior Joy is a scent full of joy and happiness that Dior wants to send to women.', '2024-01-01', 1, '30ml', 25.00, 100),
( 7, 'Dior Joy is a work that Dior has cherished for a long time, but has just released it. A new scent, completely different from previous perfumes. If these scents The previous scent was classic and elegant. Dior Joy is a scent full of joy and happiness that Dior wants to send to women.', '2024-01-01', 1, '100ml', 73.00, 100),
( 8, 'YSL Libre is a women perfume product line of high-end fashion house Yves Saint Laurent launched in 2019. YSL Libre belongs to the oriental scent group for women and is Created by two mixologists Anne Flipo and Carlos Benaim, Libre means "freedom" in French, inspired by the desire for freedom of independent, luxurious and sexy women.', '2024-01-01', 1, '30ml', 60.00, 100),
( 8, 'YSL Libre is a women perfume product line of high-end fashion house Yves Saint Laurent launched in 2019. YSL Libre belongs to the oriental scent group for women and is Created by two mixologists Anne Flipo and Carlos Benaim, Libre means "freedom" in French, inspired by the desire for freedom of independent, luxurious and sexy women.', '2024-01-01', 1, '100ml', 118.00, 100),
( 9, 'Louis Vuitton Spell On You EDP is a high-end women perfume product from the famous fashion brand Louis Vuitton. Launched in 2021, Spell On You promises is a safe choice for every girl because of its fresh, delicate, gentle scent.', '2024-01-01', 1, '30ml', 52.00, 100),
( 9, 'Louis Vuitton Spell On You EDP is a high-end women perfume product from the famous fashion brand Louis Vuitton. Launched in 2021, Spell On You promises is a safe choice for every girl because of its fresh, delicate, gentle scent.', '2024-01-01', 1, '100ml', 149.00, 100),
( 10, 'Chance Eau Fraiche captivates the world with its playful, lively and sparkling fragrance. Recently, Chanel launched a new line of women perfume Chance Eau Fraiche - brilliant Brilliant and elegant. A new opportunity is at hand.', '2024-01-01', 1, '30ml', 83.00, 100),
( 10, 'Chance Eau Fraiche captivates the world with its playful, lively and sparkling fragrance. Recently, Chanel launched a new line of women perfume Chance Eau Fraiche - brilliant Brilliant and elegant. A new opportunity is at hand.', '2024-01-01', 1, '100ml', 235.00, 100),
( 11, 'Xerjoff Naxos EDP perfume is a unisex perfume line in the special collection of the Xerjoff brand. Launched in 2015, inspired by the essence of beauty. An island located in the middle of the Mediterranean Sea, Sicily.', '2024-01-01', 1, '30ml', 47.00, 100),
( 11, 'Xerjoff Naxos EDP perfume is a unisex perfume line in the special collection of the Xerjoff brand. Launched in 2015, inspired by the essence of beauty. An island located in the middle of the Mediterranean Sea, Sicily.', '2024-01-01', 1, '100ml', 134.00, 100),
( 12, 'Armaf Sterling Club De Nuit Milestone EDP perfume is the best-selling product line of Armaf perfume with a sweet and modern scent, a delicate blend of unique scent notes.', '2024-01-01', 1, '30ml', 39.00, 100),
( 12, 'Armaf Sterling Club De Nuit Milestone EDP perfume is the best-selling product line of Armaf perfume with a sweet and modern scent, a delicate blend of unique scent notes.', '2024-01-01', 1, '100ml', 119.00, 100),
( 13, 'In 2019, the Gucci brand launched the Gucci A Song For The Rose EDP perfume line, this is a unisex perfume for both men and women. Distilled scent From the floral scent group thyme creates a sweet and seductive scent.', '2024-01-01', 1, '30ml', 17.00, 100),
( 13, 'In 2019, the Gucci brand launched the Gucci A Song For The Rose EDP perfume line, this is a unisex perfume for both men and women. Distilled scent From the floral scent group thyme creates a sweet and seductive scent.', '2024-01-01', 1, '100ml', 59.00, 100),
( 14, 'Like other perfume lines of the Le Labo brand, the Le Labo The Noir 29 EDP perfume line has a minimalist, stylish bottle design. to a luxurious, sophisticated feeling. The perfume bottle is made of transparent glass, the color of the perfume inside can be seen. In particular, the owner of this perfume bottle can print his or her name on it sticker, this represents the personalization of the product, bringing a new and unique experience to customers.', '2024-01-01', 1, '30ml', 73.00, 100),
( 14, 'Like other perfume lines of the Le Labo brand, the Le Labo The Noir 29 EDP perfume line has a minimalist, stylish bottle design. to a luxurious, sophisticated feeling. The perfume bottle is made of transparent glass, the color of the perfume inside can be seen. In particular, the owner of this perfume bottle can print his or her name on it sticker, this represents the personalization of the product, bringing a new and unique experience to customers.', '2024-01-01', 1, '100ml', 225.00, 100),
( 15, 'Are you looking for a perfume line for both women and men with a truly luxurious scent as well as making an impression at the first moment? Then Louis Vuitton Ombre Nomade EDP is the right choice right now. This is a unisex perfume line from the luxury brand Louis Vuitton.', '2024-01-01', 1, '30ml', 36.00, 100),
( 15, 'Are you looking for a perfume line for both women and men with a truly luxurious scent as well as making an impression at the first moment? Then Louis Vuitton Ombre Nomade EDP is the right choice right now. This is a unisex perfume line from the luxury brand Louis Vuitton.', '2024-01-01', 1, '100ml', 106.00, 100),
( 16, 'YSL Black Opium Eau De Parfum Christmas 2021 gift set, the new perfume line was announced as a classic rocknroll performance highlighting the magical, mysterious aspect of the YSL brand. Perfumers Nathalie Lorson and MarieSalamagne, collaborated with Olivier Cresp and Honorine Blanc to create this scent. YSL Balck Opium is Yves Saint Laurent first coffee-flower scent. The energy of black coffee dominates the entire fragrance of white flowers with assertive femininity accented by pink pepper and pear in the background.', '2024-01-01', 1, NULL, 100.00, 50),
( 17, 'BVLGari set of 3 bottles of 15ml includes 3 typical fragrances of the Bvlgari Omnia collection with 3 different styles and personalities gathered in the Bvlgari Omnia gift set so girls can experience the feelings about different scents. Bvlgari Omnia Coral EDT perfume 15ml Bvlgari Omnia Crystalline EDT perfume 15ml Bvlgari Omnia Amethyste EDT Perfume 15ml With a sophisticated, seductive and easy-to-use style, this collection will be a great choice when girls go to work or go out or picnic.', '2024-01-01', 1, NULL, 150.00, 50),
( 18, 'Set of 5 Lancome perfumes includes: Lancome Hypnose Eau de Parfum 5ml Lancome Tresor Eau de Parfum 7.5ml Lancome La vie est belle Eau de Parfum 4ml Lancome Miracle Eau de Parfum 5ml Lancome Tresor in Love Eau de Parfum 5ml', '2024-01-01', 1, NULL, 185.00, 50),
( 19, 'BVLGARI Omnia Amethyste Gift Set', '2024-01-01', 1, NULL, 212.00, 50),
( 20, 'Versace Absolute Gift Set 4 items: Versace Bright Crystal Absolu EDP 90ml perfume Versace Bright Crystal Absolu EDP 10ml Versace Perfumed Body Lotion 100ml Versace Perfumed Shower Gel 100ml', '2024-01-01', 1, NULL, 139.00, 50);

CREATE TABLE [dbo].[ProductDetailImages] (
    [ImageID] INT PRIMARY KEY IDENTITY(1,1),
    [ProductFullDetailID] INT NOT NULL,
    [ImageUrl] NVARCHAR(255) NOT NULL,
    FOREIGN KEY (ProductFullDetailID) REFERENCES [dbo].[ProductFullDetail]([ProductFullDetailID])
)
INSERT INTO [dbo].[ProductDetailImages] ([ProductFullDetailID], [ImageUrl])
VALUES
(1, 'images/Products/Men/1_1.jpg'),
(1, 'images/Products/Men/1_2.jpg'),
(1, 'images/Products/Men/1_3.jpg'),
(2, 'images/Products/Men/2_1.jpg'),
(2, 'images/Products/Men/2_2.jpg'),
(2, 'images/Products/Men/2_3.jpg'),
(3, 'images/Products/Men/3_1.jpg'),
(3, 'images/Products/Men/3_2.jpg'),
(3, 'images/Products/Men/3_3.jpg'),
(4, 'images/Products/Men/4_1.jpg'),
(4, 'images/Products/Men/4_2.jpg'),
(4, 'images/Products/Men/4_3.jpg'),
(5, 'images/Products/Men/5_1.jpg'),
(5, 'images/Products/Men/5_2.jpg'),
(5, 'images/Products/Men/5_3.jpg'),
(6, 'images/Products/Women/6_1.jpg'),
(6, 'images/Products/Women/6_2.jpg'),
(6, 'images/Products/Women/6_3.jpg'),
(7, 'images/Products/Women/7_1.jpg'),
(7, 'images/Products/Women/7_2.jpg'),
(7, 'images/Products/Women/7_3.jpg'),
(8, 'images/Products/Women/8_1.jpg'),
(8, 'images/Products/Women/8_2.jpg'),
(8, 'images/Products/Women/8_3.jpg'),
(9, 'images/Products/Women/9_1.jpg'),
(9, 'images/Products/Women/9_2.jpg'),
(9, 'images/Products/Women/9_3.jpg'),
(10, 'images/Products/Women/10_1.jpg'),
(10, 'images/Products/Women/10_2.jpg'),
(10, 'images/Products/Women/10_3.jpg'),
(11, 'images/Products/Unisex/11_1.jpg'),
(11, 'images/Products/Unisex/11_2.jpg'),
(11, 'images/Products/Unisex/11_3.jpg'),
(12, 'images/Products/Unisex/12_1.jpg'),
(12, 'images/Products/Unisex/12_2.jpg'),
(12, 'images/Products/Unisex/12_3.jpg'),
(13, 'images/Products/Unisex/13_1.jpg'),
(13, 'images/Products/Unisex/13_2.jpg'),
(13, 'images/Products/Unisex/13_3.jpg'),
(14, 'images/Products/Unisex/14_1.jpg'),
(14, 'images/Products/Unisex/14_2.jpg'),
(14, 'images/Products/Unisex/14_3.jpg'),
(15, 'images/Products/Unisex/15_1.jpg'),
(15, 'images/Products/Unisex/15_2.jpg'),
(15, 'images/Products/Unisex/15_3.jpg'),
(16, 'images/Products/Giftset/16_1.jpg'),
(16, 'images/Products/Giftset/16_2.jpg'),
(16, 'images/Products/Giftset/16_3.jpg'),
(17, 'images/Products/Giftset/17_1.jpg'),
(17, 'images/Products/Giftset/17_2.jpg'),
(17, 'images/Products/Giftset/17_3.jpg'),
(18, 'images/Products/Giftset/18_1.jpg'),
(18, 'images/Products/Giftset/18_2.jpg'),
(18, 'images/Products/Giftset/18_3.jpg'),
(19, 'images/Products/Giftset/19_1.jpg'),
(19, 'images/Products/Giftset/19_2.jpg'),
(19, 'images/Products/Giftset/19_3.jpg'),
(20, 'images/Products/Giftset/20_1.jpg'),
(20, 'images/Products/Giftset/20_2.jpg'),
(20, 'images/Products/Giftset/20_3.jpg');

CREATE TABLE [dbo].[Cart] (
    CartID INT PRIMARY KEY IDENTITY(1,1),
    ProductFullDetailID INT NOT NULL,
    Quantity INT NOT NULL,
    AccountID INT NOT NULL,
    CreateDate DATE NOT NULL,
    TotalPrice FLOAT NOT NULL,
    FOREIGN KEY (ProductFullDetailID) REFERENCES [dbo].[ProductFullDetail]([ProductFullDetailID]),
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
CREATE TABLE [dbo].[Sliders](
[SliderID] int PRIMARY KEY IDENTITY(1,1),
[SliderImage] nvarchar(255) NOT NULL,
[SliderStatus] bit NOT NULL,
[SliderTitle] nvarchar(max) NULL,
)
INSERT INTO [dbo].[Sliders] ([SliderImage],[SliderTitle],[SliderStatus])
VALUES
('images/Sliders/1.jpg',NULL,1),
('images/Sliders/2.jpg',NULL,1),
('images/Sliders/3.jpg',NULL,1)