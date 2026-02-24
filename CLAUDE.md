# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Build & Deploy Commands

```bash
make rebuild-os      # Rebuild NixOS system config (runs: nh os switch)
make rebuild-home    # Rebuild Home Manager user config (runs: nh home switch)
make delete-generations  # Garbage collect old Nix generations
```

The build scripts are Nushell scripts in `scripts/` that use `nh` (a nix command wrapper). They rely on `$env.FLAKE` being set to the machine name (e.g., `"framework_laptop"`) in the Nushell environment. Desktop notifications report success/failure.

There are no tests or linters configured for this repository.

## Architecture

This is a **Nix Flakes** dotfiles system managing one NixOS machine with Home Manager. The flake produces both `nixosConfigurations` and `homeConfigurations`.

### Machine

- **`framework_laptop`** — AMD Framework 16, NixOS 24.11, Niri compositor, Catppuccin theming, TLP power management

Machine config lives in `machines/framework_laptop/` with `configuration.nix` (NixOS), `home.nix` (Home Manager), and `hardware-configuration.nix`.

### Module Organization (`modules/`)

Modules are organized by category and imported from machine configs using `rootPath`:

- **`nixos/`** — System-level: GPU drivers (`amd.nix`), services, networking, Docker, power management, Bitwarden, fonts
- **`home/apps/`** — User applications: terminals (Ghostty), browsers (Zen), Discord (Vesktop), image viewer (feh)
- **`home/dev/`** — Development tools: AI, direnv, Git, Jujutsu
- **`home/editors/`** — Editors: Helix, Neovim (NixVim), shared LSP configs
- **`home/shell/`** — Shell tools: Nushell, Starship, Yazi, Zellij, misc CLI tools
- **`home/wayland/`** — Compositor configs: Niri, DankMaterialShell

### Key Patterns

**Feature toggling** is done by commenting/uncommenting imports in machine config files.

**Complex editor configs** use subdirectories symlinked via `xdg.configFile`:
- `modules/home/editors/helix/` — Helix config (config.toml, languages.toml, themes)
- `modules/home/editors/neovim/` — NixVim with `plugins/` and `keymaps/` subdirectories
- `modules/home/shell/zellij/` — Zellij layouts

**Flake inputs** are passed to modules via `specialArgs = {inherit inputs;}` and used for packages like Zen Browser, Helix, Niri, and DankMaterialShell.

### Custom Scripts

`script-bin/` contains executable scripts added to `$PATH` via Nushell config:
- `zellij-helix` / `zellij-nvim` — Launch editors inside Zellij sessions

# When Editing
Steps:
- Edit And make changes
- Use `jj desc -m %message` to describe the changes
- Use `jj new` to commit changes
