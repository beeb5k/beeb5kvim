inputs: let
  inherit (inputs.nixCats) utils;
  baseSettings = {
    pkgs,
    name,
    ...
  } @ misc: {
    suffix-path = true;
    suffix-LD = true;
    hosts.node.enable = false;
    hosts.ruby.enable = false;
    hosts.perl.enable = false;
    hosts.python3.enable = false;
    wrapRc = true;
    useBinaryWrapper = true;
    aliases = [
      "vim"
      "vi"
      "nvim"
    ];
    # neovim-unwrapped = inputs.neovim-nightly-overlay.packages.${pkgs.system}.neovim;
  };
  baseCats = {pkgs, ...} @ misc: {
    ai = true;
    theme = true;
    rust = true;
    toml = true;
    nix = true;
    general = true;
    lua = true;
    javascript = false;
    fennel = true;
    go = false;
    java = false;
    typst = false;
    misc = false;
    zig = false;
    clang = false;
    debug = false;
    python = false;
    markdown = true;
    core = {
      formatter = true;
      git = true;
      general = true;
      completion = true;
      picker.mini = false;
      picker.telescope = true;
    };
    ui = true;
    tsitter = true;
  };
  baseExtra = {pkgs, ...} @ misc: {
    colorscheme = "kanagawa-paper";
    pluginChoice = "fancy"; # fancy | fast | normal
    nixdExtras = {
      nixpkgs = ''import ${pkgs.path} {}'';
    };
  };
in {
  Neovim = args: {
    settings = baseSettings args;
    categories = baseCats args;
    extra = baseExtra args;
  };
  mvim = args: {
    settings =
      baseSettings args
      // {
        suffix-path = false;
        suffix-LD = false;
      };
    categories =
      baseCats args
      // {
        ai = false;
        tsitter = false;
        core = {
          formatter = false;
          git = true;
          general = true;
          picker.mini = true;
          picker.telescope = false;
        };
      };
    extra = baseExtra args;
  };
}
