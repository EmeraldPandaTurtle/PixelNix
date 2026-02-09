{
  pkgs,
  inputs,
  ...
}: {
  home.packages = with pkgs;
    [
      ####################
      # Language Servers #
      ####################
      # Nix
      nil
      alejandra

      marksman # Markdown

      wgsl-analyzer # WGSL

      # Misc Language Servers
      vscode-langservers-extracted

      taplo # TOML

      fzf-make
    ]
    ++ [
      ##########
      # Editor #
      ##########
      inputs.helix.packages.${pkgs.system}.default
    ];
  xdg.configFile."helix" = {
    source = ./helix;
    recursive = true;
  };
}
