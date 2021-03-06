{ lib, substituteAll, runCommand, stdenv, cargo, rustc, bash, jq, remarshal }:
{ name
, version
, src
, dependencies ? []
, devDependencies ? []
, buildDependencies ? []
, features ? []
, doCheck ? false
, buildInputs ? []
, buildProfile ? "release"
, noDefaultFeatures ? false
, ...} @ args:
let
  args' = builtins.removeAttrs args ["features"];
  makeExecutable = f: runCommand "${f.name}-exec" { }
    ''
      cp ${f} $out
      chmod +x $out
    '';
  und = builtins.replaceStrings ["-"] ["_"];
  wrapper = cmd: makeExecutable (substituteAll {
    src = ./wrapper.sh;
    inherit bash cmd;
  });
in
stdenv.mkDerivation ({
  inherit buildProfile dependencies devDependencies buildDependencies;
  cargo = "${cargo}/bin/cargo";
  jq = "${jq}/bin/jq";
  remarshal = "${remarshal}/bin/remarshal";
  cargoFilter = ./cargo.jq;
  utils = ./util.sh;
  lockFile = substituteAll {
    src = ./Cargo.lock;
    crateName = name;
    crateVersion = version;
  };
  features = builtins.concatStringsSep " " features;
  buildPhase = ". ${./build.sh}";
  installPhase = ". ${./install.sh}";
  RUSTC = wrapper "${rustc}/bin/rustc";
  RUSTDOC = wrapper "${rustc}/bin/rustdoc";
} // args')
