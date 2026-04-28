
CREATE SCHEMA Account;
GO

CREATE SCHEMA Product;
GO

CREATE TABLE Account.Users(
	accountID INT IDENTITY(1,1) PRIMARY KEY,
	userName VARCHAR(150) NOT NULL,
	passWord VARCHAR(150) NOT NULL,
	isSeller BIT,
	cardNum UNIQUEIDENTIFIER DEFAULT NEWID(),
	email VARCHAR(150) NOT NULL,
	profileImgLink VARCHAR(150) NOT NULL
);
GO


CREATE TABLE Account.Carts(
	cartID INT IDENTITY(1,1) PRIMARY KEY,
	accountID INT NOT NULL,

	CONSTRAINT FK_Carts_User
	FOREIGN KEY (accountID)
	REFERENCES Account.Users(accountID)
);
GO

CREATE TABLE Product.Products(
	productID INT IDENTITY(1,1) PRIMARY KEY,
	productName VARCHAR(150) NOT NULL,
	price DECIMAL(6,2) NOT NULL,
	sellerID INT NOT NULL,

	CONSTRAINT FK_Products_Seller
	FOREIGN KEY (sellerID)
	REFERENCES Account.Users(accountID)
);
GO

CREATE TABLE Account.CartItems(
	cartItemID INT IDENTITY(1,1) PRIMARY KEY,
	cartID INT NOT NULL,
	productID INT NOT NULL,
	quantity INT NOT NULL,

	CONSTRAINT FK_CartItems_Cart
	FOREIGN KEY (cartID)
	REFERENCES Account.Carts(cartID),

	CONSTRAINT FK_CartItems_Product
	FOREIGN KEY (productID)
	REFERENCES Product.Products(productID)
);
GO

CREATE TABLE Product.Orders(
	orderID INT IDENTITY(1,1) PRIMARY KEY,
	buyerID INT NOT NULL,
	orderDate DATETIME DEFAULT GETDATE(),
	billing VARCHAR(150) NOT NULL,

	CONSTRAINT FK_Orders_Buyer
	FOREIGN KEY (buyerID)
	REFERENCES Account.Users(accountID)
);
GO

CREATE TABLE Product.OrderItems(
	orderItemID INT IDENTITY(1,1) PRIMARY KEY,
	orderID INT NOT NULL,
	productID INT NOT NULL,
	quantity INT NOT NULL,
	priceAtPurchase DECIMAL(6,2) NOT NULL,

	CONSTRAINT FK_OrderItems_Order
	FOREIGN KEY (orderID)
	REFERENCES Product.Orders(orderID),

	CONSTRAINT FK_OrderItems_Product
	FOREIGN KEY (productID)
	REFERENCES Product.Products(productID)
);
GO


-- User (seller + buyer)
INSERT INTO Account.Users (userName, passWord, isSeller, email, profileImgLink)
VALUES ('Sheriff Unkel', 'pass123', 1, 'coolEmail@email.com', 'images/product.png');

DECLARE @UserID INT = SCOPE_IDENTITY();


-- Cart
INSERT INTO Account.Carts (accountID)
VALUES (@UserID);

DECLARE @CartID INT = SCOPE_IDENTITY();


-- Product
INSERT INTO Product.Products (productName, price, sellerID)
VALUES ('X9000 Ray-Gun Blaster', 12.87, @UserID);

DECLARE @ProductID INT = SCOPE_IDENTITY();


-- Cart Item
INSERT INTO Account.CartItems (cartID, productID, quantity)
VALUES (@CartID, @ProductID, 1);


-- Order
INSERT INTO Product.Orders (buyerID, billing)
VALUES (@UserID, 'Visa');

DECLARE @OrderID INT = SCOPE_IDENTITY();


-- Order Item
INSERT INTO Product.OrderItems (orderID, productID, quantity, priceAtPurchase)
VALUES (@OrderID, @ProductID, 1, 12.87);