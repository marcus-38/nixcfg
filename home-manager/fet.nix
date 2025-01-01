{ config, pkgs, ... }:
{
  home.username = "fet";
  home.homeDirectory = "/home/fet";

  xresources.properties = {
    "xcursor.size" = 16;
    "Xft.dpi" = 172;
  };

  users.users.fet = {
    isNormalUser = true;
    description = "fet";
    extraGroups = [ "networkManager" "wheel" ];
  };
  
  home.packages = with pkgs; [
    fastfetch
    nnn

    wget
    just
    
    zip
    xz
    unzip
    p7zip

    ripgrep
    jq
    yq-go
    eza
    fzf

    mtr
    iperf3
    dnsutils
    ldns
    aria2
    socat
    nmap
    ipcalc

    file
    which
    tree
    gnused
    gnutar
    gawk
    zstd
    gnupg

    nix-output-monitor

    btop
    htop
    iotop
    iftop

    strace
    ltrace
    lsof

    sysstat
    lm_sensors
    ethtool
    pciutils
    usbutils

    gh
  ];

  programs.git = {
    enable = true;
    userName = "marcus-38";
    userEmail = "marcus@r38.se";
  };

  programs.starship = {
    enable = true;
    settings = {
      add_newline = false;
      aws.disabled = true;
      gcloud.disabled = true;
      line_break.disabled = true;
    };
  };

  programs.alacritty = {
    enable = true;
    settings = {
      env.TERM = "xterm-256color";
      font = {
        size = 12;
        draw_bold_text_with_bright_colors = true;
      };
      scrolling.multiplier = 5;
      selection.save_to_clipboard = true;
    };
  };

  programs.bash = {
    enable = true;
    enableCompletion = true;

    #shellAliases = {
    #  ls=eza;
    #};
  };

  home.stateVersion = "24.11";
  programs.home-manager.enable = true;
  
}
