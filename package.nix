inputs:
let
  inherit (inputs.nixCats) utils;
  baseSettings =
    { pkgs, name, ... }@misc:
    {
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
  baseCats =
    { pkgs, ... }@misc:
    {
      theme = true;
      rust = true;
      nix = true;
      general = true;
      lua = true;
      javascript = false;
      go = false;
      java = false;
      typst = false;
      misc = false;
      zig = false;
      clang = false;
      python = false;
      markdown = true;
      core = {
        formatter = true;
        git = true;
        general = true;
        completion.blink = true; # enable only one
        completion.mini = false;
        picker.mini = false;
        picker.telescope = true;
      };
      ui = true;
      tsitter = true;
    };
  baseExtra =
    { pkgs, ... }@misc:
    {
      colorscheme = "everforest";
      nixdExtras = {
        nixpkgs = ''import ${pkgs.path} {}'';
      };
    };
in
{
  Neovim = args: {
    settings = baseSettings args;
    categories = baseCats args;
    extra = baseExtra args;
  };
  mvim = args: {
    settings = baseSettings args // {
      suffix-path = false;
      suffix-LD = false;
    };
    categories = baseCats args // {
      tsitter = false;
      core = {
        formatter = false;
        git = true;
        general = true;
        completion.blink = false; # enable only one
        completion.mini = true;
        picker.mini = true;
        picker.telescope = false;
      };
    };
    extra = baseExtra args;
  };
}
