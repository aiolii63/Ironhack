use publications2;

#Challenge 1 - Who Have Published What At Where?

SELECT au_id AS `AUTHOR ID`, au_lname AS `LAST NAME`, au_fname AS `FIRST NAME`, title AS TITLE, publishers.pub_name AS PUBLISHER
FROM
(SELECT au_id, au_lname, au_fname, titles.title, titles.pub_id
FROM
(SELECT authors.au_id, authors.au_lname, authors.au_fname, titleauthor.title_id
FROM authors
INNER JOIN titleauthor
ON authors.au_id = titleauthor.au_id) AS A
INNER JOIN titles
ON A.title_id = titles.title_id) AS B
INNER JOIN publishers
ON B.pub_id = publishers.pub_id
ORDER BY B.au_id ASC, B.title DESC;

#Challenge 2 - Who Have Published How Many At Where?

create table challenge2 (
SELECT au_id AS `AUTHOR ID`, au_lname AS `LAST NAME`, au_fname AS `FIRST NAME`, title AS TITLE, publishers.pub_name AS PUBLISHER
FROM
(SELECT au_id, au_lname, au_fname, titles.title, titles.pub_id
FROM
(SELECT authors.au_id, authors.au_lname, authors.au_fname, titleauthor.title_id
FROM authors
INNER JOIN titleauthor
ON authors.au_id = titleauthor.au_id) AS A
INNER JOIN titles
ON A.title_id = titles.title_id) AS B
INNER JOIN publishers
ON B.pub_id = publishers.pub_id
ORDER BY B.au_id ASC, B.title DESC);

select * from challenge2;

SELECT `AUTHOR ID`, `LAST NAME`, `FIRST NAME`, count(TITLE), PUBLISHER
from challenge2
group by `AUTHOR ID`, PUBLISHER
order by count(TITLE) desc;


#Challenge 3 - Challenge 3 - Best Selling Authors

SELECT `AUTHOR ID`, `LAST NAME`, `FIRST NAME`, count(TITLE)
from challenge2
group by `AUTHOR ID`
order by count(TITLE) desc
Limit 10;


#Challenge 4 - Best Selling Authors Ranking

SELECT authors.au_id, authors.au_lname, authors.au_fname, count(titleauthor.title_id)
FROM authors
LEFT JOIN titleauthor
ON authors.au_id = titleauthor.au_id
GROUP BY authors.au_id
ORDER BY count(titleauthor.title_id) desc;