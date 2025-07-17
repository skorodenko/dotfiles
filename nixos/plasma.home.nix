{
  programs.plasma = {
    enable = true;

    workspace = {
      clickItemTo = "open";
      lookAndFeel = "org.kde.breezedark.desktop";
    };

    krunner = {
      position = "center";
      activateWhenTypingOnDesktop = false;
      historyBehavior = "disabled";
      shortcuts.launch = "Ctrl+Space";
    };

    fonts = {
      general = {
        family = "Iosevka Nerd Font";
        pointSize = 10;
      };
      fixedWidth = {
        family = "Iosevka Nerd Font";
        pointSize = 10;
      };
      small = {
        family = "Iosevka Nerd Font";
        pointSize = 8;
      };
      toolbar = {
        family = "Iosevka Nerd Font";
        pointSize = 10;
      };
      menu = {
        family = "Iosevka Nerd Font";
        pointSize = 10;
      };
      windowTitle = {
        family = "Iosevka Nerd Font";
        pointSize = 10;
      };
    };
  };
}
