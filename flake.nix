{
  description = "OS as a code";

  inputs = {
    # Official NixOS package sources
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    # Settings optimization for different hardware
    hardware.url = "github:NixOS/nixos-hardware/master";

    # User environment management
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Secrets management
    sops-nix = {
      url = "github:mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Private secrets
    secrets = {
      url = "git+ssh://git@github.com/kamil-krawczyk/.secrets.git?ref=main&shallow=1";
      flake = false;
    };
  };

  outputs = { self, ... } @ inputs:
    let
      inherit (self) outputs;

      systems = [ "x86_64-linux" ];

      forEachSystem = pkgs:
        inputs.nixpkgs.lib.genAttrs systems
          (system: pkgs (import inputs.nixpkgs { inherit system; }));

      mkSystem = config:
        inputs.nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs outputs; };
          modules = [ ./hosts/${config} ];
        };
    in
    {
      formatter = forEachSystem (pkgs: pkgs.nixpkgs-fmt);

      # Host configuration
      nixosConfigurations = {
        # Private laptop
        goku = mkSystem "goku";
        # Work desktop
        brolly = mkSystem "brolly";
        # Work laptop
        vegeta = mkSystem "vegeta";
      };
    };
}
