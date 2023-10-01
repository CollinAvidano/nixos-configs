{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../roles/steam-deck.nix
    ../../desktop.nix
  ];

  # hardware.pulseaudio.enable = lib.mkForce false;
  # services.pipewire.enable = lib.mkForce true;

  # sdImage.imageBaseName = "nix-steam-deck";

  nixpkgs.config.allowBroken = true;
  nixpkgs.config.allowUnfree = true;

    # sdImage = {
    #   # Needed to make the simulation images build properly
    #   rootFsSizeMiB = lib.mkOption {
    #     default = 0;
    #     type = lib.types.int;
    #   };
    # };


  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nix-steam-deck";

  time.timeZone = "America/Denver";

  i18n.defaultLocale = "en_US.utf8";

  #systemd.services.wireguard = {
  #  enable = true;
  #  description = "Wireguard on Demand Service";
  #  serviceConfig = {
  #    ExecStart = "/opt/scripts/wireguard.sh";
  #  };
  #  wantedBy = [ "multi-user.target" ];
  #};

  users.users.collin = {
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAII+w/d1XGPnK4P3r8eUgbuhSKscJUYnWRe9z4LOUUlf/ collinavidano@gmail.com"
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIF7+z7tj9qGcuG3dC0ofV2ayt+gPq+4wffi17eJVaNGx nyx-ubuntu@cavocado.net"
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHzE6Gqu6ZGRZisAqyJrCat0VY+vQrJBqpEyqvANIt/z nyx-wsl"
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIM+nha7QuxyTs60eekPfeT3aUORqxRBCF/bnllSeQHsd collinavidano@github/49595576"
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFmm3SFbTRKJlvXrrB166Ugi2Eli553kA6+qcLEMU4Rx collinavidano@github/49672270"
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMzUUmgur9lvMACU2MhxdYE+GZQxoHPZZqHVFtXz8A6C collinavidano@github/49651418"
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQD6dR6xkWBmBvcyNxhdy8usZ2mG9C5WioIEv7CFfDVzDnt+uAkgDhQMdD6Bla8zqgNf7WpXhInLjFSDweP6CwP345Wd9ovpnrJgCzwAEQS/wAyQHt/ow90CbZCkPiZsrnP7yo1OjYJFKgjxmKLUzhj/or6JeeUvgd6gVWVzOYj4/39BJiyslBEMHILCHQ0co+TYQqOsQ46wlFSYme6Tw9e7sOG42NQk8xLeOeE1AHFuWdHTJzQagEa3vCzVQsF8S96TKb46D3esPNZrXvSs47Q6w5YfDeNvC9llTmR1X1WjJU3r7fI0TGy0iFg59de0kWrp923okyUXR3S3kstKUMwZcF3/Xr3X2dsFURUNB7xBbvS2bWqBX5wVUM3GikV0Cp6y8R2PLfexWZG4BtlORoy9MCgPLLGKZ9hVJWDkau5MoDGlRVe8QYTmovNf9wq/pFamApt+aZjl7VOFlVdwCYF8K8eNWQIsKCjAdFpVoaGsgNSALGLVu7uosZY2MWDcvZJZJ7ssvC+BL5MA8GpedbkwKGoQ8VuRGlaItWMSa20uwWK64vQGZ+QLNPYfBQ6mgbM40Zb0DMZbZuVfE5mUS45oHBL+IE1/Mr6ENIEL3rK8Fqe3ZT5jfIddZSfQh1WD9vNZ7w5TZNjiW+Dh4rC/OpJ7XFutddQkoqRfaw6BlHCr5Q== (none)"
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDkU9qHwm7y43RPehZWVjR1gDri0ZdisAzwW7uehyqa+a4oG50aWyRriNp3sJI/kHHHyI0EpAQpTD6IXxnPomcvuppalxerUu+TCX1IqCIM7MyBVqRRPBMvh1d8kw9T5peNDB00KglYXidxjCVbCYtxQk8Y8WGW4rJgXjljWIiD6otmEUybdHwRPgBfxZ6rvGSXdbeWAp264UXn7kQAlgol/fWUeFXAfVkYke0FbZOQbDP3ztYKZDM4zAPdN07hX3LqmkE951nAfJ7puAs40fU3j8wqvM/32ZcKZ2r1dZcv4xL8GjFMr+tWQ7njDwaxonJgvY8au1H63H0Zb6jVeUwGWVmZpVk0DsOyLeb5TSEOKFgUHbw3niFBDPxMJHLr+/wTRznoTxMjSHFV4hIWCty3sOM5WaaE+dsIUzy+9o3O2M2590OQLwM6zZuRAL7AbelQHsQcOxadSs/VvEluQ3JwdNVU+p4G5lWspWnY0/MCE8M+82I/bSMc01vERIhY73iJFjxXCds53HONJTGpaegPHKfnU3Zq08trdao2+wGJ9B1Qsr3OR6++00H9wAcyeWO+kb5KbEm/W2WRrAgqepJnJkrJ+gotedF7YSPmUb1oF6kFHYoQlPcNXJLz84W3dahkoCX/Cv6O4sUwpSmOUJczCCo3a9/2Lvm1SXkXm1P54Q== /home/collin/.ssh/id_rsa"
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQD6dR6xkWBmBvcyNxhdy8usZ2mG9C5WioIEv7CFfDVzDnt+uAkgDhQMdD6Bla8zqgNf7WpXhInLjFSDweP6CwP345Wd9ovpnrJgCzwAEQS/wAyQHt/ow90CbZCkPiZsrnP7yo1OjYJFKgjxmKLUzhj/or6JeeUvgd6gVWVzOYj4/39BJiyslBEMHILCHQ0co+TYQqOsQ46wlFSYme6Tw9e7sOG42NQk8xLeOeE1AHFuWdHTJzQagEa3vCzVQsF8S96TKb46D3esPNZrXvSs47Q6w5YfDeNvC9llTmR1X1WjJU3r7fI0TGy0iFg59de0kWrp923okyUXR3S3kstKUMwZcF3/Xr3X2dsFURUNB7xBbvS2bWqBX5wVUM3GikV0Cp6y8R2PLfexWZG4BtlORoy9MCgPLLGKZ9hVJWDkau5MoDGlRVe8QYTmovNf9wq/pFamApt+aZjl7VOFlVdwCYF8K8eNWQIsKCjAdFpVoaGsgNSALGLVu7uosZY2MWDcvZJZJ7ssvC+BL5MA8GpedbkwKGoQ8VuRGlaItWMSa20uwWK64vQGZ+QLNPYfBQ6mgbM40Zb0DMZbZuVfE5mUS45oHBL+IE1/Mr6ENIEL3rK8Fqe3ZT5jfIddZSfQh1WD9vNZ7w5TZNjiW+Dh4rC/OpJ7XFutddQkoqRfaw6BlHCr5Q== cardno:000611027290"
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCypDAXTrZPrjnnuNcd9cNyLVAsk5vjl1tTU9pUGrBwDq3Rg0D7RGskCLMrQULdmzxStxnq6OAixwlg7l4YYpsKDE5LX+QGKOmLTn4m7SWoX/7vLr7tHQuigB1d5hqr34xPbI6SwaFY/O8Q+CowSA6GH6aoNjNxqD3rs2aw3cT5CUtrQufsQwZ6vYcrf36YxTcZca7fzwxHA1F4Z0qdjm1S0TunnoLR8P1CWwVs7ftsMsEymYX4YQvQuZechhvBzUoe3+d3bdHHXtto7Eh9xEGYP1mNy/1Tui8Ru2lAt5v49B6mDlUe3o5DSqxJZkJbqOfLTmUdt2s3XlMYbuqzvWwN /home/collin/.ssh/etc_deploy_key"
    ];
  };

  # networking.firewall = {
  #   enable = true;
  #   allowedTCPPorts = [ 22 ];
  #   allowedUDPPorts = [ 51820 ];
  #   # For Mosh
  #   allowedUDPPortRanges = [
  #     { from = 60000; to = 61000; }
  #   ];
  # };

  # services.syncthing.guiAddress = "0.0.0.0:8384";

  services.openssh.enable = true;
  services.openssh.sftpServerExecutable = "internal-sftp";

  virtualisation = {
    waydroid.enable = true;
    lxd.enable = true;
  };

  # fileSystems = {
  #   # SD card
  #   "/sdcard" = {
  #     device = "/dev/disk/by-uuid/00b4681f-37f2-4fc7-81ec-a8a53e761d5b";
  #     fsType = "ext4";
  #     # It's okay if it's missing, automounted on access
  #     options = [ "nofail" "x-systemd.automount" ];
  #   };
  # };

  # home-manager.users.collin.home.packages = with pkgs; [
  #   pkgs.moonlight-qt
  # ];

  programs.steam.enable = true;

  # Use a remote machine for builds
  nix = {
    distributedBuilds = true;
    buildMachines = [
      {
        hostName = "192.168.42.129";
        system = "x86_64-linux";
        protocol = "ssh";
      }
    ];
  };
  system.stateVersion = "23.05";
}

