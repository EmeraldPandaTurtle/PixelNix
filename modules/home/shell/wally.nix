{pkgs, ...}: {
  home.packages = with pkgs; [
    wally-cli
  ];
}
