inputs:
let
  inherit (inputs.nixCats) utils;
in
{
  Neovim =
    { pkgs, name, ... }:
    {
      settings = {
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
      categories = {
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
      extra = {
        nixdExtras = {
          nixpkgs = ''import ${pkgs.path} {}'';
        };
      };
    };
}
