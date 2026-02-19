{hostName, ...}: {...}: {
  networking.hostName = hostName;
  networking.networkmanager.enable = true;

  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;
}
