{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    systems.url = "github:nix-systems/default";
    flake-parts.url = "github:hercules-ci/flake-parts";
    nix-shared.url = "github:chadac/test-nixspace-nix-shared";
  };

  outputs = { flake-parts, systems, ... }@inputs:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = import systems;
      perSystem = { pkgs, system, ... }: let
        shared = import inputs.nix-shared { inherit pkgs; };
        lambda = pkgs.callPackage ./. { inherit shared; };
        in {
          packages = {
            default = lambda;
            lambda-hello-world = lambda;
          };
        };
    };
}
