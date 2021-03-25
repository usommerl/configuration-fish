# {{{ Abbreviations
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

set -gx FZF_DEFAULT_OPTS '--height 60% --multi --reverse --bind ctrl-f:page-down,ctrl-b:page-up'
set -gx FZF_ALT_C_OPTS "--preview 'tree -C {} | head -100'"

if command -v fd >/dev/null
  set -gx FZF_DEFAULT_COMMAND 'fd -H -I --type f --color=never'
  set -gx FZF_CTRL_T_COMMAND "$FZF_DEFAULT_COMMAND"
  set -gx FZF_ALT_C_COMMAND 'fd -H -I --exclude ".git" --exclude "target" --exclude ".bloop" --exclude ".metals" --type d . --color=never'
end

if command -v bat >/dev/null
  set -gx FZF_CTRL_T_OPTS "--preview 'bat --color=always --line-range :500 {}'"
end
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
# }}}

# {{{ Initialisation
starship init fish | source
zoxide init fish | source && \
   abbr -a -g z zi && \
   set -xg _ZO_FZF_OPTS '-1 --reverse'
# }}}
