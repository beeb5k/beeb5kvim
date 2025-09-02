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
      blink = true;
      ui = true;
      git = true;
      theme = true;
      rust = true;
      nix = true;
      lua = true;
      javascript = true;
      go = false;
      java = false;
      clang = true;
      python = false;
      extras = true;
      general = true;
      markdown = false;
      lspDebugMode = false;
    };
  baseExtra =
    { pkgs, ... }@misc:
    {
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
  };
}
