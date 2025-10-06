{
  description = "Smithy CLI";

  inputs = {
    nixpkgs.url = "github:szympajka/nixpkgs/init-smithy";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = {
    nixpkgs,
    flake-utils,
    ...
  }:
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = nixpkgs.legacyPackages.${system};
    in
      with pkgs; {
        devShells.default = mkShell {
          packages = [smithy];
        };

        formatter = alejandra;
      });
}
