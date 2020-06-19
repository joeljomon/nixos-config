{ config, options, lib, ... }:

with lib; with types; {
  options.modules.editor = {
      neovim.enable = mkOption { type = bool; default = false; };
    };

  config.my.home.programs = {
    neovim = (mkIf config.modules.editor.neovim.enable (import ../configs/neovim.nix));
  };
}
