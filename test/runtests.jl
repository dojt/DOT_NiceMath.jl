########################################################################
#                                                                      #
# DOT_NiceMath/test/runtests.jl                                        #
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


using DOT_NiceMath

using Test

function test__⨂()
    @testset verbose=true "Testing ⨂" begin
        @test 1               == ⨂( j^2 for j=1:10 if j==π ; init=1)
        @test 3^2             == ⨂( j^2 for j=3:10 if j≤ π )
        @test 3^2*4^2*5^2*6^2 == ⨂( j^2 for j=3:10 if j≤2π )
    end
end

function test_sgn()
    @testset verbose=true "Testing `sgn()`" begin
        @test Int8(+1) == sgn(3.2e-99)
        @test Int8(+1) == sgn(123//4567)
        @test Int8(+1) == sgn(3)
        @test Int8(-1) == sgn(-2.3e-99)
        @test Int8(-1) == sgn(-123//4567)
        @test Int8(-1) == sgn(-3)
        @test Int8( 0) == sgn(-0.0)
        @test Int8( 0) == sgn(+0.0)
        @test Int8( 0) == sgn(0//1)
        @test Int8( 0) == sgn(-0//1)
    end
end

function test_abs²()
    @testset verbose=true "Testing `abs²()`" begin
        @test abs²(-2)   == 4
        @test abs²(-3im) == 9
        @test abs²(-√7)  ≈ 7
    end
end
function test_norm₂()
    @testset verbose=true "Testing `norm₂(), norm₂²()`" begin
        @test norm₂²([-1,+1])        == 2
        @test norm₂²([1-im, -1-im])  == 4
        @test norm₂²([-√7-im, √5-im]) ≈ 14

        @test norm₂([-1,-1])      ≈  √2
        @test norm₂([1-im, 1+im]) ≈  2
        @test norm₂([-√7-im, √5+im])  ≈ √14
    end
end


module _Test_Numbers64
using DOT_NiceMath.Numbers64
using ..Test
@test sizeof(ℤ) == 8
end

module _Test_Numbers64_legacy
using DOT_NiceMath.NumbersF64
using ..Test
@test sizeof(ℤ) == 8
end


@testset verbose=true "Testing DOT_NiceMath.jl" begin
    test__⨂()
    test_sgn()
    test_abs²()
    test_norm₂()

    @testset "A broken test:" begin
        @test Schnickschnack! skip=true
    end
end

#runtests.jl
#EOF
