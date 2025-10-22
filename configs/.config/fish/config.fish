## Set values
# Hide welcome message & ensure we are reporting fish as shell
set fish_greeting
set VIRTUAL_ENV_DISABLE_PROMPT "1"
set -xU MANPAGER "sh -c 'col -bx | bat -l man -p'"
set -xU MANROFFOPT "-c"
set -x SHELL /usr/bin/fish

## Export variable need for qt-theme
if type "qtile" >> /dev/null 2>&1
   set -x QT_QPA_PLATFORMTHEME "qt5ct"
end

# Set settings for https://github.com/franciscolourenco/done
set -U __done_min_cmd_duration 10000
set -U __done_notification_urgency_level low

## setting default applications
set editor micro
set elevate doas

## Environment setup
# Apply .profile: use this to put fish compatible .profile stuff in
if test -f ~/.fish_profile
  source ~/.fish_profile
end

## Cargo Build Path
set -p PATH ~/.cargo/bin

## User, Python Binary Path
set -p PATH ~/.local/bin

## Mirco Theme Export
export "MICRO_TRUECOLOR=1"

## Starship prompt
if status --is-interactive
   source ("/usr/bin/starship" init fish --print-full-init | psub)
end


## Useful aliases

# Replace ls with eza
alias ls 'eza -al --color=always --group-directories-first --icons' # preferred listing
alias la 'eza -a --color=always --group-directories-first --icons'  # all files and dirs
alias ll 'eza -l --color=always --group-directories-first --icons'  # long format
alias lt 'eza -aT --color=always --group-directories-first --icons' # tree listing
alias l. 'eza -ald --color=always --group-directories-first --icons .*' # show only dotfiles

# Common use
alias .. 'cd ..'
alias ... 'cd ../..'
alias .... 'cd ../../..'
alias ..... 'cd ../../../..'
alias ...... 'cd ../../../../..'
alias untar 'tar -zxvf '
alias wget 'wget -c '
alias cls 'clear'
alias fish-cfg '$editor ~/.config/fish/config.fish'
alias apk '$elevate apk'
alias alpine-update '$elevate apk update && elevate apk upgrade && flatpak update -y'
alias starship-cfg '$editor ~/.config/starship.toml'

## Run fastfetch if session is interactive
if status --is-interactive && type -q fastfetch
   fastfetch
end
