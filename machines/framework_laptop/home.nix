{...}: let
  rootPath = ../../.;
in {
  news.display = "silent";

  # Define Normal Home Modules
  home = {
    username = "brightonlcox";
    homeDirectory = "/home/brightonlcox";
    stateVersion = "24.11";
  };

  imports = [
    (rootPath + /packages/services/mpris.nix)
    (rootPath + /packages/theme.nix)

    ############
    # Packages #
    ############
    # Applications
    (rootPath + /packages/applications/discord.nix) # Chatting
    # (rootPath + /packages/applications/alacritty.nix) # Terminal
    (rootPath + /packages/applications/ghostty.nix) # Terminal
    # (rootPath + /packages/applications/kitty.nix) # Terminal
    # (rootPath + /packages/applications/prismlauncher.nix) # Minecraft
    (rootPath + /packages/applications/feh.nix) # Image Viewer
    # (rootPath + /packages/applications/pavu.nix) # Audio Control
    (rootPath + /packages/applications/zen.nix) # Browser
    # (rootPath + /packages/applications/olympus.nix) # Celeste Mods
    # (rootPath + /packages/applications/obsidian.nix) # Note Taking
    # (rootPath + /packages/applications/bittorrent.nix) # Torrent
    # (rootPath + /packages/applications/postman.nix) # HTTP Testing

    # Shell
    (import (rootPath + /packages/shell/nushell.nix) {
      flake = "framework_laptop";
    })

    (rootPath + /packages/shell/wally.nix) # ZSA Keyboard

    (rootPath + /packages/shell/direnv.nix) # Auto setup when entering directory

    (rootPath + /packages/shell/git.nix) # VCS
    (rootPath + /packages/shell/jujutsu.nix) # Improved Git UX

    (rootPath + /packages/shell/neovim/init.nix) # Editor
    (rootPath + /packages/shell/helix.nix) # Editor
    (rootPath + /packages/shell/starship.nix) # Prompt
    (rootPath + /packages/shell/yazi.nix) # File Explorer
    (rootPath + /packages/shell/zellij.nix) # Multiplexer
    (rootPath + /packages/shell/misc.nix)
    (rootPath + /packages/shell/ai.nix)

    # Windowing
    (rootPath + /packages/wayland/niri.nix)
    (rootPath + /packages/wayland/dms.nix)
  ];
}
