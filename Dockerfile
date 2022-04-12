FROM arm64v8/ubuntu:22.04
RUN useradd -m awsuser
RUN mkdir -p /home/awsuser/.ssh
COPY ssh-over-ssm /root/ssh-over-ssm/.
COPY ssh-over-ssm /home/awsuser/ssh-over-ssm
ENV LANG zh_TW.UTF-8
WORKDIR /home/awsuser
RUN apt-get -q update && apt-get upgrade -yqq && apt-get install -yqq curl vim unzip openssh-client tzdata && rm -rf /var/lib/apt/lists/*  && \
    ln -fs /usr/share/zoneinfo/Asia/Taipei /etc/localtime && \
    dpkg-reconfigure -f noninteractive tzdata &&  \
    curl -s -L https://awscli.amazonaws.com/awscli-exe-linux-aarch64.zip -o /opt/awscliv2.zip && cd /opt && unzip -q /opt/awscliv2.zip  && ./aws/install && \
    curl -s -L https://s3.amazonaws.com/session-manager-downloads/plugin/latest/ubuntu_arm64/session-manager-plugin.deb -o /opt/session-manager-plugin.deb && \
    dpkg -i /opt/session-manager-plugin.deb && rm -rf /opt/aws && rm -f /opt/awscliv2.zip && rm -f /opt/session-manager-plugin.deb && \
    echo "Match Host i-*\n  IdentityFile ~/.ssh/ssm-ssh-tmp \n  BatchMode yes \n  ProxyCommand ~/ssh-over-ssm/ssh-ssm.sh %h %r \n  StrictHostKeyChecking accept-new" > /home/awsuser/.ssh/config && chown awsuser:awsuser -R /home/awsuser
User awsuser
CMD ["/bin/bash"]
