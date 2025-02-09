# DOT_NiceMath.jl


## Version History
Time goes up!

#### **v0.3.1**  added missing `∏` in `export`s


#### **v0.3**    API breaking: Calling signature of ⨂ changed!

* `⨂` (bigotimes) now uses `mapreduce` for, I hope, type stability.  This means, it can no longer
  accept an empty (i.e., `isempty()`) positional argument without giving the `init` keyword argument.

* added `norm₁()`

#### **v0.2**    Added `norm₂`, `norm₂²`

#### **v0.1.7**  NumbersF64 ➨ Numbers64

#### **v0.1.6**  Added abs²()

#### **v0.1.5**  ℤ,ℚ in `NumbersF64` are now Int64-based

Maybe this will speed up comparisons between ℚs...

#### **v0.1.4**  Removed silly "Manifest.toml" from repo

#### **v0.1.3**  Added `sgn() ::Int8` function

#### **v0.1.2**  Added 1st tests
* Bug fixed `⨂`

#### **v0.1.1**  First draft of ⊗, ⨂
* `⊗` is LinearAlgebra's `kron`
* `⨂(blah) = ⊗(blah...)`
* Number submodules now also export 𝒊π


#### **v0.1.0** Initial version
* Basic stuff
* No tests yet

