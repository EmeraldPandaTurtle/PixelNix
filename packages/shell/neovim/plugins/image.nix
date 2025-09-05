{ ... }:
{
  plugins.image = {
    settings = {
      backend = "kitty";
      max_height = 12;
      max_height_window_percentage = {
        __raw = "math.huge";
      };
      max_width = 100;
      max_width_window_percentage = {
        __raw = "math.huge";
      };
      window_overlap_clear_enabled = true;
      window_overlap_clear_ft_ignore = [
        "cmp_menu"
        "cmp_docs"
        ""
      ];
    };
  };
}
