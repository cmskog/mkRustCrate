function upper {
    local x="${1//-/_}"
    echo "${x^^}"
}

function lower {
    local x="${1//_/-}"
    echo "${x,,}"
}

function crate_hash {
    local x=$(basename "$1")
    echo "${x%%-*}"
}

function crate_name {
    local name=$(basename "${1#*-}")
    echo "${name//-/_}"
}

function flags {
    for dep in ${!1}
    do
        local name=$(crate_name $dep)
        local hash=$(crate_hash $dep)
        echo "-L $dep/lib"
        echo "--extern $name=$dep/lib/lib$name-$hash.rlib"
    done
}

function filext {
    local ext="$(basename $1)"
    echo ${ext#*.}
}

function copy_or_link {
    local src="$1"; shift
    local dest="$1"; shift
    [ -L "$src" ] \
        && cp -dn "$src" "$dest" \
        || ln -s "$src" "$dest" &> /dev/null || true
}

function parse_depinfo {
    cat "$@" | while read line
    do
        [[ "x$line" =~ xcargo:([^=]+)=(.*) ]] || continue
        local key="${BASH_REMATCH[1]}"
        local val="${BASH_REMATCH[2]}"

        case $key in
            rustc-link-lib) ;&
            rustc-flags) ;&
            rustc-cfg) ;&
            rustc-env) ;&
            rerun-if-changed) ;&
            rerun-if-env-changed) ;&
            warning)
            ;;
            rustc-link-search)
                printf 'NIX_RUST_LINK_FLAGS+="${NIX_RUST_LINK_FLAGS:+ }"-L%q\n' "$val"
                ;;
            *)
                printf 'export DEP_%s_%s=%q\n' \
                       "$(upper $CARGO_LINKS)" \
                       "$(upper $key)" \
                       "$val"
        esac
    done
}

function dep_renaming {
    local dep_type=$1
    local -n deparr=$2
    local is_renamed=

    # We need a mechanism for "renaming" crate imports
    # See "Renaming dependencies in Cargo.toml"("Specifying Dependencies")
    # in the Cargo Book
    # It is very simplistic for now: just put a string before the reference
    # to the dependency
    # Save up these renamings in an array(deparr) in a pass before handling
    # the dependencies.
    #
    for dep in ${!dep_type}
    do
        # First check for null dependency
        #
        # If an null dependency was denoted, i.e. we were given '-' as
        # a dependency, then just clear potential is_renamed renaming
        # '-' is chosen because:
        # 1. It will not be changed in shell expansion from the Nix expression
        #    down to shell scripts.
        # 2. Hyphens seems to be invalid in Rust dependency renamings
        # 3. A single hyphen is not a valid nix package name
        if [[ "$dep" == '-' ]]
        then
            is_renamed=

        # FIXME: Crude hack for now: if this a directory, then assume this is
        # a dependency package. Would be nice to really check that this is a
        # valid nix package.
        elif [[ -d $dep ]]
        then
            if [[ "$is_renamed" ]]
            then
                deparr[$dep]="$is_renamed"
                is_renamed=
            else
                deparr[$dep]=
            fi

        # If $dep is not a null dependency nor a nix package,then it must be
        # a renaming
        else
            if [[ "$is_renamed" ]]
            then
                echo "Redundant renaming ignored: '$is_renamed'" >&2
            fi
            is_renamed="$dep"
        fi
    done

    if [[ "$is_renamed" ]]
    then
        echo "Extraneous renaming ignored: '$is_renamed'" >&2
        is_renamed=
    fi
}
