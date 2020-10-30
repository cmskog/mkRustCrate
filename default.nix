(self: super:
	{
		mkRustCrate = super.callPackage ./mkRustCrate/lib/mkRustCrate {};
		fetchFromCratesIo = import ./mkRustCrate/lib/fetchFromCratesIo;
	}
)
