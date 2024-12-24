{ config, pkgs, ... }: {
  programs.nixvim.config = {
    enable = true;
    defaultEditor = true;

    plugins = {
      web-devicons.enable = true;

      airline = {
        enable = true;
        settings = {
          theme = "everforest";
        };
      };

      nvim-tree.enable = true;
      comment.enable = true;
      
      barbar.enable = true;

      treesitter = {
        enable = true;
        settings = {
          autoInstall = true;
          
          ensureInstalled = [
            "nim"
            "nix"
          ];
          
          highlight = {
            enable = true;
            additionalVimRegexHighlighting = false;
          };
        };
      };

      lsp = {
        enable = true;
        servers = {
          nim_langserver.enable = true;
          nil_ls.enable = true;
        };
      };

      cmp = {
        enable = true;
        autoEnableSources = true;
        settings.sources = [
          { name = "nvim_lsp"; }
          { name = "path"; }
          { name = "buffer"; }
        ];
        settings.mapping = {
          "<C-CR>" = "cmp.mapping.confirm({ select = true })";
          "<S-Tab>" = "cmp.mapping.select_prev_item()";
          "<Tab>" = "cmp.mapping.select_next_item()";
          "<C-Space>" = "cmp.mapping.complete()";
          "<C-k>" = "cmp.mapping.scroll_docs(-1)";
          "<Esc>" = "cmp.mapping.close()";
          "<C-j>" = "cmp.mapping.scroll_docs(1)";
        };
      };

      nvim-autopairs.enable = true;
    };
    

    extraPlugins = with pkgs.vimPlugins; [
      vim-devicons
      everforest
    ];

    opts = {
      number = true;
      relativenumber = true;
      autoindent = true;
      scrolloff = 30;
      ttyfast = true;
      clipboard = "unnamedplus";
      cursorline = true;
    };

    colorscheme = "everforest";

    globals.mapleader = " ";
    globals.maplocalleader = " ";

    keymaps = [
      {
        mode = "n";
        key = "<Esc>";
        action = ":noh\n";
      }
      {
        mode = "n";
        key = "<C-c>";
        action = ":noh\n";
      }
      # tree
      {
        mode = "n";
        key = "<leader>n";
        action = ":NvimTreeToggle\n";
      }
      # barbar
      {
        mode = "n";
        key = "<A-,>";
        action = ":BufferPrevious\n";
      }
      {
        mode = "n";
        key = "<A-.>";
        action = ":BufferNext\n";
      }
      {
        mode = "n";
        key = "<leader>,";
        action = ":BufferMovePrevious\n";
      }
      {
        mode = "n";
        key = "<leader>.";
        action = ":BufferMoveNext\n";
      }
      {
        mode = "n";
        key = "<A-c>";
        action = ":BufferClose\n";
      }
      # lsp
      {
        mode = "n";
        key = "gd";
        action = ":lua vim.lsp.buf.definition()\n";
        options.silent = true;
      }
    ];

    autoCmd = [
      {
        event = ["FileType"];
        pattern = ["nim"];
        command = "setlocal tabstop=6 softtabstop=6 shiftwidth=6 expandtab";
      }
      {
        event = ["FileType"];
        pattern = ["nix"];
        command = "setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab";
      }
    ];

    extraConfigLua = ''
      vim.api.nvim_create_autocmd("BufEnter", {
        nested = true,
        callback = function()
          if #vim.api.nvim_list_wins() == 1 and vim.api.nvim_buf_get_name(0):match("NvimTree_") ~= nil then
            vim.cmd "quit"
          end
        end
      })
    '';
  };
}

