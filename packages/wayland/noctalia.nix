{ pkgs, inputs, ... }:
{
  home.packages = [
    inputs.noctalia.packages.${pkgs.system}.default
  ];
}
