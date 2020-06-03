(self: super:
	{
		mkRustCrate = super.callPackage ./mkRustCrate/lib/mkRustCrate {
			inherit (super) cargo rustc;
		};
		fetchFromCratesIo = super.callPackage ./mkRustCrate/lib/fetchFromCratesIo {
		};
	}
)
