
/* Question 1: Who have published what at where?
*/
select 
	a.au_id as author_id,
	a.au_lname as lastname,
	a.au_fname as firstname,
	t.title as title,
	p.pub_name as publisher
from 
	authors a
join 
	titleauthor ta on ta.au_id = a.au_id
join 
	titles t on t.title_id = ta.title_id
join 
	publishers p on p.pub_id = t.pub_id
order by
	1, 4; 

/* Question 2: Who have published how many times at where?
*/ 

select 
	a.au_id as author_id,
	a.au_lname as lastname,
	a.au_fname as firstname,
	p.pub_name as publisher,
	count(t.title) as title_count
from 
	authors a
join 
	titleauthor ta on ta.au_id = a.au_id
join 
	titles t on t.title_id = ta.title_id
join 
	publishers p on p.pub_id = t.pub_id
group by 
	1, 4
order by 
	5 desc;

/* Question 3: Best Selling authors 
*/
select 
	a.au_id as author_id,
	a.au_lname ||', '||a.au_fname as auther_name,
	sum(s.qty) as total_sold
from 
	authors a
join 
	titleauthor ta on ta.au_id = a.au_id
join 
	titles t on t.title_id = ta.title_id
join 
	sales s on t.title_id = s.title_id

group by 
		1, 2
order by 
		3 desc
limit 3;

/* Question 4: Best Selling Authors Ranking  
*/
select 
	a.au_id as author_id,
	a.au_lname as l_name,
	a.au_fname as f_name, 
	coalesce(sum(s.qty), 0) as title_sold
from 
	authors a
join 
	titleauthor ta on ta.au_id = a.au_id
join 
	titles t on t.title_id = ta.title_id
join 
	sales s on t.title_id = s.title_id

group by 
		1, 2
order by 
		3 desc;