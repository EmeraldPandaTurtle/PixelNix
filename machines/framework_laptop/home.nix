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

  # Inlined from packages/services/mpris.nix
  services.mpris-proxy.enable = true;

  # Inlined from packages/theme.nix
  catppuccin.enable = true;

  imports = [
    # Apps
    (rootPath + /modules/home/apps/discord.nix)
    (rootPath + /modules/home/apps/ghostty.nix)
    (rootPath + /modules/home/apps/feh.nix)
    (rootPath + /modules/home/apps/zen.nix)

    # Dev
    (rootPath + /modules/home/dev/ai.nix)
    (rootPath + /modules/home/dev/direnv.nix)
    (rootPath + /modules/home/dev/git.nix)
    (rootPath + /modules/home/dev/jujutsu.nix)

    # Editors
    (rootPath + /modules/home/editors/helix.nix)
    (rootPath + /modules/home/editors/lsp.nix)

    # Shell
    (rootPath + /modules/home/shell/nushell.nix)
    (rootPath + /modules/home/shell/wally.nix)
    (rootPath + /modules/home/shell/starship.nix)
    (rootPath + /modules/home/shell/yazi.nix)
    (rootPath + /modules/home/shell/zellij.nix)
    (rootPath + /modules/home/shell/misc.nix)

    # Wayland
    (rootPath + /modules/home/wayland/niri.nix)
    (rootPath + /modules/home/wayland/dms.nix)
  ];
}
