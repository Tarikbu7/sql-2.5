-- 1️⃣ Create database
CREATE DATABASE IF NOT EXISTS business_db;
USE business_db;

-- 2️⃣ Authors table (users)
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    email VARCHAR(100)
);

-- 3️⃣ Buyers table
CREATE TABLE buyers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    email VARCHAR(100)
);

-- 4️⃣ Articles table (books)
CREATE TABLE articles (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100),
    content TEXT,
    published_at DATE,
    owner_id INT,
    FOREIGN KEY (owner_id) REFERENCES users(id)
);

-- 5️⃣ Orders table
CREATE TABLE orders (
    id INT AUTO_INCREMENT PRIMARY KEY,
    buyer_id INT,
    article_id INT,
    price DECIMAL(10,2),
    purchase_at DATE,
    FOREIGN KEY (buyer_id) REFERENCES buyers(id),
    FOREIGN KEY (article_id) REFERENCES articles(id)
);

-- 6️⃣ Insert authors
INSERT INTO users (name, email) VALUES
('Friedrich Nietzsche', 'fried@gmail.com'),
('Marcus Aurelius', 'marcus@gmail.com'),
('Albert Camus', 'albert@gmail.com'),
('John Stuart', 'john@gmail.com'),
('Jason Statham', 'jason@gmail.com');

-- 7️⃣ Insert buyers
INSERT INTO buyers (name, email) VALUES
('tarik', 'tarik@gmail.com'),
('wadi3', 'wadi3@gmail.com'),
('walid', 'walid@gmail.com'),
('omar', 'omar@gmail.com'),
('ayoub', 'ayoub@gmail.com');

-- 8️⃣ Insert books (articles)
INSERT INTO articles (title, content, published_at, owner_id) VALUES
('Beyond Good and Evil', 'philosophy critique', '1886-05-22', 1),
('Meditations', 'stoic philosophy', '1634-04-19', 2),
('The Stranger', 'existential novel', '1942-11-16', 3),
('Liberty', 'individual freedom theory', '1859-09-12', 4),
('Twilight of the Idols', 'philosophy analysis', '1889-02-16', 1),
('Action Philosophy', 'movies and philosophy', '2022-01-21', 5);

-- 9️⃣ Insert orders
INSERT INTO orders (buyer_id, article_id, price, purchase_at) VALUES
(1, 1, 120.50, '2025-01-06'),  -- tarik buys "Beyond Good and Evil"
(2, 2, 75.00,  '2025-01-08'),  -- wadi3 buys "Meditations"
(3, 3, 200.00, '2025-01-10'),  -- walid buys "The Stranger"
(4, 4, 180.00, '2025-01-12'),  -- omar buys "Liberty"
(5, 5, 150.00, '2025-01-14'),  -- ayoub buys "Twilight of the Idols"
(1, 6, 130.00, '2025-01-16');  -- tarik buys "Action Philosophy"

select
 title,published_at 
from articles 
order by published_at asc


select owner_id,count(*) as total
from articles
group by owner_id


delete from articles
where owner_id=3

update articles set title="hello world"
where owner_id=4

select articles.title, users.name,orders.total_price
from articles inner join users
on
articles.owner_id=users.id
inner join orders
on
orders.buyer_id=users.id






