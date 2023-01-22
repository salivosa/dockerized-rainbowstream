#!/bin/bash

docker build -t rainbowstream .

# ------ configure keys ------

#twitter_user
#docker run -ti --rm -v "/home/user/twitter_user":/root/ rainbowstream rainbowstream


# ------ deploy container/s ------

docker run -d \
  --name rainbowstream_twitter_user \
  --privileged \
  --restart=unless-stopped \
  -v "/home/user/twitter_user":/root/.rainbow_oauth \
  rainbowstream

#usage example
#docker exec -it rainbowstream_twitter_user screen -S screen_rainbow -p 0 -X stuff "t いいですね ^M"