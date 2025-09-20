{ ... }:
{
  services.flatpak = {
    packages = [
      "app.zen_browser.zen"
      "com.google.ChromeDev"
      "com.spotify.Client"
      "com.usebottles.bottles"
      "io.gitlab.librewolf-community"
      "net.davidotek.pupgui2"
    ];
    overrides = {
      "com.usebottles.bottles".Context = {
        filesystems = [
          "/run/media/rinkuro/HK/HH/Games/"
        ];
      };
    };
  };
}
