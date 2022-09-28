module Gausslegendre2D
using Plots
pyplot()

function creatgpquad(ngp)
    #you need set input by gp1D#
    ngp1 = size(ngp, 1)
    gp1d = ngp
    if ngp1 > 8
        println("Don't support")
    else
        ngp2 = ngp1 * ngp1
        gpcoords = zeros(Float64, (ngp2, 3))
        k = 1
        for i in 1:ngp1
            for j in 1:ngp1
                gpcoords[k] = gp1d[i] * gp1d[j]
                gpcoords[k+ngp2] = gp1d[i+ngp1]
                gpcoords[k+2*ngp2] = gp1d[j+ngp1]
                k += 1
            end
        end
        return gpcoords
    end
end
    

function creatgptri(ngp=1)
    gpcoords = zeros(Float64, (ngp, 3))
    if ngp == 1

        gpcoords[1] = 0.5

        gpcoords[2] = 1.0 / 3.0

        gpcoords[3] = 1.0 / 3.0
        return gpcoords

    elseif ngp == 3
        gpcoords[1] = 1.0 / 6.0
        gpcoords[2] = 1.0 / 6.0
        gpcoords[3] = 1.0 / 6.0

        gpcoords[4] = 2.0 / 3.0
        gpcoords[5] = 1.0 / 6.0
        gpcoords[6] = 1.0 / 6.0

        gpcoords[7] = 1.0 / 6.0
        gpcoords[8] = 2.0 / 3.0
        gpcoords[9] = 1.0 / 6.0
        return gpcoords

    elseif ngp == 4
        gpcoords[1] = 1.590206908719885e-01
        gpcoords[2] = 9.097930912801141e-02
        gpcoords[3] = 1.590206908719885e-01
        gpcoords[4] = 9.097930912801141e-02

        gpcoords[5] = 1.550510257216821e-01
        gpcoords[6] = 6.449489742783178e-01
        gpcoords[7] = 1.550510257216821e-01
        gpcoords[8] = 6.449489742783178e-01

        gpcoords[9] = 1.785587282636164e-01
        gpcoords[10] = 7.503111022260811e-02
        gpcoords[11] = 6.663902460147013e-01
        gpcoords[12] = 2.800199154990740e-01
        return gpcoords

    elseif ngp == 6

        gpcoords[1] = 0.1099517437 * 0.5
        gpcoords[2] = 0.1099517437 * 0.5
        gpcoords[3] = 0.1099517437 * 0.5
        gpcoords[4] = 0.2233815897 * 0.5
        gpcoords[5] = 0.2233815897 * 0.5
        gpcoords[6] = 0.2233815897 * 0.5

        gpcoords[7] = 0.0915762135
        gpcoords[8] = 0.0915762135
        gpcoords[9] = 0.8168475730
        gpcoords[10] = 0.4459484909
        gpcoords[11] = 0.4459484909
        gpcoords[12] = 0.1081030182

        gpcoords[13] = 0.8168475730
        gpcoords[14] = 0.0915762135
        gpcoords[15] = 0.0915762135
        gpcoords[16] = 0.1081030182
        gpcoords[17] = 0.4459484909
        gpcoords[18] = 0.4459484909
        return gpcoords

    elseif ngp == 7
        gpcoords[1] = 0.2250000000 * 0.5
        gpcoords[2] = 0.1259391805 * 0.5
        gpcoords[3] = 0.1259391805 * 0.5
        gpcoords[4] = 0.1259391805 * 0.5
        gpcoords[5] = 0.1323941528 * 0.5
        gpcoords[6] = 0.1323941528 * 0.5
        gpcoords[7] = 0.1323941528 * 0.5

        gpcoords[8] = 1.0 / 3.0
        gpcoords[9] = 0.1012865073
        gpcoords[10] = 0.1012865073
        gpcoords[11] = 0.7974269854
        gpcoords[12] = 0.0597158718
        gpcoords[13] = 0.4701420641
        gpcoords[14] = 0.4701420641

        gpcoords[15] = 1.0 / 3.0
        gpcoords[16] = 0.7974269854
        gpcoords[17] = 0.1012865073
        gpcoords[18] = 0.1012865073
        gpcoords[19] = 0.4701420641
        gpcoords[20] = 0.4701420641
        gpcoords[21] = 0.0597158718
        return gpcoords

    else
        println("unsuported gauss point number in 2D")
    end
end

function draw(num)
    markershapes = :circle
    plot(num[:,2],num[:,3], num[:,1], xlabel = "x", ylabel = "y",zlabel = "w", title="Gausspoints2D",st = :scatter, shape = markershapes, markersize = 3,color = :red)
end

end