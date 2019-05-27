FROM ubuntu:bionic

ENV container docker

# Don't start any optional services except for the few we need.
RUN find /etc/systemd/system \
    /lib/systemd/system \
    -path '*.wants/*' \
    -not -name '*journald*' \
    -not -name '*systemd-tmpfiles*' \
    -not -name '*systemd-user-sessions*' \
    -exec rm \{} \;

RUN apt-get update && \
    apt-get install -y \
    dbus systemd && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN systemctl set-default multi-user.target
RUN systemctl mask dev-hugepages.mount sys-fs-fuse-connections.mount

STOPSIGNAL SIGRTMIN+3

RUN apt-get update && apt-get install -y locales openssh-server curl gnupg2 cron aptitude python-pip sudo
RUN mkdir /var/run/sshd
RUN echo 'root:testpassword' | chpasswd
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd
ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile
RUN /usr/bin/ssh-keygen -A
RUN localedef -i en_US -f UTF-8 en_US.UTF-8
RUN mkdir /root/.ssh/
ADD authorized_keys /root/.ssh/authorized_keys

CMD ["/bin/bash", "-c", "exec /sbin/init --log-target=journal 3>&1"]
