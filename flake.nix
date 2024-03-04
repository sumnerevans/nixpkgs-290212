{
  description = "Proof that 290212 affects the toolchain";
  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
    in {
      devShells.${system}.default = pkgs.mkShell {
        HOME = "/tmp/290212";
        packages = with pkgs; [ gopls go_1_22 ];
      };
    };
}
