# syntax=docker/dockerfile:1

FROM registry.access.redhat.com/ubi8/ubi
WORKDIR /app
RUN mkdir -p /.local
RUN mkdir -p /.config
RUN chgrp -R 0 /app && \
    chmod -R g=u /app
RUN chgrp -R 0 /.local && \
    chmod -R g=u /.local
RUN chgrp -R 0 /.config && \
    chmod -R g=u /.config
RUN yum -y install python39 libpq-devel && pip3 install label-studio
EXPOSE 8080
CMD label-studio start
