{
  config,
  pkgs,
  ...
}:
{
  plugins = {
    jdtls = {
      settings = {
        cmd = [ "jdtls" ];
        root_dir = {
          __raw = "  vim.fs.dirname(vim.fs.find({'gradlew', '.git', 'mvnw'}, { upward = true })[1])\n";
        };
        init_options.settings.java.imports.gradle = {
          enabled = true;
          wrapper = {
            enabled = true;
            checksums = [
              {
                sha256 = "81a82aaea5abcc8ff68b3dfcb58b3c3c429378efd98e7433460610fecd7ae45f";
                allowed = true;
              }
            ];
          };
        };
      };
    };

    lsp = {
      inlayHints = true;
      servers = {
        nushell.enable = true;
        markdown_oxide.enable = true;
        gopls.enable = true;
        rust_analyzer = {
          enable = true;
          installRustc = false;
          installCargo = false;
        };
        html.enable = true;
        cssls.enable = true;
        tailwindcss.enable = true;
        nil_ls.enable = true; # Nix
        ts_ls.enable = true; # Typescript
        qmlls.enable = true;
      };
      keymaps = {
        silent = true;
        lspBuf = {
          gd = {
            action = "definition";
            desc = "Goto Definition";
          };
          gr = {
            action = "references";
            desc = "Goto References";
          };
          gD = {
            action = "declaration";
            desc = "Goto Declaration";
          };
          gI = {
            action = "implementation";
            desc = "Goto Implementation";
          };
          gT = {
            action = "type_definition";
            desc = "Type Definition";
          };
          "<leader>k" = {
            action = "hover";
            desc = "Hover";
          };
          "<leader>cw" = {
            action = "workspace_symbol";
            desc = "Workspace Symbol";
          };
          "<leader>cr" = {
            action = "rename";
            desc = "Rename";
          };
        };
        diagnostic = {
          "<leader>d" = {
            action = "open_float";
            desc = "Line Diagnostics";
          };
          "[d" = {
            action = "goto_next";
            desc = "Next Diagnostic";
          };
          "]d" = {
            action = "goto_prev";
            desc = "Previous Diagnostic";
          };
        };
      };
    };
  };
}
