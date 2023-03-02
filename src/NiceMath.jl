########################################################################
#                                                                      #
# NiceMath.jl                                                          #
#                                                                      #
# (c) Dirk Oliver Theis 2022                                           #
#                                                                      #
#                                                                      #
# License:                                                             #
#                                                                      #
#             CC-by                                                    #
#                                                                      #
#             Creative Commons, share with attribution                 #
#                                                                      #
########################################################################

"""
Module `NiceMath`

Exports definitions of constants that make math in Julia look even more like acutal math.

# Exports

## General
* `⋅` (`\\cdot`) — multiplication (`Base.:*`)
* `¬` (`\neg`) — negation (`Base.:!`)
* `∑` (`\\sum`) — summation (`Base.sum`)
* `ℜ`, `ℑ` (`\\Re`,`\\Im`) — real and imaginary part (`Base.real`, `Base.imag`)

## Number definitions (in sub-modules `Numbers`𝑥𝑦𝑧)
* `ℝ`, `ℂ` — floating point types; `ℂ === Complex{ℝ}`
* `ℤ, `ℚ`  — integer-based types; `ℚ === Rational{ℤ}`
* `𝒊 ::ℂ` (`\\bii`) — imaginary unit
* `π𝒊 ::ℂ`, `𝒊π ::ℂ`
* `∞ ::ℝ`  (`Inf`)

# Sub-modules

Sub-module names are not exported by `NiceMath`.

* `NiceMath.NumbersF64`: Provices number definitions based on `Float64` and `Int128`.
* `NiceMath.NumbersBig`: Provices number definitions based on `BigInt` and `BigFloat`.
"""
module NiceMath
export ⋅, ¬, ∑, ℜ, ℑ

import Base.:*    ; const ⋅  = Base.:*

import Base.:!    ; const ¬  = Base.:!

import Base.sum   ; const ∑ = Base.sum

import Base.real  ; const ℜ  = Base.real
import Base.imag  ; const ℑ  = Base.imag

module NumbersF64
	export ℤ, ℚ, ℝ, ℂ, 𝒊, π𝒊, ∞

	const ℤ  = Int128
	const ℝ  = Float64

	const ℚ  = Rational{ℤ}
	const ℂ  = Complex{ℝ}
	const 𝒊  = ℂ(im)
	const π𝒊 = π*𝒊
	const 𝒊π = 𝒊*π

	const ∞ = ℝ(Inf)
end #^ module NumbersF64

module NumbersBig
	export ℤ, ℚ, ℝ, ℂ, 𝒊, π𝒊, ∞

	const ℤ  = BigInt
	const ℝ  = BigFloat

	const ℚ  = Rational{ℤ}
	const ℂ  = Complex{ℝ}
	const 𝒊  = ℂ(im)
	const π𝒊 = π*𝒊
	const 𝒊π = 𝒊*π

	const ∞ = ℝ(Inf)
end #^ module NumbersBig

end #^ module NiceMath
# EOF
