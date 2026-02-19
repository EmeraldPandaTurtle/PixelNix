{ pkgs, ... }:
{
  home.packages = with pkgs; [
    typescript-language-server # Typescript
    imagemagick
  ];

  xdg.configFile."nvim/scripts" = {
    source = ./scripts;
    recursive = true;
  };

  programs.nixvim = {
    enable = true;
    globals.mapleader = " ";

    # Import modules
    imports = [
      ./options.nix
      ./keymaps/init.nix
      ./plugins/init.nix
      ./plugins/cmp.nix
      ./plugins/lsp.nix
      ./plugins/treesitter.nix
      ./plugins/ui.nix
      ./plugins/markdown.nix
      ./plugins/image.nix
    ];
  };
}
