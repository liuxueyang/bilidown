#!/usr/bin/env bash

TargetDir="$HOME/Videos/bilibili/"

Start=0
End=0

showHelp() {
    echo "Usage: $0 [options] URL"
    _OPTION_="Options: -s Start | "
    _OPTION_+="-e End | "
    _OPTION_+="-t TargetDir"
    echo $_OPTION_
    exit 1
}

while getopts ':s:e:t:' opt; do
    case $opt in
        s)
            Start=$OPTARG
            ;;
        e)
            End=$OPTARG
            ;;
        t)
            TargetDir=$OPTARG
            ;;
        \?)
           echo "Invalid option -$OPTARG" >&2
           showHelp
           ;;
    esac
done

shift $(($OPTIND - 1))

if [ $# -lt 1 ]; then
    showHelp
fi

URL="$1"

for x in $(seq $Start $End); do
    if [ $x -eq 1 ] || [ $x -eq 6 ]; then
        continue
    fi

    URL1="${URL}?p=$x"
    echo $URL1
    echo $TargetDir
    python3 ~/fun/bilidown/bilidown.py -o $TargetDir $URL1
done
