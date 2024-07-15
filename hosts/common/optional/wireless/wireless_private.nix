{ config, lib, inputs, ... }:

with lib;

let
  secretsPath = "${builtins.toString inputs.secrets}/hosts/common/private/secrets.yaml";
  interfaceName = config.host.wireless.interfaceName;
in
{
  config = mkIf (config.host.wireless.enable && builtins.elem "private" config.host.locations) {
    sops.secrets."wireless/home" = {
      sopsFile = secretsPath;
    };

    networking.networkmanager.ensureProfiles = {
      environmentFiles = [ config.sops.secrets."wireless/home".path ];
      # Convert .nmconnection files into nix code with use of https://github.com/janik-haag/nm2nix
      # sudo su -c "cd /etc/NetworkManager/system-connections && nix --extra-experimental-features 'nix-command flakes' run github:Janik-Haag/nm2nix"
      profiles = {

        "Krawczyk&Krawczyk2" = {
          connection = { id = "Krawczyk&Krawczyk2"; interface-name = interfaceName; type = "wifi"; uuid = "739765f1-ef25-47c7-ba19-0099faf12d82"; };
          ipv4 = { method = "auto"; };
          ipv6 = { addr-gen-mode = "default"; method = "disabled"; };
          proxy = { };
          wifi = { mode = "infrastructure"; ssid = "Krawczyk&Krawczyk2"; };
          wifi-security = { auth-alg = "open"; key-mgmt = "wpa-psk"; psk = "$KrawczykAndKrawczyk"; };
        };

        "Krawczyk&Krawczyk5" = {
          connection = { id = "Krawczyk&Krawczyk5"; interface-name = interfaceName; type = "wifi"; uuid = "be1dddb8-8c41-41e1-8906-4172eaaba828"; };
          ipv4 = { method = "auto"; };
          ipv6 = { addr-gen-mode = "default"; method = "disabled"; };
          proxy = { };
          wifi = { mode = "infrastructure"; ssid = "Krawczyk&Krawczyk5"; };
          wifi-security = { auth-alg = "open"; key-mgmt = "wpa-psk"; psk = "$KrawczykAndKrawczyk"; };
        };

        "Orange_Swiatlowod_1270" = {
          connection = { id = "Orange_Swiatlowod_1270"; interface-name = interfaceName; type = "wifi"; uuid = "5d9ed08d-9397-4ed1-9ff7-2374d4c53399"; };
          ipv4 = { method = "auto"; };
          ipv6 = { addr-gen-mode = "default"; method = "disabled"; };
          proxy = { };
          wifi = { mode = "infrastructure"; ssid = "Orange_Swiatlowod_1270"; };
          wifi-security = { auth-alg = "open"; key-mgmt = "wpa-psk"; psk = "$Orange_Swiatlowod_1270"; };
        };

      };
    };
  };
}
