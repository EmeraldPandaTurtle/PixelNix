{ config, pkgs, ... }:

{
  plugins = {
    web-devicons.enable = true;
    lualine.enable = true;
    bufferline.enable = true;
    luasnip.enable = true;
    telescope.enable = true;
    oil.enable = true;
    treesitter.enable = true;
    yazi.enable = true;
    which-key.enable = true;
    nvim-autopairs.enable = true;
    noice.enable = true;
    overseer.enable = true;
    toggleterm.enable = true;
    flash.enable = true;

    multicursors.enable = true;

    # Note Taking
    render-markdown.enable = true;

    # Kitty
    image.enable = true;

    # Zellij
    zellij-nav.enable = true;

    # LSP related
    cmp.enable = true;
    cmp-nvim-lsp.enable = true;
    cmp-cmdline.enable = true;
    lspkind.enable = true;
    lspkind.cmp.enable = true;
    cmp-buffer.enable = true;
    cmp-path.enable = true;
    cmp-treesitter.enable = true;
    jdtls.enable = true;
    lsp-format.enable = true;
    lsp.enable = true;
  };
}
