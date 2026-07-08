{ stdenvNoCC }:

stdenvNoCC.mkDerivation {
  pname = "tokyo-night-colloid-gtk";
  version = "1.0";

  src = ../gtk;

  dontConfigure = true;
  dontBuild = true;

  installPhase = ''
    runHook preInstall

    mkdir -p $out/share/themes
    cp -r tokyo-night-colloid $out/share/themes/

    runHook postInstall
  '';

  meta = {
    description = "Tokyo Night GTK theme inspired by Colloid";
  };
}
