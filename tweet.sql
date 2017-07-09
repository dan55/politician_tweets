CREATE EXTERNAL TABLE tweets
(
    value STRING 
)
LOCATION  '/user/w205/political_tweets/tweets';


CREATE EXTERNAL TABLE users
(
    value STRING
)
LOCATION '/user/w205/political_tweets/users';


CREATE TABLE tweet AS
SELECT 
    id,
    user_id,
    screen_name,
    text,
    created_at
FROM tweets t LATERAL VIEW JSON_TUPLE(t.value, 
    'id',
    'user_id',
    'screen_name',
    'text',
    'created_at'
) fields AS id, user_id, screen_name, text, created_at;


CREATE TABLE user AS
SELECT
    id,
    name,
    screen_name,
    location,
    followers_count,
    friends_count,
    statuses_count,
    created_at
FROM users u LATERAL VIEW JSON_TUPLE(u.value,
    'id',
    'name',
    'screen_name',
    'location',
    'followers_count',
    'friends_count',
    'statuses_count',
    'created_at'
) fields AS     
    id,
    name,
    screen_name,
    location,
    followers_count,
    friends_count,
    statuses_count,
    created_at;





# following the approach recommended here: https://stackoverflow.com/a/13368942/6781104

# Playing around: 
#
# SELECT created_at, screen_name 
# FROM tweets t LATERAL VIEW 
# JSON_TUPLE(t.value, 'created_at', 'screen_name') blah AS created_at, screen_name 
# LIMIT 1;

# Verifying number of users:
#
# SELECT COUNT(DISTINCT screen_name) 
# FROM tweets t LATERAL VIEW 
# JSON_TUPLE(t.value, 'screen_name') j AS screen_name;
#
# result: 545

# Finding most frequent tweeters
#
# SELECT screen_name, COUNT(screen_name) as cnt
# FROM tweets t LATERAL VIEW
# JSON_TUPLE(t.value, 'screen_name') j AS screen_name
# GROUP BY screen_name
# ORDER BY cnt DESC
# LIMIT 20;
