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
      rust-analyzer
      cargo
      rustc
      clippy
      rustfmt
      # bash-language-server
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
      nil
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

    web = with pkgs; [
      eslint
      prettierd
      typescript-language-server
    ];
  };

  startupPlugins = {
    gitPlugins = with pkgs.neovimPlugins; [
    ];
    general = with pkgs.vimPlugins; [
      lze
      lzextras
      snacks-nvim
      promise-async # required by ufo
      tokyonight-nvim
      kanagawa-nvim
      catppuccin-nvim
    ];
  };

  optionalPlugins = {
    gitPlugins = with pkgs.neovimPlugins; [
    ];
    general = with pkgs.vimPlugins; {
      blink = [
        luasnip
        friendly-snippets
        blink-cmp
        colorful-menu-nvim
      ];
      core = [
        oil-nvim
        nvim-ufo
        undotree
        nvim-lint
        vim-sleuth
        conform-nvim
        grapple-nvim
        nvim-treesitter-textobjects
        nvim-treesitter.withAllGrammars
      ];
      # java = [
      #   nvim-jdtls
      # ];
      git = [
        neogit
        gitsigns-nvim
      ];
      ui = [
        mini-icons
        lualine-nvim
        hlchunk-nvim
        eyeliner-nvim
        # tiny-inline-diagnostic-nvim
      ];
    };
    extras = with pkgs.vimPlugins; {
      core = [
        tabout-nvim
        nvim-surround
        ultimate-autopair-nvim
      ];
    };
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
