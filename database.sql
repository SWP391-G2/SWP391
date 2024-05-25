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
('Men', N'Các quý ông tìm đến nước hoa để làm gì? Có lẽ là để thơm tho, nam tính và làm chỉn chu thêm phong cách của bản thân, phải chứ? Namperfume thấu hiểu các quý ông của chúng ta, đem tới cho đấng mày râu những mùi hương tươm tất, gọn gàng, cuốn hút, đôi khi là quyền lực choáng ngợp, và chắc chắn không thể quên được sự bụi bặm phóng khoáng đặc trưng của phái mạnh.'),
('Women', N'Nước hoa từ những ngày đầu đã được tạo ra là để phục vụ cho phái đẹp, vì thế dường như trong thế giới mùi hương, những sự lựa chọn cho nữ giới là phong phú và nhiều màu sắc hơn cả. Là do vậy, namperfume luôn muốn đem đến cho các quý cô xinh đẹp những lựa chọn tuyệt vời, từ quyến rũ, sang trọng, quyền lực đến nhẹ nhàng, ngây thơ, và không thể thiếu một chút gợi cảm lả lơi, ngả ngốn...'),
('Unisex', N'Nước hoa unisex là dòng nước hoa phù hợp cho mọi giới tính, dù là nam hay nữ cũng đều dùng chung sản phẩm này. Cùng một chái nước hoa nhưng khi mày râu dùng sẽ trở nên lịch lãm, một nàng sỡ hữu nét quyến rũ yêu kều sẽ trở nên hấp dẫn hơn nữa.'),
('Giftset', N'Giftset – hay còn gọi là bộ quà tặng, là tập hợp nhiều loại sản phẩm khác nhau. Chúng đều có tính ứng dụng cao để phục vụ cho công việc và cả trong cuộc sống hàng ngày. Tất cả các sản phẩm trong bộ Giftset đều có liên quan đến nhau, tính thẩm mỹ cao để mang đến sự hài lòng cho người nhận.');

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



CREATE TABLE [dbo].[Accounts](
[AccountID] [int] IDENTITY(1,1) PRIMARY KEY,
[FirstName] [nvarchar](50) NOT NULL,
[LastName] [nvarchar](50) NOT NULL,
[Password] [nvarchar](50) NOT NULL,
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
(N'Bích',N'Nguyễn','123@gmail.com','123456','images/users/Bich.png',1,'2003-11-01','0123456789',N'Hà Nội','2024-05-23',1,1);
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
('GUCCI',N'Nước hoa Gucci là một trong những thương hiệu được tôn sùng nhất trên thế giới. Được thành lập vào thập niên 20 tại Florence, Ý, Gucci luôn hiểu rõ thời trang và nước hoa là hai thứ không thể tách rời nhau. Hãng mang đến những bộ quần áo với phong cách hiện đại, tân thời cho cả nam lẫn nữ. Biểu tượng 2 chữ cái lồng vào nhau nổi tiếng của Gucci đã trở thành một hình tượng thời trang, luôn được bắt gặp trong mọi sản phẩm của hãng, từ các bộ sưu tập túi, trang phục thể thao, các đôi giày gót cao và mảnh theo mùa cho đến những lọ nước hoa. Nước hoa Gucci rất đa dạng về mùi hương, từ gợi cảm mê đắm cho đến ngọt ngào tươi mát. Cùng với các dòng trang phục và phụ kiện của hãng, từ lâu đã trở thành những mùi hương kinh điển. Dễ dàng thấy được Gucci luôn tạo ra những làn sóng thời trang mới đồng thời là nhãn hiệu đi đầu về sự thanh lịch, và hương thơm tuyệt diệu của nước hoa Gucci luôn mang đến một cảm giác ngọt ngào của sự thành công.'),
('CHANEL',N'Chanel là thương hiệu nước hoa danh tiếng được biết đến với sự sang trọng, tinh tế và đẳng cấp. Các sản phẩm nước hoa của Chanel thường mang hương thơm độc đáo, kết hợp giữa các thành phần tự nhiên và tổng hợp để tạo nên những mùi hương đặc trưng và lâu phai.'),
('XERJOFF',N'Xerjoff là thương hiệu nước hoa cao cấp nổi tiếng với sự kết hợp hoàn hảo giữa nghệ thuật chế tác thủ công và nguyên liệu quý hiếm. Các dòng nước hoa của Xerjoff mang đến những trải nghiệm hương thơm độc đáo, phức tạp và đầy tinh tế.'),
('LOUIS VUITTON',N'Louis Vuitton, nổi tiếng với sự sang trọng và đẳng cấp trong thời trang và phụ kiện, cũng mang đến những dòng nước hoa cao cấp với hương thơm tinh tế và độc đáo. Nước hoa Louis Vuitton được sáng tạo bởi các chuyên gia nước hoa hàng đầu, sử dụng nguyên liệu quý hiếm và chất lượng cao.'),
('DIOR',N'Dior là một thương hiệu nổi tiếng trong lĩnh vực nước hoa, với nhiều dòng sản phẩm mang tính biểu tượng. Nước hoa Dior nổi bật với sự kết hợp tinh tế của các thành phần chất lượng cao, mang lại hương thơm đa dạng và phong phú.'),
('TOMMY HILFIGER',N'Tommy Hilfiger là một thương hiệu nổi tiếng, không chỉ trong lĩnh vực thời trang mà còn trong ngành nước hoa. Nước hoa của Tommy Hilfiger thường mang phong cách trẻ trung, năng động và tươi mới. '),
('ISSEY MIYAKE',N'Issey Miyake là một thương hiệu nổi tiếng với những dòng nước hoa mang phong cách hiện đại, tối giản và tinh tế. Nước hoa của Issey Miyake thường nổi bật với hương thơm tươi mát, thanh lịch và sáng tạo, lấy cảm hứng từ thiên nhiên và các yếu tố tự nhiên.'),
('CREED',N'Creed là một thương hiệu nước hoa cao cấp của Pháp, nổi tiếng với các dòng nước hoa thủ công, tinh tế và sang trọng. Mỗi sản phẩm của Creed thường được làm từ các nguyên liệu tự nhiên chất lượng cao, mang lại hương thơm độc đáo và lâu dài.'),
('YVES SAINT LAURENT (YSL)',N'Yves Saint Laurent (YSL) là một thương hiệu nước hoa danh tiếng, nổi bật với các sản phẩm mang phong cách quyến rũ, táo bạo và hiện đại. Nước hoa YSL thường được đánh giá cao bởi sự sáng tạo trong cách pha trộn hương liệu, mang lại những mùi hương độc đáo và ấn tượng.'),
('ARMAF',N'Armaf là một thương hiệu nước hoa nổi tiếng với các sản phẩm chất lượng cao nhưng giá cả phải chăng. Các loại nước hoa của Armaf thường mang phong cách đa dạng, từ tươi mới đến nồng nàn, phù hợp với nhiều sở thích và dịp khác nhau. '),
('ROJA PARFUMS',N'Roja Parfums là một thương hiệu nước hoa cao cấp và sang trọng của nhà sáng tạo nước hoa Roja Dove. Các sản phẩm của Roja Parfums thường được biết đến với sự tinh tế trong cách kết hợp các hương liệu, đảm bảo chất lượng cao nhất và tính độc đáo. Mỗi chai nước hoa Roja Parfums thường được làm thủ công và có giới hạn, tạo ra những tác phẩm nghệ thuật trong thế giới nước hoa.'),
('LE LABO',N'Le Labo là một thương hiệu nước hoa cao cấp và độc đáo, nổi tiếng với việc tạo ra các sản phẩm thủ công và cá nhân hóa. Mỗi chai nước hoa của Le Labo được sản xuất tại cửa hàng, đảm bảo sự tinh tế và chất lượng. Thương hiệu này chú trọng vào việc sử dụng các thành phần tự nhiên và chất lượng cao, cùng với sự độc đáo trong cách pha trộn hương liệu.');

CREATE TABLE [dbo].[Products] (
    [ProductID] [INT] PRIMARY KEY IDENTITY(1,1),
    [SubCategoryID] [INT] NOT NULL,
    [ProductName] [NVARCHAR](255) NOT NULL,
    [ProductDetail] [NVARCHAR](max) NULL,
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
[ProductDetail],
[ProductPrice],
[ProductCreateDate],
[SubCategoryID],
[ProductStatus],
[BrandID])
VALUES
--5 perfumes for Men
('XERJOFF CASAMORATI MEFISTO EDP FOR MEN','Được lấy cảm hứng từ bờ biển Ý, năm 2009 thương hiệu Xerjoff cho ra đời loại nước hoa dành cho nam mang tên Xerjoff Casamorati Mefisto EDP. Đây là một trong những chai nước hoa nằm trong bộ sưu tập Casamorati nổi tiếng rất được nhiều ưa chuộng.',
'5580000','2024',1,1,3),
('LOUIS VUITTON MÉTÉORE EDP FOR MEN','Louis Vuitton Météore EDP là một phần trong BST “Les Parfum” của Louis Vuitton vừa ra mắt năm 2020. Ngay khi vừa ra mắt, chai nước hoa này đã thu hút được sự chú ý của những chàng trai với thiết kế sang trọng, tinh tế. Được lấy cảm hứng từ những tinh thể băng tuyết, chai nước hoa được thiết kế có hình trụ tròn, các cạnh được bo góc mềm mại.',
'8650000','2024',1,1,),
('TOMMY ENDLESS BLUE FOR MEN','Tommy Endless Blue là một dòng nước hoa của Tommy Hilfiger dành cho nam giới, được ra mắt vào năm 2017. Chai nước hoa nam này đặc trưng với hương thơm hài hòa giữa sự ngọt ngào của Đậu Tonka, sự cay nồng của tiêu đen và hương bình yên của thảo dược cùng chút cay nồng của rượu cognac.',
'2300000','2024',2,1),
('ISSEY MIYAKE L’EAU D’ISSEY INTENSE FOR MEN','Issey Miyake L’eau D’issey Intense là một tác phẩm nghệ thuật nước hoa nam giới của Issey Miyake, được ra mắt để tạo nên một trải nghiệm hương thơm đầy sức cuốn hút và sâu lắng. Đây không chỉ đơn thuần là một nước hoa, mà còn là một câu chuyện về cảm xúc và cái đẹp của sự tương phản.',
'2500000','2024',7,1),
('CREED AVENTUS EDP FOR MEN','Creed Aventus – Một cái tên không còn quá xa lạ với các tín đồ mùi hương thời thượng. Được phong là vua của nước hoa nam. Vì đi đầu trong việc chế tạo một mùi hương cam chanh, dễ sử dụng nhưng lại đặc sắc khó tả. Có sức hút bởi mùi hương sang trọng và lôi cuốn, thêm một chút gì đó phóng khoáng và dũng mãnh. Dòng nước hoa được lấy cảm hứng từ cuộc đời đầy kịch tính của vị vua Napoleon. Tượng trưng cho sự chiến tranh, hòa bình và lãng mạn.',
'9500000','2024',4,1),

--5 perfumes for Women
('CHANEL CHANCE EDP FOR WOMEN','Chanel Chance EDP đã nổi tiếng từ nhiều năm, Chanel được nhiều người tìm kiếm và sử dụng bởi mùi hương đẳng cấp của nó. Chanel Chance Eau De Parfum là một trong những dòng nước hoa được chị em phái đẹp săn đón nhiều nhất. Trong đó có cả tôi.',
'4800000','2024',9,1),
('DIOR JOY EDP FOR WOMEN', 'Dior Joy là tác phẩm được Dior ấp ủ rất lâu, song mới cho ra mắt. Mùi hương mới mẻ, khác biệt hoàn toàn với những dòng nước hoa đi trước. Nếu như những mùi hương trước đây là cổ điển, là điệu đà. Thì Dior Joy là mùi hương đầy niềm vui và hạnh phúc mà Dior muốn gửi đến những người phụ nữ.',
'3500000','2024',11,1),
('YSL LIBRE EDP FOR WOMEN', 'YSL Libre là dòng sản phẩm nước hoa nữ của hãng thời trang cao cấp Yves Saint Laurent được cho ra mắt vào năm 2019. YSL Libre thuộc nhóm hương phương đông dành cho phái nữ và được hai nhà pha chế Anne Flipo và Carlos Benaim chế tạo ra. Trong tiếng Pháp thì Libre có nghĩa là “tự do”, được lấy cảm hứng từ sự khao khát tự do của những người phụ nữ độc lập, sang trọng và gợi cảm.',
'3500000','2024',9,1),
('LOUIS VUITTON SPELL ON YOU EDP FOR WOMEN', 'Louis Vuitton Spell On You EDP là một sản phẩm nước hoa nữ cao cấp từ thương hiệu thời trang nổi tiếng Louis Vuitton. Được ra mắt năm 2021, Spell On You hứa hẹn là sự lựa chọn an toàn cho mọi cô gái bởi mùi hương tươi tắn, tinh tế, dịu dàng.',
'9950000','2024',9,1),
('CHANEL CHANCE EAU FRAICHE EDP FOR WOMEN', 'Chance Eau Fraiche quyến rũ cả thế giới với hương thơm vui tươi, sống động và lấp lánh. Mới đây, Chanel ra mắt một dòng nước hoa nữ Chance Eau Fraiche mới – rực rỡ và thanh lịch. Một cơ hội mới đang trong tầm tay.',
'5150000','2024',8,1),

--5 perfumes for Unisex
('XERJOFF NAXOS EDP FOR UNISEX','Nước hoa Xerjoff Naxos EDP là một dòng nước hoa unisex nằm trong bộ sưu tập đặc biệt của thương hiệu Xerjoff. Được trình làng nước hoa vào năm 2015, lấy cảm hứng từ vẻ đẹp tinh tế của một hòn đảo trên là Sicilia nằm giữa biển Địa Trung Hải. ',
'6500000','2024',13,1),
('ARMAF STERLING CLUB DE NUIT MILESTONE EDP FOR UNISEX','Nước hoa Armaf Sterling Club De Nuit Milestone EDP là dòng sản phẩm bán chạy của nước hoa Armaf mang hương thơm ngọt ngào và hiện đại, là sự pha trộn tinh tế của các nốt hương độc đáo.',
'2400000','2024',16,1),
('GUCCI A SONG FOR THE ROSE EDP FOR UNISEX','Năm 2019 thương hiệu Gucci cho ra đời dòng nước hoa Gucci A Song For The Rose EDP, đây là nước hoa unisex dành cho cả nam lẫn nữ. Mùi hương chắt lọc từ nhóm hương hoa cỏ xạ hương tạo nên một hương thơm đầy ngọt ngọt và quyến rũ.',
'6550000','2024',16,1),
('LE LABO THE NOIR 29 EDP FOR UNISEX','Cũng giống như những dòng nước hoa khác của thương hiệu Le Labo, dòng nước hoa Le Labo The Noir 29 EDP sở hữu thiết kế vỏ chai theo phong cách tối giản, mang đến cảm giác sang trọng, tinh tế. Chai nước hoa được làm bằng thủy tinh trong suốt, có thể quan sát thấy màu sắc của nước hoa bên trong. Đặc biệt, người sở hữu chai nước hoa này có thể in tên mình lên trên nhãn dán, điều này thể hiện sự cá nhân hóa của sản phẩm, đem đến trải nghiệm mới lạ, độc đáo cho khách hàng.',
'7300000','2024',21,1),
('LOUIS VUITTON OMBRE NOMADE EDP FOR UNISEX','Bạn đang tìm kiếm một dòng nước hoa dành cho cả nữ và nam với hương thơm thật sang trọng cũng như tạo ấn tượng ngay giây phút đầu tiên. Thì Louis Vuitton Ombre Nomade EDP chính là một sự lựa chọn đúng ngay lúc này. Đây là dòng nước hoa unisex đến từ thương hiệu cao cấp Louis Vuitton.',
'13000000','2024',21,1),
('ROJA PARFUMS OCEANIA EDP FOR UNISEX','Nước hoa Roja Parfums Oceania EDP đến từ thương hiệu Roja. Tầng hương đầu mở ra với sự kết hợp của các nốt hương trái cây mang đến cảm giác vô cùng sảng khoái. Mùi hương chua ngọt thanh mát từ quả quýt hồng và chanh vàng rất bắt mũi. Hoà quyện cùng hương bưởi ngọt mát. Nhấn nhá bằng hương thơm trong trẻo, tươi tắn của cam Bergamot. Hương trái cây càng nổi bật hơn trên nền hương nồng the dễ chịu của oải hương, hương thảo và cỏ xạ hương. ',
'9600000','2024',21,1);

--5 Giftset 

CREATE TABLE [dbo].[ProductDetail] (
    [ProductDetailID] [int] PRIMARY KEY IDENTITY(1,1),
    [pdProductID] [int] NOT NULL,
    [ProductMI] [float] NULL,	
    [ProductSold] [int] NULL,
    [ProductAvailable] [int] NULL,
    [ProductCreateDate] DATE NULL,
    [ProductStatus] BIT NOT NULL,
    [ProductImageID] [INT] NULL,
    [ProductQuantity] [INT] NULL,
    FOREIGN KEY ([productImageID]) REFERENCES [dbo].[ProductImage]([ProductImageID]),
	FOREIGN KEY ([pdProductID]) REFERENCES [dbo].[Products]([ProductID])
)


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

