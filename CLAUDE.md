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

This is a **Nix Flakes** dotfiles system managing two NixOS machines with Home Manager. The flake produces both `nixosConfigurations` and `homeConfigurations` for each machine.

### Machines

- **`framework_laptop`** — AMD Framework 16, NixOS 24.11, Niri compositor, Catppuccin theming, TLP power management
- **`nvidia_pc`** — Desktop with NVIDIA GPU, NixOS 24.05, Hyprland (referenced), Steam/gaming

Machine configs live in `machines/{machine_name}/` with `configuration.nix` (NixOS), `home.nix` (Home Manager), and `hardware-configuration.nix`.

### Module Organization (`packages/`)

Modules are organized by category and imported from machine configs using `rootPath`:

- **`nixos/`** — System-level: GPU drivers (`nvidia.nix`, `amd.nix`), services, networking, Docker, power management
- **`applications/`** — User apps: terminals (Ghostty, Alacritty), browsers (Zen), Discord (Vesktop), gaming
- **`shell/`** — Shell tools: Nushell, Helix, Neovim (NixVim), Starship, Zellij, Git, Jujutsu, Yazi
- **`wayland/`** — Compositor configs: Niri, DankMaterialShell
- **`services/`** — User services (MPRIS)
- **`theme.nix` / `theme-os.nix`** — Catppuccin theming for home-manager and NixOS respectively

### Key Patterns

**Parameterized modules** use currying for machine-specific values:
```nix
(import (rootPath + /packages/nixos/docker.nix) { user = "brightonlcox"; })
(import (rootPath + /packages/nixos/network.nix) { hostName = "framework_laptop"; })
```

**Feature toggling** is done by commenting/uncommenting imports in machine config files.

**Complex editor configs** use subdirectories symlinked via `xdg.configFile`:
- `packages/shell/helix/` — Helix config (config.toml, languages.toml, themes)
- `packages/shell/neovim/` — NixVim with `plugins/` and `keymaps/` subdirectories
- `packages/shell/zellij/` — Zellij layouts

**Flake inputs** are passed to modules via `specialArgs = {inherit inputs;}` and used for packages like Zen Browser, Helix, Niri, and DankMaterialShell.

### Custom Scripts

`script-bin/` contains executable scripts added to `$PATH` via Nushell config:
- `zellij-helix` / `zellij-nvim` — Launch editors inside Zellij sessions

# When Editing
Steps:
- Edit And make changes
- Use `jj desc -m %message` to describe the changes
- Use `jj new` to commit changes
