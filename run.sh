#!/usr/bin/env sh
# -*- coding: utf-8 -*-

docker run -ti -w $PWD -v $HOME:$HOME -v /hab:/hab -v /etc/group:/etc/group:ro -v /etc/passwd:/etc/passwd:ro -u $( id -u $USER ):$( id -g $USER ) docker-habitat:local "$@"
