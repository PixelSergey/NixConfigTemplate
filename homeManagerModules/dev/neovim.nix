{ config, pkgs, lib, ... }:

{
  options = {
    neovim.enable = lib.mkEnableOption "enables neovim";
  };

  config = lib.mkIf config.neovim.enable {
    programs = {
      neovim = {
        enable = true;
        vimAlias = true;
        vimdiffAlias = true;

        extraConfig = ''
          set number
          set relativenumber
          set clipboard=unnamedplus
          set expandtab

          if &term =~ '^screen'
            execute "set <xUp>=\e[1;*A"
            execute "set <xDown>=\e[1;*B"
            execute "set <xRight>=\e[1;*C"
            execute "set <xLeft>=\e[1;*D"
          endif

          if has("autocmd")
            au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
              \| exe "normal! g'\"" | endif
          endif
        '';
      };
    };
  };
}
