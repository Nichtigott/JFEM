#module Gausslegendre3D
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

    
function creatgpTET(ngp=1)
    gpcoords = zeros(Float64, (ngp, 4))
    if ngp == 1

        gpcoords[1] = 1.0 / 6.0

        gpcoords[2] = 0.25

        gpcoords[3] = 0.25

        gpcoords[4] = 0.25

        return gpcoords

    elseif ngp == 4

        a = 0.585410196624969
        b = 0.138196601125011

        gpcoords[1] = 1.0 / 24.0
        gpcoords[2] = 1.0 / 24.0
        gpcoords[3] = 1.0 / 24.0
        gpcoords[4] = 1.0 / 24.0

        gpcoords[5] = a
        gpcoords[6] = b
        gpcoords[7] = b
        gpcoords[8] = b

        gpcoords[9] = b
        gpcoords[10] = a
        gpcoords[11] = b
        gpcoords[12] = b

        gpcoords[13] = b
        gpcoords[14] = b
        gpcoords[15] = a
        gpcoords[16] = b

        return gpcoords

    elseif ngp == 5
        gpcoords[1] = -2.0 / 15.0
        gpcoords[2] = 0.075
        gpcoords[3] = 0.075
        gpcoords[4] = 0.075
        gpcoords[5] = 0.075

        gpcoords[6] = 0.25
        gpcoords[7] = 0.5
        gpcoords[8] = 1.0 / 6.0
        gpcoords[9] = 1.0 / 6.0
        gpcoords[10] = 1.0 / 6.0

        gpcoords[11] = 0.25
        gpcoords[12] = 1.0 / 6.0
        gpcoords[13] = 0.5
        gpcoords[14] = 1.0 / 6.0
        gpcoords[15] = 1.0 / 6.0

        gpcoords[16] = 0.25
        gpcoords[17] = 1.0 / 6.0
        gpcoords[18] = 1.0 / 6.0
        gpcoords[19] = 0.5
        gpcoords[20] = 1.0 / 6.0

        return gpcoords
    else
        println("unsuported gauss point number in 3D")
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
    plot(num[:, 2], num[:, 3], num[:, 4], xlabel="x", ylabel="y", zlabel="z", title="Gausspoints3D",
        seriestype=:scatter, shape=markershapes, markersize=3, color=:red)
end

#end