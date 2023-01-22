#!/bin/bash

user=${1:?"Error. Debe de especificar el usuario."}
tweet=${2:?"Error. Debe de especificar el tweet."}

docker exec -it "rainbowstream_$user" screen -S screen_rainbow -p 0 -X stuff "t $tweet ^M"