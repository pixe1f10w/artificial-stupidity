#!/bin/bash

find ./ -type f -print -exec ffmpeg -i {} -f alaw -ar 8000 -ac 1 -ab 64 -y done/{} \;
