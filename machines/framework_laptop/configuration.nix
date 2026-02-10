{pkgs, ...}: let
  rootPath = ../../.;
in {
  # Enable flakes and the `nix` command
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  nix.settings.trusted-users = [
    "root"
    "brightonlcox"
  ];

  hardware.keyboard.zsa.enable = true;

  security.polkit.enable = true;

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Set your time zone.
  time.timeZone = "America/Denver";

  # Define User Account
  users.users.brightonlcox = {
    isNormalUser = true;
    extraGroups = ["wheel"]; # Enable ‘sudo’ for the user.
    shell = pkgs.nushell;
  };

  # Enable ZSH
  programs.zsh.enable = true;

  programs.dconf.enable = true;

  programs.nix-ld.enable = true;

  # Import all files that are needed
  imports = [
    ############
    # Packages #
    ############
    # Nixos
    (rootPath + /packages/nixos/packages.nix) # Misc Required Packages for Nixos to run
    (rootPath + /packages/nixos/services.nix) # Enable required services
    (rootPath + /packages/nixos/amd.nix) # GPU
    (rootPath + /packages/nixos/tlp.nix) # Power Profiles
    (rootPath + /packages/nixos/nh.nix) # Better nix command
    (rootPath + /packages/nixos/touchid.nix) # Touch ID

    # Network
    (import (rootPath + /packages/nixos/network.nix) {
      hostName = "brighton-laptop";
    })

    # Docker
    (import (rootPath + /packages/nixos/docker.nix) {
      user = "brightonlcox";
    })

    # Applications
    # (rootPath + /packages/applications/steam.nix) # Gaming
    # (rootPath + /packages/applications/alvr.nix) # VR
    (rootPath + /packages/applications/bitwarden.nix) # Passwords

    (rootPath + /packages/wayland/niri-os.nix)
    (rootPath + /packages/nixos/udisk.nix) # Auto Mount Drives

    # Font
    (rootPath + /packages/fonts.nix)
    (rootPath + /packages/theme-os.nix)

    ./hardware-configuration.nix
  ];

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
  # to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "24.11"; # Did you read the comment?
}
