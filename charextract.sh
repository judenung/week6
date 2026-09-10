#!/bin/bash

cntlc(){
    local cnt=0 patt="" type=""
    declare -a chartype=("vowels" "consonants" "numbers")

    case $2 in
        v) patt="[AEIOUaeiou]"; type="${chartype[0]}";;
        c) patt="[B-DF-HJ-NP-TV-Zb-df-hj-np-tv-z]"; type="${chartype[1]}";;
        n) patt="[0-9]"; type="${chartype[2]}";;
    esac
    
    cnt=${#1}
    echo -n "The string $1 contains the following $type - "
    for ((i=$cnt;i>0;i--))
        do
            ch=$(echo $1 | cut -c $i)
            if [[ $ch =~ $patt ]]; then
                echo -n "$ch "
            fi
        done
        echo -e "\n"
}

if ! [[ $# -eq 1 ]]; then
    echo "Invalid or missing argument. Require -v, -c or -n" && exit 1
else
    read -p "Please provide word to process: " wrd
    while getopts 'vcn' opt
        do
            case $opt in
                v) cntlc $wrd $opt
                ;;
                c) cntlc $wrd $opt
                ;;
                n) cntlc $wrd $opt
                ;; 
                *) echo "Invalid flag. Exiting..." && exit 1
                ;;
            esac
        done
fi

exit 0