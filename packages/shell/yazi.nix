{pkgs, ...}: {
  home.packages = with pkgs; [
    yazi
  ];

  programs.yazi = {
    enable = true;
    enableNushellIntegration = true;
    shellWrapperName = "y";
  };

  xdg.configFile."yazi" = {
    source = ./yazi;
    recursive = true;
  };
}
