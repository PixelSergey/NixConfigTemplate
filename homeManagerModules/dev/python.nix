{ config, pkgs, lib, ... }:

{
  options = {
    python.enable = lib.mkEnableOption "enables python with poetry for dependecies";
  };

  config = lib.mkIf config.python.enable {
    home.packages = with pkgs; [
      python3
      poetry
    ];
  };
}
