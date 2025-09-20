{ pkgs, config, ... }:
{
  # Neovim conifg
  programs.neovim = {
    enable = true;

    viAlias = true;
    vimAlias = true;

    extraLuaConfig = ''
      require("config.options")
      require("config.autocmds")
      require("lazy").setup({
        performance = {
          reset_packpath = false,
          rtp = { reset = false, }
        },
        dev = {
          path = "${pkgs.vimUtils.packDir config.programs.neovim.finalPackage.passthru.packpathDirs}/pack/myNeovimPackages/start",
          patterns = {""},
        },
        install = {
          missing = false,
        },
        spec = {
          { import = "plugins" },
        },
      })
      require("config.custom")
      require("config.lsp")
    '';

    plugins = with pkgs.vimPlugins; [
      lazy-nvim

      # autoclose
      nvim-ts-autotag
      autoclose-nvim

      # flash
      flash-nvim

      # lsp
      coq_nvim
      coq-artifacts
      coq-thirdparty
      nvim-lspconfig

      # mini-icons
      mini-icons

      # nvim-highlight-colors
      nvim-highlight-colors

      # telescope
      telescope-nvim

      # treesitter
      nvim-treesitter
      nvim-treesitter.withAllGrammars

      # cinascroll
      cinnamon-nvim

      # gitsigns
      gitsigns-nvim

      # lualine
      lualine-nvim

      # neo-tree
      neo-tree-nvim

      # themes
      onedarkpro-nvim
      kanagawa-nvim

      # which-key
      which-key-nvim

      # dashboard
      dashboard-nvim

      # indent
      indent-blankline-nvim

      # toggleterm
      toggleterm-nvim

      # rust
      rustaceanvim
    ];
  };

  # Packages nixpkg
  home.packages = with pkgs; [
    # Language servers
    pyright
    ruff
    lua-language-server
    nixd
    nixfmt-rfc-style
    nodePackages.vscode-json-languageserver
    taplo
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  home.stateVersion = "25.05";
}
