function outShape = translateShape(shape,xShift,yShift)
%Translate a shape by a given amount
%Zak C-W
outShape(1,:) = shape(1,:)+xShift; %move x coords
outShape(2,:) = shape(2,:)+yShift; %move y coords
end