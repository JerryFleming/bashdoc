CL="\[\e[0m\]"
GREEN="$CL\[\e[0;32m\]"
BGREEN="$CL\[\e[0;32;1m\]"
XORG="$CL\[\e[0;36m\]"
XRED="$CL\[\e[0;35m\]"
BRED="$CL\[\e[0;35;1m\]"
ORG="$CL\[\e[0;33m\]"
DARK_GRAY="$CL\[\e[1;30m\]"
CYAN="$CL\[\e[1;36m\]"
BLUE="$CL\[\e[1;34m\]"

# 为了显示方便，下面一行用命令替换进行赋值。实际使用时应该用单引号。
PROMPT_COMMAND=$(
    echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD}\007"
    NTTY=$(tty | cut -d"/" -f3-4)
    LS=$(ls | wc -l)
    LSA=$(ls -a | wc -l)

    L1a="$BLUE[$BGREEN\u$GREEN@\h:$NTTY\s$BLUE]$BLUE"
    L1b="$ORG\t$BLUE"
    L1c="$BLUE<$BRED\w$BLUE>$BLUE"
    L1d="($XRED$LS/$LSA$BLUE)$BLUE"
    L2="$CYAN\\\$$CL"
    export PS1="$L1a-$L1b-$L1c-$L1d-\n$L2 "
    #export PS1="[\u@\h:$NTTY\s]-\t-<\w:$LS/$LSA>-\n\\$ "
    history -a
)
# 实际使用时，上面一行也应该改成单引号
