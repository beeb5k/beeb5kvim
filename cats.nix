inputs:
let
  inherit (inputs.nixcats) utils;
in
{
  pkgs,
  settings,
  categories,
  extra,
  name,
  mkPlugin,
  ...
}@packageDef:
{
  lspsAndRuntimeDeps = with pkgs; {
    general = [
      fd
      ripgrep
    ];

    markdown = [
      marksman
      harper
    ];

    go = [
      gopls
      # delve
      # gotools
      # go-tools
      # go
      golangci-lint
      # golint
    ];

    typst = [
      tinymist
    ];

    nix = [
      nixd
      nixfmt-rfc-style
    ];

    java = [
      jdt-language-server
      google-java-format
    ];

    lua = [
      lua-language-server
      stylua
    ];

    python = [
      ruff
      pyrefly
    ];

    clang = [
      # cmake
      # valgrind
      clang-tools
      cmake-format
      # cmake-language-server
    ];

    zig = [
      zls
    ];

    javascript = [
      eslint
      prettierd
      typescript-language-server
    ];
  };

  startupPlugins = with pkgs.vimPlugins; {
    theme = [
      kanagawa-nvim
      everforest
      pkgs.neovimPlugins.neopywal
    ];

    ui = [
      nvim-web-devicons
    ];

    general = [
      lze
      lzextras
    ];

    rust = [
      rustaceanvim
    ];

    extras = [
      plenary-nvim
    ];
  };

  optionalPlugins = with pkgs.vimPlugins; {
    core = {
      general = [
        oil-nvim
        vim-sleuth
        undotree
        mini-pick
        mini-extra
        mini-surround
      ];

      formatter = [
        conform-nvim
      ];

      git = [
        vim-rhubarb
        vim-fugitive
        gitsigns-nvim
      ];

      completion = {
        blink = [
          blink-cmp
          blink-pairs
        ];

        mini = [
          mini-completion
        ];
      };
    };

    tsitter = [
      nvim-treesitter
      nvim-treesitter-textobjects
      nvim-treesitter.withAllGrammars
    ];

    ui = [
      mini-indentscope
      mini-statusline
    ];

    misc = [
      obsidian-nvim
      typst-preview-nvim
    ];
  };

  sharedLibraries = {
    general = with pkgs; [
      # libgit2
    ];
  };

  environmentVariables = {
  };

  extraWrapperArgs = {
  };

  extraLuaPackages = {
    test = [ (_: [ ]) ];
  };
}
