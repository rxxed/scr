#!/bin/sh

cd ~/work/scr
script=$(fzf --reverse --height=50%)
[ -z $script ] && exit

$EDITOR $script
