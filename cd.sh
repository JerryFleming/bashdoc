#!/bin/bash

# 改进 Bash 中的 cd 命令。
# 另请参见 dirs，popd 和 pushd 命令。
# 作者 Jerry Fleming <jerryfleming2006@gmail.com>，2009 年 8 月

cd()
{
    if [[ $1 =~ ^([+-])([0-9]*)$ ]]
    then
        CDR=$( expr $CDR ${BASH_REMATCH[1]} ${BASH_REMATCH[2]:-1} )
        [[ $CDR -lt 1 ]] && CDR=1
        [[ $CDR -gt ${#CDP[@]} ]] && CDR=${#CDP[@]}
        I=$(($CDR-1))
        builtin cd ${CDP[$I]}
    elif [[ $1 =~ ^[+][+]([0-9]*)$ ]]
    then
        CDR=${BASH_REMATCH[1]:-1}
        [[ $CDR -lt 1 ]] && CDR=1
        [[ $CDR -gt ${#CDP[@]} ]] && CDR=${#CDP[@]}
        I=$(($CDR-1))
        builtin cd ${CDP[$I]}
    elif [[ $1 == -i ]]
    then
        unset CDP
        CDP[0]=$PWD
        CDR=1
    elif [[ $1 == -l ]]
    then
        I=0
        for item in ${CDP[@]}
        do
            I=$(($I+1))
            echo -n [$I]
            if [[ $I -eq $CDR ]]
            then
                echo -n '*'
            else
                echo -n ' '
            fi
            echo -n ' '
            echo $item
        done
    else
        builtin cd $@
        CDP[$CDR]=$PWD
        CDR=$(($CDR + 1))
    fi
}
