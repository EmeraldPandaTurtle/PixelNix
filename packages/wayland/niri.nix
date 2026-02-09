{ inputs, ... }:
{
  imports = [
    inputs.niri.homeModules.niri
  ];

  programs.niri.settings = {
    outputs."eDP-1" = { };
    outputs."DP-4" = {
      scale = 1.5;
    };

    prefer-no-csd = true;

    layout = {
      gaps = 16;

      shadow.enable = true;

      empty-workspace-above-first = true;
    };

    input = {
      warp-mouse-to-focus.enable = true;
      focus-follows-mouse.enable = true;
    };

    binds = {
      # IPC
      "Mod+Space".action.spawn-sh = "dms ipc call spotlight toggle";
      "Mod+Comma".action.spawn-sh = "dms ipc call settings toggle";
      "Mod+Period".action.spawn-sh = "dms ipc call clipboard toggle";
      "Mod+Shift+S".action.spawn-sh = "dms ipc call powermenu toggle";

      # Navigation
      "Mod+H".action.focus-column-left = [ ];
      "Mod+L".action.focus-column-right = [ ];
      "Mod+J".action.focus-window-or-workspace-down = [ ];
      "Mod+K".action.focus-window-or-workspace-up = [ ];

      # Movement
      "Mod+Shift+H".action.consume-or-expel-window-left = [ ];
      "Mod+Shift+L".action.consume-or-expel-window-right = [ ];
      "Mod+Shift+J".action.move-window-down-or-to-workspace-down = [ ];
      "Mod+Shift+K".action.move-window-up-or-to-workspace-up = [ ];

      # Special Keys
      "XF86AudioRaiseVolume".action.spawn-sh = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.1+";
      "XF86AudioLowerVolume".action.spawn-sh = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.1-";
      "XF86AudioMute".action.spawn-sh = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";

      "XF86MonBrightnessUp".action.spawn-sh = "brightnessctl set 10%+";
      "XF86MonBrightnessDown".action.spawn-sh = "brightnessctl set 10%-";

      # Windowing
      "Mod+Q".action.close-window = [ ];

      # Window Size
      "Mod+R".action.switch-preset-column-width = [ ];
      "Mod+F".action.maximize-column = [ ];
      "Mod+Shift+F".action.fullscreen-window = [ ];
      "Mod+C".action.center-column = [ ];

      # Applications
      "Mod+T".action.spawn = [ "ghostty" ];
      "Mod+E".action.spawn = [ "zen" ];

      # Overview
      "Mod+O".action.toggle-overview = [ ];
    };
  };
}
