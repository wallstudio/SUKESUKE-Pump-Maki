module("Editor",package.seeall);

function Point(x, y, size, coler, alpha)
        if not EDIT then 
            return;
        end
		for j = -size/2, size/2 do
			for k = -size/2, size/2 do
				obj.putpixel(x + j, y + k, coler, alpha);
			end
		end
end