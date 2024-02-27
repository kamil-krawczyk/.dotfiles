{ pkgs, ... }:
{
  home.packages = with pkgs; [
    eza

    gzip
    zip
    unzip
    p7zip

    pciutils
    usbutils
    dmidecode
    ethtool

    htop
    strace
    ltrace
    lsof

    tcpdump
    nmap
    ldns
    socat
    netcat

    yed
  ];
}
