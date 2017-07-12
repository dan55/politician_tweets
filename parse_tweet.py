import json

csv = open('hashtags.csv', 'w')

id = 0

with open('tweets.json') as f:
    for line in f:
        data = json.loads(line)
        hashtags = data['entities']['hashtags']
        tweet_id = data['id']

        if hashtags:
            for hashtag in hashtags:
                row = ','.join( [ str(id), str(tweet_id), hashtag['text'].encode('utf-8'), '\n' ] )

                csv.write(row)

                id += 1
