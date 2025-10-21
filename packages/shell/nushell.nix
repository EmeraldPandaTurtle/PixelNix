{ flake, ... }:
{ pkgs, ... }:
{
  home.packages = with pkgs; [
    nushell # Main Shell
    carapace # Autocompletions
    fzf # Fuzzy Finder
    zoxide # `cd` replacement

    ################
    # REPLACEMENTS #
    ################
    eza # `ls`
    see-cat # `cat`
    bat # another `cat`
    ripgrep # `grep`

    ##########
    # EXTRAS #
    ##########
    gnumake # Makefiles

    htop # Task Watcher
    powertop # Power Watcher
    nvtopPackages.amd # GPU Watcher

    reflex # Directory Watcher

    wget # Different `curl`
    jq # Json Parser
    glow # Markdown Viewer

    tree-sitter

    zip
    unzip

    neofetch
  ];

  home.sessionPath = [
    "~/dotfiles/script-bin"
  ];

  programs.nushell = {
    enable = true;
    extraConfig = ''
      $env.PATH = ($env.PATH | split row esep | prepend /run/wrappers/bin | prepend ~/dotfiles/script-bin | prepend ~/.kerbin/bin/)

      $env.FLAKE = "${flake}"
      $env.NH_FLAKE = "${flake}"

      let carapace_completer = {|spans|
        carapace $spans.0 nushell $spans | from json
      }
      $env.config = {
        show_banner: false,
      }

      $env.SSH_AUTH_SOCK = "/home/brightonlcox/.bitwarden-ssh-agent.sock"

      alias core-bw = bw
      def --env --wrapped bw [...args] {
        if not ("BW_SESSION" in $env) {
          $env.BW_SESSION = (core-bw unlock --raw)
        }
        core-bw ...$args
      }

      try {
        $env.GEMINI_API_KEY = open ~/.gemini-key
      } catch {
        $env.GEMINI_API_KEY = (bw get password gemini-key --raw)
        $env.GEMINI_API_KEY | save ~/.gemini-key
      }
      try {
        $env.GROQ_API_KEY = open ~/.groq-key
      } catch {
        $env.GROQ_API_KEY = (bw get password groq-key --raw)
        $env.GROQ_API_KEY | save ~/.groq-key
      }
      try {
        $env.RPG_BOT_KEY = open ~/.rpg-bot
      } catch {
        $env.RPG_BOT_KEY = (bw get password rpg-bot --raw)
        $env.RPG_BOT_KEY | save ~/.rpg-bot
      }

      def --env d [...args] {
        let inputs = yazi --chooser-file=/dev/stdout | each {|line| $line} | split row "\n"

        mut dir = if (($inputs | length) == 0) {
          print $"(ansi gb)No Folder Selected. Using `pwd`.(ansi reset)"
          pwd
        } else {
          $inputs | get 0
        }

        while (($dir | path type) != dir) {
          $dir = $dir | path dirname
          print $"(ansi rb)Going back directory because picked item is file and not directory(ansi reset)" $"(ansi blue_bold)New Directory: ($dir)"
        }

        cd $dir
      }

      if not ("WAYLAND_DISPLAY" in $env) and not ($env.XDG_VTNR == 1) {
        dbus-run-session Hyprland
      }

      $env.EDITOR = "zellij-nvim"

      def jm [branch, ...args] {
        jj bookmark move $branch --to @ ...$args
      }

      def jr [branch, ...args] {
        jj git fetch
        jj rebase -d $branch ...$args
      }
    '';
    shellAliases = {
      core-ls = "ls";
      ls = "eza -l --icons";
      ll = "eza -Alg --icons";
      lf = "eza -lgTL2 --icons";
      lg = "eza -lgTL4 --git-ignore --icons";

      core-hx = "hx";
      hx = "zellij-helix";

      core-nvim = "nvim";
      nvim = "zellij-nvim";

      e = "startup";

      # Rust
      bc = "bacon clippy";

      # OS Stuff
      cd = "z";
      ci = "zi";
    };
  };

  programs.carapace = {
    enable = true;
    enableNushellIntegration = true;
  };

  programs.zoxide = {
    enable = true;
    enableNushellIntegration = true;
  };
}
