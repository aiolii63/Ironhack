create database olist;
use olist;

#1. From the order_items table, find the price of the highest priced order and lowest price order.
select * from order_items;

select price, order_id from order_items
order by price desc;
# '0812eb902a67711a1cb742b3cdaa65ae'

select price, order_id from order_items
order by price;
# 'c5bdd8ef3c0ec420232e668302179113'

#2. From the order_items table, what is range of the shipping_limit_date of the orders?
select order_id, shipping_limit_date from order_items
order by shipping_limit_date desc;
# Range from '2018-08-27 05:55:07' to '2020-04-10 00:35:08'

#3. From the customers table, find the states with the greatest number of customers.
select * from customers;

select customer_state, count(customer_unique_id) as numb from customers
group by customer_state
order by numb desc;

#4. From the customers table, within the state with the greatest number of customers, find the cities with the greatest number of customers.
select customer_state, customer_city, count(customer_unique_id) as numb from customers
where customer_state = "SP"
group by customer_city
order by numb desc;

#5. From the closed_deals table, how many distinct business segments are there (not including null)?
select * from closed_deals;

select distinct business_segment from closed_deals
where business_segment <> "null";

#6. From the closed_deals table, sum the declared_monthly_revenue for duplicate row values in business_segment and find the 3 business segments with the highest declared monthly revenue (of those that declared revenue).
select business_segment, sum(declared_monthly_revenue) from closed_deals
group by business_segment
order by sum(declared_monthly_revenue) desc
limit 3;

#7. From the order_reviews table, find the total number of distinct review score values.
select * from order_reviews;

select distinct review_score from order_reviews
order by review_score desc;

#8. In the order_reviews table, create a new column with a description that corresponds to each number category for each review score from 1 - 5, then find the review score and category occurring most frequently in the table.
ALTER TABLE order_reviews
ADD review_subtitles VARCHAR(30);

UPDATE order_reviews
set review_subtitles = "Terrible" where review_score ="1";

UPDATE order_reviews
set review_subtitles = "Bad" where review_score ="2";

UPDATE order_reviews
set review_subtitles = "Acceptable" where review_score ="3";

UPDATE order_reviews
set review_subtitles = "Good" where review_score ="4";

UPDATE order_reviews
set review_subtitles =  "Very good" where review_score ="5";

#9. From the order_reviews table, find the review value occurring most frequently and how many times it occurs.
select review_score, count(review_id) from order_reviews
group by review_score
order by count(review_id) desc;

# 5	57420
# 4	19200
# 1	11858
# 3	8287
# 2	3235