#!/usr/bin/bash
# author: hackwu
# 2022/7/2
# 用于配合practis_01.exp用的脚本

set -u
read -p "What is your name?" NAME
read -p "How old are you?" AGE
read -p "Which obj do you study?" OBJ
read -p "Are you happy?" FEEL
echo "$NAME" is "$AGE" years old and study "$OBJ" feell "$FEEL"!!!
