module Langrange1DShapeFun

function creatmesh(xmin=0.0,xmax=1.0,nx=5,meshtype="edge2")
    if meshtype=="edge2"
        order=1
        nodesperelement=2
        vtkcelltype=3
    elseif meshtype=="edge3"
        order=2
        nodesperelement=3
        vtkcelltype=4
    elseif meshtype=="edge4"
        order=3
        nodesperelement=4
        vtkcelltype=4
    end
    elements=nx
    nodes=elements*order+1
    dx=(xmax-xmin)/(nodes-1)
    nodecoord=zeros(nodes,1)
    for i in 1:nodes
        nodecoords[i]=xmin+i*dx
        self.elementconn=np.zeros((self.elements,self.nodesperelement),dtype=np.int16)
    end
    for e in 1:elements
        for j in 1:nodesperelement
                self.elementconn[e,j]=e*order+j
        end
    end

end
end