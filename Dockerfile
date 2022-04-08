FROM arm64v8/ubuntu:22.04
RUN apt-get update && apt-get upgrade && apt-get install -y curl vim unzip
RUN curl https://awscli.amazonaws.com/awscli-exe-linux-aarch64.zip -o /opt/awscliv2.zip && cd /opt && unzip /opt/awscliv2.zip  && ./aws/install
RUN curl https://s3.amazonaws.com/session-manager-downloads/plugin/latest/ubuntu_arm64/session-manager-plugin.deb -o /opt/session-manager-plugin.deb
RUN dpkg -i /opt/session-manager-plugin.deb
CMD ["/bin/bash"]
