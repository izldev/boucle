FROM ubuntu:latest

COPY ./boucle.sh   /tmp/boucle.sh
COPY ./niouze.sh   /tmp/niouze.sh

RUN chmod a+rx  /tmp/boucle.sh
RUN chmod a+rx  /tmp/niouze.sh

CMD [ "/tmp/boucle.sh" ]

