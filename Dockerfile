FROM python:latest

RUN pip3 install rainbowstream
RUN apt update && apt install screen -y

CMD screen -dmS screen_rainbow rainbowstream && sleep infinity