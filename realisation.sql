CREATE DATABASE business_db;
USE business_db;

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    email VARCHAR(100)
);

CREATE TABLE articles (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100),
    content TEXT,
    created_at DATE,
    user_id INT,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE orders (
    id INT AUTO_INCREMENT PRIMARY KEY,
    total_price DECIMAL(10,2),
    created_at DATE,
    user_id INT,
    FOREIGN KEY (user_id) REFERENCES users(id)
);


INSERT INTO users (name, email) VALUES
('Friedrich Nietzsche', 'fried@gmail.com'),
('Marcus Aurelius', 'marcus@gmail.com'),
('Albert Camus', 'albert@gmail.com'),
('John Stuart', 'john@gmail.com'),
('Jason Statham', 'jason@gmail.com');


INSERT INTO articles (id, title, content, created_at, user_id) VALUES
(1,'Beyond Good and Evil','exposing a government conspiracy','2025-01-01',1),
(2,'Meditations','changing nature of the universe','2025-01-05',2),
(3,'The Stranger','weeks after his mother funeral','2025-01-10',3),
(4,'Liberty','individual freedoms must be protected','2025-01-20',4),
(5,'Twilight of the Idols','philosophy critique','2025-01-23',1),
(6,'Action Philosophy', 'analysis of action movies and philosophy', '2025-01-25', 5);




INSERT INTO orders (user_id, total_price, created_at) VALUES
(1, 120.50, '2025-01-02'),
(2, 75.00, '2025-01-06'),
(3, 200.00, '2025-01-08'),
(4, 180.00, '2025-01-12'),
(5, 150.00,  '2025-01-15');




select
 title,created_at 
from articles 
order by created_at asc


select user_id,count(*) as total
from articles
group by user_id


delete from articles
where user_id=3


update articles set title="hello world"
where user_id=4



select articles.title, users.name,orders.total_price
from articles inner join users
on
articles.user_id=users.id
inner join orders
on
orders.user_id=users.id






