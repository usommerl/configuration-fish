# {{{ Abbreviations
abbr -ag d docker
abbr -ag g git
abbr -ag h history
abbr -ag vi nvim
abbr -ag v nvim
abbr -ag - cd -
abbr -ag dark 'alacritty-colorscheme -V apply material.yaml'
abbr -ag light 'alacritty-colorscheme -V apply pencil.yaml'
abbr -ag toggle 'alacritty-colorscheme -V toggle'

abbr -ag ga 'git add'
abbr -ag gau 'git add -u'
abbr -ag gb 'git branch'
abbr -ag gbc 'git rev-parse --abbrev-ref HEAD'
abbr -ag gbll 'git branch --list'
abbr -ag gblr 'git branch -r --list'
abbr -ag gbla 'git branch -a --list'
abbr -ag gblu 'git remote update origin --prune'
abbr -ag gc 'git commit -v'
abbr -ag gca 'git commit -v --amend'
abbr -ag gcan 'git commit -v --amend --no-edit'
abbr -ag gcc 'git clean -f -d'
abbr -ag gco 'git checkout'
abbr -ag gcp 'git cherry-pick'
abbr -ag gd 'git diff'
abbr -ag gds 'git diff --staged'
abbr -ag gf 'git flow'
abbr -ag gfi 'git flow init --defaults'
abbr -ag gfb 'git flow bugfix'
abbr -ag gfbl 'git flow bugfix list -v'
abbr -ag gfbs 'git flow bugfix start'
abbr -ag gfbf 'git flow bugfix finish'
abbr -ag gfbp 'git flow bugfix publish'
abbr -ag gfd 'git fd'
abbr -ag gff 'git flow feature'
abbr -ag gffl 'git flow feature list -v'
abbr -ag gffs 'git flow feature start'
abbr -ag gfff 'git flow feature finish'
abbr -ag gffp 'git flow feature publish'
abbr -ag gfr 'git flow release'
abbr -ag gfrl 'git flow release list -v'
abbr -ag gfrs 'git flow release start'
abbr -ag gfrf 'git flow release finish --keepremote'
abbr -ag gfrp 'git flow release publish'
abbr -ag gin 'git in'
abbr -ag gll 'git log --stat'
abbr -ag gl 'git log --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%ad) %Cblue<%an>%Creset" --date=short --graph'
abbr -ag gout 'git out'
abbr -ag gpl 'git pull'
abbr -ag gps 'git push'
abbr -ag gpsa 'git push --all'
abbr -ag gpsr 'git push --recurse-submodules=on-demand'
abbr -ag grl 'git reflog --date=local'
abbr -ag gs 'git show'
abbr -ag gst 'git status --short -b'
abbr -ag gstl 'git status --long'
abbr -ag gsu 'git submodule'
abbr -ag gsuf 'git submodule foreach'
abbr -ag gsuurrr 'git submodule update --remote --rebase --recursive'
abbr -ag gsw 'git sw'
abbr -ag gt 'git tag'
abbr -ag gtl 'git tag --list'
# }}}

# {{{ Variables
fish_add_path ~/.local/bin
fish_add_path ~/.local/share/coursier/bin
fish_add_path ~/.cargo/bin

set -gx MANPAGER 'nvim -c "set ft=man" -'
set -gx LESS '-iR'

set -gx fzf_fd_opts --hidden --exclude=.git
set -gx EXA_COLORS 'da=38;5;244:uu=38;5;244:gu=38;5;244:un=33:gn=33:ur=15:gr=15:tr=15:uw=33:gw=33:tw=33:sn=15:sb=15:ux=33:ue=33:gx=33:tx=33:ga=31:gm=31'
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
