{...}: {
  # Chromium and Electron Support
  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  # Fix display corruption on Framework 16 Phoenix iGPU
  boot.kernelParams = [
    "amdgpu.dcdebugmask=0x1E12" # Disable PSR + Stutter + PSR-SU + Panel Replay + IPS
    "amdgpu.sg_display=0"       # Disable scatter-gather display
    "amdgpu.abmlevel=0"         # Disable Adaptive Backlight Management
    "amdgpu.runpm=1"            # Enable runtime power management for dGPU
  ];

  hardware = {
    graphics = {
      enable = true;
      enable32Bit = true;
    };
  };

  # D-Bus GPU switching service — allows apps to request the dGPU
  services.switcherooControl.enable = true;

  # Ensure dGPU suspends when idle (runtime PM)
  services.udev.extraRules = ''
    # Enable runtime PM for AMD dGPU (RX 7700S)
    ACTION=="add", SUBSYSTEM=="pci", ATTR{vendor}=="0x1002", ATTR{class}=="0x030000", ATTR{power/control}="auto"
  '';
}
