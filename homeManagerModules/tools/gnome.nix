{ config, pkgs, lib, ... }:

{
  options = {
    gnome.enable = lib.mkEnableOption "enables gnome editor";
  };

  config = lib.mkIf config.gnome.enable {
    home.packages = with pkgs; [
      dconf-editor
    ];

    # System configuration
    dconf = {
      enable = true;

      settings."org/gnome/desktop/interface" = {
        clock-show-weekday = true;
        clock-show-seconds = true;
        show-battery-percentage = true;
      };

      settings."org/gnome/desktop/peripherals/touchpad" = {
        natural-scroll = false;
        two-finger-scrolling-enabled = true;
      };
    };
  };
}
