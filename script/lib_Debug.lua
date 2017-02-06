module("Debug",package.seeall);
require("lib_Editor");
function Log(object)
    if not DEBUG then return end
    local t = type(object);
    if string.match(t, "table") then
        debug_print(#object);
        return;
    end 
    debug_print(object);
end
function Point(x, y, size, coler, alpha)
        if not EDIT then return end
		Editor.Point(x, y, size, coler, alpha);
end