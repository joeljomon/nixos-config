{ pkgs, config, options, lib, ... }:

with lib; with types;
let 
  pkg-dev-install = (import ./pkg.nix { inherit lib config; } "dev" (import ./install.nix));
in {

  options.modules.dev = {
    racket.enable = mkOption { type = types.bool; default = false; };
    heroku.enable = mkOption { type = types.bool; default = false; };
    clang.enable = mkOption { type = types.bool; default = false; };
    gcc.enable = mkOption { type = types.bool; default = false; };
  };

  config = mkMerge (map (x: pkg-dev-install { package = x; }) (with pkgs;[ 
    racket
    heroku
    clang
    gcc
  ]));
}
