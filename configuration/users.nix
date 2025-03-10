{ config, pkgs, ... }:
{
  security.sudo.extraRules = [
    { users = [ "gleask" ];
      commands = [
        { command = "ALL";
          options = [ "NOPASSWD" ];
        }
      ];
    }
  ];
}