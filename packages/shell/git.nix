{pkgs, ...}: {
  home.packages = with pkgs; [
    git
  ];
  programs.git = {
    enable = true;
    settings = {
      user.name = "brightonlcox";
      user.email = "brightonlcox@gmail.com";
    };
  };
}
