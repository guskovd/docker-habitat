FROM alpine

ARG username=guest
ARG userid=1000
ARG groupname=guest
ARG groupid=1000
ARG svnversion

RUN deluser guest
RUN delgroup users 
RUN addgroup -g $groupid -S $groupname 
RUN adduser -D -g $groupid -G wheel -u $userid -H $username

ADD hab-0.61.0-20180815171844-x86_64-linux/hab /usr/bin/
RUN apk add sudo

# nopasswd sudo:
RUN echo '%wheel  ALL=(ALL)       NOPASSWD: ALL'  >> /etc/sudoers
RUN sed -i "s/^.*requiretty/#Defaults requiretty/" /etc/sudoers

