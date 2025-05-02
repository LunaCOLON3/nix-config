{
  lib,
  fetchFromGitHub,
  jdk8,
  makeWrapper,
  maven,
  libxkbcommon,
  xorg,
  ...
}:

maven.buildMavenPackage rec {
  pname = "ninjabrain-bot";
  version = "1.5.1";

  src = fetchFromGitHub {
    owner = "Ninjabrain1";
    repo = "Ninjabrain-Bot";
    rev = version;
    hash = "sha256-r8TpL3VLf2QHwFS+DdjxgxyuZu167fP6/lN7a8e9opM=";
  };

  mvnHash = "sha256-zAVPH5a7ut21Ipz5BUY6cnRLT52bM8Yo2r8ClFon1p0=";

  mvnDepsParameters = "assembly:single -DskipTests=true";
  mvnParameters = "assembly:single -DskipTests=true";

  nativeBuildInputs = [ makeWrapper ];

  installPhase = ''
    runHook preInstall

    mkdir -p $out/bin $out/share/ninjabrain-bot
    install -Dm644 target/ninjabrainbot-${version}-jar-with-dependencies.jar $out/share/ninjabrain-bot

    makeWrapper ${jdk8}/bin/java $out/bin/ninjabrain-bot \
      --prefix LD_LIBRARY_PATH : "${lib.makeLibraryPath [ libxkbcommon xorg.libX11 xorg.libXt ]}" \
      --add-flags "-jar $out/share/ninjabrain-bot/ninjabrainbot-${version}-jar-with-dependencies.jar"

    runHook postInstall
  '';
}
