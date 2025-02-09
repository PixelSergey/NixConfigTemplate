{ pkgs, lib, ... }:

{
  imports = [
    ./essentials.nix
  ];

  essentials.enable = lib.mkDefault true;
}
