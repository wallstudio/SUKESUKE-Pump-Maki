module("Parse",package.seeall);
require("lib_Debug");
require("lib_Util");
require("lib_Color");
function BetweenPixcel(start, stop)
    local xCount = Util.Round(math.abs(start[1] - stop[1]));
    local yCount = Util.Round(math.abs(start[2] - stop[2]));
    local longEdge, shortEdge, sign;
    if xCount > yCount then 
        longEdge = 1;
        shortEdge = 2;
    end
    if xCount <= yCount then 
        longEdge = 2;
        shortEdge = 1;
    end
    function Linear(input)
        input = input;
        local slant = (stop[shortEdge] - start[shortEdge])/(stop[longEdge] - start[longEdge]);
        local output = slant*(input - start[longEdge]) + start[shortEdge];
        local point = {};
        point[longEdge] = input;
        point[shortEdge] = output;
        return point;
    end
    local rtn = {};
    if start[longEdge] <= stop[longEdge] then
        for i=start[longEdge],stop[longEdge] do
            local c = Linear(i);
            table.insert(rtn, c);
        end
    else
        for i=stop[longEdge],start[longEdge] do
            local c = Linear(i);
            table.insert(rtn, c);
        end
        rtn = Util.Reverse(rtn);
    end
    Debug.Log("#sample: " .. #rtn);
    for i=1,#rtn do
        if 50 > math.abs(rtn[i][longEdge] - start[longEdge]) then
            Debug.Point(rtn[i][1]-3, rtn[i][2], 1, Color.SKYBLUE, 1);
        else
            Debug.Point(rtn[i][1]+3, rtn[i][2], 1, Color.BLUE, 1);
        end
    end
    Debug.Point(rtn[1][1]+3, rtn[1][2], 2, Color.BLACK, 1);
    Debug.Log("#sample: " .. #rtn);
    return rtn;
end