# syntax=docker/dockerfile:1

#FROM registry.access.redhat.com/ubi8/ubi
#RUN yum -y install python39 libpq-devel && pip3 install label-studio
#RUN mkdir --mode a+w /.local
#CMD [ "label-studio", "start", "--data-dir=/opt/app-root/.local"]



FROM python:3.8-slim-buster
WORKDIR /app
RUN mkdir -p /.local
RUN mkdir -p /.config
RUN chgrp -R 0 /app && \
    chmod -R g=u /app

RUN chgrp -R 0 /.local && \
    chmod -R g=u /.local

RUN chgrp -R 0 /.config && \
    chmod -R g=u /.config


COPY requirements.txt requirements.txt
RUN pip3 install -r requirements.txt

COPY . .

EXPOSE 8080
CMD [ "label-studio", "-p", "8080", "--no-browser", "start"]
