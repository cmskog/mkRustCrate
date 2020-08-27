(self: super:
	{
		mkRustCrate = super.callPackage ./mkRustCrate/lib/mkRustCrate {};
		fetchFromCratesIo = super.callPackage ./mkRustCrate/lib/fetchFromCratesIo {};
	}
)
