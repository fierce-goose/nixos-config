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
      nvim-tree = {
        enable = true;
        hijackUnnamedBufferWhenOpening = true;
        openOnSetup = true;
      };
      comment.enable = true;

      barbar.enable = true;
      treesitter = {
        enable = true;
        settings = {
          autoInstall = true;

          ensureInstalled = [
            "nim"
            "nix"
            "lua"
            "rust"
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
          nimls.enable = true;
          nil_ls.enable = true;
          rust_analyzer.enable = true;
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
          "<C-j>" = "cmp.mapping.scroll_docs(1)";
          "<Esc>" = "cmp.mapping.close()";
        };
      };
      nvim-autopairs.enable = true;
      nvim-ufo = {
      	enable = true;
      };
    };

    extraPlugins = with pkgs.vimPlugins; [
      vim-devicons
      everforest
    ];
    clipboard = {
      register = "unnamedplus";
      providers.wl-copy.enable = true;
    };
    opts = {
      number = true;
      relativenumber = true;
      autoindent = true;
      scrolloff = 30;
      ttyfast = true;
      cursorline = true;

      foldlevel = 99;
      foldenable = true;
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
      # ufo
      {
        mode = "n";
        key = "zR";
        action = ":lua require('ufo').openAllFolds()\n";
        options.silent = true;
      }
      {
        mode = "n";
        key = "zM";
        action = ":lua require('ufo').closeAllFolds()\n";
        options.silent = true;
      }
      {
        mode = "n";
        key = "zr";
        action = ":lua require('ufo').openAllFolds()\n";
        options.silent = true;
      }
      {
        mode = "n";
        key = "zm";
        action = ":lua require('ufo').closeAllFolds()\n";
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
        pattern = ["nix" "lua"];
        command = "setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab";
      }
    ];
  };
}
