#!/bin/bash

[ -e "$1" ] && nvim "$1" && exit

file=$(fzf)
[ -z $file ] && exit

nvim $file
