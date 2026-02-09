{ pkgs, ... }:
{
  home.packages = with pkgs; [
    gh
  ];
  programs.jujutsu = {
    enable = true;
    settings = {
      revsets = {
        log = "all()";
      };
      ui = {
        editor = "nvim";
        pager = "bat --decorations never";
        default-command = "status";
      };
      user = {
        email = "brightonlcox@gmail.com";
        name = "Brighton Cox";
      };
    };
  };
}
