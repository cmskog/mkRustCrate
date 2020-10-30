{ name, version, ... } @ args:
let
  args' = builtins.removeAttrs args ["name" "version"];
in
  builtins.fetchTarball ({
    name = "${name}-${version}.crate";
    url = "https://crates.io/api/v1/crates/${name}/${version}/download";
  } // args')
