{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
    nix-shared.url = "github:chadac/test-nixspace-nix-shared";
  };

  outputs = { flake-parts, ... }@inputs:
    flake-parts.lib.mkFlake { inherit inputs; } {
      perSystem = { pkgs, nix-shared, ... }: let
        lambda = nix-shared.buildPythonAwsLambda ./.;
        in {
          packages = {
            default = lambda;
            lambda-hello-world = lambda;
          };
        };
    };
}
