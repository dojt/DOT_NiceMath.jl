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
        @test 1               == ⨂( j^2 for j=1:10 if j==π )
        @test 3^2             == ⨂( j^2 for j=3:10 if j≤ π )
        @test 3^2*4^2*5^2*6^2 == ⨂( j^2 for j=3:10 if j≤2π )
    end
end








@testset verbose=true "Testing DOT_NiceMath.jl" begin
    test__⨂()

    @testset "A broken test:" begin
        @test Schnickschnack! skip=true
    end
end

#runtests.jl
#EOF
