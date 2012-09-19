#!/bin/bash

find ./ -type f -name \*.wav -print -exec sox {} -r 8000 -c1 {}.gsm lowpass 4000 compand 0.02,0.05 -60,-60,-30,-10,-20,-8,-5,-8,-2,-8 -8 -7 0.05 \;
