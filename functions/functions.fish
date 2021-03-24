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
