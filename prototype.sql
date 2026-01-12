--Question 1 : ajouter une nouvelle colonne au tableau


--Question 2 : listez tous les articles avec leurs auteurs
select articles.title, users.name
from articles inner join  users
on
 articles.user_id= users.id


--Question 3 : Afficher les articles écrits par un auteur spécifique (id 1 ou n’importe qui)
select articles.title, users.name from articles
inner join users
on articles.user_id=users.id
where users.id=1


-- Question 4 : Afficher les articles avec leur prix total
select articles.title,orders.total_price
from articles inner join orders
on
articles.user_id=orders.user_id




--Question 5: Afficher les articles, les auteurs et les price
select articles.title, users.name, orders.total_price
from articles inner join users
on
articles.user_id=users.id
inner join orders
on
orders.user_id=users.id


--question 6"Show all articles with their author’s name and email
select articles.title, users.name,email
from articles inner join users
on
articles.user_id=users.id

