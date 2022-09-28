module Gausslobatto1D
using Plots
pyplot()
#import Plots

function creatgp(ngp=1)

    gpcoords=zeros(Float64,(ngp,2))
    if ngp==2

        gpcoords[1]=1.0
        gpcoords[2]=1.0

        gpcoords[3]=-1.0
        gpcoords[4]= 1.0
        return gpcoords

    elseif ngp==3

        gpcoords[1]=1.0/3.0
        gpcoords[2]=4.0/3.0
        gpcoords[3]=1.0/3.0

        gpcoords[4]=-1.0
        gpcoords[5]= 0.0
        gpcoords[6]= 1.0
        return gpcoords

    elseif ngp==4

        gpcoords[1]=1.0/6.0
        gpcoords[2]=5.0/6.0
        gpcoords[3]=5.0/6.0
        gpcoords[4]=1.0/6.0

        gpcoords[5]=-1.0
        gpcoords[6]=-sqrt(0.2)
        gpcoords[7]= sqrt(0.2)
        gpcoords[8]= 1.0
        return gpcoords

    elseif ngp==5
        gpcoords[1] = 0.1
        gpcoords[2] = 49.0/90.0
        gpcoords[3] = 32.0/45.0
        gpcoords[4] = 49.0/90.0
        gpcoords[5] = 0.1

        gpcoords[6]  = -1.0
        gpcoords[7]  = -sqrt(3.0/7.0)
        gpcoords[8]  = 0.0
        gpcoords[9]  = sqrt(3.0/7.0)
        gpcoords[10] = 1.0
        return gpcoords

    elseif ngp==6
        gpcoords[1]=6.6666666666666666666666666666667e-02L
        gpcoords[2]=3.7847495629784698031661280821202e-01L
        gpcoords[3]=5.5485837703548635301672052512131e-01L
        gpcoords[4]=5.5485837703548635301672052512131e-01L
        gpcoords[5]=3.7847495629784698031661280821202e-01L
        gpcoords[6]=6.6666666666666666666666666666667e-02L

        gpcoords[7] =-1.0000000000000000000000000000000e+00L
        gpcoords[8] =-7.6505532392946469285100297395934e-01L
        gpcoords[9] =-2.8523151648064509631415099404088e-01L
        gpcoords[10]= 2.8523151648064509631415099404088e-01L
        gpcoords[11]= 7.6505532392946469285100297395934e-01L
        gpcoords[12]= 1.0000000000000000000000000000000e+00L
        return gpcoords           
    else
        println("unsuported gauss point number in 1D")
    end
    end

    function draw(num)
        markershapes = :circle  
        plot(num[:,2], num[:,1], xlabel = "X", ylabel = "Weight", title="Gausspoints1D",seriestype = :scatter, shape = markershapes, markersize = 3)
    end
 end