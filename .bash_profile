# .bash_profile

if [ -f ~/.bashrc ]; then
        . ~/.bashrc
fi


HISTSIZE=10000

# Show weather on first login.
[[ "$(date +%a)" == "$(last $USER|sed -n 2p|awk '{print$4}')" ]]||curl wttr.in

