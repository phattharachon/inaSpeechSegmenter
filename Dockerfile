# Build command bellow:
# docker build --build-arg username=$USER --build-arg uid=`id -u $USER` .

FROM tensorflow/tensorflow:2.3.0-gpu-jupyter

RUN apt-get update
RUN apt-get install -y ffmpeg

RUN pip install inaspeechsegmenter

# $USER
ARG username
# id -u $USER
ARG uid

RUN useradd --uid $uid -U -m  -s /bin/bash $username
USER $username
ENV HOME /home/$username
