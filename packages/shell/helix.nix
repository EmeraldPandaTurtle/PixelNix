{
  pkgs,
  inputs,
  ...
}: {
  home.packages = [
    inputs.helix.packages.${pkgs.stdenv.hostPlatform.system}.default
    pkgs.fzf-make
  ];
  xdg.configFile."helix" = {
    source = ./helix;
    recursive = true;
  };
}
