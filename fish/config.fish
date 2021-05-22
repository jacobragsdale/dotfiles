# remove the fish greeting
set fish_greeting

# set the prompt to starship
starship init fish | source

# set aliases
alias install="paru -Syy"
alias uninstall="paru -Rns"
alias update="paru -Syyuu"
alias off="sudo shutdown 0"
alias reboot="sudo reboot"
alias bt="exec /home/jacob/Development/bt/target/debug/bt"
alias yt="exec /home/jacob/Development/yt/target/debug/yt"
alias backup="bash /home/jacob/.backup/backup.sh"

#env variables
export set MICRO_TRUECOLOR=1
