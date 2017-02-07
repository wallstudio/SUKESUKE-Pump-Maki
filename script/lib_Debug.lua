module("Debug",package.seeall);
require("lib_Editor");
-- debug_printのラッパー，DEBUGがfalseで無効にできる
-- nil function(Any)
function Log(object)
    if not DEBUG then return end
    local t = type(object);
    if string.match(t, "table") then
        debug_print(#object);
        return;
    end 
    debug_print(object);
end
-- Editor.Pointのラッパー，DEBUGがfalseで無効にできる
-- nil function(Nun, Nun, Nun, Nun)
function Point(x, y, size, coler, alpha)
        if not EDIT then return end
		Editor.Point(x, y, size, coler, alpha);
end

function ShowDisplayValueTable(valueTable, shiftX, shiftY, dotSize, scaleX, scaleY, color, alpha)
    for i=1,#valueTable do
        local x = i;
        local y = valueTable[x];
        Debug.Point(x + shiftX, - y + shiftY, dotSize, color, alpha);
    end
end