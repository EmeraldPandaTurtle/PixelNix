{ lib, ... }:
{
  programs.kitty = lib.mkForce {
    enable = true;
    settings = {
      confirm_os_window_close = 0;
      dynamic_background_opacity = true;
      enable_audio_bell = true;

      hide_window_decorations = true;
      allow_remote_control = true;

      background_opacity = "0.9";
      background_blur = 5;
    };

    themeFile = "Catppuccin-Mocha";
    font = {
      name = "Hack Nerd Font Mono";
      size = 14;
    };
  };
}
