{ config, pkgs, lib, ... }:

{
  options = {
    git.enable = lib.mkEnableOption "enables and configures git";
  };

  config = lib.mkIf config.git.enable {
    programs = {
      git = {
        enable = true;
        userName = "GIT_USER";
        userEmail = "GIT_EMAIL";
        
        extraConfig = {
          commit.gpgSign = true;
          gpg.program = "gpg";
          signing.key = "GPG_KEYID";
          user.signingKey = "GPG_KEYID";
          signing.signByDefault = true;
        };
      };

      bash = {
        shellAliases = {
          gl = "git log --pretty=oneline --abbrev-commit";
        };
      };
    };
  };
}
