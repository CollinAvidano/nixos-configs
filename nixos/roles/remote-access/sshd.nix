{ config, pkgs, ... }:

{
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [ 22 ];
    # For Mosh
    allowedUDPPortRanges = [
      { from = 60000; to = 61000; }
    ];
  };

  services.openssh = {
    enable = true;
    #sftpServerExecutable = "internal-sftp";
    settings.PermitRootLogin = "prohibit-password";
    settings.PasswordAuthentication = false;
  };

  environment.systemPackages = with pkgs; [
    mosh
  ];

  users.users.collin = {
    openssh.authorizedKeys.keys = [
    ];
  };
  users.users.root = {
    openssh.authorizedKeys.keys = [
    ];
  };
}
