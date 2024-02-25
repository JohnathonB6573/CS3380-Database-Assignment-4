-- Johnathon Brumfield MySQL Assignment 4
-- creating the tables
CREATE DATABASE database_name;
USE database_name;

CREATE TABLE publisher(p_name varchar(20) PRIMARY KEY, address varchar(50), 
number varchar(12));

CREATE TABLE borrower(card_no int PRIMARY KEY, c_name varchar(20),
c_address varchar(50), phone varchar(12));

CREATE TABLE library_branch(branch_id int PRIMARY KEY, 
branch_name varchar(20), branch_address varchar(50));

CREATE TABLE book(book_id int PRIMARY KEY, title varchar(20),
publisher_name varchar(20), 
FOREIGN KEY (publisher_name) REFERENCES publisher(p_name));

CREATE TABLE book_authors(book_id int, author_name varchar(20) NOT NULL,
FOREIGN KEY (book_id) REFERENCES book(book_id));

CREATE TABLE book_loans(book_id int, branch_id int, card_no int, 
date_out date, date_in date, 
FOREIGN KEY (book_id) REFERENCES book(book_id), 
FOREIGN KEY (branch_id) REFERENCES library_branch(branch_id),
FOREIGN KEY (card_no) REFERENCES borrower(card_no));

CREATE TABLE book_copies(book_id int, branch_id int, no_of_copies int,
FOREIGN KEY (book_id) REFERENCES book(book_id),  
FOREIGN KEY (branch_id) REFERENCES library_branch(branch_id));

-- inserting into the tables
insert into borrower values(1, "Borrower 1", "Address 1", "+11231231234");
insert into borrower values(2, "Borrower 2", "Address 2", "+11231231235");

insert into library_branch values(1, "Lib 1", "Address 3");
insert into library_branch values(1, "Lib 1", "Address 4");

insert into publisher values ("Pub 1", "Address 5", "+11231231236");
insert into publisher values ("Pub 2", "Address 6", "+11231231237");

insert into book values (1, "Title 1", "Pub 1");
insert into book values (2, "Title 2", "Pub 2");

insert into book_authors values (1,"Author 1");
insert into book_authors values (2,"Author 2");

insert into book_copies values(1,1,4);
insert into book_copies values(2,2,5);

insert into book_loans values(1,1,1,"2023-08-30","2023-09-11");
insert into book_loans values(1,1,1,"2023-10-31","2023-12-01");

-- part c of the assignment
SELECT branch_name FROM borrower, library_branch, book_loans
WHERE borrower.card_no = book_loans.card_no
	AND book_loans.branch_id =library_branch.branch_id
ORDER BY branch_name ASC;

-- part d of the assignment
SELECT borrower_name FROM  book_loans, borrower
WHERE borrower.card_no != book_loans.card_no
ORDER BY borrower_name ASC;