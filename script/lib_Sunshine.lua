module("Sunshine",package.seeall);
TANK_WEIGHT = {0, 1.1, 0.5};
TANK_BORDER = 0.5;
HP_WEIGHT = {1.1, 0, 0.4};
HP_BORDER = 0.3;
function Parse(r, g, b, weight, border)
    local l = ( 0.298912 * weight[1] * r + 0.586611 * weight[2] * g + 0.114478 * weight[3] *  b );
    --local l = ( 0.298912 * obj.track0 * r + 0.586611 * obj.track1 * g + 0.114478 * obj.track2 *  b );
    if l < 255 * border then
        return false;
    else
        return true;
    end
    Debug.Log("EXCEPTION in Parse");
end
function TankParse(r, g, b)
    return Parse(r, g, b, TANK_WEIGHT, TANK_BORDER);
end
function HpParse(r, g, b)
    return Parse(r, g, b, HP_WEIGHT, HP_BORDER);
    --return Parse(r, g, b, {obj.track1,obj.track2,obj.track3}, obj.track0);
end
