module("Debug",package.seeall);
require("lib_Editor");
-- debug_print�̃��b�p�[�CDEBUG��false�Ŗ����ɂł���
-- nil function(Any)
function Log(object)
    if not DEBUG then return end
    local t = type(object);
    if string.match(t, "table") then
        debug_print("TABLE:#"..#object);
        return;
    end 
    if string.match(t, "nil") then
        debug_print("NIL");
        return;
    end 
    debug_print(object);
end
-- Editor.Point�̃��b�p�[�CDEBUG��false�Ŗ����ɂł���
-- nil function(Nun, Nun, Nun, Nun, Nun)
function Point(x, y, size, coler, alpha)
        if not EDIT then return end
		Editor.Point(x, y, size, coler, alpha);
end
-- �e�[�u����g�`�Ƃ��ĕ\��
-- nil function({Nun}, Nun, Nun, Nun, Nun, Nun, Nun, Nun)
function ShowDisplayValueTable(valueTable, shiftX, shiftY, dotSize, scaleX, scaleY, color, alpha)
    for i=1,#valueTable do
        local x = i;
        local y = valueTable[x];
        Debug.Point(x*scaleX + shiftX, - y*scaleY + shiftY, dotSize, color, alpha);
    end
end