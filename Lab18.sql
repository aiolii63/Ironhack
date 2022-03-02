create database Lab18;
use Lab18;

CREATE TABLE apple ( id INTEGER PRIMARY KEY, track_name TEXT, size_bytes Integer,
currency TEXT, price FLOAT,
rating_count_tot FLOAT,
rating_count_ver FLOAT,
user_rating FLOAT,
user_rating_ver FLOAT,
ver TEXT,
cont_rating FLOAT,
prime_genre TEXT,
sup_devices_num Integer,
ipadSc_urls_num Integer,
lang_num Integer,
vpp_lic	Integer);


select * from apple;

# question1 >>> List of all genres
select prime_genre from apple;

#question2 >>> Games
select prime_genre, count(rating_count_tot) from apple
order by count(rating_count_tot) desc
limit 1;

#question3 >>> Genres with the most apps
select prime_genre, count(id) from apple
group by prime_genre
order by count(id) desc;

#question4 >>> Medical
select prime_genre, count(id) from apple
group by prime_genre
order by count(id)
limit 1;

#question5 >>> Facebook
select track_name, rating_count_tot from apple
order by rating_count_tot desc
limit 10;

#question6 
select track_name, user_rating from apple
order by user_rating desc
limit 10;

#question7
# Facebook weighs almost 3 times as much as the next twi most rated app, Pandora and Pinterest.
# Most other app in the ranking are games (except for the Bible)

#question8
# Best rated apps based on user rating are not part of the previous ranking. 
# 5-star rated apps tend to be second tier vs the top apps worldwide

#question9
# In other words, you can't be a "best seller" app and keep a 5 star rating as well.

#question10
select track_name, user_rating, rating_count_tot from apple
where user_rating = "5"
order by rating_count_tot desc
limit 3;

#question11
select track_name, user_rating, price, user_rating/price as Newcol from apple
where price <> 0
order by Newcol desc;
#Obviously, free apps have way more users than paid apps: subscription is an entry barrier to the app !
#On the other hand, we don't see a clear correlation (positive or negative) between app price and user rating. 
#Up to a certain monthly price (1 USD), users tend to rate their apps in the same way, irrespective of the fact is free or paid. 