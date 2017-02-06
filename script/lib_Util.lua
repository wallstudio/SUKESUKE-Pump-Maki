module("Util",package.seeall);

function Map(iterator, func)
    for i=1,#iterator do
        func(iterator[i], i, iterator);
    end
end
function AnchorShift(anchorPos, dstArray, shiftX, shiftY)
    for i=1,math.floor(#anchorPos/2) do
        dstArray[i] = {};
        dstArray[i][1] = anchorPos[i*2-1] + shiftX;
	    dstArray[i][2] = anchorPos[i*2] + shiftY;
    end
end