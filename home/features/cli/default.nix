{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./fish.nix
    ./fzf.nix
    ./nitch.nix
    ./nushell.nix
    ./secrets.nix
    ./starship.nix
    ./zellij.nix
  ];

  programs.carapace = {
    enable = true;
    enableFishIntegration = true;
    enableNushellIntegration = true;
    enableBashIntegration = true;
  };

  programs.zoxide = {
    enable = true;
    enableFishIntegration = true;
    enableNushellIntegration = true;
  };

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    withNodeJs = true;
    withPython3 = true;
  };

  programs.bat = {
    enable = true;
    config = {
      theme = "universal";
    };
    themes = {
      universal = {
        src = pkgs.writeText "universal.tmTheme" ''
          <?xml version="1.0" encoding="UTF-8"?>
          <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
          <plist version="1.0">
          <dict>
            <key>name</key>
            <string>Universal (nix-colors)</string>
            <key>settings</key>
            <array>
              <dict>
                <key>settings</key>
                <dict>
                  <key>background</key>
                  <string>#${config.colorScheme.palette.base00}</string>
                  <key>foreground</key>
                  <string>#${config.colorScheme.palette.base05}</string>
                  <key>caret</key>
                  <string>#${config.colorScheme.palette.base05}</string>
                  <key>selection</key>
                  <string>#${config.colorScheme.palette.base02}</string>
                  <key>selectionForeground</key>
                  <string>#${config.colorScheme.palette.base05}</string>
                  <key>lineHighlight</key>
                  <string>#${config.colorScheme.palette.base01}</string>
                </dict>
              </dict>
              <dict>
                <key>name</key>
                <string>Comment</string>
                <key>scope</key>
                <string>comment</string>
                <key>settings</key>
                <dict>
                  <key>foreground</key>
                  <string>#${config.colorScheme.palette.base03}</string>
                  <key>fontStyle</key>
                  <string>italic</string>
                </dict>
              </dict>
              <dict>
                <key>name</key>
                <string>String</string>
                <key>scope</key>
                <string>string</string>
                <key>settings</key>
                <dict>
                  <key>foreground</key>
                  <string>#${config.colorScheme.palette.base0A}</string>
                </dict>
              </dict>
              <dict>
                <key>name</key>
                <string>Number</string>
                <key>scope</key>
                <string>constant.numeric</string>
                <key>settings</key>
                <dict>
                  <key>foreground</key>
                  <string>#${config.colorScheme.palette.base0E}</string>
                </dict>
              </dict>
              <dict>
                <key>name</key>
                <string>Keyword</string>
                <key>scope</key>
                <string>keyword</string>
                <key>settings</key>
                <dict>
                  <key>foreground</key>
                  <string>#${config.colorScheme.palette.base08}</string>
                </dict>
              </dict>
              <dict>
                <key>name</key>
                <string>Function</string>
                <key>scope</key>
                <string>entity.name.function</string>
                <key>settings</key>
                <dict>
                  <key>foreground</key>
                  <string>#${config.colorScheme.palette.base0B}</string>
                </dict>
              </dict>
              <dict>
                <key>name</key>
                <string>Type</string>
                <key>scope</key>
                <string>entity.name.type, storage.type</string>
                <key>settings</key>
                <dict>
                  <key>foreground</key>
                  <string>#${config.colorScheme.palette.base0D}</string>
                </dict>
              </dict>
              <dict>
                <key>name</key>
                <string>Variable</string>
                <key>scope</key>
                <string>variable</string>
                <key>settings</key>
                <dict>
                  <key>foreground</key>
                  <string>#${config.colorScheme.palette.base05}</string>
                </dict>
              </dict>
              <dict>
                <key>name</key>
                <string>Constant</string>
                <key>scope</key>
                <string>constant</string>
                <key>settings</key>
                <dict>
                  <key>foreground</key>
                  <string>#${config.colorScheme.palette.base0E}</string>
                </dict>
              </dict>
            </array>
          </dict>
          </plist>
        '';
      };
    };
  };

  programs.direnv = {
    enable = true;
    enableNushellIntegration = true;
    nix-direnv.enable =
      true;
  };

  programs.eza = {
    enable = true;
    enableFishIntegration = true;
    enableBashIntegration = true;
    extraOptions = ["-l" "--icons" "--git" "-a"];
  };

  programs.lf = {
    enable = true;
    settings = {
      preview = true;
      drawbox = true;
      hidden = true;
      icons = true;
      theme = "Dracula";
      previewer = "bat";
    };
  };

  home.packages = with pkgs; [
    agenix-cli
    alejandra
    bc
    claude-code
    comma
    coreutils
    devenv
    fd
    gcc
    go
    htop
    httpie
    hyprpaper-random
    jq
    just
    lazygit
    llm
    lf
    nix-index
    nushellPlugins.skim
    progress
    ripgrep
    rocmPackages.rocm-smi
    rocmPackages.rocminfo
    rocmPackages.rocm-runtime
    tldr
    pomodoro-timer
    trash-cli
    unimatrix
    unzip
    vulkan-tools
    wttrbar
    wireguard-tools
    yazi
    zellij-ps
    zip
  ];
}

