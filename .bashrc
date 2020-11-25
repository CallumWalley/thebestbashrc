# Source global definitions
if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi

export TZ="NZ"

if [ -n "${PROMPT_PREFIX+1}" ]; then
        PROMPT_PREFIX=" ${PROMPT_PREFIX}"
        WD_STACK="$WD_STACK|$PWD"
else
        PROMPT_PREFIX=""
fi
export PROMPT_PREFIX

function exitstatus() {
        EXITSTATUS="$?"
        echo -ne "\033]0;${HOSTNAME}\007"
        BOLD="\[\033[1m\]"
        RED="\[\033[1;31m\]"
        GREEN="\[\e[32;1m\]"
        BLUE="\[\e[34;1m\]"
        OFF="\[\033[m\]"
        LINE="\n" #\e]2;\$(pwd)\a\e]1;\$(pwd)\a$GREEN\$(s=\$(printf "%*s" \$COLUMNS); echo \${s// /―})\n\e[0m"
        PROMPT="${PROMPT_PREFIX}${BOLD}[\h \W"
        if [ $EXITSTATUS -eq 0 ]
        then
                PS1="${LINE}${PROMPT}${GREEN} SUCCESS${OFF}${BOLD} ]\$${OFF} "
        else
                PS1="${PROMPT}${RED} FAILURE${OFF}${BOLD} ]\$${OFF} "
        fi
        PS2="${BOLD}>${OFF} "
        }

PROMPT_COMMAND=exitstatus
