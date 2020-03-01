FROM alpine:latest

ENV AUTH_CODE=""

VOLUME /source /dest /complete

RUN apk add --no-cache \
    unzip \
    wget \
    ffmpeg \
    bc \
    bash \
    grep
RUN wget https://github.com/KrumpetPirate/AAXtoMP3/archive/master.zip && \
  unzip master.zip -d /

CMD /AAXtoMP3-master/AAXtoMP3 --complete_dir /complete --target_dir /dest --authcode $AUTH_CODE  /source/*.aax
