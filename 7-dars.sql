create table if not exists publishers(
	publisher_id serial primary key,
	publisher_name varchar(50),
	shahar varchar(50),
	date_since date default current_date
);


create table if not exists authors(
	author_id serial primary key,
	author_name varchar(50) not null,
	mamlakat varchar(50) not null
	
);

create table if not exists books(
	book_id serial primary key,
	nomi varchar(50) not null,
	muallif_id integer references authors(author_id),
	nashriyot_id integer REFERENCES publishers(publisher_id),
	janr varchar(50),
	sana date default current_date,
	narx integer
);

create table if not exists book_reviews(
	book_id integer references books(book_id),
	sharh varchar(150),
	baho char(10),
	sharh_date date default current_date
);

insert into authors(author_name, mamlakat)VALUES
('anvar obidjon','uzbek'),
('tohir','uzbek'),
('ali','uzbek'),
('bali','uzbek'),
('vali','uzbek');

insert into publishers(publisher_name ,shahar)VALUES
('pk1','toshkent'),
('pk2','andijon'),
('pk3','toshkent'),
('pk4','fargona'),
('pk5','toshkent');


insert into books(nomi,muallif_id,nashriyot_id,janr,narx)VALUES
('salom dunyo',1,1,'komediya',150000),
('hello world',4,2,'komediya',120000),
('salom dunyo',2,4,'komediya',130000),
('salom dunyo',3,3,'komediya',15000),
('salom dunyo',5,5,'komediya',17000);

insert into book_reviews(book_id,sharh, baho)VALUES
(1,'alo',5),
(2,'alo',2),
(3,'alo',3),
(2,'alo',2),
(4,'alo',4);

select * from authors;
select * from publishers;
select * from books;
select * from book_reviews;

select publisher_name from publishers
order by publisher_name DESC;

select * from books limit 2;

select * from books fetch first 2 row only;

select * from publishers where shahar in ('toshkent','fargona','andijon') 
order by shahar;

select * from books where narx BETWEEN 5000 and 170000;

select * from authors where publisher_name like 'ov';
select * from authors where publisher_name like '%ov%';
select * from authors where publisher_name ilike '%O%';

select * from book_reviews where sharh is null;
select * from book_reviews where sharh is not null;

select min(narx) from books;
select max(narx) from books;
select sum(narx) from books;
select avg(narx) from books;


