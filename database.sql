use [master]
GO
IF EXISTS (SELECT * FROM sys.databases WHERE name = 'TPS')
	DROP DATABASE TPS
GO
--drop database TPS
CREATE DATABASE TPS
GO
USE TPS
GO

CREATE TABLE [dbo].[Categories](
[CategoryID] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
[CategoryName] [nvarchar](50) NOT NULL,
[Description] [ntext] NULL,
	[status] [int]
)

INSERT INTO [dbo].[Categories] ([CategoryName],[Description],[status])
VALUES
('Men','What do gentlemen look for perfume for? Probably to smell good, be masculine and enhance their style, right ? Namperfume understands our gentlemen , brings to men decent, neat, attractive, sometimes overwhelmingly powerful scents, and certainly cannot forget the typical liberal dustiness of men.',1),
('Women','Perfume from the early days was created to serve women, so it seems that in the world of scent, the choices for women are richer and more colorful. That"s why, namperfume always wants to bring beautiful ladies great options, from seductive, luxurious, powerful to gentle, innocent, and indispensable a bit of flirty sexiness. recline...',1),
('Unisex','Unisex perfume is a perfume line suitable for all genders, whether men or women can use this product. Same perfume, but when men use it, they will become elegant. A girl who possesses adorable charms will become even more attractive.',1),
('Giftset','Giftset - also known as gift set, is a collection of many different types of products. They are all highly applicable to serve work and daily life. All The products in the Giftset are all related to each other and have high aesthetics to bring satisfaction to the recipient.',1);

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
[Gender] int NOT NULL,
[BirthDay] date NOT NULL,
[Email] [nvarchar](50) NULL,
[Status] int NOT NULL,
[CreateDate] date NOT NULL,
[RoleID] [int] NOT NULL,
FOREIGN KEY (roleID) REFERENCES [dbo].[Roles](roleID)
)
INSERT INTO [dbo].[Accounts] (
    [FirstName],
    [LastName],
    [Password],
    [Image],
    [Gender],
    [BirthDay],
    [Email],
    [Status],
    [CreateDate],
    [RoleID]
)
VALUES
    (N'Nguyễn', N'Văn Anh', 'password123', NULL, 1, '1990-01-01', 'nguyenvananh@example.com', 1, '2022-01-01', 1),
    (N'Lê', N'Thị Hà', 'password123', NULL, 2, '1992-02-02', 'lethiha@example.com', 1, '2022-01-02', 2),
    (N'Trần', N'Đình Nam', 'password123', NULL, 1, '1980-03-03', 'trandinhnam@example.com', 1, '2022-01-03', 1),
    (N'Ngô', N'Thị Nga', 'password123', NULL, 2, '1995-04-04', 'ngothinga@example.com', 1, '2022-01-04', 2),
    (N'Phạm', N'Văn Minh', 'password123', NULL, 1, '1985-05-05', 'phamvanminh@example.com', 1, '2022-01-05', 1),
    (N'Hồ', N'Thị Thu', 'password123', NULL, 2, '1998-06-06', 'hothithu@example.com', 1, '2022-01-06', 2),
    (N'Đặng', N'Văn Tùng', 'password123', NULL, 1, '1990-07-07', 'dangvantung@example.com', 1, '2022-01-07', 1),
    (N'Lê', N'Thị Loan', 'password123', NULL, 2, '1992-08-08', 'lethiloan@example.com', 1, '2022-01-08', 2),
    (N'Nguyễn', N'Văn Hùng', 'password123', NULL, 1, '1982-09-09', 'nguyenvanhung@example.com', 1, '2022-01-09', 1),
    (N'Trần', N'Thị Linh', 'password123', NULL, 2, '1995-10-10', 'tranthilinh@example.com', 1, '2022-01-10', 2);

CREATE TABLE [dbo].[Feedbacks] (
    fbID INT PRIMARY KEY IDENTITY(1,1),
    fbAccountID INT NOT NULL,
    fbProductID INT NOT NULL,
    fbStar INT NOT NULL,
    fbContent NVARCHAR(255) NULL,
    fbImage NVARCHAR(255) NULL,
    fbDate DATE NOT NULL,
    fbStatus INT NOT NULL,
	[reply] nvarchar (250) NULL,
    FOREIGN KEY (fbAccountID) REFERENCES [dbo].[Accounts](AccountID)
)
CREATE TABLE [dbo].[Brands] (
    [BrandID] INT PRIMARY KEY IDENTITY(1,1),
    [BrandName] NVARCHAR(100) NOT NULL UNIQUE,
    [Description] NVARCHAR(MAX),
	[status] [int]
)

INSERT INTO [dbo].[Brands]([BrandName],[Description],[status])
VALUES
('GUCCI','Gucci perfume is one of the most revered brands in the world. Founded in the 1920s in Florence, Italy, Gucci has always understood that fashion and perfume are two inseparable things. The company offers clothes with modern, modern styles for both men and women. Gucci famous interlocking letter logo has become a fashion icon that is always seen in all of the company products, from bag collections, sportswear, seasonal high and thin heels to perfume bottles. Gucci perfumes have a variety of scents, from sensual and indulgent to sweet and fresh. Along with the company clothing and accessories lines, which have long become classic scents.',1),
('CHANEL','Chanel is a famous perfume brand known for its elegance, sophistication and class. Chanel perfume products often have unique scents, combining natural ingredients. natural and synthetic to create unique and long-lasting scents.',1),
('XERJOFF','Xerjoff is a famous high-end perfume brand with the perfect combination of craftsmanship and rare ingredients. Xerjoff perfume lines bring unique fragrance experiences. unique, complex and full of sophistication.',1),
('LOUIS VUITTON', 'Louis Vuitton, famous for its luxury and class in fashion and accessories, also offers high-end perfume lines with delicate and unique scents. Louis Vuitton perfumes are Created by leading perfumers, using rare and high quality ingredients.',1),
('DIOR','Dior is a famous brand in the field of perfume, with many iconic product lines. Dior perfume stands out with its sophisticated combination of high-quality ingredients, bringing the fragrance is diverse and rich.',1),
('TOMMY HILFIGER','Tommy Hilfiger is a famous brand, not only in the fashion field but also in the perfume industry. Tommy Hilfiger perfumes often have a youthful, dynamic and fresh style.' ,1),
('ISSEY MIYAKE',N'Issey Miyake is a famous brand with modern, minimalist and sophisticated perfume lines. Issey Miyake perfumes often stand out with their fresh, elegant and creative, inspired by nature and natural elements.',1),
('CREED', 'Creed is a high-end French perfume brand, famous for its handmade, sophisticated and luxurious perfume lines. Each Creed product is usually made from quality natural ingredients. high quality, providing a unique and long-lasting fragrance.',1),
('YVES SAINT LAURENT (YSL)','Yves Saint Laurent (YSL) is a famous perfume brand, standing out with products that have a seductive, bold and modern style. YSL perfumes are often highly appreciated for the creativity in blending aromas, bringing unique and impressive scents.',1),
('ARMAF','Armaf is a famous perfume brand with high quality products at affordable prices. Armaf perfumes often have diverse styles, from fresh to passionate, suitable for everyone. Suitable for many different tastes and occasions.',1),
('ROJA PARFUMS', 'Roja Parfums is a high-end and luxurious perfume brand of perfume creator Roja Dove. Roja Parfums products are often known for their sophistication in the way they combine scents. materials, ensuring the highest quality and uniqueness. Each bottle of Roja Parfums perfume is often handmade and limited, creating works of art in the world of perfume.',1),
('LE LABO','Le Labo is a high-end and unique perfume brand, famous for creating handmade and personalized products. Each bottle of Le Labo perfume is made in-house products, ensuring sophistication and quality. This brand focuses on using natural and high-quality ingredients, along with unique flavor blends.',1),
('BVLGARI','Bvlgari is a renowned luxury brand known for its exquisite fragrances and perfumes. Founded in 1884 by jewelry manufacturer Sotirio Bulgari, the brand offers both bold and modern scents as well as timeless classics. Bvlgari’s master perfumers create high-quality fragrances that reflect elegance and refinement. Their Eau Parfumee collection includes captivating scents for both men and women, making Bvlgari a go-to choice for those seeking sophistication and allure ',1),
('VERSACE','Versace is an Italian luxury fashion company founded by Gianni Versace in 1978. Known for its audacious and unapologetic style, Versace fuses street fashion with high-end designs, resulting in bombastic and avant-garde creations. The iconic Versace logo draws inspiration from Greek mythology, featuring the figure of Medusa. Versace produces Italian-made ready-to-wear clothing, accessories, and haute couture under its Atelier Versace brand, and licenses its name to Luxottica for eyewear. Their distinctive style combines materials like metal, mesh, and leather, often painted in bright colors, celebrating individuality and sensuality . ',1),
('LANCOME','Lancôme is a perfume and cosmetics brand with its roots in the heart of European fashion, Paris. Founded by Armand Petitjean during a major economic crisis in the mid-1930s, Lancôme has epitomized beauty with a French accent for over 80 years. What began as a brand helmed by knowledgeable ambassadresses quickly grew to include a thousand boutiques across France. Lancôme’s legacy of expertise continues today with their team of industry-leading National Makeup Artists, led by Lisa Eldridge. ',1);
CREATE TABLE [dbo].[Products] (
     [ProductID] [INT] PRIMARY KEY IDENTITY(1,1),
    [ProductName] [NVARCHAR](255) NOT NULL,
    [ProductCreateDate] DATE NOT NULL,
    [ProductDetailID] [INT] NULL,
    [ProductStatus] int NOT NULL,
    [ProductImageUrl] [nvarchar](255) NOT NULL,
    [OrderID] [INT] NULL,	
    [fbID] [INT] NULL,
	[BrandID] [int] NULL,
	[fk_category_id][int],
	[UpdateDescription] nvarchar(max) NULL,
	FOREIGN KEY (fk_category_id) REFERENCES [dbo].[Categories](CategoryID),
    FOREIGN KEY (fbID) REFERENCES [dbo].[Feedbacks]([fbID]),
	FOREIGN KEY (BrandID) REFERENCES [dbo].[Brands](BrandID),
)
INSERT INTO [dbo].[Products] (
[ProductName],
[ProductDetailID],
[ProductCreateDate],
[ProductStatus],
[BrandID],
[ProductImageUrl],
[fk_category_id])
VALUES
--20 perfumes for Men
('XERJOFF CASAMORATI MEFISTO EDP FOR MEN',1,'2024-01-01',1,3,'1_0.jpg',1),
('LOUIS VUITTON MÉTÉORE EDP FOR MEN',2,'2024-01-01',1,4,'2_0.jpg',1),
('TOMMY ENDLESS BLUE FOR MEN',3,'2024-01-01',1,6,'3_0.jpg',1),
('ISSEY MIYAKE LEAU DISSEY INTENSE FOR MEN',4,'2024-01-01',1,7,'4_0.jpg',1),
('CREED AVENTUS EDP FOR MEN',5,'2024-01-01',1,8,'5_0.jpg',1),
('DIOR SAUVAGE EDP FOR MEN',6,'2024-01-01',1,5,'6_0.jpg',1),
('BLEU DE CHANEL EDP FOR MEN',7,'2024-01-01',1,2,'7_0.jpg',1),
('YVES SAINT LAURENT LA NUIT DE L''HOMME EDT FOR MEN',8,'2024-01-01',1,9,'8_0.jpg',1),
('VERSACE DYLAN BLUE POUR HOMME FOR MEN',9,'2024-01-01',1,14,'9_0.jpg',1),
('ARMAF VENTANA POUR HOMME EDP FOR MEN',10,'2024-01-01',1,10,'10_0.jpg',1),
('BVLGARI WOOD NEROLI EDP FOR MEN',11,'2024-01-01',1,13,'11_0.jpg',1),
('VERSACE EAU FRAICHE EDT FOR MEN',12,'2024-01-01',1,14,'12_0.jpg',1),
('GUCCI GUILTY ABSOLUTE POUR HOMME FOR MEN',13,'2024-01-01',1,1,'13_0.jpg',1),
('YVES SAINT LAURENT Y EDP FOR MEN',14,'2024-01-01',1,9,'14_0.jpg',1),
('ROJA ENIGMA POUR HOMME FOR MEN',15,'2024-01-01',1,11,'15_0.jpg',1),
('BVLGARI SPLENDIDA JASMIN NOIR EDP FOR MEN',16,'2024-01-01',1,13,'16_0.jpg',1),
('CHANEL ANTAEUS POUR HOMME EDT FOR MEN',17,'2024-01-01',1,2,'17_0.jpg',1),
('DIOR HOMME SPORT EDT FOR MEN',18,'2024-01-01',1,5,'18_0.jpg',1),
('VERSACE EROS FLAME FOR MEN',19,'2024-01-01',1,14,'19_0.jpg',1),
('ISSEY MIYAKE NUIT DISSEY EDT FOR MEN',20,'2024-01-01',1,7,'20_0.jpg',1),

-- 20 perfumes for Women
('CHANEL CHANCE EDP FOR WOMEN',21,'2024-01-01',1,2,'21_0.jpg',2),
('DIOR JOY EDP FOR WOMEN',22,'2024-01-01',1,5,'22_0.jpg',2),
('YSL LIBRE EDP FOR WOMEN',23,'2024-01-01',1,9,'23_0.jpg',2),
('LOUIS VUITTON SPELL ON YOU EDP FOR WOMEN',24,'2024-01-01',1,4,'24_0.jpg',2),
('CHANEL CHANCE EAU FRAICHE EDP FOR WOMEN',25,'2024-01-01',1,2,'25_0.jpg',2),
('LANCOME LA VIE EST BELLE EN ROSE FOR WOMEN',26,'2024-01-01',1,15,'26_0.jpg',2),
('LANCOME TRESOR LA NUIT EDP FOR WOMEN',27,'2024-01-01',1,15,'27_0.jpg',2),
('LANCOME LA VIE EST BELLE EDP FOR WOMEN',28,'2024-01-01',1,15,'28_0.jpg',2),
('GUCCI BLOOM AMBROSIA DI FIORI EDP FOR WOMEN',29,'2024-01-01',1,1,'29_0.jpg',2),
('BVLGARI ROSE GOLDEA FOR WOMEN',30,'2024-01-01',1,13,'30_0.jpg',2),
('ARMAF CLUB DE NUIT FOR WOMEN',31,'2024-01-01',1,10,'31_0.jpg',2),
('GUCCI FLORA GORGEOUS GARDENIA EDP FOR WOMEN',32,'2024-01-01',1,1,'32_0.jpg',2),
('TOMMY GIRL EDT FOR WOMEN',33,'2024-01-01',1,6,'33_0.jpg',2),
('ROJA ELIXIR POUR FEMME FOR WOMEN',34,'2024-01-01',1,11,'34_0.jpg',2),
('CHANEL COCO MADEMOISELLE EDP FOR WOMEN',35,'2024-01-01',1,2,'35_0.jpg',2),
('LOUIS VUITTON MATIERE NOIRE FOR WOMEN',36,'2024-01-01',1,4,'36_0.jpg',2),
('LOUIS VUITTON CALIFORNIA DREAM FOR WOMEN',37,'2024-01-01',1,4,'37_0.jpg',2),
('GUCCI BLOOM EDP FOR WOMEN',38,'2024-01-01',1,1,'38_0.jpg',2),
('CHANEL COCO NOIR FOR WOMEN',39,'2024-01-01',1,2,'39_0.jpg',2),
('VERSACE DYLAN BLUE POUR FEMME EDP FOR WOMEN',40,'2024-01-01',1,14,'40_0.jpg',2),

-- 20 perfumes for Unisex
('XERJOFF NAXOS EDP FOR UNISEX',41,'2024-01-01',1,3,'41_0.jpg',3),
('ARMAF STERLING CLUB DE NUIT MILESTONE EDP FOR UNISEX',42,'2024-01-01',1,10,'42_0.jpg',3),
('GUCCI A SONG FOR THE ROSE EDP FOR UNISEX',43,'2024-01-01',1,1,'43_0.jpg',3),
('LE LABO THE NOIR 29 EDP FOR UNISEX',44,'2024-01-01',1,12,'44_0.jpg',3),
('LOUIS VUITTON OMBRE NOMADE EDP FOR UNISEX',45,'2024-01-01',1,4,'45_0.jpg',3),
('CREED SILVER MOUNTAIN WATER FOR UNISEX',46,'2024-01-01',1,8,'46_0.jpg',3),
('LE LABO BERGAMOTE 22 EDP FOR UNISEX',47,'2024-01-01',1,12,'47_0.jpg',3),
('LE LABO SANTAL 33 FOR UNISEX',48,'2024-01-01',1,12,'48_0.jpg',3),
('ROJA DOVE AMBER AOUND PARFUM FOR UNISEX',49,'2024-01-01',1,11,'49_0.jpg',3),
('LOUIS VUITTON CACTUS GARDEN EDP FOR UNISEX',50,'2024-01-01',1,4,'50_0.jpg',3),
('LOUIS VUITOTN SUN SONG EDP FOR UNISEX',51,'2024-01-01',1,4,'51_0.jpg',3),
('ROJA DOVE MANHATTAN EDP FOR UNISEX',52,'2024-01-01',1,11,'52_0.jpg',3),
('ROJA DOVE BURLINGTON 1819 PARFUM FOR UNISEX',53,'2024-01-01',1,11,'53_0.jpg',3),
('XERJOFF ALEXANDRIA II FOR UNISEX',54,'2024-01-01',1,3,'54_0.jpg',3),
('BVLGARI SPLENDIDA MAGNOLIA SENSUEL EDP FOR UNISEX',55,'2024-01-01',1,13,'55_0.jpg',3),
('ARMAF CLUB DE NUIT UNTOLD EDP FOR UNISEX',56,'2024-01-01',1,10,'56_0.jpg',3),
('GUCCI BLOOM ACQUA DI FIORI EDT',57,'2024-01-01',1,1,'57_0.jpg',3),
('CHANEL GABRIELLE ESSENCE EDP',58,'2024-01-01',1,2,'58_0.jpg',3),
('VERSACE YELLOW DIAMOND INTENSE EDP FOR UNISEX',59,'2024-01-01',1,14,'59_0.jpg',3),
('CHANEL ALLURE HOMME SPORT COLOGNE FOR UNISEX',60,'2024-01-01',1,2,'60_0.jpg',3),

-- 5 Giftsets 
('SET YSL BLACK OPIUM EDP FOR GIFT SET',61,'2024-01-01',1,9,'61_0.jpg',4),
('SET BVLGARI OMNIA FOR GIFT SET',62,'2024-01-01',1,13,'62_0.jpg',4),
('SET OF 5 LANCOME PARIS PERFUMES FOR GIFT SET',63,'2024-01-01',1,15,'63_0.jpg',4),
('BVLGARI OMNIA AMETHYSTE FOR GIFT SET',64,'2024-01-01',1,13,'64_0.jpg',4),
('VERSACE BRIGHT CRYSTAL ABSOLU FOR GIFT SET',65,'2024-01-01',1,14,'65_0.jpg',4);

CREATE TABLE [dbo].[ProductFullDetail] (
    [ProductFullDetailID] [int] PRIMARY KEY IDENTITY(1,1),
    [pdProductID] [int] NOT NULL,
    [ProductDescription] [NVARCHAR](max) NULL,
    [ProductCreateDate] DATE NULL,
    [ProductStatus] int NOT NULL,
    [ProductSize] [NVARCHAR](max) NULL,
    [ProductPrice] [decimal](18, 2) NOT NULL,
    [ProductAvaiable] [int] NOT NULL,
	[image] varchar(100),
	FOREIGN KEY ([pdProductID]) REFERENCES [dbo].[Products]([ProductID])
)

INSERT INTO [dbo].[ProductFullDetail] (
    [pdProductID],
    [ProductDescription],
    [ProductCreateDate],
    [ProductStatus],
    [ProductSize],
    [ProductPrice],
    [ProductAvaiable],
    [image]
)
VALUES
--Details full for men
( 1, 'Inspired by the Italian coast, in 2009 the Xerjoff brand launched a perfume for men called Xerjoff Casamorati Mefisto EDP. This is one of the perfume bottles located in the famous and very popular Casamorati collection.', '2024-01-01', 1, '30ml', 50.00, 100, '1_1.jpg'),
( 1, 'Inspired by the Italian coast, in 2009 the Xerjoff brand launched a perfume for men called Xerjoff Casamorati Mefisto EDP. This is one of the perfume bottles located in the famous and very popular Casamorati collection.', '2024-01-01', 1, '100ml', 120.00, 100, '1_2.jpg'),
( 2, 'Louis Vuitton Météore EDP is part of Louis Vuitton "Les Parfum" collection just launched in 2020. As soon as it was released, this perfume bottle attracted attention. The idea of boys with a luxurious and sophisticated design. Inspired by snow and ice crystals, the perfume bottle is designed with a round cylinder shape and soft rounded edges.', '2024-01-01', 1, '30ml', 60.00, 100, '2_1.jpg'),
( 2, 'Louis Vuitton Météore EDP is part of Louis Vuitton "Les Parfum" collection just launched in 2020. As soon as it was released, this perfume bottle attracted attention. The idea of boys with a luxurious and sophisticated design. Inspired by snow and ice crystals, the perfume bottle is designed with a round cylinder shape and soft rounded edges.', '2024-01-01', 1, '100ml', 134.00, 100, '2_2.jpg'),
( 3, 'Tommy Endless Blue is a perfume line of Tommy Hilfiger for men, launched in 2017. This men''s perfume bottle features a harmonious scent between sweetness of Tonka Beans, the spiciness of black pepper and the peaceful scent of herbs with a spicy kick of cognac.', '2024-01-01', 1, '30ml', 30.00, 100, '3_1.jpg'),
( 3, 'Tommy Endless Blue is a perfume line of Tommy Hilfiger for men, launched in 2017. This men''s perfume bottle features a harmonious scent between sweetness of Tonka Beans, the spiciness of black pepper and the peaceful scent of herbs with a spicy kick of cognac.', '2024-01-01', 1, '100ml', 95.00, 100, '3_2.jpg'),
( 4, 'Issey Miyake L EAU D ISSEY Intense is a work of art as a men perfume by Issey Miyake, launched to create a fragrant experience. This fragrance is full of charm and depth. This is not simply a perfume, but also a story about emotions and the beauty of contrasts.', '2024-01-01', 1, '30ml', 46.00, 100, '4_1.jpg'),
( 4, 'Issey Miyake L EAU D ISSEY Intense is a work of art as a men perfume by Issey Miyake, launched to create a fragrant experience. This fragrance is full of charm and depth. This is not simply a perfume, but also a story about emotions and the beauty of contrasts.', '2024-01-01', 1, '100ml', 137.00, 100, '4_2.jpg'),
( 5, 'Creed Aventus - A name that is no longer strange to trendy scent followers. Appointed as the king of men perfume. For being at the forefront of creating a scent Citrus, easy to use but indescribably unique. Attractive with a luxurious and attractive scent, adding a bit of generosity and bravery. The perfume line is inspired by the dramatic life of King Napoleon symbolizes war, peace and romance.', '2024-01-01', 1, '30ml', 29.00, 100, '5_1.jpg'),
( 5, 'Creed Aventus - A name that is no longer strange to trendy scent followers. Appointed as the king of men perfume. For being at the forefront of creating a scent Citrus, easy to use but indescribably unique. Attractive with a luxurious and attractive scent, adding a bit of generosity and bravery. The perfume line is inspired by the dramatic life of King Napoleon symbolizes war, peace and romance.', '2024-01-01', 1, '100ml', 63.00, 100, '5_2.jpg'),
( 6, 'Dior Sauvage EDP men''s perfume of the Christian Dior brand was launched in 2018, known as the version that continues the resounding success of the 2015 product line that made men "suffer". The scent of Dior Sauvage EDP is masculine, strong, attractive from everyday scents and conquers the most demanding people.', '2024-01-01', 1, '30ml', 75.00, 100, '6_1.jpg'),
( 6, 'Dior Sauvage EDP men''s perfume of the Christian Dior brand was launched in 2018, known as the version that continues the resounding success of the 2015 product line that made men "suffer". The scent of Dior Sauvage EDP is masculine, strong, attractive from everyday scents and conquers the most demanding people.', '2024-01-01', 1, '100ml', 155.00, 100, '6_2.jpg'),
( 7, 'Bleu De Chanel EDP men''s perfume is extremely popular, the scent is perfect and an absolute hit in that it suits all men and can be used at any time.', '2024-01-01', 1, '30ml', 85.00, 100, '7_1.jpg'),
( 7, 'Bleu De Chanel EDP men''s perfume is extremely popular, the scent is perfect and an absolute hit in that it suits all men and can be used at any time.', '2024-01-01', 1, '100ml', 170.00, 100, '7_2.jpg'),
( 8, 'Yves Saint Laurent La Nuit de L''Homme EDT offers a seductive and enchanting fragrance. The blend of spice notes such as cardamom, cedarwood, and lavender creates a masculine, strong scent that retains sophistication and elegance.', '2024-01-01', 1, '30ml', 34.70, 100, '8_1.jpg'),
( 8, 'Yves Saint Laurent La Nuit de L''Homme EDT offers a seductive and enchanting fragrance. The blend of spice notes such as cardamom, cedarwood, and lavender creates a masculine, strong scent that retains sophistication and elegance.', '2024-01-01', 1, '100ml', 104.50, 100, '8_2.jpg'),
( 9, 'Versace Dylan Blue Pour Homme is the perfect choice for those who love freshness and dynamism. The top notes of grapefruit, bergamot and seawater provide a refreshing feel, while the middle notes of fig leaves and the end notes of wood and aromatic resin make for the perfect and lasting balance.', '2024-01-01', 1, '30ml', 45.00, 100, '9_1.jpg'),
( 9, 'Versace Dylan Blue Pour Homme is the perfect choice for those who love freshness and dynamism. The top notes of grapefruit, bergamot and seawater provide a refreshing feel, while the middle notes of fig leaves and the end notes of wood and aromatic resin make for the perfect and lasting balance.', '2024-01-01', 1, '100ml', 130.00, 100, '9_2.jpg'),
( 10, 'Armaf Ventana Pour Homme EDP is a passionate and attractive fragrance, ideal for special occasions. With early notes of bergamot, lemon and tangerine, combined with woody midst notes and end notes of vanilla and musk, this perfume gives confidence and charm to men.', '2024-01-01', 1, '30ml', 52.00, 100, '10_1.jpg'),
( 10, 'Armaf Ventana Pour Homme EDP is a passionate and attractive fragrance, ideal for special occasions. With early notes of bergamot, lemon and tangerine, combined with woody midst notes and end notes of vanilla and musk, this perfume gives confidence and charm to men.', '2024-01-01', 1, '100ml', 160.00, 100, '10_2.jpg'),
( 11, 'Wood Neroli is a floral scent, wood, musk for men, launched by perfume company Bvlgari in 2019. This is also the second scent in Bvlgari''s new collection, with the first edition entitled Wood Essence.', '2024-01-01', 1, '30ml', 36.00, 100, '11_1.jpg'),
( 11, 'Wood Neroli is a floral scent, wood, musk for men, launched by perfume company Bvlgari in 2019. This is also the second scent in Bvlgari''s new collection, with the first edition entitled Wood Essence.', '2024-01-01', 1, '100ml', 94.00, 100, '11_2.jpg'),
( 12, 'Versace Man Eau Fraiche for men is suitable for daytime, especially in summer when the weather is hot. Help boys stay fresh and refreshed with a cool and masculine scent.', '2024-01-01', 1, '30ml', 32.00, 100, '12_1.jpg'),
( 12, 'Versace Man Eau Fraiche for men is suitable for daytime, especially in summer when the weather is hot. Help boys stay fresh and refreshed with a cool and masculine scent.', '2024-01-01', 1, '100ml', 103.00, 100, '12_2.jpg'),
( 13, 'Gucci Guilty Absolute Pour Homme is a powerful and masculine fragrance that offers charm and mystery. With a combination of woody, amber and leather notes, this perfume creates a sense of charm and power.', '2024-01-01', 1, '30ml', 25.50, 100, '13_1.jpg'),
( 13, 'Gucci Guilty Absolute Pour Homme is a powerful and masculine fragrance that offers charm and mystery. With a combination of woody, amber and leather notes, this perfume creates a sense of charm and power.', '2024-01-01', 1, '100ml', 82.50, 100, '13_2.jpg'),
( 14, 'Yves Saint Laurent Y EDP is a modern and powerful fragrance that is ideal for confident and stylish men. The refreshing tip notes of citrus and ginger, combined with the middle notes from sage and the end notes from wood and amber, create a unique and lasting scent.', '2024-01-01', 1, '30ml', 49.99, 100, '14_1.jpg'),
( 14, 'Yves Saint Laurent Y EDP is a modern and powerful fragrance that is ideal for confident and stylish men. The refreshing tip notes of citrus and ginger, combined with the middle notes from sage and the end notes from wood and amber, create a unique and lasting scent.', '2024-01-01', 1, '100ml', 139.99, 100, '14_2.jpg'),
( 15, 'Roja Enigma Pour Homme is a complex and mysterious fragrance, ideal for special occasions. With a blend of bergamot, ginger, and cognac, combined with woody and tobacco notes, this perfume offers elegance and charm.', '2024-01-01', 1, '30ml', 35.70, 100, '15_1.jpg'),
( 15, 'Roja Enigma Pour Homme is a complex and mysterious fragrance, ideal for special occasions. With a blend of bergamot, ginger, and cognac, combined with woody and tobacco notes, this perfume offers elegance and charm.', '2024-01-01', 1, '100ml', 103.20, 100, '15_2.jpg'),
( 16, 'Bvlgari Splendida Jasmin Noir EDP is an elegant and delicate fragrance, with early notes of jasmine and almond, middle notes of wood and end notes of musk and vanilla, creating a masculine, luxurious and attractive scent.', '2024-01-01', 1, '30ml', 27.30, 100, '16_1.jpg'),
( 16, 'Bvlgari Splendida Jasmin Noir EDP is an elegant and delicate fragrance, with early notes of jasmine and almond, middle notes of wood and end notes of musk and vanilla, creating a masculine, luxurious and attractive scent.', '2024-01-01', 1, '100ml', 92.50, 100, '16_2.jpg'),
( 17, 'Chanel Antaeus Pour Homme EDT is a strong and masculine fragrance, with a combination of woody, amber and spice notes. This fragrance gives confidence and strength, ideal for important occasions and special evenings.', '2024-01-01', 1, '30ml', 43.20, 100, '17_1.jpg'),
( 17, 'Chanel Antaeus Pour Homme EDT is a strong and masculine fragrance, with a combination of woody, amber and spice notes. This fragrance gives confidence and strength, ideal for important occasions and special evenings.', '2024-01-01', 1, '100ml', 139.99, 100, '17_2.jpg'),
( 18, 'Dior Homme Sport EDT is a fresh and active fragrance, ideal for active and sporting days. The top notes of citrus and ginger, combined with the middle notes from sage and the last notes from wood and musk, create a masculine and refreshing scent.', '2024-01-01', 1, '30ml', 28.90, 100, '18_1.jpg'),
( 18, 'Dior Homme Sport EDT is a fresh and active fragrance, ideal for active and sporting days. The top notes of citrus and ginger, combined with the middle notes from sage and the last notes from wood and musk, create a masculine and refreshing scent.', '2024-01-01', 1, '100ml', 94.90, 100, '18_2.jpg'),
( 19, 'Versace Eros Flame is a passionate and seductive fragrance, with a blend of bergamot, lemon and tangerine notes, combined with woody and final notes from vanilla and musk. This perfume gives confidence and charisma, ideal for special occasions.', '2024-01-01', 1, '30ml', 35.60, 100, '19_1.jpg'),
( 19, 'Versace Eros Flame is a passionate and seductive fragrance, with a blend of bergamot, lemon and tangerine notes, combined with woody and final notes from vanilla and musk. This perfume gives confidence and charisma, ideal for special occasions.', '2024-01-01', 1, '100ml', 135.00, 100, '19_2.jpg'),
( 20, 'Issey Miyake Nuit d''Issey EDT is a mysterious and enchanting fragrance, with a combination of woody, amber and spice notes. This fragrance gives confidence and charm, ideal for evenings and important occasions.', '2024-01-01', 1, '30ml', 34.00, 100, '20_1.jpg'),
( 20, 'Issey Miyake Nuit d''Issey EDT is a mysterious and enchanting fragrance, with a combination of woody, amber and spice notes. This fragrance gives confidence and charm, ideal for evenings and important occasions.', '2024-01-01', 1, '100ml', 104.00, 100, '20_2.jpg'),

--Details full for unisex
	(21, 'Chanel Chance EDP has been famous for many years, Chanel is sought after and used by many people because of its classy scent. Chanel Chance Eau De Parfum is one of the perfume lines most sought after by women, including me.', '2024-01-01', 1, '30ml', 70.00, 100, '21_1.jpg'), 
    (21, 'Chanel Chance EDP has been famous for many years, Chanel is sought after and used by many people because of its classy scent. Chanel Chance Eau De Parfum is one of the perfume lines most sought after by women, including me.', '2024-01-01', 1, '100ml', 235.00, 100, '21_2.jpg'), 
    (22, 'Dior Joy is a work that Dior has cherished for a long time, but has just released it. A new scent, completely different from previous perfumes. If these scents The previous scent was classic and elegant. Dior Joy is a scent full of joy and happiness that Dior wants to send to women.', '2024-01-01', 1, '30ml', 25.00, 100, '22_1.jpg'), 
    (22, 'Dior Joy is a work that Dior has cherished for a long time, but has just released it. A new scent, completely different from previous perfumes. If these scents The previous scent was classic and elegant. Dior Joy is a scent full of joy and happiness that Dior wants to send to women.', '2024-01-01', 1, '100ml', 73.00, 100, '22_2.jpg'), 
    (23, 'YSL Libre is a women perfume product line of high-end fashion house Yves Saint Laurent launched in 2019. YSL Libre belongs to the oriental scent group for women and is Created by two mixologists Anne Flipo and Carlos Benaim, Libre means "freedom" in French, inspired by the desire for freedom of independent, luxurious and sexy women.', '2024-01-01', 1, '30ml', 60.00, 100, '23_1.jpg'), 
    (23, 'YSL Libre is a women perfume product line of high-end fashion house Yves Saint Laurent launched in 2019. YSL Libre belongs to the oriental scent group for women and is Created by two mixologists Anne Flipo and Carlos Benaim, Libre means "freedom" in French, inspired by the desire for freedom of independent, luxurious and sexy women.', '2024-01-01', 1, '100ml', 118.00, 100, '23_2.jpg'), 
    (24, 'Louis Vuitton Spell On You EDP is a high-end women perfume product from the famous fashion brand Louis Vuitton. Launched in 2021, Spell On You promises is a safe choice for every girl because of its fresh, delicate, gentle scent.', '2024-01-01', 1, '30ml', 52.00, 100, '24_1.jpg'), 
    (24, 'Louis Vuitton Spell On You EDP is a high-end women perfume product from the famous fashion brand Louis Vuitton. Launched in 2021, Spell On You promises is a safe choice for every girl because of its fresh, delicate, gentle scent.', '2024-01-01', 1, '100ml', 149.00, 100, '24_2.jpg'), 
    (25, 'Chance Eau Fraiche captivates the world with its playful, lively and sparkling fragrance. Recently, Chanel launched a new line of women perfume Chance Eau Fraiche - brilliant Brilliant and elegant. A new opportunity is at hand.', '2024-01-01', 1, '30ml', 83.00, 100, '25_1.jpg'), 
    (25, 'Chance Eau Fraiche captivates the world with its playful, lively and sparkling fragrance. Recently, Chanel launched a new line of women perfume Chance Eau Fraiche - brilliant Brilliant and elegant. A new opportunity is at hand.', '2024-01-01', 1, '100ml', 235.00, 100, '25_2.jpg'), 
    (26, 'Lancome La Vie Est Belle En Rose is a fresh and radiant fragrance for women. The top notes of red berries and bergamot provide freshness, while the middle notes from rose and peony add femininity and tenderness. The last scent of musk and wood creates a warm and lasting feeling, helping you always feel confident and happy.', '2024-01-01', 1, '30ml', 56.60, 100, '26_1.jpg'), 
    (26, 'Lancome La Vie Est Belle En Rose is a fresh and radiant fragrance for women. The top notes of red berries and bergamot provide freshness, while the middle notes from rose and peony add femininity and tenderness. The last scent of musk and wood creates a warm and lasting feeling, helping you always feel confident and happy.', '2024-01-01', 1, '100ml', 167.90, 100, '26_2.jpg'), 
    (27, 'Lancome Tresor La Nuit EDP is a seductive and mysterious fragrance for women. With top notes from raspberries and pears, middle notes from black roses and vanilla orchids, along with final notes of woody and resinous, this perfume offers an enchanting charm, ideal for special evenings.', '2024-01-01', 1, '30ml', 52.00, 100, '27_1.jpg'), 
    (27, 'Lancome Tresor La Nuit EDP is a seductive and mysterious fragrance for women. With top notes from raspberries and pears, middle notes from black roses and vanilla orchids, along with final notes of woody and resinous, this perfume offers an enchanting charm, ideal for special evenings.', '2024-01-01', 1, '100ml', 149.00, 100, '27_2.jpg'), 
    (28, 'Lancome La Vie Est Belle EDP is a sweet and elegant fragrance for women. The top notes of pears and black currants, combined with mid-notes from irises, jasmine and orange blossoms, and the final notes of nougat beans, tonka beans and vanilla, create a perfect and enticing scent that brings a sense of happiness and fulfillment.', '2024-01-01', 1, '30ml', 52.00, 100, '28_1.jpg'), 
    (28, 'Lancome La Vie Est Belle EDP is a sweet and elegant fragrance for women. The top notes of pears and black currants, combined with mid-notes from irises, jasmine and orange blossoms, and the final notes of nougat beans, tonka beans and vanilla, create a perfect and enticing scent that brings a sense of happiness and fulfillment.', '2024-01-01', 1, '100ml', 149.00, 100, '28_2.jpg'), 
    (29, 'Gucci Bloom Ambrosia di Fiori EDP is a fresh and luxurious floral fragrance. The top notes of jasmine and lily, combined with the middle notes from magnolia and the end notes of Damascena roses, create a feminine and seductive scent, ideal for special occasions.', '2024-01-01', 1, '30ml', 52.00, 100, '29_1.jpg'), 
    (29, 'Gucci Bloom Ambrosia di Fiori EDP is a fresh and luxurious floral fragrance. The top notes of jasmine and lily, combined with the middle notes from magnolia and the end notes of Damascena roses, create a feminine and seductive scent, ideal for special occasions.', '2024-01-01', 1, '100ml', 149.00, 100, '29_2.jpg'), 
    (30, 'Bvlgari Rose Goldea EDP is a passionate and noble fragrance for women. With a combination of rose, musk and amber notes, this perfume offers a feminine, elegant and seductive scent, ideal for romantic evenings or important events.', '2024-01-01', 1, '30ml', 52.00, 100, '30_1.jpg'), 
    (30, 'Bvlgari Rose Goldea EDP is a passionate and noble fragrance for women. With a combination of rose, musk and amber notes, this perfume offers a feminine, elegant and seductive scent, ideal for romantic evenings or important events.', '2024-01-01', 1, '100ml', 149.00, 100, '30_2.jpg'), 
    (31, 'Armaf Club de Nuit for Women is a sweet and seductive fragrance, with early notes from bergamot, grapefruit and peach, middle notes from rose, geranium and jasmine, and final notes of vanilla, musk and amber. This perfume gives confidence and charisma, ideal for every occasion.', '2024-01-01', 1, '30ml', 52.00, 100, '31_1.jpg'), 
    (31, 'Armaf Club de Nuit for Women is a sweet and seductive fragrance, with early notes from bergamot, grapefruit and peach, middle notes from rose, geranium and jasmine, and final notes of vanilla, musk and amber. This perfume gives confidence and charisma, ideal for every occasion.', '2024-01-01', 1, '100ml', 149.00, 100, '31_2.jpg'), 
    (32, 'Gucci Flora Gorgeous Gardenia EDP is a refreshing and feminine fragrance, with notes starting from red berries and pears, middle notes from jasmine and orchids, and final notes from sugar and patchouli. This perfume feels fresh and energetic, ideal for summer days.', '2024-01-01', 1, '30ml', 52.00, 100, '32_1.jpg'), 
    (32, 'Gucci Flora Gorgeous Gardenia EDP is a refreshing and feminine fragrance, with notes starting from red berries and pears, middle notes from jasmine and orchids, and final notes from sugar and patchouli. This perfume feels fresh and energetic, ideal for summer days.', '2024-01-01', 1, '100ml', 149.00, 100, '32_2.jpg'), 
    (33, 'Tommy Girl EDT is a fresh and active fragrance for women. The top notes of citrus, mint and black currant, combined with notes from rose, lily and orange blossom, and the last notes of sandalwood and musk, create a refreshing and youthful scent, ideal for active days.', '2024-01-01', 1, '30ml', 52.00, 100, '33_1.jpg'), 
    (33, 'Tommy Girl EDT is a fresh and active fragrance for women. The top notes of citrus, mint and black currant, combined with notes from rose, lily and orange blossom, and the last notes of sandalwood and musk, create a refreshing and youthful scent, ideal for active days.', '2024-01-01', 1, '100ml', 149.00, 100, '33_2.jpg'), 
    (34, 'Roja Elixir Pour Femme is a luxurious and seductive fragrance, with notes starting from bergamot, middle notes from jasmine, rose and orange blossom, and final notes from sandalwood, musk and vanilla. This perfume offers femininity and nobility, ideal for special occasions.', '2024-01-01', 1, '30ml', 52.00, 100, '34_1.jpg'), 
    (34, 'Roja Elixir Pour Femme is a luxurious and seductive fragrance, with notes starting from bergamot, middle notes from jasmine, rose and orange blossom, and final notes from sandalwood, musk and vanilla. This perfume offers femininity and nobility, ideal for special occasions.', '2024-01-01', 1, '100ml', 149.00, 100, '34_2.jpg'), 
    (35, 'Chanel Coco Mademoiselle EDP is an elegant and sensual fragrance for women. Early notes from citrus and grapefruit, combined with notes from rose and jasmine, and final notes from patchouli, vanilla and musk, create a seductive and delicate scent, ideal for every occasion.', '2024-01-01', 1, '30ml', 52.00, 100, '35_1.jpg'), 
    (35, 'Chanel Coco Mademoiselle EDP is an elegant and sensual fragrance for women. Early notes from citrus and grapefruit, combined with notes from rose and jasmine, and final notes from patchouli, vanilla and musk, create a seductive and delicate scent, ideal for every occasion.', '2024-01-01', 1, '100ml', 149.00, 100, '35_2.jpg'), 
    (36, 'Louis Vuitton Matière Noire EDP is a mysterious and alluring fragrance for women. The first notes from black currants and raspberries, combined with notes from rose and jasmine, and the last notes from wood and amber, create a luxurious and enchanting scent.', '2024-01-01', 1, '30ml', 52.00, 100, '36_1.jpg'), 
    (36, 'Louis Vuitton Matière Noire EDP is a mysterious and alluring fragrance for women. The first notes from black currants and raspberries, combined with notes from rose and jasmine, and the last notes from wood and amber, create a luxurious and enchanting scent.', '2024-01-01', 1, '100ml', 149.00, 100, '36_2.jpg'), 
    (37, 'Louis Vuitton California Dream EDP is a refreshing and romantic fragrance, with notes starting from mandarins and bergamot, mid-notes from pear and magnolia, and final notes from musk and sandalwood. This perfume gives a feeling of freedom and freedom, ideal for summer days.', '2024-01-01', 1, '30ml', 52.00, 100, '37_1.jpg'), 
    (37, 'Louis Vuitton California Dream EDP is a refreshing and romantic fragrance, with notes starting from mandarins and bergamot, mid-notes from pear and magnolia, and final notes from musk and sandalwood. This perfume gives a feeling of freedom and freedom, ideal for summer days.', '2024-01-01', 1, '100ml', 149.00, 100, '37_2.jpg'), 
    (38, 'Gucci Bloom EDP is a fresh and elegant floral fragrance for women. The first notes from jasmine and lily, combined with the middle notes from orange blossom and the last from magnolia, create a feminine and seductive scent, ideal for every occasion.', '2024-01-01', 1, '30ml', 52.00, 100, '38_1.jpg'), 
    (38, 'Gucci Bloom EDP is a fresh and elegant floral fragrance for women. The first notes from jasmine and lily, combined with the middle notes from orange blossom and the last from magnolia, create a feminine and seductive scent, ideal for every occasion.', '2024-01-01', 1, '100ml', 149.00, 100, '38_2.jpg'), 
    (39, 'Chanel Coco Noir EDP is a powerful and seductive fragrance for women. The first notes from bergamot and grapefruit, combined with notes from jasmine and rose, and the last notes from patchouli, musk and amber, create a luxurious and mysterious scent.', '2024-01-01', 1, '30ml', 52.00, 100, '39_1.jpg'), 
    (39, 'Chanel Coco Noir EDP is a powerful and seductive fragrance for women. The first notes from bergamot and grapefruit, combined with notes from jasmine and rose, and the last notes from patchouli, musk and amber, create a luxurious and mysterious scent.', '2024-01-01', 1, '100ml', 149.00, 100, '39_2.jpg'), 
    (40, 'Versace Dylan Blue Pour Femme EDP is a fresh and active fragrance for women. The first notes from black currants and green apples, combined with notes from rose and jasmine, and final notes from wood and musk, create a feminine and modern scent, ideal for every occasion.', '2024-01-01', 1, '30ml', 52.00, 100, '40_1.jpg'), 
    (40, 'Versace Dylan Blue Pour Femme EDP is a fresh and active fragrance for women. The first notes from black currants and green apples, combined with notes from rose and jasmine, and final notes from wood and musk, create a feminine and modern scent, ideal for every occasion.', '2024-01-01', 1, '100ml', 149.00, 100, '40_2.jpg'),

	--Details full for unisex
	(41, 'Xerjoff Naxos EDP perfume is a unisex perfume line in the special collection of the Xerjoff brand. Launched in 2015, inspired by the essence of beauty. An island located in the middle of the Mediterranean Sea, Sicily.', '2024-01-01', 1, '30ml', 47.00, 100, '41_1.jpg'),
(41, 'Xerjoff Naxos EDP perfume is a unisex perfume line in the special collection of the Xerjoff brand. Launched in 2015, inspired by the essence of beauty. An island located in the middle of the Mediterranean Sea, Sicily.', '2024-01-01', 1, '100ml', 134.00, 100, '41_2.jpg'),
(42, 'Armaf Sterling Club De Nuit Milestone EDP perfume is the best-selling product line of Armaf perfume with a sweet and modern scent, a delicate blend of unique scent notes.', '2024-01-01', 1, '30ml', 39.00, 100, '42_1.jpg'),
(42, 'Armaf Sterling Club De Nuit Milestone EDP perfume is the best-selling product line of Armaf perfume with a sweet and modern scent, a delicate blend of unique scent notes.', '2024-01-01', 1, '100ml', 119.00, 100, '42_2.jpg'),
(43, 'In 2019, the Gucci brand launched the Gucci A Song For The Rose EDP perfume line, this is a unisex perfume for both men and women. Distilled scent From the floral scent group thyme creates a sweet and seductive scent.', '2024-01-01', 1, '30ml', 17.00, 100, '43_1.jpg'),
(43, 'In 2019, the Gucci brand launched the Gucci A Song For The Rose EDP perfume line, this is a unisex perfume for both men and women. Distilled scent From the floral scent group thyme creates a sweet and seductive scent.', '2024-01-01', 1, '100ml', 59.00, 100, '43_2.jpg'),
(44, 'Like other perfume lines of the Le Labo brand, the Le Labo The Noir 29 EDP perfume line has a minimalist, stylish bottle design. to a luxurious, sophisticated feeling. The perfume bottle is made of transparent glass, the color of the perfume inside can be seen. In particular, the owner of this perfume bottle can print his or her name on it sticker, this represents the personalization of the product, bringing a new and unique experience to customers.', '2024-01-01', 1, '30ml', 73.00, 100, '44_1.jpg'),
(44, 'Like other perfume lines of the Le Labo brand, the Le Labo The Noir 29 EDP perfume line has a minimalist, stylish bottle design. to a luxurious, sophisticated feeling. The perfume bottle is made of transparent glass, the color of the perfume inside can be seen. In particular, the owner of this perfume bottle can print his or her name on it sticker, this represents the personalization of the product, bringing a new and unique experience to customers.', '2024-01-01', 1, '100ml', 225.00, 100, '44_2.jpg'),
(45, 'Are you looking for a perfume line for both women and men with a truly luxurious scent as well as making an impression at the first moment? Then Louis Vuitton Ombre Nomade EDP is the right choice right now. This is a unisex perfume line from the luxury brand Louis Vuitton.', '2024-01-01', 1, '30ml', 36.00, 100, '45_1.jpg'),
(45, 'Are you looking for a perfume line for both women and men with a truly luxurious scent as well as making an impression at the first moment? Then Louis Vuitton Ombre Nomade EDP is the right choice right now. This is a unisex perfume line from the luxury brand Louis Vuitton.', '2024-01-01', 1, '100ml', 106.00, 100, '45_2.jpg'),
(46, 'Creed Silver Mountain Water is a fresh and pure fragrance for both men and women. The top notes from bergamot and black currants provide refreshment, while the middle notes from green tea and violets create elegance and sophistication. The last incense from musk and sandalwood helps retain the scent for a long time, giving it a feeling of freshness and energy.', '2024-01-01', 1, '30ml', 36.00, 100, '46_1.jpg'),
(46, 'Creed Silver Mountain Water is a fresh and pure fragrance for both men and women. The top notes from bergamot and black currants provide refreshment, while the middle notes from green tea and violets create elegance and sophistication. The last incense from musk and sandalwood helps retain the scent for a long time, giving it a feeling of freshness and energy.', '2024-01-01', 1, '100ml', 106.00, 100, '46_2.jpg'),
(47, 'Le Labo Bergamote 22 is a fresh and radiant fragrance with early notes from bergamot and grapefruit. The middle notes from orange blossom and vetiver add subtlety, while the final notes from musk and cedarwood provide a warm and pleasant feeling. This is perfect for both men and women on every occasion, from work to dates.', '2024-01-01', 1, '30ml', 36.00, 100, '47_1.jpg'),
(47, 'Le Labo Bergamote 22 is a fresh and radiant fragrance with early notes from bergamot and grapefruit. The middle notes from orange blossom and vetiver add subtlety, while the final notes from musk and cedarwood provide a warm and pleasant feeling. This is perfect for both men and women on every occasion, from work to dates.', '2024-01-01', 1, '100ml', 106.00, 100, '47_2.jpg'),
(48, 'Le Labo Santal 33 is a distinctive and seductive fragrance with heads from sandalwood and pepper. The middle notes from violets and cardamom make it unique, while the final notes from musk and amber provide warmth and appeal. This is the ideal choice for both men and women on special occasions.', '2024-01-01', 1, '30ml', 36.00, 100, '48_1.jpg'),
(48, 'Le Labo Santal 33 is a distinctive and seductive fragrance with heads from sandalwood and pepper. The middle notes from violets and cardamom make it unique, while the final notes from musk and amber provide warmth and appeal. This is the ideal choice for both men and women on special occasions.', '2024-01-01', 1, '100ml', 106.00, 100, '48_2.jpg'),
(49, 'Roja Dove Amber Aoud Parfum is a luxurious and noble fragrance with notes from lemon and bergamot. The middle notes from rose and saffron stigmas combine with final notes from agarwood and amber, providing warmth and charm. This is a great choice for both men and women on important occasions.', '2024-01-01', 1, '30ml', 36.00, 100, '49_1.jpg'),
(49, 'Roja Dove Amber Aoud Parfum is a luxurious and noble fragrance with notes from lemon and bergamot. The middle notes from rose and saffron stigmas combine with final notes from agarwood and amber, providing warmth and charm. This is a great choice for both men and women on important occasions.', '2024-01-01', 1, '100ml', 106.00, 100, '49_2.jpg'),
(50, 'Louis Vuitton Cactus Garden EDP is a refreshing and liberal fragrance with notes from bergamot and green tea. The middle notes from vetiver and ginger provide freshness and refreshment, while the final notes from musk create a sense of freedom and dynamism. This is perfect for summer days.', '2024-01-01', 1, '30ml', 36.00, 100, '50_1.jpg'),
(50, 'Louis Vuitton Cactus Garden EDP is a refreshing and liberal fragrance with notes from bergamot and green tea. The middle notes from vetiver and ginger provide freshness and refreshment, while the final notes from musk create a sense of freedom and dynamism. This is perfect for summer days.', '2024-01-01', 1, '100ml', 106.00, 100, '50_2.jpg'),
(51, 'Louis Vuitton Sun Song EDP is a cheerful and radiant fragrance with top notes from orange and lemon. The middle notes from orange blossom and jasmine create elegance, while the last from musk provides a pleasant and soothing feel. This is a great choice for both men and women on sunny days.', '2024-01-01', 1, '30ml', 36.00, 100, '51_1.jpg'),
(51, 'Louis Vuitton Sun Song EDP is a cheerful and radiant fragrance with top notes from orange and lemon. The middle notes from orange blossom and jasmine create elegance, while the last from musk provides a pleasant and soothing feel. This is a great choice for both men and women on sunny days.', '2024-01-01', 1, '100ml', 106.00, 100, '51_2.jpg'),
(52, 'Roja Dove Manhattan EDP is a luxurious and modern fragrance with notes from bergamot and tangerine. The middle notes from jasmine and rose combine with the final notes from sandalwood and musk, providing charm and elegance. This is the ideal choice for both men and women on special occasions.', '2024-01-01', 1, '30ml', 36.00, 100, '52_1.jpg'),
(52, 'Roja Dove Manhattan EDP is a luxurious and modern fragrance with notes from bergamot and tangerine. The middle notes from jasmine and rose combine with the final notes from sandalwood and musk, providing charm and elegance. This is the ideal choice for both men and women on special occasions.', '2024-01-01', 1, '100ml', 106.00, 100, '52_2.jpg'),
(53, 'Roja Dove Burlington 1819 Parfum is a complex and noble fragrance with heads from bergamot, lemon and grapefruit. The middle notes from rose and jasmine, and the final notes from amber and sandalwood, provide elegance and appeal. This is a great choice for both men and women on important occasions.', '2024-01-01', 1, '30ml', 36.00, 100, '53_1.jpg'),
(53, 'Roja Dove Burlington 1819 Parfum is a complex and noble fragrance with heads from bergamot, lemon and grapefruit. The middle notes from rose and jasmine, and the final notes from amber and sandalwood, provide elegance and appeal. This is a great choice for both men and women on important occasions.', '2024-01-01', 1, '100ml', 106.00, 100, '53_2.jpg'),
(54, 'Xerjoff Alexandria II is a strong and delicate fragrance with top notes from apple and cinnamon. The notes between rose and sandalwood combine with the final notes from vanilla and musk, creating charm and elegance. This is the ideal choice for both men and women on important occasions.', '2024-01-01', 1, '30ml', 36.00, 100, '54_1.jpg'),
(54, 'Xerjoff Alexandria II is a strong and delicate fragrance with top notes from apple and cinnamon. The notes between rose and sandalwood combine with the final notes from vanilla and musk, creating charm and elegance. This is the ideal choice for both men and women on important occasions.', '2024-01-01', 1, '100ml', 106.00, 100, '54_2.jpg'),
(55, 'Bvlgari Splendida Magnolia Sensuel EDP is a sweet and delicate fragrance with top notes from mandarins and bergamot. The middle notes from magnolia and jasmine, and the final notes from vanilla and musk, provide elegance and charm. This is the perfect option for both men and women on any occasion.', '2024-01-01', 1, '30ml', 36.00, 100, '55_1.jpg'),
(55, 'Bvlgari Splendida Magnolia Sensuel EDP is a sweet and delicate fragrance with top notes from mandarins and bergamot. The middle notes from magnolia and jasmine, and the final notes from vanilla and musk, provide elegance and charm. This is the perfect option for both men and women on any occasion.', '2024-01-01', 1, '100ml', 106.00, 100, '55_2.jpg'),
(56, 'Armaf Club de Nuit Untold EDP is a passionate and attractive fragrance with heads from bergamot and black currants. The middle notes from jasmine and rose combine with the final notes from musk and sandalwood, providing confidence and charm. This is the ideal choice for both men and women on special occasions.', '2024-01-01', 1, '30ml', 36.00, 100, '56_1.jpg'),
(56, 'Armaf Club de Nuit Untold EDP is a passionate and attractive fragrance with heads from bergamot and black currants. The middle notes from jasmine and rose combine with the final notes from musk and sandalwood, providing confidence and charm. This is the ideal choice for both men and women on special occasions.', '2024-01-01', 1, '100ml', 106.00, 100, '56_2.jpg'),
(57, 'Gucci Bloom Acqua di Fiori EDT is a refreshing and elegant fragrance with top notes from black currants and pears. The middle incense from jasmine and lily, and the last from musk and sandalwood, create femininity and charm. This is the perfect option for both men and women on any occasion.', '2024-01-01', 1, '30ml', 36.00, 100, '57_1.jpg'),
(57, 'Gucci Bloom Acqua di Fiori EDT is a refreshing and elegant fragrance with top notes from black currants and pears. The middle incense from jasmine and lily, and the last from musk and sandalwood, create femininity and charm. This is the perfect option for both men and women on any occasion.', '2024-01-01', 1, '100ml', 106.00, 100, '57_2.jpg'),
(58, 'Chanel Gabrielle Essence EDP is a sweet and delicate fragrance with heads from mandarins and bergamot. The middle notes from jasmine and orange blossom, and the final notes from musk and sandalwood, bring elegance and charm. This is a great choice for both men and women on important occasions.', '2024-01-01', 1, '30ml', 36.00, 100, '58_1.jpg'),
(58, 'Chanel Gabrielle Essence EDP is a sweet and delicate fragrance with heads from mandarins and bergamot. The middle notes from jasmine and orange blossom, and the final notes from musk and sandalwood, bring elegance and charm. This is a great choice for both men and women on important occasions.', '2024-01-01', 1, '100ml', 106.00, 100, '58_2.jpg'),
(59, 'Versace Yellow Diamond Intense EDP is a refreshing and vibrant fragrance with notes from lemon and bergamot. The middle notes from orange blossom and jasmine, and the last from musk and amber, create elegance and charm. This is the ideal option for both men and women on all occasions.', '2024-01-01', 1, '30ml', 36.00, 100, '59_1.jpg'),
(59, 'Versace Yellow Diamond Intense EDP is a refreshing and vibrant fragrance with notes from lemon and bergamot. The middle notes from orange blossom and jasmine, and the last from musk and amber, create elegance and charm. This is the ideal option for both men and women on all occasions.', '2024-01-01', 1, '100ml', 106.00, 100, '59_2.jpg'),
(60, 'Chanel Allure Homme Sport Cologne is a refreshing and dynamic fragrance with top notes from citrus and grapefruit. The middle notes from jasmine and rose, and the final notes from musk and sandalwood, create refreshment and charm. This is perfect for both men and women on active days.', '2024-01-01', 1, '30ml', 36.00, 100, '60_1.jpg'),
(60, 'Chanel Allure Homme Sport Cologne is a refreshing and dynamic fragrance with top notes from citrus and grapefruit. The middle notes from jasmine and rose, and the final notes from musk and sandalwood, create refreshment and charm. This is perfect for both men and women on active days.', '2024-01-01', 1, '100ml', 106.00, 100, '60_2.jpg'),

--Details full for gift set
(61, 'YSL Black Opium Eau De Parfum Christmas 2021 gift set, the new perfume line was announced as a classic rocknroll performance highlighting the magical, mysterious aspect of the YSL brand. Perfumers Nathalie Lorson and MarieSalamagne, collaborated with Olivier Cresp and Honorine Blanc to create this scent. YSL Black Opium is Yves Saint Laurent first coffee-flower scent. The energy of black coffee dominates the entire fragrance of white flowers with assertive femininity accented by pink pepper and pear in the background.', '2024-01-01', 1, NULL, 100.00, 50, '61_1.jpg'),
(62, 'BVLGari set of 3 bottles of 15ml includes 3 typical fragrances of the Bvlgari Omnia collection with 3 different styles and personalities gathered in the Bvlgari Omnia gift set so girls can experience the feelings about different scents. Bvlgari Omnia Coral EDT perfume 15ml Bvlgari Omnia Crystalline EDT perfume 15ml Bvlgari Omnia Amethyste EDT Perfume 15ml With a sophisticated, seductive and easy-to-use style, this collection will be a great choice when girls go to work or go out or picnic.', '2024-01-01', 1, NULL, 150.00, 50, '62_1.jpg'),
(63, 'Set of 5 Lancome perfumes includes: Lancome Hypnose Eau de Parfum 5ml Lancome Tresor Eau de Parfum 7.5ml Lancome La vie est belle Eau de Parfum 4ml Lancome Miracle Eau de Parfum 5ml Lancome Tresor in Love Eau de Parfum 5ml', '2024-01-01', 1, NULL, 185.00, 50, '63_1.jpg'),
(64, 'BVLGARI Omnia Amethyste Gift Set', '2024-01-01', 1, NULL, 212.00, 50, '64_1.jpg'),
(65, 'Versace Absolute Gift Set 4 items: Versace Bright Crystal Absolu EDP 90ml perfume Versace Bright Crystal Absolu EDP 10ml Versace Perfumed Body Lotion 100ml Versace Perfumed Shower Gel 100ml', '2024-01-01', 1, NULL, 139.00, 50, '65_1.jpg');


CREATE TABLE [dbo].[Cart] (
    CartID INT PRIMARY KEY IDENTITY(1,1),
    ProductFullDetailID INT NOT NULL,
	AccountID int NOT NULL,
    Quantity INT NOT NULL,
    TotalPrice DECIMAL(18,2),
	product_name [NVARCHAR](255),
	product_size [NVARCHAR](max),
	[image] varchar(100),
	FOREIGN KEY (AccountID) REFERENCES [dbo].[Accounts]([AccountID]),
    FOREIGN KEY (ProductFullDetailID) REFERENCES [dbo].[ProductFullDetail]([ProductFullDetailID]),
)

-- Sample data for insertion into Cart table



CREATE TABLE [dbo].[StatusOrder] (
    SOID INT PRIMARY KEY IDENTITY(1,1),
    SOName NVARCHAR(255) NOT NULL
)

INSERT INTO [dbo].[StatusOrder] (SOName)
VALUES 
('Process'),
('Done'),
('Cancel');


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

-- Inserting sample orders with full names in Vietnamese
INSERT INTO [dbo].[Orders] (AccountID, OrderDate, OrderTotalPrice, OrderContactName, OrderPhone, OrderAddress, OrderStatus, OrderReceiveDate, OrderNote, OrderSoID)
VALUES
(1, '2024-06-15', 1500000.00, N'Nguyễn Văn A', '0987654321', N'123 Đường ABC, Quận 1, TP. HCM', 1, NULL, N'Ghi chú 1', 1),
(2, '2024-06-16', 2500000.00, N'Trần Thị Bích', '0123456789', N'456 Đường XYZ, Quận 2, TP. HCM', 2, NULL, N'Ghi chú 2', 2),
(3, '2024-06-17', 1800000.00, N'Lê Văn Cường', '0909090909', N'789 Đường MNO, Quận 3, TP. HCM', 1, NULL, N'Ghi chú 3', 1),
(4, '2024-06-18', 1200000.00, N'Phạm Thị Dung', '0998877665', N'321 Đường PQR, Quận 4, TP. HCM', 3, NULL, N'Ghi chú 4', 3),
(5, '2024-06-19', 2000000.00, N'Huỳnh Văn Eo', '0888777666', N'654 Đường GHI, Quận 5, TP. HCM', 2, NULL, N'Ghi chú 5', 2),
(6, '2024-06-20', 3000000.00, N'Ngô Thị Fong', '0123999888', N'987 Đường KLM, Quận 6, TP. HCM', 1, NULL, N'Ghi chú 6', 1),
(7, '2024-06-21', 1500000.00, N'Lương Văn Gấm', '0777888999', N'741 Đường DEF, Quận 7, TP. HCM', 3, NULL, N'Ghi chú 7', 3),
(8, '2024-06-22', 1700000.00, N'Đặng Thị Hà', '0333444555', N'852 Đường LMN, Quận 8, TP. HCM', 2, NULL, N'Ghi chú 8', 2),
(9, '2024-06-23', 2200000.00, N'Bùi Văn Iên', '0666777888', N'963 Đường UVW, Quận 9, TP. HCM', 1, NULL, N'Ghi chú 9', 1),
(10, '2024-06-24', 1900000.00, N'Vũ Thị Kính', '0111222333', N'159 Đường STU, Quận 10, TP. HCM', 3, NULL, N'Ghi chú 10', 3);


CREATE TABLE [dbo].[OrderDetail] (
    odID INT PRIMARY KEY IDENTITY(1,1),
    odOrderID INT NOT NULL,
    odProductID INT NOT NULL,
    odQuantity INT NOT NULL,
    odPrice FLOAT NOT NULL,
    FOREIGN KEY (odOrderID) REFERENCES [dbo].[Orders](OrderID),
    FOREIGN KEY (odProductID) REFERENCES [dbo].[Products](ProductID)
)
-- Sample data for insertion into OrderDetail table

CREATE TABLE [dbo].[Sliders](
[SliderID] int PRIMARY KEY IDENTITY(1,1),
[SliderImage] nvarchar(255) NOT NULL,
[SliderStatus] int NOT NULL,
[SliderTitle] nvarchar(max) NULL,
[update_at] date,
[fk_account_id] [int],
FOREIGN KEY ([fk_account_id]) REFERENCES [dbo].[Accounts]([AccountID]
))
INSERT INTO [dbo].[Sliders] ([SliderImage],[SliderTitle],[update_at],[SliderStatus],[fk_account_id])
VALUES
('images/Sliders/slider1.jpg',NULL,'2024-01-01',1,5),
('images/Sliders/2.jpg',NULL,'2024-01-01',1,5),
('images/Sliders/3.jpg',NULL,'2024-01-01',1,3)

CREATE TABLE [dbo].[Blog](
	[blog_id] [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](max) NULL,
	[brief_infor] [nvarchar](max) NULL,
	[content_blog] [nvarchar](max) NULL,
	[thumbnail] [nvarchar](max) NULL,
	[createdAt] [datetime] NULL,
	[updateAt] [datetime] NULL,
	[author_id] [int] NULL,
	[status] [int] NULL,
	FOREIGN KEY ([author_id]) REFERENCES [dbo].[Accounts]([AccountID])
)
--create table address 
CREATE TABLE [dbo].[Address] (
    [address_id] INT PRIMARY KEY IDENTITY(1,1),
    [account_id] INT,
	[phone] varchar(11),
    [address_line] NVARCHAR(MAX),
    [city] NVARCHAR(MAX),
    [district] NVARCHAR(MAX),
    [status] INT,
    FOREIGN KEY ([account_id]) REFERENCES [dbo].[Accounts]([AccountID])
);
--insert value in table address
INSERT INTO [dbo].[Address] ([account_id], [phone], [address_line], [city], [district], [status])
VALUES
( 1,'0912345678', '123 Đường Nguyễn Trãi', 'Hà Nội', 'Thanh Xuân', 1),
( 1,'0987654321', '456 Đường Lê Lợi', 'Hồ Chí Minh', 'Quận 1', 1),
( 1,'0934567890', '789 Đường Trần Phú', 'Đà Nẵng', 'Hải Châu', 0),
( 1,'0923456789', '101 Đường Phạm Ngũ Lão', 'Hà Nội', 'Hoàn Kiếm', 1),
( 2,'0945678901', '202 Đường Trường Chinh', 'Hồ Chí Minh', 'Quận 3', 0),
( 3,'0912345679', '303 Đường Bạch Đằng', 'Đà Nẵng', 'Thanh Khê', 1),
( 2,'0987654320', '404 Đường Hùng Vương', 'Hà Nội', 'Ba Đình', 1),
( 2,'0934567891', '505 Đường Nguyễn Văn Cừ', 'Hồ Chí Minh', 'Quận 5', 0),
( 2,'0923456788', '606 Đường Lý Thái Tổ', 'Đà Nẵng', 'Liên Chiểu', 1),
( 3,'0945678902', '707 Đường Võ Văn Kiệt', 'Hà Nội', 'Cầu Giấy', 1);
