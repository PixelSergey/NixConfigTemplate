{ config, pkgs, lib, ... }:

{
  options = {
    vscode.enable = lib.mkEnableOption "enables and configures vscode";
  };

  config = lib.mkIf config.vscode.enable {
    home.packages = with pkgs; [
      code-cursor
    ];

    programs = {
      vscode = {
        enable = true;
        enableExtensionUpdateCheck = true;
        enableUpdateCheck = true;

        extensions = with pkgs.vscode-extensions; [
          # VSCode extensions here
        ];
      };
    };
  };
}
