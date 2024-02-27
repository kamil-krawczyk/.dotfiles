{ config, lib, inputs, ... }:

with lib;

{
  security.pki.certificateFiles = [ ]
    ++ optional (builtins.elem "macro-system" config.host.locations) "${builtins.toString inputs.secrets}/home/kkrawczyk/macro.local.cer.pem";
}
