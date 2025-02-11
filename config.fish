# {{{ Abbreviations
abbr -ag cat 'bat'
abbr -ag watch 'viddy'
abbr -ag d docker
abbr -ag du 'dust'
abbr -ag dc 'docker context'
abbr -ag dcu 'docker context use'
abbr -ag dcud 'docker context use default'
abbr -ag dcl 'docker context ls'
abbr -ag dps 'command docker ps --format "table {{.Image}}\t{{.Names}}\t{{.Status}}\t{{.Ports}}" | begin sed -u 1q; sort -k 2; end | grcat conf.dockerps'
abbr -ag c docker-compose
abbr -ag h history
abbr -ag p paru
abbr -ag ps "paru -Slq | fzf --multi --preview 'paru -Si {1}' | xargs -ro paru -S"
abbr -ag vi nvim
abbr -ag v nvim
abbr -ag n nvim
abbr -ag - cd -
abbr -ag dark 'alacritty-colorscheme -V apply tokyonight-moon.yml'
abbr -ag light 'alacritty-colorscheme -V apply pencil.yaml'
abbr -ag toggle 'alacritty-colorscheme -V toggle'
abbr -ag tree 'exa --tree'
abbr -ag fh 'nix run "https://flakehub.com/f/DeterminateSystems/fh/*.tar.gz"'


# kubernetes abbreviations
abbr -ag k 'kubectl'
abbr -ag kc 'kubectx'
abbr -ag kn 'kubens'
abbr -ag kg 'kubectl get'
abbr -ag kd 'kubectl describe'

# git abbreviations
abbr -ag g git
abbr -ag ga 'git add'
abbr -ag gai 'git add -ip'
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
abbr -ag gl 'git log --pretty=format:"%Cred%h%Creset%C(yellow)%d%Creset %s %Cgreen(%ad) %Cblue<%an>%Creset" --date=short'
abbr -ag gll 'git log --stat'
abbr -ag glg 'git log --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%ad) %Cblue<%an>%Creset" --date=short --graph'
abbr -ag gout 'git out'
abbr -ag gpl 'git pull'
abbr -ag gps 'git push'
abbr -ag gpsa 'git push --all'
abbr -ag gpsr 'git push --recurse-submodules=on-demand'
abbr -ag gr 'cd (git rev-parse --show-toplevel)'
abbr -ag grl 'git reflog --date=local'
abbr -ag gs 'git show'
abbr -ag gst 'git status --short -b'
abbr -ag gstl 'git status --long'
abbr -ag gsu 'git submodule'
abbr -ag gsuf 'git submodule foreach'
abbr -ag gsuurrr 'git submodule update --remote --rebase --recursive'
abbr -ag gsw 'git sw'
abbr -ag grs 'git remote -vv show'
abbr -ag gt 'git tag'
abbr -ag gtl 'git tag --list | sort -V'
abbr -ag gtr 'git trim'
abbr -ag gw 'git worktree'
# }}}

# {{{ Variables
set -gx MANPAGER 'nvim +Man!'
set -gx LESS '-iR'
set -gx GOPATH ~/.go
set -gx SBT_TPOLECAT_DEV

fish_add_path ~/.local/bin
fish_add_path ~/.local/share/coursier/bin
fish_add_path ~/.cargo/bin
fish_add_path ~/.go/bin
fish_add_path ~/.cache/scalacli/local-repo/bin/scala-cli
fish_add_path /opt/google-cloud-cli/bin

set -gx fzf_fd_opts --hidden --exclude=.git
set -gx FZF_DEFAULT_OPTS '--cycle --layout=reverse --border --height=90% --preview-window=wrap --marker="*" --bind ctrl-alt-k:preview-up,ctrl-alt-j:preview-down'
set -gx EXA_COLORS 'da=38;5;244:uu=38;5;244:gu=38;5;244:un=33:gn=33:ur=38;5;244:gr=38;5;244:tr=38;5;244:uw=38;5;244:gw=38;5;244:tw=38;5;244:sn=15:sb=15:ux=38;5;244:ue=38;5;244:gx=38;5;244:tx=38;5;244:ga=1;31:gm=1;31'
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

function fish_title
  pwd
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
    case aiaiai
      __bctl_connect 00:08:E0:73:07:70
    case nubert
      __bctl_connect CC:90:93:12:6D:C8
    case '*'
      echo "Unknown argument: $argv[1]"
  end
end
complete -c bctl -n "not __fish_seen_subcommand_from $commands" \
    -a "off aiaiai nubert"

function source_if_exists
  if [ -f $argv[1] ]
    source $argv[1]
  end
end
# }}}

# {{{ Initialisation
source_if_exists "/etc/grc.fish"

starship init fish | source
zoxide init fish | source && \
   abbr -a -g z zi && \
   abbr -a -g Z zi && \
   set -xg _ZO_FZF_OPTS '-1 --reverse'


if status --is-interactive
  keychain --eval --quiet -Q id_rsa | source

  set -gx ATUIN_NOBIND "true"
  atuin init fish | source
  bind \cr _atuin_search
  bind -M insert \cr _atuin_search
end

if status --is-login
  if test -z "$DISPLAY" -a $XDG_VTNR = 1
    exec startx -- -keeptty &> /dev/null
  end
end
# }}}

set -gx DIRENV_LOG_FORMAT ""
direnv hook fish | source
