#!/bin/sh

xmodmap ~/.Xmodmap 
xmodmap -e "clear lock"

xmodmap -e 'keycode 64 = Alt_R'
