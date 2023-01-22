#!/bin/bash

alias twitter_cli='/home/salivosa/scripts/docker/sali-rainbowstream/send_tweet_dockerized_rainbowstream.sh'

docker stop rainbowstream_salivosx;
docker rm rainbowstream_salivosx;

docker stop rainbowstream_saribosu;
docker rm rainbowstream_saribosu;

docker stop rainbowstream_bluetsutsu;
docker rm rainbowstream_bluetsutsu;

docker build -t rainbowstream "/home/salivosa/scripts/docker/sali-rainbowstream"

# ------ configure keys ------

#salivosx
#docker run -ti --rm -v "/media/SL HDD/DOCKER/twitter_cli/salivosx":/root/ rainbowstream rainbowstream

#saribosu
#docker run -ti --rm -v "/media/SL HDD/DOCKER/twitter_cli/saribosu":/root/ rainbowstream rainbowstream

#bluetsutsu
#docker run -ti --rm -v "/media/SL HDD/DOCKER/twitter_cli/bluetsutsu":/root/ rainbowstream rainbowstream


# ------ deploy containers ------

#salivosx

docker run -d \
  --name rainbowstream_salivosx \
  --privileged \
  --restart=unless-stopped \
  -v "/media/SL HDD/DOCKER/twitter_cli/salivosx/.rainbow_oauth":/root/.rainbow_oauth \
  rainbowstream

#saribosu

docker run -d \
  --name rainbowstream_saribosu \
  --privileged \
  --restart=unless-stopped \
  -v "/media/SL HDD/DOCKER/twitter_cli/saribosu/.rainbow_oauth":/root/.rainbow_oauth \
  rainbowstream

#bluetsutsu

docker run -d \
  --name rainbowstream_bluetsutsu \
  --privileged \
  --restart=unless-stopped \
  -v "/media/SL HDD/DOCKER/twitter_cli/bluetsutsu/.rainbow_oauth":/root/.rainbow_oauth \
  rainbowstream


#example
#docker exec -it rainbowstream_salivosx screen -S screen_rainbow -p 0 -X stuff "t $tweet ^M"