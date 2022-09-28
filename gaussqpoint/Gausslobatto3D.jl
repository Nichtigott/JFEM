module Gausslobatto3D
using Plots
pyplot()

function creatgpHEX(ngp)
    #you need set input by gp1D#
    ngp1 = size(ngp, 1)
    gp1d = ngp
    if ngp1 > 8
        println("Don't support")
    else
        ngp2 = ngp1 * ngp1 * ngp1
        gpcoords = zeros(Float64, (ngp2, 4))
        l = 1
        for k in 1:ngp1
            for j in 1:ngp1
                for i in 1:ngp1
                    gpcoords[l] = gp1d[k] * gp1d[i] * gp1d[j]
                    gpcoords[l+ngp2] = gp1d[k+ngp1]
                    gpcoords[l+2*ngp2] = gp1d[j+ngp1]
                    gpcoords[l+3*ngp2] = gp1d[i+ngp1]
                    l += 1
                end
            end
        end
        return gpcoords
    end
end

function draw(num)
    ngp = size(num, 1)
    x = Float64[]
    y = Float64[]
    z = Float64[]
    W = num[:, 1] * 0.5
    for i in 1:ngp
        a = num[i+ngp]
        b = num[i+2ngp]
        c = num[i+3ngp]
        w = num[i] * 10
        push!(x, w * a / sqrt(a^2 + b^2 + c^2))
        push!(y, w * a / sqrt(a^2 + b^2 + c^2))
        push!(z, w * a / sqrt(a^2 + b^2 + c^2))
    end
    n = length(x)
    print(n)
    markershapes = :circle
    #,seriestype = :scatter,shape = markershapes, markersize = 3
    #quiver=(x,y,z),
    plot(num[:, 2], num[:, 3], num[:, 4], xlabel="x", ylabel="y", zlabel="z", title="Gausspoints3D", seriestype=:scatter, shape=markershapes, markersize=3, color=:red)
end

end