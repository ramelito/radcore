#!/bin/bash

portno=$(echo $1 | tr '\/' '\n' | tail -4 | head -1 | tr -d [:punct:])

test "$2" == "X$2" && echo $portno || echo $portno$2
