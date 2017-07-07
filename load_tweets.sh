# create a staging directory
mkdir -p political_tweets
cd political_tweets

# download and unzip source data
wget https://files.pushshift.io/twitter/US_PoliticalTweets.tar.gz
tar -xzf US_PoliticalTweets.tar.gz

# create hdfs directories
hdfs dfs -mkdir /user/w205/political_tweets
hdfs dfs -mkdir /user/w205/political_tweets/tweets
hdfs dfs -mkdir /user/w205/political_tweets/users

# copy source data to hdfs
hdfs dfs -put users.json /user/w205/political_tweets/users
hdfs dfs -put tweets.json /user/w205/political_tweets/tweets