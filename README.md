# Tokyo Night Colloid

A [Tokyo Night](https://github.com/enkia/tokyo-night-vscode-theme)-inspired GTK and Kvantum theme built on top of the [Colloid](https://github.com/vinceliuice/Colloid-gtk-theme) theme by [vinceliuice](https://github.com/vinceliuice).

## Contents

| Package | Install path |
|---|---|
| `gtk` | `$out/share/themes/tokyo-night-colloid` |
| `kvantum` | `$out/share/Kvantum/tokyo-night-colloid` |
| `default` | both of the above, joined |

## Installation on NixOS

This repository exposes Nix packages via `flake.nix`. The recommended approach is to consume it through your system flake.

### 1. Add as a flake input

In your `flake.nix`:

```nix
{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    tokyo-night-colloid = {
      url = "github:nautilor/tokyo-night-colloid";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
}
```

### 2. Build the packages

The `flake.nix` in this repo is a plain Nix expression (not a standard flake output) designed to be called with `callPackage`. From your own flake's `outputs`, evaluate it by passing `pkgs`:

```nix
outputs = { nixpkgs, tokyo-night-colloid, ... }:
let
  pkgs = import nixpkgs { system = "x86_64-linux"; };
  themes = pkgs.callPackage "${tokyo-night-colloid}" {};
in {
  # themes.gtk      → GTK theme only
  # themes.kvantum  → Kvantum theme only
  # themes.default  → both combined
};
```

### 3. Add to your configuration

#### NixOS (`configuration.nix`)

```nix
environment.systemPackages = [ themes.default ];
```

#### Home Manager (`home.nix`)

```nix
home.packages = [ themes.default ];

# Apply the GTK theme
gtk = {
  enable = true;
  theme = {
    name = "tokyo-night-colloid";
    package = themes.gtk;
  };
};
```

#### Kvantum (Qt)

Install the Kvantum manager and select the `palette-tokyo-dark` theme:

```nix
home.packages = with pkgs; [
  themes.kvantum
  libsForQt5.qtstyleplugin-kvantum
];

qt = {
  enable = true;
  style.name = "kvantum";
};
```

Then open `kvantummanager` and select **palette-tokyo-dark** from the installed themes.

## Credits

This theme is based on the [Colloid GTK Theme](https://github.com/vinceliuice/Colloid-gtk-theme) by [vinceliuice](https://github.com/vinceliuice), adapted to the [Tokyo Night](https://github.com/enkia/tokyo-night-vscode-theme) color palette.

## License

Refer to the upstream [Colloid license](https://github.com/vinceliuice/Colloid-gtk-theme/blob/master/LICENSE).
