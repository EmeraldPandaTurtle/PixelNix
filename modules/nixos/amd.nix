{...}: {
  # Chromium and Electron Support
  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  # Fix display corruption on Framework 16 Phoenix iGPU
  boot.kernelParams = [
    "amdgpu.dcdebugmask=0x1E12" # Disable PSR + Stutter + PSR-SU + Panel Replay + IPS
    "amdgpu.sg_display=0"       # Disable scatter-gather display
    "amdgpu.abmlevel=0"         # Disable Adaptive Backlight Management
  ];

  hardware = {
    graphics = {
      enable = true;
      enable32Bit = true;
    };
  };

}
