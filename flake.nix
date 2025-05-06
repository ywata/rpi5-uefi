{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, utils }:
    utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };

        # Define the custom-as package
        customAs = pkgs.runCommand "custom-as" {} ''
          mkdir -p $out/bin
          cp ${./bin/as} $out/bin/as
          chmod +x $out/bin/as
        '';
      in
      {
        packages.default =
          pkgs.stdenv.mkDerivation {
            name = "my-package";
            src = ./.;
            nativeBuildInputs = with pkgs; [
              openssl
              customAs
              git
              dtc
              acpica-tools
              python312
              python312Packages.pyelftools
              libuuid
            ];
          };
      });
}
