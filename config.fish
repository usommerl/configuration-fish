# {{{ Abbreviations
abbr -a -g d docker
abbr -a -g g git
abbr -a -g h history
abbr -a -g vi nvim
abbr -a -g v nvim
abbr -a -g - cd -
# }}}

# {{{ Variables
fish_add_path ~/.local/bin
fish_add_path ~/.local/share/coursier/bin
fish_add_path ~/.cargo/bin

set -gx MANPAGER 'nvim -c "set ft=man" -'
set -gx LESS '-iR'

set -gx fzf_fd_opts --hidden --exclude=.git
set -gx EXA_COLORS 'da=38;5;244:uu=38;5;244:gu=38;5;244:un=1;33:gn=1;33:ur=15:gr=15:tr=15:uw=33:gw=33:tw=33:sn=15:sb=15:ux=32'
# }}}

# {{{ Functions
alias l 'exa -lg --time-style=long-iso --git'
alias ll 'l -a'

function update_terminal_start_directory --on-event fish_preexec
  echo (pwd) > $HOME/.terminal_start_directory
end

function fish_greeting
  # Workaround for nasty ⏎ symbol before prompt after terminal startup
  clear
end

function cat
  if command -v bat >/dev/null 2>&1
    bat $argv
  else
    command cat $argv
  end
end

function __bctl_connect
  bluetoothctl -- power off
  bluetoothctl -- power on
  bluetoothctl -- connect $argv[1]
end

function bctl
  switch $argv[1]
    case off
      bluetoothctl -- power off
    case btc22
      __bctl_connect 70:B3:D5:94:A3:32
    case aiaiai
      __bctl_connect 00:08:E0:73:07:70
    case nubert
      __bctl_connect CC:90:93:12:6D:C8
    case '*'
      echo "Unknown argument: $argv[1]"
  end
end

function source_if_exists
  if [ -f $argv[1] ]
    source $argv[1]
  end
end
# }}}

# {{{ Initialisation
source_if_exists "$HOME/.bashhub/bashhub.fish"
source_if_exists "/etc/grc.fish"

starship init fish | source
zoxide init fish | source && \
   abbr -a -g z zi && \
   set -xg _ZO_FZF_OPTS '-1 --reverse'
# }}}
