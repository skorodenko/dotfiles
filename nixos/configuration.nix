# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, lib, ... }:
{
  imports =
    [ # Include the results of the hardware scan.
      <home-manager/nixos>
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.
  # hardware.bluetooth.enable = true;
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Kyiv";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Enable the X11 windowing system.
  # You can disable this if you're only using the Wayland session.
  # services.xserver.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = false;

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # rinkuro user account setup
  users.users.rinkuro = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ];
    shell = pkgs.zsh;
  };
  home-manager.users.rinkuro = { pkgs, lib, config, ... }: {
    # Zsh config
    programs.zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;

      shellAliases = {
        la = "ls -la";
        ll = "ls -l";
      };

      profileExtra = ''
        if uwsm check may-start && uwsm select; then
          exec uwsm start default
        fi
      '';
	
      oh-my-zsh = {
        enable = true;
        theme = "refined";
        plugins = [
          "git"
          "zoxide"
        ];
      };

      history.size = 10000;
      history.ignoreAllDups = true;
      history.path = "$HOME/.zsh_history";
    };    

    # Neovim conifg
    xdg.configFile."nvim/lua" = {
      recursive = true;
      source = ../.config/nvim/lua;
    };
    programs.neovim = {
      enable = true;
    
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
        #! auto-indent-nvim
        indent-blankline-nvim

	# projects
        #! neovim-project

        # toggleterm
        toggleterm-nvim
      ];
    };

    # Programs nixpkg
    programs.firefox.enable = true;

    # Packages nixpkg
    home.packages = with pkgs; [ 
      htop 
      fastfetch 
      lazygit 
      zoxide
      kitty
      wofi
      brightnessctl
      stow
    ];

    home.stateVersion = "25.05";
  };

  programs.zsh.enable = true;

  programs.hyprland = {
    enable = true;
    withUWSM = true;
  };

  # UWSM config
  programs.uwsm = {
    enable = true;
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim
    wget
    git
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?

}
