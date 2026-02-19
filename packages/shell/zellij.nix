{pkgs, ...}: {
  programs.zellij = {
    enable = true;
  };

  xdg.configFile."zellij" = {
    source = ./zellij;
    recursive = true;
  };
}
