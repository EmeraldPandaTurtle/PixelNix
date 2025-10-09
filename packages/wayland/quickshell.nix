{ pkgs, inputs, ... }:
{
  home.packages = with pkgs; [
    inputs.quickshell.packages.${pkgs.system}.default

    upower
  ];

  xdg.configFile."quickshell" = {
    source = ./quickshell;
    recursive = true;
  };
}
