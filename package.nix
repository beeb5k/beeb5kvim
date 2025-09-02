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
      clang = false;
      python = false;
      markdown = false;
      core = {
        formatter = true;
        git = true;
        general = true;
        completion.blink = true; # enable only one
        completion.mini = false;
      };
      ui = true;
      tsitter = true;
    };
  baseExtra =
    { pkgs, ... }@misc:
    {
      colorscheme = "kanagawa";
      nixdExtras = {
        nixpkgs = ''import ${pkgs.path} {}'';
      };
    };
in
{
  Neovim = args: {
    settings = baseSettings args // {
      aliases = [
        "vim"
        "vi"
        "nvim"
      ];
      # neovim-unwrapped = inputs.neovim-nightly-overlay.packages.${pkgs.system}.neovim;
    };
    categories = baseCats args;
    extra = baseExtra args;
  };
  mvim = args: {
    settings = baseSettings args // {
      suffix-path = false;
      suffix-LD = false;
      aliases = [ ];
    };
    categories = baseCats args // {
      tsitter = false;
    };
    extra = baseExtra args // {
      colorscheme = "vague";
    };
  };
}
