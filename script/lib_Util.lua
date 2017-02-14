module("Util",package.seeall);
-- �e�[�u���̃}�b�v
-- nil function({Any}, Func)
function Map(iterator, func)
    for i=1,#iterator do
        func(iterator[i], i, iterator);
    end
end
-- �A���J�[�̌����ڂƂ̍��W�̂���𒲐������d�z��ɕ���
-- nil function({Nun}, {{Nun}}, Nun, Nun)
function AnchorShift(anchorPos, dstArray, shiftX, shiftY)
    for i=1,math.floor(#anchorPos/2) do
        dstArray[i] = {};
        dstArray[i][1] = anchorPos[i*2-1] + shiftX;
	    dstArray[i][2] = anchorPos[i*2] + shiftY;
    end
end
-- �l�̌ܓ��i���̂�math�ɂȂ��j
-- Nun function(Nun)
function Round(x)
    if math.abs(math.floor(x) - x) > math.abs(math.ceil(x) - x) then
        return math.ceil(x);
    end
    return math.floor(x);
end
-- �e�[�u���̃��o�[�X
-- {Any} function({Any})
function Reverse(iterator)
    local rtn = {};
    for i=0,#iterator-1 do
        table.insert(rtn, iterator[#iterator - i]);
    end
    return rtn;
end
-- ���W�X�e�B�b�N�֐��Cdomein:[0,1],range:[0,1]
-- Nun function(Nun)
function Logistic(x)
    local k = 1;
    local b = 0.3;
    local c = 0.5;
    x = x*15 - 10;
    local tmp = 1 + b*math.exp(-c*x);
    return k/tmp;
end
-- �X��1�ؕ�0�̐��`�֐��Cdomein:[0,1],range:[0,1]
-- Nun function(Nun)
function Linear(x)
    return x;
end
-- ��2�̃V�t�g�ςݑΐ��֐��Cdomein:[0,1],range:[0,1]
-- Nun function(Nun)
function Log(x)
    return math.log(x+1, 2);
end
-- �2�̃V�t�g�ςݎw���֐��Cdomein:[0,1],range:[0,1]
-- Nun function(Nun)
function Pow(x)
    return math.pow(2, x)-1;
end
-- count�̃����_���Ȓl�̃e�[�u�������
-- {Nun} function(Nun, Nun, Nun)
function MakeRandomTable(count, start, stop)
    --math.randomseed(os.time()*math.random());
    local rtn = {};
    for i=0,count do
        table.insert(rtn, math.random(start, stop));
    end
    return rtn;
end
-- count�̃����_���Ȓl�̃e�[�u�������
-- {{Nun}} function(Nun, Nun, Nun, Nun)
function MakeRandomDoubleTable(count, start, stop, seed)
    local rtn = {};
    math.randomseed(seed);
    rtn[1] = MakeRandomTable(count, start, stop);
    math.randomseed(seed%2525);
    rtn[2] = MakeRandomTable(count, start, stop);
    return rtn;
end
-- �ӂ��U��
-- nil function(Nun, obj)
function BreakDown(time, obj)

    local size=50;
    local speed=100;
    local grav=100;
    local delay=100;
    local impact=100;
    local spin=100;
    local diff=100;
    local step=1.0;
    local px={}
    local py={}
    local pz={}
    local pu={}
    local pv={}
    if( step < 0 ) then 
        tm = obj.time*step+ time
    else
        tm = obj.time*step- time
    end
    if( tm < 0 ) then
        return
    end
    obj.effect()
    grav = grav*6
    delay = delay*0.002
    impact = impact*0.1
    spin = math.floor(spin*10)
    diff = diff/80
    if( size < 10 ) then
        size = 10
    end 
    xl = obj.w
    yl = obj.h
    ax = 0
    ay = 0
    az = 0
    sp = speed*0.01*math.sqrt(impact)
    w = math.floor(xl/size)
    h = math.floor(yl/size)
    l = math.sqrt(xl*xl+yl*yl)
    if( w < 2 ) then
        w = 2
    elseif( w > xl ) then
        w = xl
    end
    if( h < 2 ) then
        h = 2
    elseif( h > yl ) then
        h = yl
    end
    pw = xl/w/2.3
    ph = yl/h/2.3
    for y=0,h-1 do
        for x=0,w-1 do
            -- �e���_���v�Z
            pu[0] = xl*x/w
            pu[1] = xl*(x+1)/w
            pu[2] = pu[1]
            pu[3] = pu[0]
            pv[0] = yl*y/h
            pv[1] = pv[0]
            pv[2] = yl*(y+1)/h
            pv[3] = pv[2]
            pu[0] = pu[0] + obj.rand(-pw,pw,x  ,y  )
            pu[1] = pu[1] + obj.rand(-pw,pw,x+1,y  )
            pu[2] = pu[2] + obj.rand(-pw,pw,x+1,y+1)
            pu[3] = pu[3] + obj.rand(-pw,pw,x  ,y+1)
            pv[0] = pv[0] + obj.rand(-ph,ph,x  ,y  +1000)
            pv[1] = pv[1] + obj.rand(-ph,ph,x+1,y  +1000)
            pv[2] = pv[2] + obj.rand(-ph,ph,x+1,y+1+1000)
            pv[3] = pv[3] + obj.rand(-ph,ph,x  ,y+1+1000)
            if( x == 0 ) then
                pu[0] = 0
                pu[3] = 0
            elseif ( x == w-1 ) then
                pu[1] = xl
                pu[2] = xl
            end
            if( y == 0 ) then
                pv[0] = 0
                pv[1] = 0
            elseif ( y == h-1 ) then
                pv[2] = yl
                pv[3] = yl
            end
            -- ��̌v�Z
            gx = (pu[0]+pu[1]+pu[2]+pu[3])/4
            gy = (pv[0]+pv[1]+pv[2]+pv[3])/4
            gz = 0
            cx = gx-xl/2
            cy = gy-yl/2
            cz = 0
            vx = cx-ax
            vy = cy-ay
            vz = -az
            v = math.sqrt(vx*vx+vy*vy+vz*vz)
            -- ���Ԃ̌v�Z
            t = tm-v/l*delay
            if( t < 0 ) then
                t = 0
                obj.setoption('antialias',0)
            else
                obj.setoption('antialias',1)
            end
            -- ��]���v�Z
            xx = t*obj.rand(-spin,spin,x,y+2000)/100
            yy = t*obj.rand(-spin,spin,x,y+3000)/100
            zz = t*obj.rand(-spin,spin,x,y+4000)/100
            sin_x = math.sin(xx);
            cos_x = math.cos(xx);
            sin_y = math.sin(yy);
            cos_y = math.cos(yy);
            sin_z = math.sin(zz);
            cos_z = math.cos(zz);
            m00 =  cos_y*cos_z
            m01 = -cos_y*sin_z
            m10 =  cos_x*sin_z +sin_x*cos_z*sin_y
            m11 =  cos_x*cos_z -sin_x*sin_z*sin_y
            m20 =  sin_x*sin_z -cos_x*cos_z*sin_y
            m21 =  sin_x*cos_z +cos_x*sin_z*sin_y
            for i=0,3 do
                xx = pu[i]-gx
                yy = pv[i]-gy
                px[i] = m00*xx + m01*yy
                py[i] = m10*xx + m11*yy
                pz[i] = m20*xx + m21*yy
            end
            -- �\�����W���v�Z
            v = 1/(1+v*v/(l*l)*impact)
            vx = vx*v + obj.rand(-size,size,x,y+4000)*diff
            vy = vy*v + obj.rand(-size,size,x,y+5000)*diff
            vz = vz*v + obj.rand(-size,size,x,y+6000)*diff
            cx = cx + t*vx*sp
            cy = cy + t*vy*sp + t*t*grav
            cz = cz + t*vz*sp
            obj.drawpoly(px[0]+cx,py[0]+cy,pz[0]+cz,px[1]+cx,py[1]+cy,pz[1]+cz,px[2]+cx,py[2]+cy,pz[2]+cz,px[3]+cx,py[3]+cy,pz[3]+cz, pu[0],pv[0],pu[1],pv[1],pu[2],pv[2],pu[3],pv[3])
        end
    end
end
-- pointSrc�ɏ]����count�̃}�X�N�����Ă�C�}�X�N�͂��񂾂�傫���Ȃ�
-- nil function(Nun, {{Nun}}, Nun, Nun, Nun, Nun)
function BreakMask(count, pointSrc, offsetX, offsetY, size, max)
    for i=1, count do
        obj.effect("�}�X�N",
            "X",pointSrc[1][i]+offsetX,
            "Y",pointSrc[2][i]+offsetY,
            "�T�C�Y",size * i/max,
            "�}�X�N�̔��]",1,
            "type",5
        );
    end
end
-- �s��i�񎟃e�[�u���j�̓]�u����
-- {{Any}} function({{Any}})
function MatrixTranspos(matrix)
    local newMatrix = {};
    for i=1,#(matrix[1]) do
        local newVector = {};
        for j=1,#matrix do
            newVector[j] = matrix[j][i];
        end
        table.insert(newMatrix, newVector);
    end
    return newMatrix;
end
-- obj.getaudio�̃��b�p�[
-- {Nun} function(obj, Num)
function GetSpectrum(obj, sampleCount)
    local buf = {};
    obj.getaudio(buf,"audiobuffer","spectrum",division);
    return buf;
end
-- ���U�z��̊֐����Cdomein:[0,1]
-- Nun function({Nun}, Nun)
function TableFunc(values, input)
    local count = #values;
    input = Round(input*count);
    if input < 1 then input = 1 end
    if input > count - 1 then input = count end
    return values[input];
end
-- �e�[�u�����m�̕��όv�Z
-- {Num} function({{Num}})
function TableAverage(valueTable, length)    
    local average = {};
    for i=1,#(valueTable[1]) do -- division
        average[i] = 0;
        for j=1,#valueTable do -- bufferCount
            average[i] = average[i] + valueTable[j][i];
        end
        average[i] = average[i]/length;
    end
    return average;
end
-- �e�[�u�����`���[�u�Ƃ݂Ȃ��ėv�f�̒ǉ�
-- nil function({Any}, Any, Num)
function TubeTableAdd(buffer, addElement, length)
    if #buffer >= length then table.remove(buffer, 1) end
    table.insert(buffer, addElement);
end
-- �e�[�u��������G�������g�őS�ď�����
-- {Any} function(Any, Num)
function InitTableReplece(initElement, count)
    local rtn = {};
    for i=1,count do
        rtn[i] = initElement;
    end
    return rtn;
end
-- �e�[�u���̍��� table0 - table1
-- {Num} function({Num}, {Num})
function DiffTable(table0, table1)
    local rtn = {};
    for i=1,#table0 do
        rtn[i] = table0[i] - table1[i];
    end
    return rtn;
end
-- ���֊֐�
-- {Num} function({Num}, {Num}, Num)
function CrossCorelation(f, g ,t)
    local sum = 0;
    for i=1,#f do
        if 1 <= i-t and i-t <= #g then
            sum = sum + f[i]*g[i+t];
        end
    end
    return sum;
end
-- �e�[�u���̘a
-- {Num} function({Num}, {Num})
function AddTable(table0, table1)
    local rtn = {};
    for i=1,#table0 do
        rtn[i] = table0[i] + table1[i]; 
    end
    return rtn;
end
-- �e�[�u���̃X�J���[�{
-- {Num} function({Num}, Num)
function ScaleTable(table0, scale)
    local rtn = {};
    for i=1,#table0 do
        rtn[i] = table0[i] * scale; 
    end
    return rtn;
end
-- �t�@�C���Ɉ�s��������
-- nil function(string, string, string)
function FileDump(path, data, mode)
    local fhs, estr, ecode = io.open(path, mode);
    fhs:write(data .. "\n");
    fhs:close();
end
-- ���ϊw�K�̃T�u���[�`����
-- nil function({Num}, {Num}, Num, Num, string)
function LogAverage(pram, buf, count, frameBuf, path)
    local INTERVAL = 60;
    buf = ScaleTable(buf, count);
    count = count + 1;
    buf = ScaleTable(AddTable(buf, pram), 1/count);
    frameBuf = frameBuf + 1;
    if frameBuf % INTERVAL < 1 then
        FileDump(path, table.concat(buf, ","), "a");
    end
end