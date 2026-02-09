export def init-makefile [] {}

def main [] {
  try { fzf-make }
  print "Press <Any> To Continue!"
  input -n 1 -s
}
