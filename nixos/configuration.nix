# configuration.nix

{ self, config, pkgs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; 
  networking.networkmanager.enable = true;

  time.timeZone = "America/New_York";

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


  fonts.fontconfig = {
    enable = true;
    antialias = true;
    hinting.enable = true;
    hinting.style = "slight";
    subpixel.rgba = "rgb";
  };


  services.xserver.enable = true;

  
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  
  services.printing.enable = true;

  
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  users.users.m = {
    isNormalUser = true;
    description = "m";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      kdePackages.kate
    ];
  };

  hardware.bluetooth.enable = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];


  hardware = {
    graphics = {
        enable = true;
        enable32Bit = true;
    };
    
    amdgpu.amdvlk = {
        enable = true;
        support32Bit.enable = true;
    };
    
    opengl = {
	enable = true;
    };
  };

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    localNetworkGameTransfers.openFirewall = true;
  };

  programs.hyprland.enable = true;
  
  nixpkgs.config.allowUnfree = true;
  services.flatpak.enable = true; 

  xdg.portal.enable = true;
  xdg.portal.extraPortals = [pkgs.xdg-desktop-portal-gtk];


  environment.systemPackages = with pkgs; [

    ### TUI apps
    wget
    ripgrep
    fzf
    fd
    unzip
    git
    lazygit
    yazi
    sl
    bat
    fastfetch
    btop
    zoxide
    docker
    lazydocker    
    neovim
    
    ### GUI apps
    kitty    
    google-chrome
    xfce.thunar
    vesktop # discord
    vscode

    ### hyprland stuff
    dunst # notif daemon
    hyprpaper # wallpapers
    waybar # status bar
    rofi # app launcher
    grim
    slurp # screenshot utilities
    wl-clipboard
    clipman # clipboard utilities
    sddm-astronaut




    ### languages
    
    #rust
    rustc
    cargo
    rust-analyzer
    rustfmt
    clippy
    
    #c/c++
    gcc
    clang
    clang-tools
    gnumake
    cmake
    boost
    catch2

    #golang
    go
    gopls

    #python
    (python3.withPackages (ps: [ 
      ps.pip
      ps.black
      ps.ruff
      ps.numpy
      ps.pandas
      ps.requests
      ps.flask
    ]))

    #js/ts
    typescript
    nodejs
    bun
    typescript-language-server
    nodePackages.prettier
    nodePackages.live-server

    #java
    openjdk
    maven
    jdt-language-server
      
    #zig
    zig
    zls


    ### fonts
    nerd-fonts._0xproto
    nerd-fonts._3270
    nerd-fonts.agave
    nerd-fonts.anonymice
    nerd-fonts.arimo
    nerd-fonts.aurulent-sans-mono
    nerd-fonts.bigblue-terminal
    nerd-fonts.bitstream-vera-sans-mono
    nerd-fonts.blex-mono
    nerd-fonts.caskaydia-cove
    nerd-fonts.caskaydia-mono
    nerd-fonts.code-new-roman
    nerd-fonts.comic-shanns-mono
    nerd-fonts.commit-mono
    nerd-fonts.cousine
    nerd-fonts.d2coding
    nerd-fonts.daddy-time-mono
    nerd-fonts.departure-mono
    nerd-fonts.dejavu-sans-mono
    nerd-fonts.droid-sans-mono
    nerd-fonts.envy-code-r
    nerd-fonts.fantasque-sans-mono
    nerd-fonts.fira-code
    nerd-fonts.fira-mono
    nerd-fonts.geist-mono
    nerd-fonts.go-mono
    nerd-fonts.gohufont
    nerd-fonts.hack
    nerd-fonts.hasklug
    nerd-fonts.heavy-data
    nerd-fonts.hurmit
    nerd-fonts.im-writing
    nerd-fonts.inconsolata
    nerd-fonts.inconsolata-go
    nerd-fonts.inconsolata-lgc
    nerd-fonts.intone-mono
    nerd-fonts.iosevka
    nerd-fonts.iosevka-term
    nerd-fonts.iosevka-term-slab
    nerd-fonts.jetbrains-mono
    nerd-fonts.lekton
    nerd-fonts.liberation
    nerd-fonts.lilex
    nerd-fonts.martian-mono
    maple-mono.variable
    nerd-fonts.meslo-lg
    nerd-fonts.monaspace
    nerd-fonts.monofur
    nerd-fonts.monoid
    nerd-fonts.mononoki
    nerd-fonts.noto
    nerd-fonts.open-dyslexic
    nerd-fonts.overpass
    nerd-fonts.profont
    nerd-fonts.proggy-clean-tt
    nerd-fonts.recursive-mono
    nerd-fonts.roboto-mono
    nerd-fonts.shure-tech-mono
    nerd-fonts.sauce-code-pro
    nerd-fonts.space-mono
    nerd-fonts.symbols-only
    nerd-fonts.terminess-ttf
    nerd-fonts.tinos
    nerd-fonts.ubuntu
    nerd-fonts.ubuntu-mono
    nerd-fonts.ubuntu-sans
    nerd-fonts.victor-mono
    nerd-fonts.zed-mono
  ];

  system.stateVersion = "25.05"; 

}
