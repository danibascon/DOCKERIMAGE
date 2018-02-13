FROM debian
MAINTAINER Daniel Bascon Arenas "bascon1991@hotmail.es"

RUN \
        apt-get update && \
        apt-get install -y nginx && \
        apt-get clean && \
        rm -rf /var/lib/apt/lists/* && \
        rm -r /etc/nginx/sites-available/default /etc/nginx/sites-enabled/default



ADD index.html /home/index.html
ADD run.sh /home/run.sh
RUN chmod +x /home/run.sh



EXPOSE 80
CMD ["/home/run.sh"]
