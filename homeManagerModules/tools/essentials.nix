{ config, pkgs, lib, ... }:

{
  options = {
    essentials.enable = lib.mkEnableOption "enables essential tools";
  };

  config = lib.mkIf config.essentials.enable {
    home.packages = with pkgs; [
      tree
      zip
      curl
      wget
      htop
      neofetch
      meow
    ];
  };
}
