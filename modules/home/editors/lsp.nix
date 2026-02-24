{pkgs, ...}: {
  home.packages = with pkgs; [
    # Nix
    nil
    alejandra

    marksman # Markdown
    wgsl-analyzer # WGSL
    vscode-langservers-extracted # HTML/CSS/JSON
    taplo # TOML
  ];
}
