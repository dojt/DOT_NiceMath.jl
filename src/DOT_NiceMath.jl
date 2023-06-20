########################################################################
#                                                                      #
# DOT_NiceMath.jl                                                      #
#                                                                      #
# (c) Dirk Oliver Theis 2023                                           #
#                                                                      #
#                                                                      #
# License:                                                             #
#                                                                      #
#             CC-by                                                    #
#                                                                      #
#             Creative Commons, share with attribution                 #
#                                                                      #
########################################################################

@doc raw"""
Module `DOT_NiceMath`

Exports definitions of constants that make math in Julia look even more like acutal math.

# Exports

## General
* `⋅` (`\cdot`) — multiplication (`Base.:*`)
* `¬` (`\neg`) — negation (`Base.:!`)
* `∑` (`\sum`) — summation (`Base.sum`)
* `∏` (`\prod`) — product (`Base.prod`)
* `ℜ`, `ℑ` (`\Re`,`\Im`) — real and imaginary part (`Base.real`, `Base.imag`)

* `⊗` (`\otimes`) — matrix tensor/kronecker product (`LinearAlgebra.kron`)
* `⨂` (`\bigotimes`) — tensoration: should behave like `∑` and `∏`.

## Number definitions (in sub-modules `Numbers`𝑥𝑦𝑧)
* `ℝ`, `ℂ` — floating point types; `ℂ === Complex{ℝ}`
* `ℤ, `ℚ`  — integer-based types; `ℚ === Rational{ℤ}`
* `𝒊 ::ℂ` (`\bii`) — imaginary unit
* `π𝒊 ::ℂ`, `𝒊π ::ℂ`
* `∞ ::ℝ`  (`Inf`)

# Sub-modules

Sub-module names are not exported by `DOT_NiceMath`.

* `DOT_NiceMath.NumbersF64`: Provices number definitions based on `Float64` and `Int128`.
* `DOT_NiceMath.NumbersBig`: Provices number definitions based on `BigInt` and `BigFloat`.
"""
module DOT_NiceMath
export ⋅, ¬, ∑, ℜ, ℑ
export ⊗, ⨂
export sgn
export abs²

import Base.:*            ; const ⋅    = Base.:*

import Base.:!            ; const ¬    = Base.:!

import Base.sum           ; const ∑    = Base.sum
import Base.prod          ; const ∏    = Base.prod

import Base.real          ; const ℜ    = Base.real
import Base.imag          ; const ℑ    = Base.imag

import LinearAlgebra
import LinearAlgebra.kron ; const ⊗    = LinearAlgebra.kron

import Base.abs2          ; const abs² = Base.abs2


function ⨂(blah)
    if isempty( blah )  return 1   end
    (tp,rest...) = blah
    if isempty( rest )  return tp  end
    # length of blah ≥2:
    return ⊗(blah...)
end

sgn(x)::Int8 = Int8(sign(x))

module NumbersF64
	export ℤ, ℚ, ℝ, ℂ, 𝒊, 𝒊π, π𝒊, ∞

	const ℤ  = Int64
	const ℝ  = Float64

	const ℚ  = Rational{ℤ}
	const ℂ  = Complex{ℝ}
	const 𝒊  = ℂ(im)
	const π𝒊 = π*𝒊
	const 𝒊π = 𝒊*π

	const ∞ = ℝ(Inf)
end #^ module NumbersF64

module NumbersBig
	export ℤ, ℚ, ℝ, ℂ, 𝒊, 𝒊π, π𝒊, ∞

	const ℤ  = BigInt
	const ℝ  = BigFloat

	const ℚ  = Rational{ℤ}
	const ℂ  = Complex{ℝ}
	const 𝒊  = ℂ(im)
	const π𝒊 = π*𝒊
	const 𝒊π = 𝒊*π

	const ∞ = ℝ(Inf)
end #^ module NumbersBig

end #^ module DOT_NiceMath
# EOF
