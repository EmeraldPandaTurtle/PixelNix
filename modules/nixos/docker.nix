{...}: {
  virtualisation.docker = {
    enable = true;
    enableOnBoot = true;
  };
  users.users.brightonlcox.extraGroups = ["docker"];
}
