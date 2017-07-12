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
                try:
                    row = ','.join( [ str(id), str(tweet_id), str(hashtag['text']) ] )
                    row += '\n'
                except UnicodeEncodeError:
                    pass
                     #row = str(id) + str(tweet_id) + hashtag['text'].encode('utf-8')

                csv.write(row)

                id += 1