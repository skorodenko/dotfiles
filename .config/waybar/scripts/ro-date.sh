#!/usr/bin/env bash

declare -A rmonths

rmonths["01"]="I"
rmonths["02"]="II"
rmonths["03"]="III"
rmonths["04"]="IV"
rmonths["05"]="V"
rmonths["06"]="VI"
rmonths["07"]="VII"
rmonths["08"]="VIII"
rmonths["09"]="IX"
rmonths["10"]="X"
rmonths["11"]="XI"
rmonths["12"]="XII"

read day mon year hr min <<< $(date +"%d %m %Y %H %M")

# Echo content
echo "${day} ${rmonths[$mon]} | ${hr}:${min}"
# Echo tooltip
echo ""
# Echo style-classname
echo "roclock"
