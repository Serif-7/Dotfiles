{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    zig-overlay.url = "github:mitchellh/zig-overlay";
  };
  outputs =
    { nixpkgs, zig-overlay, ... }:
    {
      devShells.x86_64-linux =
        let
          pkgs = import nixpkgs {
            system = "x86_64-linux";
            overlays = [ zig-overlay.overlays.default ];
          };
        in
        {
          default = pkgs.mkShell { packages = [ pkgs.zigpkgs."0.13.0" ]; };
        };
    };
}
