{ pkgs, ... }:
{
  fonts.packages = with pkgs; [
    font-awesome
    nerd-fonts.fira-code
    nerd-fonts.hack
    nerd-fonts.departure-mono
    nerd-fonts.gohufont
    fira-sans
  ];

  # Cursors
  environment.systemPackages = with pkgs; [
    bibata-cursors
  ];
}
