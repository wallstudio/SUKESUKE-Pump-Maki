module("Debug",package.seeall);
require("lib_Editor");
-- debug_print�̃��b�p�[�CDEBUG��false�Ŗ����ɂł���
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
-- Editor.Point�̃��b�p�[�CDEBUG��false�Ŗ����ɂł���
-- nil function(Nun, Nun, Nun, Nun)
function Point(x, y, size, coler, alpha)
        if not EDIT then return end
		Editor.Point(x, y, size, coler, alpha);
end