{
  pkgs,
  lib,
  ...
}: {
  programs.starship.enable = true;

  programs.starship.settings = {
    format = lib.concatStrings [
      "$username"
      "$hostname"
      "$directory"
      "$line_break"
      "$character"
    ];

    right_format = lib.concatStrings [
      "$git_branch "
      "$git_state "
      "$git_status "
      "$nix_shell "
      "$cmd_duration "
      "$time"
    ];

    directory = {
      style = "blue";
    };

    character = {
      success_symbol = "[❯](purple)";
      error_symbol = "[❯](red)";
      vimcmd_symbol = "[❮](green)";
    };

    git_branch = {
      format = "[$branch]($style)";
      style = "bright-black";
    };

    git_status = {
      format = "[[(*$conflicted$untracked$modified$staged$renamed$deleted)](218) ($ahead_behind$stashed)]($style)";
      style = "cyan";
      conflicted = "​";
      untracked = "​";
      modified = "​";
      staged = "​";
      renamed = "​";
      deleted = "​";
      stashed = "≡";
    };

    git_state = {
      format = "\([$state( $progress_current/$progress_total)]($style)\)";
      style = "bright-black";
    };

    cmd_duration = {
      format = "[$duration]($style)";
      style = "yellow";
    };

    time = {
      disabled = false;
      time_format = "%R";
      style = "green";
      format = "[   $time]($style)";
    };

    nix_shell = {
      style = "bold italic dimmed blue";
      symbol = "*";
      format = "[$symbol nix|$state|]($style) [$name](italic dimmed white)";
      impure_msg = "[  ](bold dimmed red)";
      pure_msg = "[  ](bold dimmed green)";
    };
  };
}
