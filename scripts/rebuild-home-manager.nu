try {
  nh home switch ~/dotfiles#homeConfigurations.($env.FLAKE).activationPackage
} catch {
  notify-send -u critical -e "Failed to Rebuild Home-Manager Configuration!"
  exit 1
}

notify-send -u low -e "Home-Manager Configuration Rebuilt Ok!"
