let
  gtk = pkgs.callPackage ./pkgs/gtk.nix {};
  kvantum = pkgs.callPackage ./pkgs/kvantum.nix {};
in {
  inherit gtk kvantum;

  default = pkgs.symlinkJoin {
    name = "tokyo-night-colloid";
    paths = [ gtk kvantum ];
  };
}
