{pkgs ? import <nixpkgs> {
    inherit system;
  },
  system ? builtins.currentSystem
  }:

let

    stdenv = pkgs.stdenv;

in stdenv.mkDerivation rec {

    name = "ramdisk";
    src = ./src;
    buildInputs = [ pkgs.makeWrapper pkgs.which ];
    installPhase = ''
        mkdir -p $out/bin
        makeWrapper ${src}/ramdisk $out/bin/ramdisk --suffix PATH : $src
    '';

}