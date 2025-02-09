{ config, pkgs, lib, ... }:

{
  options = {
    bash.enable = lib.mkEnableOption "enables and configures bash";
  };

  config = lib.mkIf config.bash.enable {
    programs = {
      bash = {
        enable = true;
        shellAliases = {
          ".." = "cd ..";
          e = "exit";
          c = "clear";

          conf = "code ~/dotfiles";
          reb = "sudo nixos-rebuild switch --flake ~/dotfiles#HOSTNAME";
          update = "nix-channel --update && nix flake update --flake ~/dotfiles";
          garbage = "sudo nix profile wipe-history --profile /nix/var/nix/profiles/system --older-than 7d && nix-collect-garbage --delete-old";
        };

        initExtra = ''        
          function cl {
            str="$*"
            cd $str
            ls
          }
        '';
      };
    };
  };
}
