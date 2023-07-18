#!/bin/bash

# set profile 
echo -ne "\033]1337;SetProfile=$1\a"

# ssh login
/usr/bin/ssh -A "$@" 

# set profile(default)
echo -ne "\033]1337;SetProfile=Default\a"

