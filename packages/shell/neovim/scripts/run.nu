def main [filepath?, session?] {
  let session = match $session {
    # Create a crazy, random set of characters for the session name
    null => (random chars --length 10)

    # Just use what was put for the session name.
    _ => $session
  }

  if $filepath == null {
    $env.ZELLIJ_OPEN = $filepath
  }

  $env.ZELLIJ_SESSION = $session

  zellij -n nvim -s $session
}
