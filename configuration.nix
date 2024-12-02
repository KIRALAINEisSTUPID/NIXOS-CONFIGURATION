#    __ __ _            __      _          
#   / //_/(_)________ _/ /___ _(_)___  ___ 
#  / ,<  / / ___/ __ `/ / __ `/ / __ \/ _ \
# / /| |/ / /  / /_/ / / /_/ / / / / /  __/
#/_/ |_/_/_/   \__,_/_/\__,_/_/_/ /_/\___/ 
#  =================================================================
#  |             writed with tears and blood                       |
#  ==================================================================                                        

{ config, pkgs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "yako"; # Define your hostname.
  # networking.wireless.enable = true;

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Asia/Tashkent";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the KDE Plasma Desktop Environment and deleteing some apps
  services.displayManager.sddm.enable = true;
  services.xserver.desktopManager.plasma5 = {
    enable = true;
    excludePackages = with pkgs.libsForQt5; [
      konsole
      elisa
      spectacle
      okular
      gwenview
    ];

  };
  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;
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

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.kiki = {
    isNormalUser = true; #its your PC and your rules ;>
    description = "KIRALAINE";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.fish;
    packages = with pkgs; [
    ];
  };

  # Install firefox.
  programs.firefox.enable = true;
 
  
  # Set fish default
  programs.fish.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  











  # List packages installed in system profile. To search, run:
  # $ nix search {pkg.name}
  environment.systemPackages = with pkgs; [
     wget
     fish
     flameshot
     git
     htop
     kitty
     telegram-desktop
     obs-studio
     krita
     vscode 
     wine
     wine64
     bottles
     mesa
     mpv
     python3
     python3Packages.pip
     glib
     glibc
     gcc
     cava
     neofetch
 ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };
   

  #enabling experimental functions ;3
  nix.settings.experimental-features ="nix-command flakes";
  

  system.stateVersion = "24.05";
  nix.gc = {
     automatic = true;
     dates = "weekly";
     options = "--delete-older-than 30d";
 };
}




