{ pkgs, ... }:
{
  home.packages = with pkgs; [
    asciinema # Shell session recording
  ];
}
