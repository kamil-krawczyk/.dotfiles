{ pkgs, ... }:
{
  environment = {
    variables.EDITOR = "hx";
    systemPackages = with pkgs; [ helix ];
  };
}
