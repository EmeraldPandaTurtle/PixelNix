def main [operation, current_buffer] {
  print $current_buffer
  mut current_path = $current_buffer | str join;
  if $current_path == "scratch" {
    $current_path = "./"
  }

  # Open yazi at the current path, and print the selected files to stdout.
  let paths = yazi --chooser-file=/dev/stdout $current_path

  # Split the files by rows.
  let command = ($paths | each {|line| $line | split row "\n"})

  # Check if no files were selected, and exit if none are.
  if ($command | get 0 | str trim | is-empty) {
    exit 0
  }

  # Join the list of filepaths we had above to support writing the paths to helix.
  let command_str = $command | each {|p| $"\"($p)\"" }| str join " "


  match $operation { 
    "right" => { zellij run -c -d right -- hx $command_str }
    "down" => { zellij run -c -d down -- hx $command_str }
    _ => {
        # Set up the string for the actual command.
        let run = ":open " + $command_str

        zellij action toggle-floating-panes # Select Helix In The System
        zellij action write 27 # Exit To Normal Mode
        zellij action write-chars $run # Write actual Command
        zellij action write 13 # Press Enter to run the command
    }
  }
}
