![Nix Logo](https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcToRCrHuF77fjDtsxG5mJxs-liz16eugHR7kQ&s)

# NixOS Configuration Files

This repository contains my personal NixOS configuration files. It's an example of how I set up my NixOS system, including the configuration of various packages, services, and system settings using Nix.

## About NixOS

[NixOS](https://nixos.org/) is a Linux distribution that is built around the Nix package manager. It is declarative, meaning the entire system configuration is described in a single configuration file (typically `/etc/nixos/configuration.nix`). NixOS offers atomic upgrades, rollbacks, and precise package management.

- **Declarative Configuration**: The system's state is fully defined in configuration files.
- **Reproducible**: Ensures you can recreate the exact same environment anywhere.
- **Atomic Upgrades & Rollbacks**: Safe and easy system updates.

## About Nix

[Nix](https://nixos.org/nix/) is a powerful package manager that supports reproducible builds, atomic upgrades, and rollbacks for managing both the software and system configuration. Nix's unique approach allows for flexibility and control over dependencies and package management, making it a great choice for developers and sysadmins.

## How to Use These Configs

If you're interested in using my NixOS configuration as a reference, follow the instructions below:

### 1. Clone the Repository

```git clone https://github.com/yourusername/nixos-config.git```
```cd nixos-config```
### 2. Apply the Configuration
Make sure you have a working NixOS installation and that you are in your NixOS configuration directory (usually /etc/nixos/). You can then copy or symlink my configuration files to your system's configuration folder.

```sudo cp -r * /etc/nixos/```

### 3. Rebuild the System

Once the configuration files are in place, rebuild your NixOS system to apply the changes:

```sudo nixos-rebuild switch```

### 4. Modify as Needed

Feel free to modify the configuration files as per your needs. I maintain my NixOS setup to meet my requirements, but everyone’s needs are different!
