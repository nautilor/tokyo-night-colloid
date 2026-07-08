{
  description = "Tokyo Night theme for GTK and Kvantum inspired by Colloid";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }:
    let
      lib = nixpkgs.lib;
      systems = [ "x86_64-linux" "aarch64-linux" ];
    in {
      packages = lib.genAttrs systems (system:
        let
          pkgs = import nixpkgs {
            inherit system;
          };

          gtk = pkgs.callPackage ./pkgs/gtk.nix { };
          kvantum = pkgs.callPackage ./pkgs/kvantum.nix { };
        in {
          inherit gtk kvantum;

          default = pkgs.symlinkJoin {
            name = "tokyo-night-colloid";
            paths = [ gtk kvantum ];
          };
        });
    };
}
