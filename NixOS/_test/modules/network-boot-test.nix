{ config, pkgs, ... }:

let
  username = config.phip1611.username;
in
{
  phip1611.network-boot.enable = true;
  phip1611.network-boot.tftpRoot = "/tftpboot";
  phip1611.network-boot.interfaces = [
    {
      interface = "enp4s0";
      hostIp = "192.168.44.100";
      testboxIp = "192.168.44.101";
      hostnameAlias = "testbox";
    }
    {
      interface = "enp4s1";
      hostIp = "192.168.44.200";
      testboxIp = "192.168.44.201";
      hostnameAlias = "testbox2";
    }
  ];
}
