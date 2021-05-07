{ name, version, cratelocation ? null, ... } @ args:
let
  args' = builtins.removeAttrs args ["name" "version" "cratelocation"];
  crateinfo = {
    name = "${name}-${version}.crate";
    } // args';
in
    if cratelocation == null ||
       cratelocation == "remoteregistry"
    then
      builtins.fetchTarball ({
        url = "https://crates.io/api/v1/crates/${name}/${version}/download";
      } // crateinfo)
    else if cratelocation == "localcargosrc"
    then
      builtins.path ({
        path = (/. + (builtins.getEnv "HOME")  + "/.cargo/registry/src/github.com-1ecc6299db9ec823/${name}-${version}");
        filter = (path: type: type != "regular" || baseNameOf path != ".cargo-ok");
        recursive = true;
      } // crateinfo)
    else if cratelocation == "localcargocrate"
    then
      builtins.fetchTarball ({
        url = ("file://" + (builtins.getEnv "HOME")  + "/.cargo/registry/cache/github.com-1ecc6299db9ec823/${name}-${version}.crate");
      } // crateinfo)
    else
      builtins.abort "fetchFromCratesIo(${crateinfo.name}): invalid cratelocation: ${cratelocation}"
