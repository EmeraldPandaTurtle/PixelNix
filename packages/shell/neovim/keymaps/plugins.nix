[
  {
    key = "s";
    action.__raw = ''
      function() require('flash').jump() end
    '';
    mode = [
      "n"
      "x"
      "o"
    ];
    options.desc = "Flash";
  }
  {
    key = "S";
    action.__raw = ''function() require("flash").treesitter() end'';
    mode = [
      "n"
      "x"
      "o"
    ];
    options.desc = "Flash Treesitter";
  }
  {
    mode = "n";
    key = "<leader>ff";
    action = "<cmd>Telescope find_files<cr>";
    options.desc = "Telescope Find Files";
  }
  {
    mode = "n";
    key = "<leader>fb";
    action = "<cmd>Telescope buffers<cr>";
    options.desc = "Telescope Buffers";
  }
  {
    mode = "n";
    key = "<leader>ft";
    action = "<cmd>Yazi<cr>";
    options.desc = "Open Yazi File Manager";
  }
  {
    mode = "n";
    key = "<leader>/";
    action = "<cmd>Telescope live_grep<cr>";
    options.desc = "Search Project";
  }
  {
    mode = "n";
    key = "gn";
    action = "<cmd>BufferLineCycleNext<cr>";
    options.desc = "Next Buffer";
  }
  {
    mode = "n";
    key = "gp";
    action = "<cmd>BufferLineCyclePrev<cr>";
    options.desc = "Previous Buffer";
  }
  {
    mode = [
      "n"
      "o"
      "x"
    ];
    key = "C";
    action = "<cmd>MCstart<cr>";
    options.desc = "Begin using multicursors";
  }
  {
    mode = [
      "n"
    ];
    key = ";t";
    action = "<cmd>OverseerRun<cr>";
  }
  {
    mode = [
      "n"
    ];
    key = ";T";
    action = "<cmd>OverseerToggle<cr>";
  }
]
