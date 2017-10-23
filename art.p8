px = 8
py = 16
pspd = 8
movetime = 0
timepermove = 10

function bump(x,y)
 return fget(mget(flr(x/8),flr(y/8)),0)
end

function load_level(a)
	for x = 0,8 do
	camera_x=((a-1)*16)-(flr((a-1)/8)*128)
	camera_y= flr((a-1)/8) * 16

--	else
		--camera_x = 0
		--camera_y = 0
	--end
end	
function _update()
 if movetime > 0 then
  movetime-=1
 end

 if btn(0) and movetime == 0 then
  px -= pspd
  movetime = timepermove
  if px < 8 then
   px = 8
  end
  
  if bump(px,py) or bump(px,py+7) then
   px += pspd

  end
 end
 
 if btn(1) and movetime == 0 then
  px += pspd
  movetime = timepermove
  if px > 112 then
   px = 112
  end
  if bump(px+7,py) or bump(px+7,py+7) then
   px -= pspd
  end
 end
 
 if btn(2) and movetime == 0 then
  py -= pspd
  movetime = timepermove
  if py < 8 then
   py = 8
  end
  if bump(px,py) or bump(px+7,py) then
   py += pspd
  end
 end
 
 if btn(3) and movetime == 0 then
  py += pspd
  movetime = timepermove
  if py > 112 then
   py = 112
  end
  if bump(px,py+7) or bump(px+7,py+7) then
   py -= pspd
  end 
 end
end

function _draw()
 cls()
 map(0,0,0,0,128,128)--map
 spr(52,px,py)--him
 spr(7,112,58)--him
 spr(9,104,58)
 spr(54,104,66)
 
 
 --spr(4,50,48)
end