{ inputs, ... }: {

  imports = [ inputs.nixvim.homeManagerModules.nixvim ];

  home.sessionVariables.EDITOR = "nvim";

  programs.nixvim = {
    enable = true;

    clipboard.providers.wl-copy.enable = true;
    colorschemes.catppuccin = {
      enable = true;
      settings.transparent_background = true;
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
      intellitab.enable = true;
      treesitter.enable = true;
      luasnip.enable = true;
      friendly-snippets.enable = true;

      neo-tree = {
        enable = true;
        closeIfLastWindow = true;
      };

      lualine = {
        enable = true;
        settings = {
          tabline = {
            lualine_a = [ "buffers" ];
            lualine_b = [];
            lualine_c = [];
            lualine_x = [];
            lualine_y = [];
            lualine_z = [];
          };

          extensions = [ "neo-tree" ];
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
          "<C-Space>" = "cmp.mapping.complete()";
          "<C-d>" = "cmp.mapping.scroll_docs(-4)";
          "<C-e>" = "cmp.mapping.close()";
          "<C-f>" = "cmp.mapping.scroll_docs(4)";
          "<CR>" = "cmp.mapping.confirm({ select = true })";
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
    };
  };
}
