{ pkgs ? import <nixpkgs> {} }:
    let
      mkRustCrate = pkgs.callPackage ../../mkRustCrate/lib/mkRustCrate {
        inherit (pkgs) cargo rustc;
      };
      fetchFromCratesIo = pkgs.callPackage ../../mkRustCrate/lib/fetchFromCratesIo;
    in
    rec {
# Package with pkgid: "proc-macro2 1.0.17 (registry+https://github.com/rust-lang/crates.io-index)"
# A dependency applicable for the following cfgs:
# "required"
proc-macro2-1-0-17--registry-https---github-com-rust-lang-crates-io-index- = mkRustCrate rec {
    name = "proc-macro2";
    version = "1.0.17";
    src = fetchFromCratesIo {
      inherit name version;
      sha256 = "1md8b4f88x481w8yngdvd34jc2g7270agknd4zdicjs3hq07afnv";
    };
    dependencies = [
unicode-xid-0-2-0--registry-https---github-com-rust-lang-crates-io-index-
    ];
    buildDependencies = [

    ];
    devDependencies = [

    ];
    features = [
"default"
"proc-macro"
    ];
  };
# Package with pkgid: "quote 1.0.6 (registry+https://github.com/rust-lang/crates.io-index)"
# A dependency applicable for the following cfgs:
# "required"
quote-1-0-6--registry-https---github-com-rust-lang-crates-io-index- = mkRustCrate rec {
    name = "quote";
    version = "1.0.6";
    src = fetchFromCratesIo {
      inherit name version;
      sha256 = "00d428fwiq1mify90g0a2wpqmnw002qdgm61jcs4fwk2lfmphd05";
    };
    dependencies = [
proc-macro2-1-0-17--registry-https---github-com-rust-lang-crates-io-index-
    ];
    buildDependencies = [

    ];
    devDependencies = [

    ];
    features = [
"default"
"proc-macro"
    ];
  };
# Package with pkgid: "serde 1.0.110 (registry+https://github.com/rust-lang/crates.io-index)"
# Root package
serde-1-0-110--path-file----Dev-alacritty-serde- = mkRustCrate rec {
    name = "serde";
    version = "1.0.110";
    src = fetchFromCratesIo {
      inherit name version;
      sha256 = "025ijwgy8c8b9savnvynbbpwdm8i5pdrvri05k07q61khmm6anap";
    };
    dependencies = [
serde-derive-1-0-110--registry-https---github-com-rust-lang-crates-io-index-
    ];
    buildDependencies = [

    ];
    devDependencies = [
serde-derive-1-0-110--registry-https---github-com-rust-lang-crates-io-index-
    ];
    features = [
"derive"
"serde_derive"
    ];
  };
# Package with pkgid: "serde_derive 1.0.110 (registry+https://github.com/rust-lang/crates.io-index)"
# A dependency applicable for the following cfgs:
# "required"
serde-derive-1-0-110--registry-https---github-com-rust-lang-crates-io-index- = mkRustCrate rec {
    name = "serde_derive";
    version = "1.0.110";
    src = fetchFromCratesIo {
      inherit name version;
      sha256 = "0n0gryh5nppibvqzdrwrd8gs35mfc65r7k4gzswjplihbh1hqbfn";
    };
    dependencies = [
proc-macro2-1-0-17--registry-https---github-com-rust-lang-crates-io-index-
quote-1-0-6--registry-https---github-com-rust-lang-crates-io-index-
syn-1-0-24--registry-https---github-com-rust-lang-crates-io-index-
    ];
    buildDependencies = [

    ];
    devDependencies = [

    ];
    features = [
"default"
    ];
  };
# Package with pkgid: "syn 1.0.24 (registry+https://github.com/rust-lang/crates.io-index)"
# A dependency applicable for the following cfgs:
# "required"
syn-1-0-24--registry-https---github-com-rust-lang-crates-io-index- = mkRustCrate rec {
    name = "syn";
    version = "1.0.24";
    src = fetchFromCratesIo {
      inherit name version;
      sha256 = "05wl9iix808ajigand9f8lpgpx7dg3xkfcqqwyqic8nsyvikw2j8";
    };
    dependencies = [
proc-macro2-1-0-17--registry-https---github-com-rust-lang-crates-io-index-
quote-1-0-6--registry-https---github-com-rust-lang-crates-io-index-
unicode-xid-0-2-0--registry-https---github-com-rust-lang-crates-io-index-
    ];
    buildDependencies = [

    ];
    devDependencies = [

    ];
    features = [
"clone-impls"
"default"
"derive"
"parsing"
"printing"
"proc-macro"
"quote"
"visit"
    ];
  };
# Package with pkgid: "unicode-xid 0.2.0 (registry+https://github.com/rust-lang/crates.io-index)"
# A dependency applicable for the following cfgs:
# "required"
unicode-xid-0-2-0--registry-https---github-com-rust-lang-crates-io-index- = mkRustCrate rec {
    name = "unicode-xid";
    version = "0.2.0";
    src = fetchFromCratesIo {
      inherit name version;
      sha256 = "1c85gb3p3qhbjvfyjb31m06la4f024jx319k10ig7n47dz2fk8v7";
    };
    dependencies = [

    ];
    buildDependencies = [

    ];
    devDependencies = [

    ];
    features = [
"default"
    ];
  };
    }
