{ envVars, ... }:
{
  pkgs,
  inputs,
  ...
}:
{
  home.packages = with pkgs; [
    hypridle # Checks for idling machine
    hyprlock # Makes machine lockable

    # Screenshots
    grim
    slurp

    # Brightness
    brightnessctl

    wl-clipboard
  ];

  xdg.configFile."hypr/scripts" = {
    source = ./hyprland/scripts;
    recursive = true;
  };

  services.hypridle = {
    enable = true;
    settings = {
      listener = [
        {
          timeout = 900;
          on-timeout = "hyprlock";
        }
        {
          timeout = 1200;
          on-timeout = "hyprctl dispatch dpms off";
          on-resume = "hyprctl dispatch dpms on";
        }
      ];
    };
  };

  programs.hyprlock = {
    enable = true;
    extraConfig = ''
      ${builtins.readFile ./hyprland/hyprlock.conf}
    '';
  };

  wayland.windowManager.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    plugins = [ ];

    extraConfig = ''
      ${builtins.readFile ./hyprland/hyprland.conf}
    '';

    settings = {
      env = [
        "MOZ_ENABLE_WAYLAND,1"
        "AQ_DRM_DEVICES,/dev/dri/card2:/dev/dri/card1"
        "XCURSOR_SIZE,20"
      ]
      ++ envVars;

      # Layer rules for QuickShell blur
      layerrule = [
        "blur, quickshell"
        "ignorealpha 0.05, quickshell" # Only blur parts with >5% opacity
      ];

      animations = {
        enabled = 1;
        animation = [
          "borderangle,0"
        ];
      };

      monitor = [
        "eDP-2,prefered,2560x0,1.25"
        "DP-4,prefered,0x0,1.5"
        # Layout remaining monitors automatically
        ",prefered,auto,1.5"
      ];

      xwayland = {
        enabled = true;
        force_zero_scaling = true;
      };

      general = {
        gaps_in = 5;
        gaps_out = 20;

        border_size = 2;

        "col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
        "col.inactive_border" = "rgba(595959aa)";

        layout = "master";
      };

      decoration = {
        rounding = 10;

        blur = {
          enabled = true;
          size = 3;
          passes = 2;
          new_optimizations = true;
          xray = false; # This makes opaque parts NOT blur
          ignore_opacity = false;
        };

        shadow.enabled = false;
      };

      "group:groupbar" = {
        "col.active" = "rgba(55ccffee) rgba(22ff99ee) 45deg";
        "col.inactive" = "rgba(595959aa)";
      };

      dwindle = {
        pseudotile = true;
      };

      master = {
        new_status = "slave";
        mfact = 0.5;
        allow_small_split = true;
        new_on_active = "after";
      };

      input = {
        follow_mouse = 1;
        sensitivity = -0.2;
        natural_scroll = true;

        touchpad = {
          disable_while_typing = true;
          natural_scroll = true;
          scroll_factor = 0.3;
          clickfinger_behavior = true;
        };
      };

      misc = {
        disable_splash_rendering = true;
        disable_hyprland_logo = true;

        mouse_move_enables_dpms = true;
        key_press_enables_dpms = true;

        vfr = true;
      };

      render = {
        direct_scanout = true;
      };

      cursor = {
        no_hardware_cursors = true;
      };

      workspace = [
        "r[1-5], persistent:1, monitor:DP-3"
        "6, persistent:1, monitor:eDP-2"
        "8, persistent:1, monitor:eDP-2"
      ];

      "$mod" = "SUPER";
      exec-once = [
        # Run lock on system startup
        "hyprlock"

        #
        "hyprctl setcursor Bibata-Modern-Classic 20"
        "quickshell"

        # Start Up Applications that are used everywhere.
        "[workspace 1 silent] zen-beta" # Web-Browser

        "[workspace 4 silent] discord" # Messaging

        "[workspace 3 silent] kitty" # Terminal

        "[workspace 2 silent] steam -silent" # Gaming

        "[workspace 5 silent] bitwarden" # Password Manager

        "[workspace special silent] kitty" # Floating Terminal
      ];

      bindm = [
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
      ];

      windowrulev2 = [
        "suppressevent maximize, class:.*"
        "nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0"

        "workspace 4 silent, class:^(discord)$"
      ];
    };
  };
}
