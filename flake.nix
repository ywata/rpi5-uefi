{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, utils }:
    utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
      in
      {
        packages.default =
        let
          pkgs = import nixpkgs { inherit system; };
        in
          pkgs.stdenv.mkDerivation {
            name = "my-package";
            src = ./.;
            #nativeBuildInputs = [ pkgs.git pkgs.dtc pkgs.acpica-tools pkgs.python312 pkgs.python312Packages.pyelftools pkgs.python3 I];
            nativeBuildInputs = with pkgs; [ git  dtc acpica-tools python312 python312Packages.pyelftools libuuid gnumake42];
        };
 

      });
}
