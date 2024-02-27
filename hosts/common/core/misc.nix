{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    tcpdump
    nmap
    ldns

    htop
    iotop
    iftop

    strace
    ltrace
    lsof
  ];
}
