{ pkgs, ... }:
{
  home.packages = [
    pkgs.kdePackages.krohnkite
  ];

  programs.plasma = {
    enable = true;

    workspace = {
      clickItemTo = "open";
      lookAndFeel = "org.kde.breezedark.desktop";
      colorScheme = "BreezeDarkTinted";
    };

    krunner = {
      position = "center";
      activateWhenTypingOnDesktop = false;
      historyBehavior = "disabled";
      shortcuts.launch = "Ctrl+Space";
    };

    shortcuts = {
      kwin = {
        "Window Close" = "Meta+C";
        "Switch to Desktop 1" = "Meta+1";
        "Switch to Desktop 2" = "Meta+2";
        "Switch to Desktop 3" = "Meta+3";
        "Switch to Desktop 4" = "Meta+4";
        "Switch to Desktop 5" = "Meta+5";
        "Window to Desktop 1" = "Meta+!";
        "Window to Desktop 2" = "Meta+@";
        "Window to Desktop 3" = "Meta+#";
        "Window to Desktop 4" = "Meta+$";
        "Window to Desktop 5" = "Meta+%";
        "KrohnkiteFocusLeft" = "Meta+Left";
        "KrohnkiteFocusRight" = "Meta+Right";
        "KrohnkiteFocusUp" = "Meta+Up";
        "KrohnkiteFocusDown" = "Meta+Down";
      };

      services = {
        "kitty.desktop" = "Meta+Return";
      };
    };

    configFile = {
      kwinrc.Plugins.krohnkiteEnabled = true;
      kwinrc.Windows.DelayFocusInterval = 50;
      kwinrc.Windows.FocusPolicy = "FocusFollowsMouse";
      kwinrc."Script-krohnkite" = {
        screenGapBetween = 18;
        screenGapBottom = 18;
        screenGapLeft = 18;
        screenGapRight = 18;
        screenGapTop = 18;
      };
      kwinrc.Desktops = {
        Name_1 = "I";
        Name_2 = "II";
        Name_3 = "III";
        Name_4 = "IV";
        Name_5 = "V";
        Number = 5;
        Rows = 1;
      };
      kwinrc."Effect-slide".SlideBackground = false;

      breezerc.Style.MenuOpacity = 60;
      breezerc."Windeco Exception 0" = {
        BorderSize = 3;
        Enabled = true;
        ExceptionPattern = ".*";
        ExceptionType = 0;
        HideTitleBar = true;
        Mask = 16;
      };

      kdeglobals.General = {
        accentColorFromWallpaper = true;
      };
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

    panels = [
      {
        height = 40;
        location = "bottom";
        floating = true;
        widgets = [
          {
            pager.general = {
              displayedText = "desktopName";
            };
          }
          "org.kde.plasma.panelspacer"
          { digitalClock = { }; }
          "org.kde.plasma.panelspacer"
          {
            systemTray.items = {
              shown = [
                "org.kde.plasma.clipboard"
                "org.kde.plasma.volume"
                "org.kde.plasma.brightness"
                "org.kde.plasma.keyboardlayout"
                "org.kde.plasma.bluetooth"
                "org.kde.plasma.networkmanagement"
              ];
              configs = {
                keyboardLayout.displayStyle = "labelOverFlag";
              };
            };
          }
        ];
      }
    ];
  };
}
