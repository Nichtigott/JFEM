module Gausslobatto2D
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

function draw(num)
    markershapes = :circle
    plot(num[:, 2], num[:, 3], num[:, 1], xlabel="x", ylabel="y", zlabel="w", title="Gausspoints2D", st=:scatter, shape=markershapes, markersize=3, color=:red)
end

end