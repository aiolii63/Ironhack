1. What are the different genres?
Games
Productivity
Reference
Games
Finance
Music
Utilities
Games
Games
Games
Travel
Social Networking
Games
Reference
Games
Business
Music
Utilities
Weather
Games
Photo & Video
Music
Navigation
Music
Navigation
Travel
Entertainment
Games
Sports
Games
Weather
Business
Education
Lifestyle
Lifestyle
Food & Drink
Entertainment
Education
Games
Games
Music
Games
Photo & Video
Games
Social Networking
Social Networking
Photo & Video
Entertainment
Entertainment
Utilities
Games
Education
Reference
News
Sports
Utilities
Entertainment
Games
Business
Travel
Finance
Entertainment
Games
Games
Games
Music
Social Networking
Weather
Shopping
Games
Games
Games
Games
News
Travel
Games
News
Games
Productivity
Health & Fitness
Utilities
Medical
Photo & Video
Entertainment
Games
Weather
Entertainment
Sports
Productivity
Entertainment
Games
Sports
Navigation
Finance
Health & Fitness
Shopping
Entertainment
Games
Lifestyle
News
Lifestyle
Business
News
News
Entertainment
Entertainment
Reference
Games
Games
News
Music
Games
Games
Games
Sports
Games
Games
Business
Shopping
Entertainment
Photo & Video
Entertainment
Shopping
Shopping
Health & Fitness
Travel
Productivity
News
Photo & Video
Music
Business
Health & Fitness
Games
Entertainment
Games
Travel
Lifestyle
Travel
Games
Navigation
Games
Travel
Games
Education
Finance
Games
Entertainment
Games
Travel
Health & Fitness
Games
Health & Fitness
Business
Entertainment
Photo & Video
News
Lifestyle
Games
Social Networking
Book
Games
Social Networking
Games
Finance
Productivity
Health & Fitness
Health & Fitness
News
Games
Education
Lifestyle
Games
Games
Games
Photo & Video
Games
Games
Games
Music
Travel
Education
Education
Photo & Video
Travel
Entertainment
Music
Entertainment
Sports
Games
Productivity
Games
Education
Finance
Games
Entertainment
Games
Games
Productivity
Navigation
Photo & Video
Weather
Education
Games
Entertainment
Music
Utilities
Productivity
Photo & Video
Games
Games
Social Networking
Entertainment
Games
Games
Entertainment
Reference
Utilities
Reference
Education
Games
Reference
Photo & Video
Entertainment
Navigation
Photo & Video
Games
Book
Travel
Games
Entertainment
News
Travel
Utilities
Travel
Productivity
Book
Weather
Business
Health & Fitness
Games
Social Networking
Sports
Finance
Productivity
Utilities
Education
Games
Social Networking
Health & Fitness
Games
Photo & Video
Games
Photo & Video
Games
Games
Navigation
Photo & Video
Entertainment
Entertainment
Utilities
Utilities
Music
Lifestyle
Shopping
Productivity
Games
Shopping
Entertainment
Games
Photo & Video
Business
Social Networking
Games
Games
News
Lifestyle
Games
Games
Utilities
Games
Education
Games
Games
News
Games
Shopping
Games
Games
Utilities
Education
Games
Music
Games
Utilities
Games
Travel
Productivity
News
Travel
Business
Utilities
Games
Games
Utilities
Photo & Video
Travel
Food & Drink
Finance
Utilities
Finance
Travel
Games
Education
Photo & Video
Navigation
Games
Entertainment
Health & Fitness
Weather
Games
Education
Games
Productivity
Games
Games
Lifestyle
Games
Sports
Music
Entertainment
News
Games
Entertainment
Entertainment
Games
Photo & Video
Games
Sports
Social Networking
Entertainment
Entertainment
Games
Reference
Games
Music
Social Networking
Photo & Video
Finance
Games
Travel
Utilities
Education
Education
Productivity
Education
Travel
Education
Photo & Video
Photo & Video
Games
Education
Food & Drink
Games
Photo & Video
Shopping
Photo & Video
Business
Games
Weather
Book
Business
Lifestyle
Games
Social Networking
Entertainment
Finance
Social Networking
Games
Travel
Reference
Games
Music
Entertainment
Health & Fitness
Games
Games
News
Entertainment
Social Networking
Food & Drink
Utilities
Games
Games
Games
Social Networking
Games
Games
Games
Entertainment
Games
Education
Games
Music
Weather
Business
News
Health & Fitness
Games
Games
News
Shopping
Games
Education
Education
Games
Finance
Games
Shopping
Photo & Video
Games
Games
Social Networking
Music
Games
Sports
Games
Games
Games
Utilities
Games
Education
Finance
Sports
Games
Weather
Reference
Music
Health & Fitness
Music
Games
Sports
Games
Health & Fitness
Games
Games
Games
Games
Business
Games
Games
Games
Games
Games
Food & Drink
Games
Education
Education
Games
Photo & Video
Productivity
Games
Utilities
Games
Games
Entertainment
Entertainment
Entertainment
Games
Weather
Weather
Business
Games
Health & Fitness
Games
Photo & Video
Productivity
Shopping
Photo & Video
Photo & Video
Games
Entertainment
Games
Games
Lifestyle
Games
Games
Games
Games
Games
Photo & Video
Health & Fitness
Games
Photo & Video
Games
Travel
Productivity
Games
Games
Games
Games
Photo & Video
Photo & Video
Games
Games
Games
Education
Health & Fitness



2. Which is the genre with the most apps rated?
Games (507 apps)



3. Which is the genre with most apps?
Games	167


4. Which is the one with least?
Medical (1 app)



5. Find the top 10 apps most rated.
Facebook	2974680
Pandora - Music & Radio	1126880
Pinterest	1061620
Bible	985920
Angry Birds	824451
Fruit Ninja Classic	698516
Solitaire	679055
PAC-MAN	508808
Calorie Counter & Diet Tracker by MyFitnessPal	507706
Google Earth	446185



6. Find the top 10 apps best rated by users.
Sudoku +	5
Domino's Pizza USA	5
Kurumaki Calendar -month scroll calendar-	5
Daily Audio Bible App	5
:) Sudoku +	5
The Photographer's Ephemeris	5
Learn English quickly with MosaLingua	5
Plants vs. Zombies HD	5
Learn to Speak Spanish Fast With MosaLingua	5
J&J Official 7 Minute Workout	5



7. Take a look at the data you retrieved in question 5. Give some insights.
# Facebook weighs almost 3 times as much as the next twi most rated app, Pandora and Pinterest.
# Most other app in the ranking are games (except for the Bible)



8. Take a look at the data you retrieved in question 6. Give some insights.
# Best rated apps based on user rating are not part of the previous ranking. 
# 5-star rated apps tend to be second tier vs the top apps worldwide


9. Now compare the data from questions 5 and 6. What do you see?
# In other words, you can't be a top worldwide app and keep a 5 star rating as well.


10. How could you take the top 3 regarding both user ratings and number of votes?
select track_name, user_rating, rating_count_tot from apple
where user_rating = "5"
order by rating_count_tot desc
limit 3;


11. Do people care about the price of an app? Do some queries, comment why are you doing them and the results you retrieve. What is your conclusion?
#Obviously, free apps have way more users than paid apps: subscription is an entry barrier to the app !
#On the other hand, we don't see a clear correlation (positive or negative) between app price and user rating. 
#Up to a certain monthly price (1 USD), users tend to rate their apps in the same way, irrespective of the fact is free or paid.



Deliverables
You need to submit a .sql file that includes the queries used to answer the questions above, as well as an .md file including your answers.
