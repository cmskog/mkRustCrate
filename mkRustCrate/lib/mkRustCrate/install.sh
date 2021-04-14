shopt -s nullglob

source $utils

mkdir $out

cd "target/$buildProfile"

hash=$(crate_hash $out)
needs_deps=

for f in *
do
    ext=$(filext $f)

    case $(filext $f) in
        rlib)
            mkdir -p $out/lib
            cp $f $out/lib
            local dest=$out/lib/$(basename $f .rlib).depinfo
            touch "$dest"

            for depinfo in build/*/output
            do
                parse_depinfo $depinfo >> $dest
            done

            local -A depmap=()

            dep_renaming dependencies depmap

            for dep in ${!depmap[@]}
            do
                cat $dep/lib/*.depinfo >> $dest
            done

            needs_deps=1
            ;;
        a) ;&
        so)
            mkdir -p $out/lib
            cp $f $out/lib
            ;;
        *)
            if [ -x "$f" ] && ! [ -d "$f" ]
            then
                mkdir -p $out/bin
                cp $f $out/bin
            fi
            continue
            ;;
    esac
done

if [ "$needs_deps" ]
then
    cp -dr ../../deps $out/lib/
fi

if [ -d ../doc ]
then
    mkdir -p $out/share/doc
    cp -r ../doc $out/share/doc/html
fi
