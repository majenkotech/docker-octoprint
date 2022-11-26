FROM python:3.10

ENV PATH=/home/octoprint/.local/bin:/bin:/usr/bin:/sbin:/usr/sbin:/usr/local/bin:/usr/local/sbin

RUN useradd -m octoprint

RUN su -c "pip install octoprint" octoprint

COPY drun /usr/sbin/drun

EXPOSE 8080

CMD /usr/sbin/drun
