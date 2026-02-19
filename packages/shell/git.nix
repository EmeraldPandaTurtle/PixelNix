{pkgs, ...}: {
  programs.git = {
    enable = true;
    settings = {
      user.name = "brightonlcox";
      user.email = "brightonlcox@gmail.com";
    };
  };
}
