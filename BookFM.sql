--==================product id Sequence=======================

create sequence books_seq 
start with 1
increment by 1
maxvalue 100000
nocache
nocycle;

--==================product table=============================

CREATE TABLE BookDtls(
  book_id NUMBER default books_seq.nextval PRIMARY KEY,
  book_name VARCHAR2(50) NOT NULL,
  narrator varchar2(45),
  description VARCHAR2(200) NOT NULL,
  price NUMBER(10,2) NOT NULL check(price>0),
  book_category varchar2(45) not null,
  photo varchar2(45) not null,
  email varchar2(45) not null
);

add audio varchar2(45);





--==================customer id sequence======================


create sequence user_seq 
start with 1
increment by 1
maxvalue 100000
nocache
nocycle;

--==================customer table=====================

CREATE TABLE users(
  user_id NUMBER default user_seq.nextval PRIMARY KEY,
  name VARCHAR2(50) NOT NULL,
  email VARCHAR2(100) NOT NULL,
  password VARCHAR2(50) NOT NULL,
  phone VARCHAR2(20) NOT NULL
);


--====================order id sequence================

create sequence order_seq 
start with 1
increment by 1
maxvalue 100000
nocache
nocycle;
drop sequence order_seq;
--=====================orders table=====================

CREATE TABLE orders(
  user_id NUMBER default order_seq.nextval primary key,
  order_id varchar2(45),
  name varchar2(45),
  email VARCHAR2(100),   
  phone VARCHAR2(20),
  book_name VARCHAR2(50),
  narrator varchar2(45),
  price varchar2(45),
  payment varchar2(45),
  audio varchar2(45)
);
   

--======================cart id sequence=================== 

create sequence cart_seq 
start with 1
increment by 1
maxvalue 100000
nocache
nocycle;

--=======================shopping cart=====================

CREATE TABLE cart(
  cart_id NUMBER default cart_seq.nextval PRIMARY KEY,
  book_id NUMBER NOT NULL,
  user_id number not null,
  book_name VARCHAR2(50),
  narrator varchar2(45),
  price NUMBER(10,2) check(price>0),
  total_price NUMBER(10,2) check(total_price>0)
);

--====================DQL Queries==========================

select * from bookdtls;
select * from users;
select * from cart;
select * from orders;

--====================DDL Commands ends=====================


--====================DML Commands start=====================


--=================== Insert a new product using Procedures==================

CREATE OR REPLACE PROCEDURE insert_books(
b_book_name IN VARCHAR2,
b_narrator IN VARCHAR2,
b_description in  varchar2,
b_price IN NUMBER,
b_book_category in varchar2,
b_photo in varchar2,
b_email in varchar2
) AS
BEGIN
INSERT INTO bookdtls(book_id, book_name,narrator, description, price, book_category, photo, email)
VALUES (books_seq.nextval, b_book_name,b_narrator, b_description, b_price, b_book_category, b_photo, b_email);
END insert_books;

execute insert_books('A Court of Mist and Fury','Amaan Siddiquie','Feyre has undergone more trials than one human woman can carry in her heart.',450,'New Book', 'Fury.jpg', 'admin@gmail.com');

--=================== Update a existing product using Procedures==================

CREATE OR REPLACE PROCEDURE update_product(
p_product_id IN NUMBER,
p_product_name IN VARCHAR2,
p_description IN VARCHAR2,
p_price IN NUMBER,
p_image_id IN NUMBER
) AS
BEGIN
UPDATE products
SET product_name = p_product_name,
description = p_description,
price = p_price,
image_id = p_image_id
WHERE product_id = p_product_id;
END update_product;

--=================== Delete a existing product using Procedures==================

CREATE OR REPLACE PROCEDURE delete_product(
p_product_id IN NUMBER
) AS
BEGIN
DELETE FROM products
WHERE product_id = p_product_id;
END delete_product;







commit;