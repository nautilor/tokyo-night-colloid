{ stdenvNoCC }:

stdenvNoCC.mkDerivation {
  pname = "tokyo-night-colloid-kvantum";
  version = "1.0";

  src = ../kvantum;

  dontConfigure = true;
  dontBuild = true;

  installPhase = ''
    runHook preInstall

    mkdir -p $out/share/Kvantum
    cp -r tokyo-night-colloid $out/share/Kvantum/

    runHook postInstall
  '';

  meta = {
    description = "Tokyo Night Kvantum theme inspired by Colloid";
  };
}
