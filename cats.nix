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
  lspsAndRuntimeDeps = {
    general = with pkgs; [
      fd
      ripgrep
    ];

    rust = with pkgs; [
      rust-analyzer
      clippy
      rustfmt
    ];

    markdown = with pkgs; [
      marksman
      harper
    ];

    go = with pkgs; [
      gopls
      delve
      gotools
      go-tools
      go
      golangci-lint
      golint
    ];

    nix = with pkgs; [
      nixd
      nixfmt-rfc-style
    ];

    java = with pkgs; [
      jdt-language-server
      google-java-format
    ];

    lua = with pkgs; [
      lua-language-server
      stylua
    ];

    python = with pkgs; [
      ruff
      pyrefly
    ];

    clang = with pkgs; [
      cmake
      valgrind
      clang-tools
      cmake-format
      cmake-language-server
    ];

    javascript = with pkgs; [
      eslint
      prettierd
      typescript-language-server
    ];
  };

  startupPlugins = with pkgs.vimPlugins; {
    theme = [
      kanagawa-nvim
      pkgs.neovimPlugins.vague
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
