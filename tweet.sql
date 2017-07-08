CREATE  EXTERNAL TABLE tweets
(
    value STRING 
)
LOCATION  '/user/w205/political_tweets/tweets';

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
