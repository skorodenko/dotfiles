{ ... }:
{
  home-manager.users.rinkuro =
    { pkgs, ... }:
    {
      imports = [
        ./plasma.home.nix
        ./neovim.home.nix
      ];

      # Zsh config
      programs.zsh = {
        enable = true;
        enableCompletion = true;
        autosuggestion.enable = true;
        syntaxHighlighting.enable = true;

        shellAliases = {
          ls = "eza";
          la = "eza -la";
          ll = "eza -lh";
          l = "eza -l";
        };

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

      # mpd config
      services.mpd = {
        enable = true;
        musicDirectory = "~/Music";
        network = {
          startWhenNeeded = true;
        };
        extraConfig = ''
          audio_output {
                  type            "pipewire"
                  name            "PipeWire Sound Server"
          }
        '';
      };

      # Packages nixpkg
      home.packages = with pkgs; [
        htop
        rmpc
        fastfetch
        lazygit
        zoxide
        kitty
        glances
        brightnessctl
        haruna
        stow
        eza
        bluetuith
        chromium
        librewolf
        floorp
      ];

      home.stateVersion = "25.05";
    };
}
