{ pkgs, ... }:
{
  home.packages = with pkgs; [
    ghostty
  ];

  xdg.configFile."ghostty" = {
    source = ./ghostty;
    recursive = true;
  };

}
