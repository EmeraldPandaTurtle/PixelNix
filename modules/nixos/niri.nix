{config, ...}: {
  programs.niri.enable = true;
  services.displayManager.dms-greeter = {
    enable = true;
    compositor.name = "niri";

    configHome = config.users.users.brightonlcox.home;
  };
}
