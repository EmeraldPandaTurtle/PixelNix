{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    libnotify
    pulseaudio
    bluez
  ];
}
