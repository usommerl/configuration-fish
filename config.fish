abbr -a -g vi nvim
abbr -a -g h history

function update_terminal_start_directory --on-event fish_preexec
  echo (pwd) > $HOME/.terminal_start_directory
end

set fish_greeting
starship init fish | source
