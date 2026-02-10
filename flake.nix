{
  description = "Your new nix config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # Helix editor
    helix.url = "github:helix-editor/helix";
    helix.inputs.nixpkgs.follows = "nixpkgs";

    # Neovim
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    dms = {
      url = "github:AvengeMedia/DankMaterialShell/stable";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    niri = {
      url = "github:sodiboo/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser.url = "github:0xc000022070/zen-browser-flake";
    zen-browser.inputs.nixpkgs.follows = "nixpkgs";

    # Framework 16 stuff
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    # Theme
    catppuccin.url = "github:catppuccin/nix";
  };
  outputs = {
    nixpkgs,
    home-manager,
    catppuccin,
    ...
  } @ inputs: {
    nixosConfigurations = {
      nvidia_pc = nixpkgs.lib.nixosSystem {
        pkgs = import nixpkgs {
          system = "x86_64-linux";
          config.allowUnfree = true;
        };

        specialArgs = {inherit inputs;};
        modules = [
          ./machines/nvidia_pc/configuration.nix
        ];
      };
      framework_laptop = nixpkgs.lib.nixosSystem {
        pkgs = import nixpkgs {
          system = "x86_64-linux";
          config.allowUnfree = true;
        };

        specialArgs = {inherit inputs;};
        modules = [
          catppuccin.nixosModules.catppuccin
          inputs.nixos-hardware.nixosModules.framework-16-7040-amd
          ./machines/framework_laptop/configuration.nix
        ];
      };
    };

    homeConfigurations = {
      nvidia_pc = home-manager.lib.homeManagerConfiguration {
        pkgs = import nixpkgs {
          system = "x86_64-linux";
          config.allowUnfree = true;
        };

        extraSpecialArgs = {inherit inputs;};

        modules = [
          inputs.nixvim.homeModules.nixvim
          ./machines/nvidia_pc/home.nix
        ];
      };
      framework_laptop = home-manager.lib.homeManagerConfiguration {
        pkgs = import nixpkgs {
          system = "x86_64-linux";
          config.allowUnfree = true;
        };

        extraSpecialArgs = {inherit inputs;};

        modules = [
          inputs.nixvim.homeModules.nixvim
          catppuccin.homeModules.catppuccin
          ./machines/framework_laptop/home.nix
        ];
      };
    };
  };
}
