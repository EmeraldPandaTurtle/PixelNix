let connected = (hyprctl monitors -j | from json | get name)

# Kill Pretty Background Thing
nu ~/dotfiles/script-bin/sr kill

swww kill

if ($connected | any { |m| $m == "DP-4" }) {
  hyprctl dispatch moveworkspacetomonitor 6 eDP-2
  hyprctl dispatch moveworkspacetomonitor 8 eDP-2

  for i in 5..0 {
    hyprctl dispatch moveworkspacetomonitor $i DP-4
  }
} else {
  hyprctl dispatch moveworkspacetomonitor 6 eDP-2
  hyprctl dispatch moveworkspacetomonitor 8 eDP-2

  for i in 5..0 {
    hyprctl dispatch moveworkspacetomonitor $i eDP-2
  }
}

hyprctl dispatch exec swww-daemon

nu ~/dotfiles/script-bin/sr start 5min
