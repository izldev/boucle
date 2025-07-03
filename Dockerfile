FROM ubuntu:latest

COPY ./boucle.sh   /tmp/boucle.sh
COPY ./niouze.sh   /tmp/niouze.sh
COPY ./entree.sh   /tmp/entree.sh

RUN chmod a+rx  /tmp/boucle.sh
RUN chmod a+rx  /tmp/niouze.sh
RUN chmod a+rx  /tmp/entree.sh

CMD ["bash" , "/tmp/entree.sh"]

