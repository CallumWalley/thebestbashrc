# .bash_profile

if [ -f ~/.bashrc ]; then
        . ~/.bashrc
fi


HISTSIZE=10000

# Show weather on first login.
[[ "$(date +%a)" == "$(last $USER|sed -n 2p|awk '{print$4}')" ]]||curl wttr.in

# Helpful tips for productivity
alias synergize="curl -sL http://cbsg.sf.net|grep -Eo '^<li>(.*)</li>'|sed "s/\<li\>//g"|sed "s/\<\/li\>//g"|shuf -n1"
alias cat="wget -qO - http://placekitten.com/$[500 + RANDOM % 500]|display"
