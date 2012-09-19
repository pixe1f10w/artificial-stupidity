#!/bin/bash

find ./ -type f -name \*.wav -print -exec ffmpeg -i {} -acodec pcm_s16le -ar 8000 -ac 1 -y done/{} \;
