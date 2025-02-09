{ pkgs, lib, ... }:

{
  imports = [
    ./essentials.nix
    ./gnome.nix
  ];

  essentials.enable = lib.mkDefault true;
  gnome.enable = lib.mkDefault true;
}
