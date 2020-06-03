{ pkgs ? import <nixpkgs> {} }:
    let
      mkRustCrate = pkgs.callPackage ../../mkRustCrate/lib/mkRustCrate {
        inherit (pkgs) cargo rustc;
      };
      fetchFromCratesIo = pkgs.callPackage ../../mkRustCrate/lib/fetchFromCratesIo { };
    in
    rec {
# "rusttype 0.7.9 (registry+https://github.com/rust-lang/crates.io-index)": dependency applicable in the following cfgs: ""
rusttype-0-7-9--registry-https---github-com-rust-lang-crates-io-index- = mkRustCrate rec {
    name = "rusttype";
    version = "0.7.9";
    src = fetchFromCratesIo {
      inherit name version;
      sha256 = "1j3iwirvq0j7mv1xnc1bvyz4hwijhmkgd0b8q983jbyw9sj7wxzn";
    };
    dependencies = [
[
	"rusttype_next" rusttype-0-8-3--registry-https---github-com-rust-lang-crates-io-index-
]
    ];
    buildDependencies = [

    ];
    devDependencies = [

    ];
    features = [

    ];
  };
# "rusttype 0.8.3 (registry+https://github.com/rust-lang/crates.io-index)": dependency applicable in the following cfgs: ""
rusttype-0-8-3--registry-https---github-com-rust-lang-crates-io-index- = mkRustCrate rec {
    name = "rusttype";
    version = "0.8.3";
    src = fetchFromCratesIo {
      inherit name version;
      sha256 = "17ig2ig85arr725zbaa8zd0bysfqdm59slxsxvbx6rkmjwy4vpg6";
    };
    dependencies = [
approx-0-3-2--registry-https---github-com-rust-lang-crates-io-index-
ordered-float-1-0-2--registry-https---github-com-rust-lang-crates-io-index-
stb-truetype-0-3-1--registry-https---github-com-rust-lang-crates-io-index-
    ];
    buildDependencies = [

    ];
    devDependencies = [

    ];
    features = [
"default"
"has-atomics"
"std"
    ];
  };
# "approx 0.3.2 (registry+https://github.com/rust-lang/crates.io-index)": dependency applicable in the following cfgs: ""
approx-0-3-2--registry-https---github-com-rust-lang-crates-io-index- = mkRustCrate rec {
    name = "approx";
    version = "0.3.2";
    src = fetchFromCratesIo {
      inherit name version;
      sha256 = "1sziapqxz6qk1m3bv4pay1bfqv887pf6045qfg913ip4jmyv8fcb";
    };
    dependencies = [
num-traits-0-2-11--registry-https---github-com-rust-lang-crates-io-index-
    ];
    buildDependencies = [

    ];
    devDependencies = [

    ];
    features = [

    ];
  };
# "ordered-float 1.0.2 (registry+https://github.com/rust-lang/crates.io-index)": dependency applicable in the following cfgs: ""
ordered-float-1-0-2--registry-https---github-com-rust-lang-crates-io-index- = mkRustCrate rec {
    name = "ordered-float";
    version = "1.0.2";
    src = fetchFromCratesIo {
      inherit name version;
      sha256 = "1bwjh1gkh2n6zqb2q1a04gkskgz3hxbj3w7fvhx6yd7l0nbmbd1b";
    };
    dependencies = [
num-traits-0-2-11--registry-https---github-com-rust-lang-crates-io-index-
    ];
    buildDependencies = [

    ];
    devDependencies = [

    ];
    features = [

    ];
  };
# "stb_truetype 0.3.1 (registry+https://github.com/rust-lang/crates.io-index)": dependency applicable in the following cfgs: ""
stb-truetype-0-3-1--registry-https---github-com-rust-lang-crates-io-index- = mkRustCrate rec {
    name = "stb_truetype";
    version = "0.3.1";
    src = fetchFromCratesIo {
      inherit name version;
      sha256 = "1aa3jjx8ga7i02v64kjcf3xkr2b60znqmqzickx1l42wb28qwm5l";
    };
    dependencies = [
byteorder-1-3-4--registry-https---github-com-rust-lang-crates-io-index-
    ];
    buildDependencies = [

    ];
    devDependencies = [

    ];
    features = [
"std"
    ];
  };
# "num-traits 0.2.11 (registry+https://github.com/rust-lang/crates.io-index)": dependency applicable in the following cfgs: ""
num-traits-0-2-11--registry-https---github-com-rust-lang-crates-io-index- = mkRustCrate rec {
    name = "num-traits";
    version = "0.2.11";
    src = fetchFromCratesIo {
      inherit name version;
      sha256 = "0vr6ca475yglxdz7qriasdziq0cqn54z0z1xkmiqlnjx30plwmbl";
    };
    dependencies = [

    ];
    buildDependencies = [
autocfg-1-0-0--registry-https---github-com-rust-lang-crates-io-index-
    ];
    devDependencies = [

    ];
    features = [
"default"
"std"
    ];
  };
# "byteorder 1.3.4 (registry+https://github.com/rust-lang/crates.io-index)": dependency applicable in the following cfgs: ""
byteorder-1-3-4--registry-https---github-com-rust-lang-crates-io-index- = mkRustCrate rec {
    name = "byteorder";
    version = "1.3.4";
    src = fetchFromCratesIo {
      inherit name version;
      sha256 = "1hi7ixdls5qssw39wgp1gm8d20yjghgawc3m4xr2wkxmxsv08krz";
    };
    dependencies = [

    ];
    buildDependencies = [

    ];
    devDependencies = [

    ];
    features = [
"default"
"std"
    ];
  };

# "autocfg 1.0.0 (registry+https://github.com/rust-lang/crates.io-index)": dependency applicable in the following cfgs: ""
autocfg-1-0-0--registry-https---github-com-rust-lang-crates-io-index- = mkRustCrate rec {
    name = "autocfg";
    version = "1.0.0";
    src = fetchFromCratesIo {
      inherit name version;
      sha256 = "1hhgqh551gmws22z9rxbnsvlppwxvlj0nszj7n1x56pqa3j3swy7";
    };
    dependencies = [

    ];
    buildDependencies = [

    ];
    devDependencies = [

    ];
    features = [

    ];
  };
    }
