FROM opencontrailnightly/contrail-controller-webui-web:2002.82

RUN yum install -y http://mirror.centos.org/centos/7/os/x86_64/Packages/patch-2.7.1-11.el7.x86_64.rpm
COPY kind.patch /kind.patch
RUN cd / && patch -p3 < kind.patch