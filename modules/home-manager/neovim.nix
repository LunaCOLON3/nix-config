{ inputs, ... }: {

  imports = [ inputs.nixvim.homeManagerModules.nixvim ];

  home.sessionVariables.EDITOR = "nvim";

  programs.nixvim = {
    enable = true;

    clipboard.providers.wl-copy.enable = true;
    colorschemes.catppuccin = {
      enable = true;
      settings = {
        transparent_background = true;
        show_end_of_buffer = false;
        no_italic = true;

        custom_highlights = ''
                  function(colors)
                  return{
          Variable = {fg = colors.teal},
          }
          end
        '';
      };
    };

    opts = {
      number = true;
      relativenumber = true;

      signcolumn = "yes";

      expandtab = true;
      tabstop = 2;
      softtabstop = 2;
      shiftwidth = 2;

      textwidth = 0;
      wrapmargin = 0;
      wrap = false;

      scrolloff = 5;
    };

    plugins = {
      web-devicons.enable = true;
      treesitter.enable = true;
      luasnip.enable = true;
      friendly-snippets.enable = true;
      indent-blankline.enable = true;
      rainbow-delimiters.enable = true;
      intellitab.enable = true;
      autoclose.enable = true;

      lualine = {
        enable = true;
        settings = {
          tabline = {
            lualine_a = [ "buffers" ];
            lualine_z = [ "tabs" ];
          };
        };
      };

      cmp = {
        enable = true;
        autoEnableSources = true;
        settings.sources = [
          { name = "nvim_lsp"; }
          { name = "luasnip"; }
          { name = "path"; }
          { name = "buffer"; }
        ];

        settings.mapping = {
          "<C-f>" = "cmp.mapping.complete()";
          "<S-Tab>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})";
          "<Tab>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
        };
      };

      lsp = {
        enable = true;
        servers = {
          astro.enable = true;
          bashls.enable = true;
          cssls.enable = true;
          eslint.enable = true;
          html.enable = true;
          jsonls.enable = true;
          marksman.enable = true;
          nixd.enable = true;
          pylsp.enable = true;
          pyright.enable = true;
          tailwindcss.enable = true;
          ts_ls.enable = true;
        };
      };

      telescope = {
        enable = true;

        extensions = {
          fzf-native.enable = true;
          ui-select.enable = true;
        };

        keymaps = {
          "ff" = "find_files";
          "gc" = "git_commits";
          "mp" = "man_pages";
        };
      };
    };
  };
}
