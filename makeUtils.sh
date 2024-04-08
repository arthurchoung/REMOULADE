#!/bin/bash

set -x
gcc -o remoulade-imap remoulade-imap.c

gcc -o remoulade-list `pkg-config --cflags --libs gmime-3.0` remoulade-list.c 
gcc -o remoulade-extractPart `pkg-config --cflags --libs gmime-3.0` remoulade-extractPart.c 
gcc -o remoulade-printMessage `pkg-config --cflags --libs gmime-3.0` remoulade-printMessage.c 
gcc -o remoulade-printHeaders `pkg-config --cflags --libs gmime-3.0` remoulade-printHeaders.c 
gcc -o remoulade-printContentType `pkg-config --cflags --libs gmime-3.0` remoulade-printContentType.c 

