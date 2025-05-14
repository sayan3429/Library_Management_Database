BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "books" (
	"book_id"	INTEGER,
	"title"	VARCHAR(200) NOT NULL,
	"author"	VARCHAR(100) NOT NULL,
	"isbn"	VARCHAR(20) UNIQUE,
	"published_year"	INTEGER,
	"genre"	VARCHAR(50),
	"total_copies"	INTEGER DEFAULT 1,
	"available_copies"	INTEGER DEFAULT 1,
	PRIMARY KEY("book_id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "fines" (
	"fine_id"	INTEGER,
	"loan_id"	INTEGER,
	"fine_amount"	DECIMAL(10, 2),
	"paid"	BOOLEAN DEFAULT 0,
	PRIMARY KEY("fine_id" AUTOINCREMENT),
	FOREIGN KEY("loan_id") REFERENCES "loans"("loan_id")
);
CREATE TABLE IF NOT EXISTS "loans" (
	"loan_id"	INTEGER,
	"book_id"	INTEGER,
	"member_id"	INTEGER,
	"loan_date"	DATE DEFAULT CURRENT_DATE,
	"due_date"	DATE,
	"return_date"	DATE,
	PRIMARY KEY("loan_id" AUTOINCREMENT),
	FOREIGN KEY("book_id") REFERENCES "books"("book_id"),
	FOREIGN KEY("member_id") REFERENCES "members"("member_id")
);
CREATE TABLE IF NOT EXISTS "members" (
	"member_id"	INTEGER,
	"first_name"	VARCHAR(50) NOT NULL,
	"last_name"	VARCHAR(50) NOT NULL,
	"email"	VARCHAR(100) UNIQUE,
	"join_date"	DATE DEFAULT CURRENT_DATE,
	"membership_status"	VARCHAR(20) DEFAULT 'Active',
	PRIMARY KEY("member_id" AUTOINCREMENT)
);
INSERT INTO "books" VALUES (1,'The Great Gatsby','F. Scott Fitzgerald','9780743273565',1925,'Classic',3,3);
INSERT INTO "books" VALUES (2,'To Kill a Mockingbird','Harper Lee','9780061120084',1960,'Fiction',2,2);
INSERT INTO "books" VALUES (3,'1984','George Orwell','9780451524935',1949,'Dystopian',4,4);
INSERT INTO "books" VALUES (4,'Pride and Prejudice','Jane Austen','9780141439518',1813,'Romance',2,2);
INSERT INTO "books" VALUES (5,'The Hobbit','J.R.R. Tolkien','9780547928227',1937,'Fantasy',3,3);
INSERT INTO "loans" VALUES (1,1,2,'2025-05-14','2025-05-28','2025-05-14');
INSERT INTO "members" VALUES (1,'John','Smith','john.smith@email.com','2025-05-14','Active');
INSERT INTO "members" VALUES (2,'Sarah','Johnson','sarah.j@email.com','2025-05-14','Active');
INSERT INTO "members" VALUES (3,'Michael','Williams','michael.w@email.com','2025-05-14','Active');
INSERT INTO "members" VALUES (4,'Emma','Brown','emma.b@email.com','2025-05-14','Active');
INSERT INTO "members" VALUES (5,'David','Jones','david.jones@email.com','2025-05-14','Active');
COMMIT;
