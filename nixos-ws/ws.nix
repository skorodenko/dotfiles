{ ... }:
{
  home-manager.users.ws =
    { pkgs, ... }:
    {
      imports = [
        ./plasma.home.nix
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
      };

      # Packages nixpkg
      home.packages = with pkgs; [
        htop
        fastfetch
        lazygit
        zoxide
        eza
        tor
        tor-browser
        haruna
      ];

      home.stateVersion = "25.05";
    };
}
