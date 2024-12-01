#    __ __ _            __      _          
#   / //_/(_)________ _/ /___ _(_)___  ___ 
#  / ,<  / / ___/ __ `/ / __ `/ / __ \/ _ \
# / /| |/ / /  / /_/ / / /_/ / / / / /  __/
#/_/ |_/_/_/   \__,_/_/\__,_/_/_/ /_/\___/ 
#  ================================================================
#  |             author doesnt know Nix programming language sorry|
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
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Asia/Tashkent";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the KDE Plasma Desktop Environment.
  services.displayManager.sddm.enable = true;
  services.xserver.desktopManager.plasma5.enable = true;

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
    isNormalUser = true;
    description = "KIRALAINE";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.fish;
    packages = with pkgs; [
    #   kate
    #  thunderbird
    ];
  };

  # Install firefox.
  programs.firefox.enable = true;

  #set fish default
  programs.fish.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
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
     fastfetch 
 ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };
 
  system.stateVersion = "24.05";
  nix.gc = {
     automatic = true;
     dates = "weekly";
     options = "--delete-older-than 30d";
 };
}




