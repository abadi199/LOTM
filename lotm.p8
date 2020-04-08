pico-8 cartridge // http://www.pico-8.com
version 18
__lua__
--main
function _init()
	make_player()
	make_coins()
end

function _update()
	move_player()
	update_coins()
end

function _draw()
	cls()
	draw_map()
	draw_coins()
	draw_player()
end
-->8
--player
function make_player()
	player={}
	player.x=64
	player.y=64
	player.sprite=2
	player.timer=0
	player.state=0
end

function move_player()
	player.timer+=1
	if (btn(⬅️)) then 
		player.x-=1 
		change_state(player,1)
	elseif (btn(➡️)) then 
		player.x+=1 
		change_state(player,1)
	elseif (btn(⬆️)) then
		player.y-=1 
		change_state(player,1)
	elseif (btn(⬇️)) then 
		player.y+=1 
		change_state(player,1)
		move_down()
	else
		change_state(player,0)
		idle()
	end
end

function change_state(object, state)
	if (object.state!=state) then 
		object.state=state
		object.timer=0
	end
end

function move_down()
	if player.timer < 5 then 
		player.sprite=2
	elseif (player.timer < 10) then 
		player.sprite=4
	elseif (player.timer < 15) then 
		player.sprite=2
	elseif (player.timer < 20) then
		player.sprite=0
	elseif (player.timer < 25) then
		player.timer=1
	end
end

function idle()
	player.sprite=2
end

function draw_player()
	spr(player.sprite,player.x,player.y,2,2)
	print(player.state)
	print(player.timer)
	print(player.sprite)
end

function draw_map()
	map(0,0,0,0,64,64)
end


-->8
--coins
function make_coins()
	coin={}
	coin.visible=true
	coin.x=36
	coin.y=36
end

function update_coins()
	if (coin.visible and 
		player.x+6>=coin.x and player.x+6<coin.x+8 and
		player.y+1>=coin.y and player.y+1<coin.y+8) then
		sfx(0)
		coin.visible=false
	end
end

function draw_coins()
	if (coin.visible) then
		spr(4,36,36)
	end
end
-->8
--house
function make_house()
	
end
__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000aaaa00
0000088888800000000008888880000000000888888000000000000000000000000000000000000000000000000000000000000000000000000000000aa7aaa0
000008f8ff800000000008f8ff800000000008f8ff800000000000000000000000000000000000000000000000000000000000000000000000000000aa7aaaaa
00000f1ff1f0000000000f1ff1f0000000000f1ff1f00000000000000000000000000000000000000000000000000000000000000000000000000000a7aaaa9a
00000ffffff0000000000ffffff0000000000ffffff00000000000000000000000000000000000000000000000000000000000000000000000000000aaaaaa9a
00000ff444f0000000000ff444f0000000000ff444f00000000000000000000000000000000000000000000000000000000000000000000000000000aaaaa9aa
00000ffffff0000000000ffffff0000000000ffffff000000000000000000000000000000000000000000000000000000000000000000000000000000aa99aa0
00001111111100000000111111110000000011111111000000000000000000000000000000000000000000000000000000000000000000000000000000aaaa00
00011111111110000001111111111000000111111111100000000000000000000000000000000000000000000000000000000000000000000000000000000000
00f001111110f00000f001111110f00000f001111110f00000000000000000000000000000000000000000000000000000000000000000000000000000000000
00f0011111100f000f00011111100f000f0001111110f00000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000cccccc0000000000cccccc0000000000cccccc0000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000cc00cc0000000000cc00cc0000000000cc00cc0000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000f000f00000000000f000f00000000000f000f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000088000f00000000000f000f00000000000f000880000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000088000000000880008800000000088000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
33333333333333333333333333333333333333333333333300000000000000000000000000000000000000000000000000000000000000000000000000000000
333333333333333333333333333333333333333333b3b33300000000000000000000000000000000000000000000000000000000000000000000000000000000
3333333333333333333333333333333333333333333b333300000000000000000000000000000000000000000000000000000000000000000000000000000000
33333333333333333333333333333333333333333333333300000000000000000000000000000000000000000000000000000000000000000000000000000000
33333333333333333333333333333333333b3b333333333300000000000000000000000000000000000000000000000000000000000000000000000000000000
33333333333333333333333333333333333b3b333333333300000000000000000000000000000000000000000000000000000000000000000000000000000000
33333333a333333333333333333333333333b3333333333300000000000000000000000000000000000000000000000000000000000000000000000000000000
3333333a9a3333333333333333333333333333333333333300000000000000000000000000000000000000000000000000000000000000000000000000000000
33333333a33333333333333333333333333333333333333300000000000000000000000000000000000000000000000000000000000000000000000000000000
33333333333333333333333333333333333333333333333300000000000000000000000000000000000000000000000000000000000000000000000000000000
3333a333333333333333333333333333333333333b3b333300000000000000000000000000000000000000000000000000000000000000000000000000000000
333a9a33333333333333333333333333333333333b3b333300000000000000000000000000000000000000000000000000000000000000000000000000000000
3333a3333333333333333333333333333333333333b3333300000000000000000000000000000000000000000000000000000000000000000000000000000000
33333333333333333333333333333333333333333333333300000000000000000000000000000000000000000000000000000000000000000000000000000000
33333333333333333333333333333333333333333333333300000000000000000000000000000000000000000000000000000000000000000000000000000000
33333333333333333333333333333333333333333333333300000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000055550000000000000000000000000000000000056666666666666666666666666666666666666666666666666666500000
00000000000000000000000000005545545500000000000000000000000000000000056666666666666666666666666666666666666666666666666666500000
00000000000000000000000000554445544455000000000000000000000000000000056666666666666666666666666666666666666666666666666666500000
00000000000000000000000055444445544444550000000000000000000000000000056666666666666666666666666666666666666666666666666666500000
00000000000000000000005544444445544444445500000000000000000000000000056666666666666666666666666666666666666666666666666666500000
00000000000000000000554444444445544444444455000000000000000000000000056666666666666666666666666666666666666666666666666666500000
00000000000000000055444444444445544444444444550000000000000000000000056666666666666666666666666666666666666666666666666666500000
00000000000000005544444444444445544444444444445500000000000000000000056666666666666666666666666666666666666666666666666666500000
00000000000000554444444444444445544444444444444455000000000000000000056666666666666666666666666666666666666666666666666666500000
00000000000055444444444444444445544444444444444444550000000000000000056666666666666666666666666666666666666666666666666666500000
00000000005544444444444444444445544444444444444444445500000000000000056666666666666666666666666666666666666666666666666666500000
00000000554444444444444444444445544444444444444444444455000000000000056666666666666666666666666666666666666666666666666666500000
00000055444444444444444444444445544444444444444444444444550000000000056666666666666666666666666666666666666666666666666666500000
00005544444444444444444444444445544444444444444444444444445500000000056666666666666666666666666666666666666666666666666666500000
00554444444444444444444444444445544444444444444444444444444455000000056666666666666666666666666666666666666666666666666666500000
55444444444444444444444444444445544444444444444444444444444444550000056666666666666666666666666666666666666666666666666666500000
54444444444444444444444444444455554444444444444444444444444444450000056666666666666666666666666666666666666666666666666666500000
54444444444444444444444444445566665544444444444444444444444444450000056666666666666666666666666666666666666666666666666666500000
54444444444444444444444444556666666655444444444444444444444444450000056666666666666666666666666666666666666666666666666666500000
54444444444444444444444455666666666666554444444444444444444444450000056666666666666666666666666666666666666666666666666666500000
54444444444444444444445566666666666666665544444444444444444444450000056666666666666666666666666666666666666666666666666666500000
54444444444444444444556666666666666666666655444444444444444444450000056666666666666666666666666666666666666666666666666666500000
54444444444444444455666666666666666666666666554444444444444444450000056666666666666666666666666666666666666666666666666666500000
54444444444444445566666666666666666666666666665544444444444444450000056666666666666666666666666666666666666666666666666666500000
54444444444444556666666666666666666666666666666655444444444444450000056666666666666666666666666666666666666666666666666666500000
54444444444455666666666666666666666666666666666666554444444444450000056666666666666666666666666666666666666666666666666666500000
54444444445566666666666666666666666666666666666666665544444444450000056666666666666666666666666666666666666666666666666666500000
54444444556666666666666666666666666666666666666666666655444444450000056666666666666666666666666666666666666666666666666666500000
54444455666666666666666666666666666666666666666666666666554444450000056666666666666666666666666666666666666666666666666666500000
54445566666666666666666666666666666666666666666666666666665544450000056666666666666666666666666666666666666666666666666666500000
54550566666666666666666666666666666666666666666666666666665055450000056666666666666666666666666666666666666666666666666666500000
55000566666666666666666666666666666666666666666666666666665000550000055555555555555555555555555555555555555555555555555555500022
22222222222222222222222222222222222222222222222222222222222222223222322232223222223222322232223222322232223222322232223222322232
22222222222222222222222222222222222222222222222222222222222222222333233323233323332333233323332333233323332333332222222222222223
22222222222222222222222222222222222222222222222222222222222222223323332333233323233323332333233323332333233323332333233323332333
22222222222222222222222222222222222222222222222222222222222222222232223222223222322232223222322232223222323222322222222222222222
22222222222222222222222222222222222222222222222222222222222222223222322232223222223222322232223222322232223222322232223222322232
22222222222222222222222222222222222222222222222222222222222222222333233323233323332333233323332333233323333323332222222222222223
22222222222222222222222222222222222222222222222222222222222222223323332333233323233323332333233323332333233323332333233323332333
22222222222222222222222222222222222222222222222222222222222222222222322232223222322232223222322232223222322232322222222222222222
22222222222222222222222222222222222222222222222222222222222222223222322232223222223222322232223222322232223222322232223222322232
22222222222222222222222222222222222222222222222222222222222222222323332333233323332333233323332333233323332333332222222222222223
22222222222222222222222222222222222222222222222222222222222222223323332333233323233323332333233323332333233323332333233323332333
22222222222222222222222222222222222222222222222222222222222222223222322232223222322232223222322232223222322232223222222222222222
22222222222222222222222222222222222222222222222222222222222222223222322232223222223222322232223222322232223222322232223222322232
22222222222222222222222222222222222222222222222222222222222222223323332333233323332333233323332333233323332333233322222222222223
22222222222222222222222222222222222222222222222222222222222222223323332333233323233323332333233323332333233323332333233323332333
22222222222222222222222222222222222222222222222222222222222222223222322232223222322232223222322232223222322232223222222222222222
22222222222222222222222222222222222222222222222222222222222222223222322232223222223222322232223222322232223222322232223222322222
22222222222222222222222222222222222222222222222222222222222222223323332333233323332333233323332333233323332333233322222222222223
22222222222222222222222222222222222222222222222222222222222222223323332333233323233323332333233323332333233323332333233323332323
22222222222222222222222222222222222222222222222222222222222222223222322232223222322232223222322232223222322232322222222222222222
22222222222222222222222222222222222222222222222222222222222222223222322232223222222232223232223222322232223222322232223222322222
22222222222222222222222222222222222222222222222222222222222222223323332333233323332333233323332333233323332333332222222222222223
22222222222222222222222222222222222222222222222222222222222222223323332333233323232333233333233323332333233323332333233323332323
22222222222222222222222222222222222222222222222222222222222222223222322232223222322232223222322232223222322232223222222222222222
22222222222222222222222222222222222222222222222222222222222222223222322232223222223222322232223222322232223222322232223222322232
22222222222222222222222222222222222222222222222222222222222222223323332333233323332333233323332333233323332333233322222222222223
22222222222222222222222222222222222222222222222222222222222222223323332333233323233323332333233323332333233323332333233323332333
22222222222222222222222222222222222222222222222222222222222222223222322232223222322232223222322232223222322232223222222222222222
22222222222222222222222222222222222222222222222222222222222222223222322232223222223222322232223222322232223222322232223222322232
22222222222222222222222222222222222222222222222222222222222222223323332333233323332333233323332333233323332333233322222222222232
22222222222222222222222222222222222222222222222222222222222222223222322232223222322232223222322232223222322232223222322232223222
22222222222222222222222222222222222222222222222222222222222222223222322232223222322232223222323222322222322232223222222222222333
23332333233323332333233323332322323323332333233323332333233333233323332333233323332333233323332333233323332333233323332333233323
33233323332333233323332333233323332333233323332333233323332333233323332333233323332333233323333323332323332333233322222222222232
22322232223222322232223222322223333222322232223222322232223222322232322232223222322232223222322232223222322232223222322232223222
32223222322232223222322232223222322232223222322232223222322232223222322232223222322232223222322232223222322232223222222222222333
23332333233323332333233323332333233323332333233323332333233323332333332333233323332333233323332333233323332333233323332333233323
33233323332333233323332333233323332333233323332333233323332333233323332333233323332333233323332333233323332333233322222222222222
22222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
22222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
22222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
22222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
22222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
22222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
22222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
22222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
22222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
22222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
22222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
22222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
22222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
22222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
22222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
22222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
22222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
22222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
22222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
22222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
22222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
22222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
22222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
22222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
22222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
22222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
__map__
2222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
2222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
2222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
2222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
2222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
2222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
2222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
2222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
2222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
2222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
2222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
2222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
2222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
2222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
2222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
2222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
2222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
2222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
2222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
2222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
2222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
2222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
2222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
2222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
2222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
2222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
2222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
2222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
2222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
2222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
2222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
2222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222
__sfx__
000500002d0500e000380503805038030380203802038010270002700027000110000f0002e0002f0002e00032000300003500000000000000000000000000000000000000000000000000000000000000000000
