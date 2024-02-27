{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    tcpdump
    wireshark
    nmap
    ldns

    htop
    iotop
    iftop

    strace
    ltrace
    lsof

    pv
  ];
}
