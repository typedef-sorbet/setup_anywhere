# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Allow unfree packages (mostly used for vscode)
  nixpkgs.config.allowUnfree = true;

  # Use the GRUB 2 boot loader.
  boot.loader.grub.enable = true;
  boot.loader.grub.version = 2;
  # boot.loader.grub.efiSupport = true;
  # boot.loader.grub.efiInstallAsRemovable = true;
  # boot.loader.efi.efiSysMountPoint = "/boot/efi";
  # Define on which hard drive you want to install Grub.
  boot.loader.grub.device = "/dev/sda"; # or "nodev" for efi only

  networking.hostName = "warmachine-v2"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Set your time zone.
  time.timeZone = "America/Los_Angeles";

  # The global useDHCP flag is deprecated, therefore explicitly set to false here.
  # Per-interface useDHCP will be mandatory in the future, so this generated config
  # replicates the default behaviour.
  networking.useDHCP = false;
  networking.interfaces.enp0s3.useDHCP = true;

  fonts.fonts = with pkgs; [
    source-code-pro
  ];

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";
  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Source Code Pro";
    keyMap = "us";
  };

  # services.xserver.displayManager.gdm.enable = true;
  # services.xserver.desktopManager.gnome.enable = true;
 
  # Enabling AwesomeWM 

  # Firstly, set up an overlay to grab the latest AwesomeWM version.
  nixpkgs.overlays = [
    (self: super: {
      awesome = super.awesome.overrideAttrs (old: {
        src = super.fetchFromGitHub {
          owner = "awesomeWM";
          repo = "awesome";
          rev = "70524e72faf263cfed18600339431de513d76186";
          sha256 = "0lv5xjhmbjr72n6fbx0ck09g3ir887k903a8287sx3y78xxrrl7a";
        };
      });
    })
  ];

  services.xserver = {
    enable = true;
    resolutions = [
      {
        x = 1920;
        y = 1200;
      }
    ];
    
    displayManager = {
      sddm.enable = true;
      sddm.theme = "${(pkgs.fetchFromGitHub {
        owner = "MarianArlt";
        repo = "sddm-sugar-dark";
        rev = "v1.2";
        sha256 = "0gx0am7vq1ywaw2rm1p015x90b75ccqxnb1sz3wy8yjl27v82yhb";
      })}";
      defaultSession = "none+awesome";
    };

		windowManager.awesome = {
			enable = true;
			luaModules = with pkgs.luaPackages; [
				luarocks
				luadbi-mysql			
                lgi
			];
		};
  };

  # Configure keymap in X11
  # services.xserver.layout = "us";
  # services.xserver.xkbOptions = "eurosign:e";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.sanctity = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
		# Needed for AwesomeWM configuration
		i3lock-fancy
		picom
		rofi
		feh
		light
		flameshot
		# Editors
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
		neovim	# Based and neovim-pilled
		vscode
		# Various ommand line utilities
    wget
    git
    ripgrep
		bat
		exa
		btop
		openssh
		# Terminal
		terminator
		# Python
		python310
		# File Manager
		cinnamon.nemo
		# Browser
    firefox
		# Etc
		discord
		spotify
		qmk
		keymapviz
		# And of course, the most important:
		cowsay
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;


  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "21.11"; # Did you read the comment?

}

