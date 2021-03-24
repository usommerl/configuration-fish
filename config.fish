abbr -a -g g git
abbr -a -g h history
abbr -a -g vi nvim
abbr -a -g - cd -

alias l 'exa -lg --time-style=long-iso'
alias ll 'l -a'

function update_terminal_start_directory --on-event fish_preexec
  echo (pwd) > $HOME/.terminal_start_directory
end

set fish_greeting
starship init fish | source
zoxide init fish | source && \
   abbr -a -g z zi && \
   set -xg _ZO_FZF_OPTS '-1 --reverse'
