module("Debug",package.seeall);

function Log(object)
    if not DEBUG then return end
    debug_print(object);
end