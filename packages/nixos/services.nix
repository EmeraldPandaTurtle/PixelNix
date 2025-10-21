{ pkgs, ... }:
{
  # Document Printing.
  services.printing.enable = true;

  # Realtime scheduling priority for processes.
  security.rtkit.enable = true;

  # Sound
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  services.libinput.enable = true;

  # Bluetooth
  services.blueman.enable = true;

  # SSH
  services.openssh.enable = true;

  # Power
  services.upower.enable = true;
}
