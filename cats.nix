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
      cargo
      rustc
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

  startupPlugins = {
    theme = with pkgs.vimPlugins; [
      tokyonight-nvim
      kanagawa-nvim
      catppuccin-nvim
    ];

    general = with pkgs.vimPlugins; [
      lze
      lzextras
      snacks-nvim
      promise-async # required by ufo
    ];
  };

  optionalPlugins = with pkgs.vimPlugins; {
    java = [
      nvim-jdtls
    ];

    blink = [
      # luasnip
      # friendly-snippets
      blink-cmp
      colorful-menu-nvim
    ];

    git = [
      neogit
      gitsigns-nvim
    ];

    ui = [
      lualine-nvim
      hlchunk-nvim
      eyeliner-nvim
      nvim-web-devicons
    ];

    general = [
      oil-nvim
      vim-sleuth
      undotree
      nvim-treesitter-textobjects
      nvim-treesitter.withAllGrammars
    ];

    extras = [
      nvim-ufo
      nvim-lint
      conform-nvim
      grapple-nvim
      tabout-nvim
      nvim-surround
      ultimate-autopair-nvim
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

  python3.libraries = {
    test = (_: [ ]);
  };

  extraLuaPackages = {
    test = [ (_: [ ]) ];
  };
}
