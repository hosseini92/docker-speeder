FROM alpine:3.19

### prepare everything
RUN apk update
RUN apk add vim lsof tar

WORKDIR /opt/speederv2
ENV PATH="/opt/speederv2:${PATH}"
ENV SPEEDERV2_VERSION=20230206.0


### UDPspeeder 
RUN wget -O speederv2_linux.tar.gz https://github.com/wangyu-/UDPspeeder/releases/download/${SPEEDERV2_VERSION}/speederv2_binaries.tar.gz 
RUN tar xzvf speederv2_linux.tar.gz
RUN rm speederv2_linux.tar.gz


### copy pre-setting to workspace
COPY script script

### next need to excute in host
# enable ip_forward
# RUN sed -i 's/net.ipv4.ip_forward = 0/net.ipv4.ip_forward = 1/' /etc/sysctl.conf

### keep this code for set sysctl.conf for bbr kernel
# RUN echo 'net.core.default_qdisc = fq' >> /etc/sysctl.conf
# RUN echo 'net.ipv4.tcp_congestion_control = bbr' >> /etc/sysctl.conf
# active setting
# RUN sysctl -p

# find options here https://github.com/wangyu-/UDPspeeder#full-options

ENTRYPOINT [ "./script/start.sh" ]
CMD ["speederv2_amd64", "-s", "-l","0.0.0.0:4096", "-f","20:10", "-k", "passwd"]]
