USE E_COMMERCE;

CREATE TABLE USER_LOGIN(
USERNAME VARCHAR(40) NOT NULL,
    EMAIL VARCHAR(100),
    PASSWD VARCHAR(50) NOT NULL,
    POINTS NUMERIC DEFAULT 0,
    PRIMARY KEY(EMAIL)
);

CREATE TABLE PRODUCTS(
PRODUCT_ID VARCHAR(30) NOT NULL,
    PRODUCT_DESC VARCHAR(500) NOT NULL,
    PRODUCT_NAME VARCHAR(60) NOT NULL,
    PRODUCT_PRICE NUMERIC NOT NULL CHECK(PRODUCT_PRICE>0),
    POINT_PER_UNIT NUMERIC DEFAULT 0,
    PRODUCT_RATING NUMERIC DEFAULT 0,
    PRODUCT_LINK VARCHAR(500) NOT NULL,
    NO_OF_SOLD INTEGER DEFAULT 0 CHECK(NO_OF_SOLD>=0),
    CATEGORY VARCHAR(50) NOT NULL,
    PRIMARY KEY(PRODUCT_ID)
);

CREATE TABLE IMAGES(
PRODUCT_ID VARCHAR(30) REFERENCES PRODUCTS(PRODUCT_ID),
IMAGE_LINK VARCHAR(500)
);

CREATE TABLE REWARDS(
	REWARD_ID VARCHAR(30) NOT NULL,
    PRODUCT_DESC VARCHAR(500) NOT NULL,
    PRODUCT_NAME VARCHAR(60) NOT NULL,
    PRODUCT_POINTS NUMERIC NOT NULL CHECK(PRODUCT_POINTS>0),
    PRODUCT_LINK VARCHAR(500) NOT NULL,
    NO_OF_SOLD INTEGER DEFAULT 0,
    PRIMARY KEY(REWARD_ID)
);

CREATE TABLE PURCHASES(
PURCHASE_ID VARCHAR(50) NOT NULL,
    PRODUCT_ID VARCHAR(30) REFERENCES PRODUCTS(PRODUCT_ID),
    USER_ID VARCHAR(100) REFERENCES USER_LOGIN(EMAIL),
    PURCHASE_DATE TIMESTAMP NOT NULL,
    PRIMARY KEY(PURCHASE_ID)
);

CREATE TABLE ORDERS(
	ORDER_ID INT NOT NULL,
    PRODUCT_ID VARCHAR(30) REFERENCES PRODUCTS(PRODUCT_ID),
	USER_ID VARCHAR(100) REFERENCES USER_LOGIN(EMAIL),
    DATE_OF_ORDER TIMESTAMP NOT NULL,
    PRICE NUMERIC NOT NULL,
    POINTS_GAINED NUMERIC DEFAULT 0,
    PRIMARY KEY(ORDER_ID)
);

DROP TABLE ORDERS;

CREATE TABLE TRANSACTIONS(
ORDER_ID VARCHAR(50) REFERENCES ORDERS(ORDER_ID),
PRODUCT_ID VARCHAR(30) REFERENCES PRODUCTS(PRODUCT_ID),
    USER_ID VARCHAR(100) REFERENCES USER_LOGIN(EMAIL),
    TRANSACTION_DATE TIMESTAMP NOT NULL,
    TRANSACTION_AMOUNT NUMERIC NOT NULL,
    PAYMENT_METHOD VARCHAR(50) NOT NULL
);

CREATE TABLE CART(
PRODUCT_ID VARCHAR(30) REFERENCES PRODUCTS(PRODUCT_ID),
    USER_ID VARCHAR(30) REFERENCES USER_LOGIN(EMAIL),
QUANTITY NUMERIC DEFAULT 0 NOT NULL,
    TOTAL_PRICE NUMERIC DEFAULT 0 NOT NULL,
    PRIMARY KEY(PRODUCT_ID,USER_ID)
);

CREATE TABLE PROMOTIONS(
PRODUCT_ID VARCHAR(30) REFERENCES PRODUCTS(PRODUCT_ID),
    PROMOTION_QUOTE VARCHAR(500) NOT NULL,
--    VALIDITY_PERIOD TIMESTAMP NOT NULL,
    DISCOUNT_AMT NUMERIC DEFAULT 0
);

CREATE TABLE WISH_LIST(
PRODUCT_ID VARCHAR(30) REFERENCES PRODUCTS(PRODUCT_ID),
    USER_ID VARCHAR(100) REFERENCES USER_LOGIN(EMAIL),
    PRIORITY INTEGER DEFAULT 0,
    PRIMARY KEY (PRODUCT_ID,USER_ID)
);

DROP TABLE CART;

INSERT INTO USER_LOGIN
VALUES('JohnDoe','johndoe@example.com','johndoe',0);

INSERT INTO USER_LOGIN
VALUES('Scarlet','scarlet@email.com','scarlet',0);

INSERT INTO PRODUCTS (PRODUCT_ID, PRODUCT_DESC, PRODUCT_NAME, PRODUCT_PRICE, POINT_PER_UNIT, PRODUCT_RATING, PRODUCT_LINK, NO_OF_SOLD, CATEGORY) VALUES
('1001', 'High-quality leather wallet with multiple compartments.', 'Leather Wallet', 49.99, 5, 4.5, 'https://example.com/leather-wallet', 120, 'Accessories');

INSERT INTO PRODUCTS
VALUES('1002', 'Stainless steel water bottle, 20 oz capacity.', 'Stainless Steel Water Bottle', 19.99, 3, 4.2, 'https://example.com/water-bottle', 80, 'Kitchenware');

INSERT INTO PRODUCTS
VALUES ('1003', 'Lightweight and durable laptop backpack with padded compartments.', 'Laptop Backpack', 59.99, 8, 4.7, 'https://example.com/laptop-backpack', 150, 'Bags & Luggage');

INSERT INTO PRODUCTS
VALUES ('1004', 'Soft cotton t-shirt with a minimalist design.', 'Basic T-Shirt', 14.99, 2, 4.0, 'https://example.com/basic-t-shirt', 200, 'Clothing');

INSERT INTO PRODUCTS
VALUES('1005', 'Premium noise-canceling headphones with Bluetooth connectivity.', 'Noise-Canceling Headphones', 149.99, 10, 4.8, 'https://example.com/headphones', 90, 'Electronics');

INSERT INTO PRODUCTS
VALUES ('1006', 'Classic leather belt with a polished buckle.', 'Leather Belt', 34.99, 4, 4.3, 'https://example.com/leather-belt', 110, 'Accessories');

INSERT INTO PRODUCTS
VALUES ('1007', 'Stylish sunglasses with UV protection.', 'Sunglasses', 29.99, 3, 4.5, 'https://example.com/sunglasses', 70, 'Accessories');

INSERT INTO PRODUCTS
VALUES ('1008', 'Set of ceramic mugs, perfect for morning coffee.', 'Ceramic Mug Set', 24.99, 4, 4.6, 'https://example.com/mug-set', 100, 'Kitchenware');

INSERT INTO PRODUCTS
VALUES ('1009', 'Cozy fleece blanket for chilly evenings.', 'Fleece Blanket', 39.99, 6, 4.4, 'https://example.com/fleece-blanket', 80, 'Home & Decor');

INSERT INTO PRODUCTS
VALUES('1010', 'Versatile canvas tote bag with reinforced handles.', 'Canvas Tote Bag', 19.99, 3, 4.1, 'https://example.com/tote-bag', 130, 'Bags & Luggage');

-- INSERT INTO PRODUCTS (PRODUCT_ID, PRODUCT_DESC, PRODUCT_NAME, PRODUCT_PRICE, POINT_PER_UNIT, PRODUCT_RATING, PRODUCT_LINK, NO_OF_SOLD, CATEGORY) VALUES
-- ('1001', 'High-quality leather wallet with multiple compartments.', 'Leather Wallet', 49.99, 5, 4.5, 'https://example.com/leather-wallet', 120, 'Accessories'),
-- ('1002', 'Stainless steel water bottle, 20 oz capacity.', 'Stainless Steel Water Bottle', 19.99, 3, 4.2, 'https://example.com/water-bottle', 80, 'Kitchenware'),
-- ('1003', 'Lightweight and durable laptop backpack with padded compartments.', 'Laptop Backpack', 59.99, 8, 4.7, 'https://example.com/laptop-backpack', 150, 'Bags & Luggage'),
-- ('1004', 'Soft cotton t-shirt with a minimalist design.', 'Basic T-Shirt', 14.99, 2, 4.0, 'https://example.com/basic-t-shirt', 200, 'Clothing'),
-- ('1005', 'Premium noise-canceling headphones with Bluetooth connectivity.', 'Noise-Canceling Headphones', 149.99, 10, 4.8, 'https://example.com/headphones', 90, 'Electronics'),
-- ('1006', 'Classic leather belt with a polished buckle.', 'Leather Belt', 34.99, 4, 4.3, 'https://example.com/leather-belt', 110, 'Accessories'),
-- ('1007', 'Stylish sunglasses with UV protection.', 'Sunglasses', 29.99, 3, 4.5, 'https://example.com/sunglasses', 70, 'Accessories'),
-- ('1008', 'Set of ceramic mugs, perfect for morning coffee.', 'Ceramic Mug Set', 24.99, 4, 4.6, 'https://example.com/mug-set', 100, 'Kitchenware'),
-- ('1009', 'Cozy fleece blanket for chilly evenings.', 'Fleece Blanket', 39.99, 6, 4.4, 'https://example.com/fleece-blanket', 80, 'Home & Decor'),
-- ('1010', 'Versatile canvas tote bag with reinforced handles.', 'Canvas Tote Bag', 19.99, 3, 4.1, 'https://example.com/tote-bag', 130, 'Bags & Luggage');

INSERT INTO CART (PRODUCT_ID, USER_ID, QUANTITY, TOTAL_PRICE) VALUES
('1001', 'johndoe@example.com', 2, 99.98),
('1002', 'johndoe@example.com', 1, 19.99),
('1003', 'johndoe@example.com', 1, 59.99),
('1004', 'johndoe@example.com', 3, 44.97),
('1005', 'johndoe@example.com', 1, 149.99),
('1006', 'johndoe@example.com', 2, 69.98),
('1007', 'johndoe@example.com', 1, 29.99);

INSERT INTO CART (PRODUCT_ID, USER_ID, QUANTITY, TOTAL_PRICE) VALUES
('1001', 'scarlet@email.com', 3, 149.97),
('1002', 'scarlet@email.com', 2, 39.98),
('1003', 'scarlet@email.com', 1, 59.99),
('1004', 'scarlet@email.com', 2, 29.98),
('1005', 'scarlet@email.com', 1, 149.99),
('1006', 'scarlet@email.com', 1, 34.99);

-- INSERT INTO REWARDS TABLE WITH 20 REWARDS

INSERT INTO REWARDS (REWARD_ID, PRODUCT_DESC, PRODUCT_NAME, PRODUCT_POINTS, PRODUCT_LINK, NO_OF_SOLD) VALUES 
('RWD001', 'Wireless Bluetooth Headphones with Noise Cancelling', 'Bluetooth Headphones', 1500, 'https://example.com/bluetooth-headphones', 0),
('RWD002', 'Portable Waterproof Bluetooth Speaker', 'Bluetooth Speaker', 800, 'https://example.com/bluetooth-speaker', 0),
('RWD003', 'Smart Fitness Tracker Watch with Heart Rate Monitor', 'Fitness Tracker Watch', 1200, 'https://example.com/fitness-tracker-watch', 0),
('RWD004', 'Wireless Charging Pad for Smartphones', 'Wireless Charging Pad', 600, 'https://example.com/wireless-charging-pad', 0),
('RWD005', '4K Ultra HD Action Camera with Waterproof Case', 'Action Camera', 2000, 'https://example.com/action-camera', 0),
('RWD006', 'Wireless Ergonomic Keyboard and Mouse Combo', 'Keyboard and Mouse Combo', 1800, 'https://example.com/keyboard-mouse-combo', 0),
('RWD007', 'Noise Cancelling Over-Ear Wireless Headphones', 'Noise Cancelling Headphones', 2500, 'https://example.com/noise-cancelling-headphones', 0),
('RWD008', 'Portable Power Bank with Fast Charging', 'Power Bank', 1000, 'https://example.com/power-bank', 0),
('RWD009', 'Wireless Charging Stand for Smartphones', 'Wireless Charging Stand', 700, 'https://example.com/wireless-charging-stand', 0),
('RWD010', 'Bluetooth Wireless Earbuds with Charging Case', 'Wireless Earbuds', 1200, 'https://example.com/wireless-earbuds', 0),
('RWD011', 'Compact Waterproof Binoculars for Outdoor Activities', 'Binoculars', 1500, 'https://example.com/binoculars', 0),
('RWD012', 'Mini Drone with HD Camera and Altitude Hold', 'Mini Drone', 1800, 'https://example.com/mini-drone', 0),
('RWD013', 'Stainless Steel Insulated Travel Mug', 'Travel Mug', 500, 'https://example.com/travel-mug', 0),
('RWD014', 'Fitness Resistance Bands Set with Handles', 'Resistance Bands', 900, 'https://example.com/resistance-bands', 0),
('RWD015', 'Digital Kitchen Food Scale with Stainless Steel Platform', 'Kitchen Food Scale', 700, 'https://example.com/kitchen-food-scale', 0),
('RWD016', 'Wireless Charging Car Mount for Smartphones', 'Car Mount', 1200, 'https://example.com/car-mount', 0),
('RWD017', 'Portable Blender for Smoothies and Shakes', 'Portable Blender', 1500, 'https://example.com/portable-blender', 0),
('RWD018', 'Waterproof Laptop Backpack with USB Charging Port', 'Laptop Backpack', 2000, 'https://example.com/laptop-backpack', 0),
('RWD019', 'HD Webcam with Microphone for Video Conferencing', 'Webcam', 800, 'https://example.com/webcam', 0),
('RWD020', 'LED Desk Lamp with Wireless Charging and USB Port', 'Desk Lamp', 1000, 'https://example.com/desk-lamp', 0);


TRUNCATE CART;
TRUNCATE REWARDS;

DELIMITER $$

-- CREATE PROCEDURE GET_USERS()
-- BEGIN
-- SELECT *
--     FROM USER_LOGIN;
-- END $$

-- A Procedure for getting the search results
CREATE PROCEDURE GET_SEARCH_RESULTS(IN SEARCH_ELEMENT VARCHAR(20))
BEGIN
	SELECT *
    FROM PRODUCTS
    WHERE PRODUCT_NAME LIKE CONCAT('%',SEARCH_ELEMENT,'%') OR CATEGORY LIKE CONCAT('%',SEARCH_ELEMENT,'%');
END $$

-- A Procedure for Finding the top N elements having larger units sold
CREATE PROCEDURE GET_BEST_SELLERS(IN NUMBER_OF_ELEMENTS INTEGER)
BEGIN
	SELECT PRODUCT_ID,PRODUCT_PRICE,NO_OF_SOLD
    FROM PRODUCTS
    ORDER BY NO_OF_SOLD DESC
    LIMIT NUMBER_OF_ELEMENTS;
END$$

-- A Procedure for finding the cart elements of a particular user
CREATE PROCEDURE GET_CART_ITEMS(IN EMAIL_ID VARCHAR(100))
BEGIN
IF (EMAIL_ID IN (
		SELECT EMAIL
        FROM USER_LOGIN
		)
	)
THEN
    SELECT *
	FROM CART
	WHERE USER_ID = EMAIL_ID;
ELSE
	SELECT 'FAILURE';
END IF;
END$$

-- A Procedure to Add Products to the cart
CREATE PROCEDURE ADD_TO_CART(
	IN EMAIL_ID VARCHAR(40),
    IN PRO_CODE VARCHAR(30),
    IN QUANTITY NUMERIC
)
BEGIN
	DECLARE PRICE NUMERIC;
	IF (EMAIL_ID IN (
		SELECT EMAIL
        FROM USER_LOGIN
	)	AND PRO_CODE IN (
			SELECT PRODUCT_ID
            FROM PRODUCTS
	)	AND PRO_CODE NOT IN(
			SELECT PRODUCT_ID
            FROM CART
            WHERE USER_ID = EMAIL_ID
		) AND QUANTITY > 0
	)
	THEN
		SELECT PRODUCT_PRICE INTO PRICE
		FROM PRODUCTS
        WHERE PRODUCT_ID = PRO_CODE;
       
        SELECT PRICE;
		SET PRICE := PRICE * QUANTITY;
		
        INSERT INTO CART
        VALUES(PRO_CODE,EMAIL_ID,QUANTITY,PRICE);
        
        SELECT 'SUCCESS';
	ELSE
		SELECT 'FAILURE';
	END IF;
END$$

DROP PROCEDURE ADD_TO_CART$$

-- A Procedure for finding the wish list elements of a particula user
CREATE PROCEDURE GET_WISH_LIST_ELEMENTS(IN EMAIL_ID VARCHAR(100))
BEGIN
IF (EMAIL_ID IN (
SELECT EMAIL
FROM USER_LOGIN
)
)
THEN
SELECT *
FROM WISH_LIST
WHERE USER_ID = EMAIL_ID;
ELSE
SELECT 'FAILURE';
END IF;
END$$

-- A Procedure to Add Promotions to the Promotion table
CREATE PROCEDURE ADD_PROMOTIONS(
	IN PRO_CODE VARCHAR(30),
	IN PRO_QOT VARCHAR(500),
    IN DISCOUNT DECIMAL(2,2)
)
BEGIN
	IF (DISCOUNT BETWEEN 0 AND 1)
        AND (PRO_CODE NOT IN (
			SELECT PRODUCT_ID
			FROM PROMOTIONS
		)
	)	AND PRO_QOT != ''
	AND PRO_QOT NOT IN (
		SELECT PROMOTION_QUOTE
        FROM PROMOTIONS
    )
    THEN
		INSERT INTO PROMOTIONS
		VALUES(PRO_CODE,PRO_QOT,DISCOUNT);
        
        SELECT 'SUCCESS';
    ELSE
		SELECT 'FAILURE';
	END IF;
END$$

DROP PROCEDURE ADD_PROMOTIONS$$

CREATE PROCEDURE PLACE_ORDER(
	EMAIL_ID VARCHAR(40),
    PRODUCT VARCHAR(30),
    NUMBER_OF_UNITS INT
)
BEGIN
	DECLARE ITEM_PRICE DECIMAL(10,0);
    DECLARE POINTS DECIMAL(10,0);
    DECLARE ORDER_DATE TIMESTAMP;
    DECLARE ORDER_ID INT;
    DECLARE VALUE_COUNT INT;
    
    SET VALUE_COUNT = 1;
    SET VALUE_COUNT = 0;
    SET ORDER_DATE = SYSDATE();
    
    SELECT POINT_PER_UNIT,PRODUCT_PRICE INTO POINTS,ITEM_PRICE
    FROM PRODUCTS
    WHERE PRODUCT_ID = PRODUCT;
    
    SET POINTS = POINTS * NUMBER_OF_UNITS;
    SET ITEM_PRICE = ITEM_PRICE * NUMBER_OF_UNITS;
    
    SELECT MAX(ORDERS.ORDER_ID) INTO ORDER_ID
    FROM ORDERS;
    
    IF ORDER_ID IS NULL
    THEN
		SET ORDER_ID = 1;
	ELSE
		SET ORDER_ID = ORDER_ID + 1;
	END IF;
    
    
    -- select value_count;
    
    SELECT COUNT(*) INTO VALUE_COUNT
    FROM ORDERS
    WHERE USER_ID = EMAIL_ID AND PRODUCT_ID = PRODUCT;
    
    -- SELECT ORDER_ID;
    
    

	-- SELECT VALUE_COUNT,ORDER_ID,PRODUCT,EMAIL_ID,ORDER_DATE,ITEM_PRICE,POINTS;

    IF VALUE_COUNT = 0
    THEN
		INSERT INTO ORDERS
		VALUES(ORDER_ID,PRODUCT,EMAIL_ID,ORDER_DATE,ITEM_PRICE,POINTS);
        
        SELECT 'Success !';
	ELSE
		SELECT 'Error : -1, User already exists' AS ERROR_RESULT;
	END IF;
END$$

CALL PLACE_ORDER('scarlet@email.com',1010,5)$$
CALL PLACE_ORDER('johndoe@example.com',1002,17)$$

DROP PROCEDURE PLACE_ORDER$$
TRUNCATE ORDERS$$

-- CREATE PROCEDURE PLACE_ORDER(IN)

DROP TABLE CART$$
DROP PROCEDURE GET_SEARCH_RESULTS$$
DROP PROCEDURE ADD_TO_CART$$
DROP PROCEDURE GET_BEST_SELLERS$$
DROP PROCEDURE GET_WISH_LIST_ELEMENTS$$
DROP PROCEDURE ADD_PROMOTIONS$$

CALL GET_BEST_SELLERS(5)$$

CALL GET_SEARCH_RESULTS('Bags')$$

CALL GET_CART_ITEMS('scarlet@email.com')$$
CALL GET_CART_ITEMS('johndoe@example.com')$$
CALL GET_WISH_LIST_ELEMENTS('johndoe@example.com')$$


CALL ADD_PROMOTIONS(1004,'Explore the new technology with lower price ever',0.5)$$-- STR_TO_DATE('12-15-2024','%m-%d-%Y'),0.5)$$

-- IN PRO_CODE VARCHAR(30),
-- 	IN PRO_QOT VARCHAR(500),
--     IN VALIDITY_PERIOD TIMESTAMP,
--     IN DISCOUNT DECIMAL(2,2)

CALL ADD_TO_CART('johndoe@example.com',1010,5)$$
CALL ADD_TO_CART('johndoe@example.com',1006,15)$$
CALL ADD_TO_CART('johndoe@example.com',1007,2)$$
CALL ADD_TO_CART('johndoe@example.com',1001,6)$$
CALL ADD_TO_CART('scarlet@email.com',1010,25)$$
CALL ADD_TO_CART('scarlet@email.com',1005,17)$$
CALL ADD_TO_CART('scarlet@email.com',1009,31)$$
CALL ADD_TO_CART('scarlet@email.com',1002,52)$$



-- PROCEDURES
CREATE PROCEDURE GET_MIN_POINTS_FOR_REWARD(IN EMAIL_ID VARCHAR(100))
BEGIN
	DECLARE MIN_POINTS INT;
    DECLARE POINTS INT;
    DECLARE REWARD_NAME VARCHAR(60);
    DECLARE REWARD_ID VARCHAR(30);
    DECLARE REWARD_LINK VARCHAR(500);

	SELECT USER_LOGIN.POINTS INTO POINTS
	FROM USER_LOGIN
    WHERE EMAIL=EMAIL_ID;

	SELECT MIN(PRODUCT_POINTS) INTO MIN_POINTS
	FROM REWARDS;
    
    SELECT PRODUCT_NAME,REWARDS.REWARD_ID,PRODUCT_LINK INTO REWARD_NAME,REWARD_ID,REWARD_LINK
    FROM REWARDS
    WHERE PRODUCT_POINTS = MIN_POINTS;
    
	IF MIN_POINTS-POINTS<=0 THEN
		SELECT 0;
	ELSE
		SELECT (MIN_POINTS-POINTS) AS MIN_POINTS_REQUIRED,REWARD_NAME,REWARD_ID,REWARD_LINK;
    END IF;
END$$

DROP PROCEDURE GET_MIN_POINTS_FOR_REWARD$$


-- TRIGGERS

-- CREATE TRIGGER PRODUCT_ARRIVAL_IN_PROMOTION
-- AFTER INSERT ON PROMOTIONS
-- FOR EACH ROW
-- BEGIN
-- 	SELECT EMAIL
--     FROM USER_LOGIN;
-- END$$

-- CREATE TRIGGER PRODUCT_ARRIVAL_IN_PROMOTION
-- AFTER DELETE ON PROMOTIONS
-- FOR EACH ROW
-- BEGIN
-- 	SELECT EMAIL
--     FROM USER_LOGIN;
-- END$$

CREATE TRIGGER NEW_PROMOTION
AFTER INSERT ON PRODUCTS
FOR EACH ROW
BEGIN
	CALL ADD_PROMOTIONS(NEW.PRODUCT_ID,NEW.PRODUCT_DESC,0);
END$$

-- CREATE TRIGGER WISHLIST_PROMOTION
-- AFTER INSERT ON PROMOTIONS
-- FOR EACH ROW
-- BEGIN
-- 	IF NEW.PRODUCT_ID IN (SELECT PRODUCT_ID FROM WISHLIST)
--     THEN
-- 		SELECT EMAIL
--         FROM USER_LOGIN
--         WHERE USER_ID IN (SELECT DISTINCT USER_ID FROM WISHLIST WHERE PRODUCT_ID=NEW.PRODUCT_ID);
-- 	END IF;
-- END$$

-- CREATE TRIGGER PRODUCT_REMOVAL_FROM_PROMOTION
-- AFTER DELETE ON PROMOTIONS
-- FOR EACH ROW
-- BEGIN
-- SELECT PRODUCT_ID
--     FROM PROMOTIONS
--     WHERE TIMEDIFF(VALIDITY,SYSDATE()) -- NOT DONE
-- END;

CREATE TRIGGER ADD_TO_PURCHASE
AFTER INSERT ON ORDERS
FOR EACH ROW
BEGIN
	DECLARE MAXIMUM INT;
    SET MAXIMUM = 0;
    
    SELECT MAX(PURCHASE_ID)+1 INTO MAXIMUM
    FROM PURCHASES;
    
    SELECT MAXIMUM,NEW.PRODUCT_ID,NEW.USER_ID,NEW.DATE_OF_ORDER
    FROM PURCHASES;
    
	
    INSERT INTO PURCHASES
    VALUES(MAXIMUM,NEW.PRODUCT_ID,NEW.USER_ID,NEW.DATE_OF_ORDER);
	-- SELECT *
--     FROM PURCHASES;
END$$

DROP TRIGGER ADD_TO_PURCHASE$$

CALL PLACE_ORDER('scarlet@email.com',1010,5)$$
CALL PLACE_ORDER('johndoe@example.com',1002,17)$$


CALL GET_MIN_POINTS_FOR_REWARD('johndoe@example.com');