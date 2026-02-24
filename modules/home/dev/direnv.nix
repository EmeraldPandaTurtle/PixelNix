{pkgs, ...}: {
  programs.direnv = {
    enable = true;
    enableNushellIntegration = true;
  };
}
