{ pkgs, inputs, ... }:
{
  home.packages = [
    inputs.quickshell.packages.${pkgs.system}.default
  ];

  xdg.configFile."quickshell" = {
    source = ./quickshell;
    recursive = true;
  };
}
