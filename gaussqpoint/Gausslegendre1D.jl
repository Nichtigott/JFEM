module Gausslegendre1D
using Plots
pyplot()
#import Plots

function creatgp(ngp=1)

    gpcoords = zeros(Float64, (ngp, 2))
    if ngp == 1

        gpcoords[1] = 2.0
        gpcoords[2] = 0.0
        return gpcoords

    elseif ngp == 2

        gpcoords[1] = 1.0
        gpcoords[2] = 1.0

        gpcoords[3] = -sqrt(1.0 / 3.0)
        gpcoords[4] = sqrt(1.0 / 3.0)
        return gpcoords

    elseif ngp == 3

        gpcoords[1] = 5.0 / 9.0
        gpcoords[2] = 8.0 / 9.0
        gpcoords[3] = 5.0 / 9.0

        gpcoords[4] = -sqrt(3.0 / 5.0)
        gpcoords[5] = 0.0
        gpcoords[6] = sqrt(3.0 / 5.0)
        return gpcoords

    elseif ngp == 4
        t = sqrt(4.8)
        w = 1.0 / 3.0 / t

        gpcoords[1] = 0.5 - w
        gpcoords[2] = 0.5 + w
        gpcoords[3] = 0.5 + w
        gpcoords[4] = 0.5 - w

        gpcoords[5] = -sqrt((3.0 + t) / 7.0)
        gpcoords[6] = -sqrt((3.0 - t) / 7.0)
        gpcoords[7] = sqrt((3.0 - t) / 7.0)
        gpcoords[8] = sqrt((3.0 + t) / 7.0)
        return gpcoords

    elseif ngp == 5
        t = sqrt(1120.0)

        gpcoords[1] = (21.0 * t + 117.60) / (t * (70.0 + t))
        gpcoords[2] = (21.0 * t - 117.60) / (t * (70.0 - t))
        gpcoords[3] = 2.0 * (1.0 - gpcoords[1] - gpcoords[2])
        gpcoords[4] = gpcoords[2]
        gpcoords[5] = gpcoords[1]

        gpcoords[6] = -sqrt((70.0 + t) / 126.0)
        gpcoords[7] = -sqrt((70.0 - t) / 126.0)
        gpcoords[8] = 0.0
        gpcoords[9] = sqrt((70.0 - t) / 126.0)
        gpcoords[10] = sqrt((70.0 + t) / 126.0)
        return gpcoords

    elseif ngp == 6
        gpcoords[1] = 0.1713244923791704
        gpcoords[2] = 0.3607615730481386
        gpcoords[3] = 0.4679139345726910
        gpcoords[4] = 0.4679139345726910
        gpcoords[5] = 0.3607615730481386
        gpcoords[6] = 0.1713244923791704

        gpcoords[7] = -0.9324695142031521
        gpcoords[8] = -0.6612093864662645
        gpcoords[9] = -0.2386191860831969
        gpcoords[10] = 0.2386191860831969
        gpcoords[11] = 0.6612093864662645
        gpcoords[12] = 0.9324695142031521
        return gpcoords

    elseif ngp == 7
        gpcoords[1] = 0.1294849661688697
        gpcoords[2] = 0.2797053914892766
        gpcoords[3] = 0.3818300505051189
        gpcoords[4] = 0.4179591836734694
        gpcoords[5] = 0.3818300505051189
        gpcoords[6] = 0.2797053914892766
        gpcoords[7] = 0.1294849661688697

        gpcoords[8] = -0.9491079123427585
        gpcoords[9] = -0.7415311855993945
        gpcoords[10] = -0.4058451513773972
        gpcoords[11] = 0.0
        gpcoords[12] = 0.4058451513773972
        gpcoords[13] = 0.7415311855993945
        gpcoords[14] = 0.9491079123427585
        return gpcoords

    elseif ngp == 8
        gpcoords[1] = 0.1012285362903763
        gpcoords[2] = 0.2223810344533745
        gpcoords[3] = 0.3137066458778873
        gpcoords[4] = 0.3626837833783620
        gpcoords[5] = 0.3626837833783620
        gpcoords[6] = 0.3137066458778873
        gpcoords[7] = 0.2223810344533745
        gpcoords[8] = 0.1012285362903763

        gpcoords[9] = -0.9602898564975363
        gpcoords[10] = -0.7966664774136267
        gpcoords[11] = -0.5255324099163290
        gpcoords[12] = -0.1834346424956498
        gpcoords[13] = 0.1834346424956498
        gpcoords[14] = 0.5255324099163290
        gpcoords[15] = 0.7966664774136267
        gpcoords[16] = 0.9602898564975363
        return gpcoords

    else
        println("unsuported gauss point number in 1D")
    end
end

function draw(num)
    markershapes = :circle
    plot(num[:, 2], num[:, 1], xlabel="X", ylabel="Weight", title="Gausspoints1D", seriestype=:scatter, shape=markershapes, markersize=3)
end
end