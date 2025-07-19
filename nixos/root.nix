# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ./rinkuro.nix
  ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Fix for rtw8822
  boot.kernelModules = [
    "rtw88"
  ];
  boot.extraModprobeConfig = ''
    options rtw88_pci disable_aspm=1
  '';

  networking.hostName = "nixos"; # Define your hostname.
  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = false;

  # Block internal bluetooth module
  services.udev = {
    enable = true;
    extraRules = ''
      SUBSYSTEM=="usb", ATTRS{idVendor}=="0bda", ATTRS{idProduct}=="b023", ATTR{authorized}="0"
    '';
  };

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Kyiv";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.supportedLocales = [
    "en_US.UTF-8/UTF-8"
    "uk_UA.UTF-8/UTF-8"
  ];
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

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Font config
  fonts.packages = with pkgs; [
    ibm-plex
    material-symbols
    nerd-fonts.iosevka
  ];

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
  };

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # rinkuro user account setup
  users.users.rinkuro = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "input"
      "networkmanager"
    ];
    shell = pkgs.zsh;
  };

  programs.zsh.enable = true;

  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = true;
  services.desktopManager.plasma6.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim
    wget
    git
    uv
    wl-clipboard
    usbutils
    ripgrep
    lm_sensors
    ddcutil
    kdePackages.qtdeclarative
  ];

  environment.variables = {
    NIXOS_OZONE_WL = "1";
  };

  programs.ssh.startAgent = true;

  #  programs.nix-ld.enable = true;
  #  programs.nix-ld.libraries = with pkgs; [
  #    zlib
  #    libGL
  #    glib
  #  ];

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

  system.stateVersion = "25.05"; # Did you read the comment?
}
