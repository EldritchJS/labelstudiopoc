# syntax=docker/dockerfile:1

FROM registry.access.redhat.com/ubi8/ubi
RUN yum -y install python39 libpq-devel && pip3 install label-studio

CMD [ "label-studio", "start"]
