loop {
  if "ZELLIJ_OPEN" in $env {
    hx $env.ZELLIJ_OPEN
  } else {
    hx
  }

  nu -i
}
