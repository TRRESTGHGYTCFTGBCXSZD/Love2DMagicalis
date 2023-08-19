function love.load()
	frames = 0
	frameticks = 0
	bit32 = require("bit")
	love.graphics.setBackgroundColor(0, 0, 0, 0)
	bg = love.graphics.newImage("bg.png")
	board = love.graphics.newImage("board.png")
	board = love.graphics.newImage("boardglow.png")
	music = love.audio.newSource("music.ogg", "stream")
	music:setLooping(true)
	music:play()
	sharedpiecequeue = sevenbag()
	pieceimagetype = {}
	pieceimagetype.I = love.graphics.newImage("piece_t.png")
	pieceimagetype.O = love.graphics.newImage("piece_o.png")
	pieceimagetype.T = love.graphics.newImage("piece_s.png")
	pieceimagetype.J = love.graphics.newImage("piece_j.png")
	pieceimagetype.L = love.graphics.newImage("piece_l.png")
	pieceimagetype.Z = love.graphics.newImage("piece_i.png")
	pieceimagetype.S = love.graphics.newImage("piece_z.png")
	pieceimagetype.G = love.graphics.newImage("piece_garbage.png")
	--pentominos
	pieceimagetype.U = love.graphics.newImage("penta_skin.png")
	pieceimagetype.I5 = love.graphics.newImage("penta_white.png")
	pieceimagetype.T5 = love.graphics.newImage("penta_cyan.png")
	pieceimagetype.Z5a = love.graphics.newImage("penta_red.png")
	pieceimagetype.S5a = love.graphics.newImage("penta_green.png")
	pieceimagetype.Z5b = love.graphics.newImage("penta_pink.png")
	pieceimagetype.S5b = love.graphics.newImage("penta_green.png")
	pieceimagetype.Fa = love.graphics.newImage("penta_blue.png")
	pieceimagetype.Fb = love.graphics.newImage("penta_orange.png")
	pieceimagetype.V = love.graphics.newImage("penta_magenta.png")
	pieceimagetype.L5 = love.graphics.newImage("penta_orange.png")
	pieceimagetype.J5 = love.graphics.newImage("penta_blue.png")
	pieceimagetype.Ya = love.graphics.newImage("penta_orange.png")
	pieceimagetype.Yb = love.graphics.newImage("penta_blue.png")
	pieceimagetype.P = love.graphics.newImage("penta_green.png")
	pieceimagetype.Q = love.graphics.newImage("penta_pink.png")
	pieceimagetype.X = love.graphics.newImage("penta_magenta.png")
	pieceimagetype.W = love.graphics.newImage("penta_pristinegreen.png")
	
	pieceimagetype.Sq2 = love.graphics.newImage("piece_square2.png")
	pieceimagetype.Sq3 = love.graphics.newImage("piece_square3.png")
	pieceimagetype.Sq4 = love.graphics.newImage("piece_square4.png")
	pieceimagetype.Sq5 = love.graphics.newImage("piece_square5.png")
	
	pieceimagetype.T9 = love.graphics.newImage("super_t9.png")
	pieceimagetype.T15 = love.graphics.newImage("super_t15.png")
	pieceimagetype.D13 = love.graphics.newImage("super_d13.png")
	pieceimagetype.U9 = love.graphics.newImage("super_ue.png")
	pieceimagetype.Active = love.graphics.newImage("piece_active.png")
	pieceimagetype.ActiveDark = love.graphics.newImage("piece_activedark.png")
	pieceimagetype.ActiveHold = love.graphics.newImage("piece_activehold.png")
	pieceimagetypenexttero = {}
	pieceimagetypenexttero.I5 = love.graphics.newImage("penta_i5.png")
	pieceimagetypenexttero.T5 = love.graphics.newImage("penta_t5.png")
	pieceimagetypenexttero.Fa = love.graphics.newImage("penta_fa.png")
	pieceimagetypenexttero.Fb = love.graphics.newImage("penta_fb.png")
	pieceimagetypenexttero.Z5b = love.graphics.newImage("penta_z5b.png")
	pieceimagetypenexttero.S5b = love.graphics.newImage("penta_s5b.png")
	pieceimagetypenexttero.V = love.graphics.newImage("penta_v.png")
	pieceimagetypenexttero.W = love.graphics.newImage("penta_w.png")
	pieceimagetypenexttero.T9 = love.graphics.newImage("super_hidden.png")
	pieceimagetypenexttero.T15 = love.graphics.newImage("super_hidden.png")
	pieceimagetypenexttero.D13 = love.graphics.newImage("super_hidden.png")
	pieceimagetypenexttero.U9 = love.graphics.newImage("super_hidden.png")
	pieceimagetypenexttero.Sq2 = love.graphics.newImage("square_hidden.png")
	pieceimagetypenexttero.Sq3 = love.graphics.newImage("square_hidden.png")
	pieceimagetypenexttero.Sq4 = love.graphics.newImage("square_hidden.png")
	pieceimagetypenexttero.Sq5 = love.graphics.newImage("square_hidden.png")
	pieceimagetypeholdtero = {}
	pieceimagetypeholdtero.I5 = love.graphics.newImage("penta_i5.png")
	pieceimagetypeholdtero.T5 = love.graphics.newImage("penta_t5.png")
	pieceimagetypeholdtero.Fa = love.graphics.newImage("penta_fa.png")
	pieceimagetypeholdtero.Fb = love.graphics.newImage("penta_fb.png")
	pieceimagetypeholdtero.Z5b = love.graphics.newImage("penta_z5b.png")
	pieceimagetypeholdtero.S5b = love.graphics.newImage("penta_s5b.png")
	pieceimagetypeholdtero.V = love.graphics.newImage("penta_v.png")
	pieceimagetypeholdtero.W = love.graphics.newImage("penta_w.png")
	pieceimagetypeholdtero.T9 = love.graphics.newImage("super_t9_hold.png")
	pieceimagetypeholdtero.T15 = love.graphics.newImage("super_t15_hold.png")
	pieceimagetypeholdtero.D13 = love.graphics.newImage("super_d13_hold.png")
	pieceimagetypeholdtero.U9 = love.graphics.newImage("super_ue_hold.png")
	pieceimagetypeholdtero.Sq2 = love.graphics.newImage("square_2.png")
	pieceimagetypeholdtero.Sq3 = love.graphics.newImage("square_3.png")
	pieceimagetypeholdtero.Sq4 = love.graphics.newImage("square_4.png")
	pieceimagetypeholdtero.Sq5 = love.graphics.newImage("square_5.png")
	garbageimagetype = {}
	garbageimagetype.red = love.graphics.newImage("garbagebar_red.png")
	garbageimagetype.yellow = love.graphics.newImage("garbagebar_yellow.png")
	garbageimagetype.white = love.graphics.newImage("garbagebar_white.png")
	boardwin = love.graphics.newImage("boardwin.png")
	boardlose = love.graphics.newImage("boardlose.png")
	boarddraw = love.graphics.newImage("boarddraw.png")
	perfectclearboard = love.graphics.newImage("boardpc.png")
	lock = love.audio.newSource("lock.wav", "static")
	rotate = love.audio.newSource("rotate.wav", "static")
	prerotate = love.audio.newSource("prerotate.wav", "static")
	prehold = love.audio.newSource("prehold.wav", "static")
	garbagekick = love.audio.newSource("garbagekick.wav", "static")
	lineclear = love.audio.newSource("lineclear.wav", "static")
	dead = love.audio.newSource("dead.ogg", "static")
	tspinnotify = love.audio.newSource("tspin.ogg", "static")
	softlock = love.audio.newSource("softlock.wav", "static")
	lineclearsingle = love.audio.newSource("linesingle.wav", "static")
	linecleardouble = love.audio.newSource("linedouble.wav", "static")
	linecleartriple = love.audio.newSource("linetriple.wav", "static")
	lineclearquad = love.audio.newSource("linequad.wav", "static")
	finish = love.audio.newSource("finish.wav", "static")
	finishdraw = love.audio.newSource("finishdraw.wav", "static")
	finish1p = love.audio.newSource("p1win.wav", "static")
	finish2p = love.audio.newSource("p2win.wav", "static")
	finishdrawcom = love.audio.newSource("drawgame.wav", "static")
	downtimereset = 60
	controls = {["P1Left"]={"kbd","left"},["P1Right"]={"kbd","right"},["P1SoftDrop"]={"kbd","down"},["P1HardDrop"]={"kbd","up"},["P1CCW"]={"kbd","z"},["P1CW"]={"kbd","x"},["P1Hold"]={"kbd","space"},
	["P2Left"]={"none","none"},["P2Right"]={"none","none"},["P2SoftDrop"]={"none","none"},["P2HardDrop"]={"none","none"},["P2CCW"]={"none","none"},["P2CW"]={"none","none"},["P2Hold"]={"none","none"},}
	controleating = false
	whatcontroleating = nil
	piecekicks={
	["CW"]={
	[0]={
	{-1,0},{-1,1},{0,-2},{-1,-2},
	},
	[1]={
	{1,0},{1,-1},{0,2},{1,2},
	},
	[2]={
	{1,0},{1,1},{0,-2},{1,-2},
	},
	[3]={
	{-1,0},{-1,-1},{0,2},{-1,2},
	},
	},
	["CCW"]={
	[0]={
	{1,0},{1,1},{0,-2},{1,-2},
	},
	[1]={
	{1,0},{1,-1},{0,2},{1,2},
	},
	[2]={
	{-1,0},{-1,1},{0,-2},{-1,-2},
	},
	[3]={
	{-1,0},{-1,-1},{0,2},{-1,2},
	},
	},
	}
	piecekicks.I={
	["CW"]={
	[0]={
	{-2,0},{1,0},{-2,-1},{1,2},
	},
	[1]={
	{-1,0},{2,0},{-1,2},{2,-1},
	},
	[2]={
	{2,0},{-1,0},{2,1},{-1,-2},
	},
	[3]={
	{1,0},{-2,0},{1,-2},{-2,1},
	},
	},
	["CCW"]={
	[0]={
	{-1,0},{2,0},{-1,2},{2,-1},
	},
	[1]={
	{2,0},{-1,0},{2,1},{-1,-2},
	},
	[2]={
	{1,0},{-2,0},{1,-2},{-2,1},
	},
	[3]={
	{-2,0},{1,0},{2,1},{-1,-2},
	},
	},
	}
	piecetype={
	["I"]={
	[0]={
	{0,0,0,0,0},
	{0,0,0,0,0},
	{0,1,1,1,1},
	{0,0,0,0,0},
	{0,0,0,0,0},
	},
	[1]={
	{0,0,0,0,0},
	{0,0,0,1,0},
	{0,0,0,1,0},
	{0,0,0,1,0},
	{0,0,0,1,0},
	},
	[2]={
	{0,0,0,0,0},
	{0,0,0,0,0},
	{0,0,0,0,0},
	{0,1,1,1,1},
	{0,0,0,0,0},
	},
	[3]={
	{0,0,0,0,0},
	{0,0,1,0,0},
	{0,0,1,0,0},
	{0,0,1,0,0},
	{0,0,1,0,0},
	},
	},
	["O"]={
	[0]={
	{0,0,0,0,0},
	{0,0,0,0,0},
	{0,0,1,1,0},
	{0,0,1,1,0},
	{0,0,0,0,0},
	},
	[1]={
	{0,0,0,0,0},
	{0,0,0,0,0},
	{0,0,1,1,0},
	{0,0,1,1,0},
	{0,0,0,0,0},
	},
	[2]={
	{0,0,0,0,0},
	{0,0,0,0,0},
	{0,0,1,1,0},
	{0,0,1,1,0},
	{0,0,0,0,0},
	},
	[3]={
	{0,0,0,0,0},
	{0,0,0,0,0},
	{0,0,1,1,0},
	{0,0,1,1,0},
	{0,0,0,0,0},
	},
	},
	["T"]={
	[0]={
	{0,0,0,0,0},
	{0,0,0,0,0},
	{0,0,1,0,0},
	{0,1,1,1,0},
	{0,0,0,0,0},
	},
	[1]={
	{0,0,0,0,0},
	{0,0,0,0,0},
	{0,0,1,0,0},
	{0,0,1,1,0},
	{0,0,1,0,0},
	},
	[2]={
	{0,0,0,0,0},
	{0,0,0,0,0},
	{0,0,0,0,0},
	{0,1,1,1,0},
	{0,0,1,0,0},
	},
	[3]={
	{0,0,0,0,0},
	{0,0,0,0,0},
	{0,0,1,0,0},
	{0,1,1,0,0},
	{0,0,1,0,0},
	},
	},
	["J"]={
	[0]={
	{0,0,0,0,0},
	{0,0,0,0,0},
	{0,1,0,0,0},
	{0,1,1,1,0},
	{0,0,0,0,0},
	},
	[1]={
	{0,0,0,0,0},
	{0,0,0,0,0},
	{0,0,1,1,0},
	{0,0,1,0,0},
	{0,0,1,0,0},
	},
	[2]={
	{0,0,0,0,0},
	{0,0,0,0,0},
	{0,0,0,0,0},
	{0,1,1,1,0},
	{0,0,0,1,0},
	},
	[3]={
	{0,0,0,0,0},
	{0,0,0,0,0},
	{0,0,1,0,0},
	{0,0,1,0,0},
	{0,1,1,0,0},
	},
	},
	["L"]={
	[0]={
	{0,0,0,0,0},
	{0,0,0,0,0},
	{0,0,0,1,0},
	{0,1,1,1,0},
	{0,0,0,0,0},
	},
	[1]={
	{0,0,0,0,0},
	{0,0,0,0,0},
	{0,0,1,0,0},
	{0,0,1,0,0},
	{0,0,1,1,0},
	},
	[2]={
	{0,0,0,0,0},
	{0,0,0,0,0},
	{0,0,0,0,0},
	{0,1,1,1,0},
	{0,1,0,0,0},
	},
	[3]={
	{0,0,0,0,0},
	{0,0,0,0,0},
	{0,1,1,0,0},
	{0,0,1,0,0},
	{0,0,1,0,0},
	},
	},
	["Z"]={
	[0]={
	{0,0,0,0,0},
	{0,0,0,0,0},
	{0,1,1,0,0},
	{0,0,1,1,0},
	{0,0,0,0,0},
	},
	[1]={
	{0,0,0,0,0},
	{0,0,0,0,0},
	{0,0,0,1,0},
	{0,0,1,1,0},
	{0,0,1,0,0},
	},
	[2]={
	{0,0,0,0,0},
	{0,0,0,0,0},
	{0,0,0,0,0},
	{0,1,1,0,0},
	{0,0,1,1,0},
	},
	[3]={
	{0,0,0,0,0},
	{0,0,0,0,0},
	{0,0,1,0,0},
	{0,1,1,0,0},
	{0,1,0,0,0},
	},
	},
	["S"]={
	[0]={
	{0,0,0,0,0},
	{0,0,0,0,0},
	{0,0,1,1,0},
	{0,1,1,0,0},
	{0,0,0,0,0},
	},
	[1]={
	{0,0,0,0,0},
	{0,0,0,0,0},
	{0,0,1,0,0},
	{0,0,1,1,0},
	{0,0,0,1,0},
	},
	[2]={
	{0,0,0,0,0},
	{0,0,0,0,0},
	{0,0,0,0,0},
	{0,0,1,1,0},
	{0,1,1,0,0},
	},
	[3]={
	{0,0,0,0,0},
	{0,0,0,0,0},
	{0,1,0,0,0},
	{0,1,1,0,0},
	{0,0,1,0,0},
	},
	},
	-- pentomino
	["I5"]={
	[0]={
	{0,0,0,0,0},
	{0,0,0,0,0},
	{1,1,1,1,1},
	{0,0,0,0,0},
	{0,0,0,0,0},
	},
	[1]={
	{0,0,1,0,0},
	{0,0,1,0,0},
	{0,0,1,0,0},
	{0,0,1,0,0},
	{0,0,1,0,0},
	},
	[2]={
	{0,0,0,0,0},
	{0,0,0,0,0},
	{1,1,1,1,1},
	{0,0,0,0,0},
	{0,0,0,0,0},
	},
	[3]={
	{0,0,1,0,0},
	{0,0,1,0,0},
	{0,0,1,0,0},
	{0,0,1,0,0},
	{0,0,1,0,0},
	},
	},
	["J5"]={
	[0]={
	{0,0,0,0,0},
	{0,0,0,0,0},
	{0,0,0,0,1},
	{0,1,1,1,1},
	{0,0,0,0,0},
	},
	[1]={
	{0,0,0,0,0},
	{0,0,1,0,0},
	{0,0,1,0,0},
	{0,0,1,0,0},
	{0,0,1,1,0},
	},
	[2]={
	{0,0,0,0,0},
	{0,0,0,0,0},
	{0,1,1,1,1},
	{0,1,0,0,0},
	{0,0,0,0,0},
	},
	[3]={
	{0,0,0,0,0},
	{0,0,1,1,0},
	{0,0,0,1,0},
	{0,0,0,1,0},
	{0,0,0,1,0},
	},
	},
	["L5"]={
	[0]={
	{0,0,0,0,0},
	{0,0,0,0,0},
	{0,1,0,0,0},
	{0,1,1,1,1},
	{0,0,0,0,0},
	},
	[1]={
	{0,0,0,0,0},
	{0,0,1,1,0},
	{0,0,1,0,0},
	{0,0,1,0,0},
	{0,0,1,0,0},
	},
	[2]={
	{0,0,0,0,0},
	{0,0,0,0,0},
	{0,1,1,1,1},
	{0,0,0,0,1},
	{0,0,0,0,0},
	},
	[3]={
	{0,0,0,0,0},
	{0,0,0,1,0},
	{0,0,0,1,0},
	{0,0,0,1,0},
	{0,0,1,1,0},
	},
	},
	["Z5a"]={
	[0]={
	{0,0,0,0,0},
	{0,0,0,0,0},
	{0,1,1,0,0},
	{0,0,1,1,1},
	{0,0,0,0,0},
	},
	[1]={
	{0,0,0,0,0},
	{0,0,0,1,0},
	{0,0,1,1,0},
	{0,0,1,0,0},
	{0,0,1,0,0},
	},
	[2]={
	{0,0,0,0,0},
	{0,0,0,0,0},
	{0,1,1,1,0},
	{0,0,0,1,1},
	{0,0,0,0,0},
	},
	[3]={
	{0,0,0,0,0},
	{0,0,0,1,0},
	{0,0,0,1,0},
	{0,0,1,1,0},
	{0,0,1,0,0},
	},
	},
	["S5a"]={
	[0]={
	{0,0,0,0,0},
	{0,0,0,0,0},
	{0,0,0,1,1},
	{0,1,1,1,0},
	{0,0,0,0,0},
	},
	[1]={
	{0,0,0,0,0},
	{0,0,1,0,0},
	{0,0,1,0,0},
	{0,0,1,1,0},
	{0,0,0,1,0},
	},
	[2]={
	{0,0,0,0,0},
	{0,0,0,0,0},
	{0,0,1,1,1},
	{0,1,1,0,0},
	{0,0,0,0,0},
	},
	[3]={
	{0,0,0,0,0},
	{0,0,1,0,0},
	{0,0,1,1,0},
	{0,0,0,1,0},
	{0,0,0,1,0},
	},
	},
	["Z5b"]={
	[0]={
	{0,0,0,0,0},
	{0,0,0,0,0},
	{0,1,1,0,0},
	{0,0,1,0,0},
	{0,0,1,1,0},
	},
	[1]={
	{0,0,0,0,0},
	{0,0,0,0,0},
	{0,0,0,1,0},
	{0,1,1,1,0},
	{0,1,0,0,0},
	},
	[2]={
	{0,0,0,0,0},
	{0,0,0,0,0},
	{0,1,1,0,0},
	{0,0,1,0,0},
	{0,0,1,1,0},
	},
	[3]={
	{0,0,0,0,0},
	{0,0,0,0,0},
	{0,0,0,1,0},
	{0,1,1,1,0},
	{0,1,0,0,0},
	},
	},
	["S5b"]={
	[0]={
	{0,0,0,0,0},
	{0,0,0,0,0},
	{0,0,1,1,0},
	{0,0,1,0,0},
	{0,1,1,0,0},
	},
	[1]={
	{0,0,0,0,0},
	{0,0,0,0,0},
	{0,1,0,0,0},
	{0,1,1,1,0},
	{0,0,0,1,0},
	},
	[2]={
	{0,0,0,0,0},
	{0,0,0,0,0},
	{0,0,1,1,0},
	{0,0,1,0,0},
	{0,1,1,0,0},
	},
	[3]={
	{0,0,0,0,0},
	{0,0,0,0,0},
	{0,1,0,0,0},
	{0,1,1,1,0},
	{0,0,0,1,0},
	},
	},
	-- square
	["Sq2"]={
	[0]={
	{0,0,0,0,0},
	{0,0,0,0,0},
	{0,0,1,1,0},
	{0,0,1,1,0},
	{0,0,0,0,0},
	},
	[1]={
	{0,0,0,0,0},
	{0,0,0,0,0},
	{0,0,1,1,0},
	{0,0,1,1,0},
	{0,0,0,0,0},
	},
	[2]={
	{0,0,0,0,0},
	{0,0,0,0,0},
	{0,0,1,1,0},
	{0,0,1,1,0},
	{0,0,0,0,0},
	},
	[3]={
	{0,0,0,0,0},
	{0,0,0,0,0},
	{0,0,1,1,0},
	{0,0,1,1,0},
	{0,0,0,0,0},
	},
	},
	["Sq3"]={
	[0]={
	{0,0,0,0,0},
	{0,1,1,1,0},
	{0,1,1,1,0},
	{0,1,1,1,0},
	{0,0,0,0,0},
	},
	[1]={
	{0,0,0,0,0},
	{0,1,1,1,0},
	{0,1,1,1,0},
	{0,1,1,1,0},
	{0,0,0,0,0},
	},
	[2]={
	{0,0,0,0,0},
	{0,1,1,1,0},
	{0,1,1,1,0},
	{0,1,1,1,0},
	{0,0,0,0,0},
	},
	[3]={
	{0,0,0,0,0},
	{0,1,1,1,0},
	{0,1,1,1,0},
	{0,1,1,1,0},
	{0,0,0,0,0},
	},
	},
	["Sq4"]={
	[0]={
	{0,0,0,0,0},
	{0,1,1,1,1},
	{0,1,1,1,1},
	{0,1,1,1,1},
	{0,1,1,1,1},
	},
	[1]={
	{0,0,0,0,0},
	{0,1,1,1,1},
	{0,1,1,1,1},
	{0,1,1,1,1},
	{0,1,1,1,1},
	},
	[2]={
	{0,0,0,0,0},
	{0,1,1,1,1},
	{0,1,1,1,1},
	{0,1,1,1,1},
	{0,1,1,1,1},
	},
	[3]={
	{0,0,0,0,0},
	{0,1,1,1,1},
	{0,1,1,1,1},
	{0,1,1,1,1},
	{0,1,1,1,1},
	},
	},
	["Sq5"]={
	[0]={
	{1,1,1,1,1},
	{1,1,1,1,1},
	{1,1,1,1,1},
	{1,1,1,1,1},
	{1,1,1,1,1},
	},
	[1]={
	{1,1,1,1,1},
	{1,1,1,1,1},
	{1,1,1,1,1},
	{1,1,1,1,1},
	{1,1,1,1,1},
	},
	[2]={
	{1,1,1,1,1},
	{1,1,1,1,1},
	{1,1,1,1,1},
	{1,1,1,1,1},
	{1,1,1,1,1},
	},
	[3]={
	{1,1,1,1,1},
	{1,1,1,1,1},
	{1,1,1,1,1},
	{1,1,1,1,1},
	{1,1,1,1,1},
	},
	},
	-- super
	["D13"]={
	["unoffsetable"]=true,
	[0]={
	{0,0,1,0,0},
	{0,1,1,1,0},
	{1,1,1,1,1},
	{0,1,1,1,0},
	{0,0,1,0,0},
	},
	[1]={
	{0,0,1,0,0},
	{0,1,1,1,0},
	{1,1,1,1,1},
	{0,1,1,1,0},
	{0,0,1,0,0},
	},
	[2]={
	{0,0,1,0,0},
	{0,1,1,1,0},
	{1,1,1,1,1},
	{0,1,1,1,0},
	{0,0,1,0,0},
	},
	[3]={
	{0,0,1,0,0},
	{0,1,1,1,0},
	{1,1,1,1,1},
	{0,1,1,1,0},
	{0,0,1,0,0},
	},
	},
	["T9"]={
	["unoffsetable"]=true,
	[0]={
	{0,0,0,0,0},
	{0,0,1,0,0},
	{0,1,1,1,0},
	{1,1,1,1,1},
	{0,0,0,0,0},
	},
	[1]={
	{0,1,0,0,0},
	{0,1,1,0,0},
	{0,1,1,1,0},
	{0,1,1,0,0},
	{0,1,0,0,0},
	},
	[2]={
	{0,0,0,0,0},
	{1,1,1,1,1},
	{0,1,1,1,0},
	{0,0,1,0,0},
	{0,0,0,0,0},
	},
	[3]={
	{0,0,0,1,0},
	{0,0,1,1,0},
	{0,1,1,1,0},
	{0,0,1,1,0},
	{0,0,0,1,0},
	},
	},
	["T15"]={
	["unoffsetable"]=true,
	[0]={
	{1,0,0,0,0},
	{1,1,0,0,0},
	{1,1,1,0,0},
	{1,1,1,1,0},
	{1,1,1,1,1},
	},
	[1]={
	{1,1,1,1,1},
	{1,1,1,1,0},
	{1,1,1,0,0},
	{1,1,0,0,0},
	{1,0,0,0,0},
	},
	[2]={
	{1,1,1,1,1},
	{0,1,1,1,1},
	{0,0,1,1,1},
	{0,0,0,1,1},
	{0,0,0,0,1},
	},
	[3]={
	{0,0,0,0,1},
	{0,0,0,1,1},
	{0,0,1,1,1},
	{0,1,1,1,1},
	{1,1,1,1,1},
	},
	},
	["U9"]={
	["unoffsetable"]=true,
	[0]={
	{0,0,0,0,0},
	{0,0,1,0,0},
	{0,0,1,1,0},
	{0,0,1,0,0},
	{1,1,1,1,1},
	},
	[1]={
	{1,0,0,0,0},
	{1,0,0,0,0},
	{1,1,1,1,0},
	{1,0,1,0,0},
	{1,0,0,0,0},
	},
	[2]={
	{1,1,1,1,1},
	{0,0,1,0,0},
	{0,1,1,0,0},
	{0,0,1,0,0},
	{0,0,0,0,0},
	},
	[3]={
	{0,0,0,0,1},
	{0,0,1,0,1},
	{0,1,1,1,1},
	{0,0,0,0,1},
	{0,0,0,0,1},
	},
	},
	}
	boardencode = {["E"]="_",["I"]="i",["O"]="o",["T"]="t",["J"]="j",["L"]="l",["Z"]="z",["S"]="s",["G"]="#",}
	boarddecode = {["_"]="E",["i"]="I",["o"]="O",["t"]="T",["j"]="J",["l"]="L",["z"]="Z",["s"]="S",["#"]="G",}
	p1 = {}
	initplayer(p1)
	p2 = {}
	initplayer(p2)
end
	function tablltablltabllcontains(list, x)
		for _, v in pairs(list) do
			if v == x then return true end
		end
		return false
	end
	function deepCopy(original)
		local copy = {}
		for k, v in pairs(original) do
			if type(v) == "table" then
				v = deepCopy(v)
			end
			copy[k] = v
		end
		return copy
	end
	function readboard(spacing,memlocation,yspacing,globalyspacing,writeinreverse)
		local boardlist = {}
		for _ = 1, 20 do
			for _, h in pairs(spacing.board[memlocation]) do
				if writeinreverse then
					table.insert(boardlist,1,h)
				else
					table.insert(boardlist,h)
				end
			end
			memlocation=memlocation+1
		end
		return boardlist
	end
	function writeboard(spacing,memlocation,yspacing,globalyspacing,input,readinreverse)
		local boardlist = deepCopy(input)
		if readinreverse then
			for h = 20, 1, -1 do
				assistant = {}
				assistant[1] = boardlist[(h*10)-9]
				assistant[2] = boardlist[(h*10)-8]
				assistant[3] = boardlist[(h*10)-7]
				assistant[4] = boardlist[(h*10)-6]
				assistant[5] = boardlist[(h*10)-5]
				assistant[6] = boardlist[(h*10)-4]
				assistant[7] = boardlist[(h*10)-3]
				assistant[8] = boardlist[(h*10)-2]
				assistant[9] = boardlist[(h*10)-1]
				assistant[10] = boardlist[(h*10)]
				spacing.board[h] = assistant
			end
		else
			for h = 1, 20 do
				assistant = {}
				assistant[1] = boardlist[(h*10)-9]
				assistant[2] = boardlist[(h*10)-8]
				assistant[3] = boardlist[(h*10)-7]
				assistant[4] = boardlist[(h*10)-6]
				assistant[5] = boardlist[(h*10)-5]
				assistant[6] = boardlist[(h*10)-4]
				assistant[7] = boardlist[(h*10)-3]
				assistant[8] = boardlist[(h*10)-2]
				assistant[9] = boardlist[(h*10)-1]
				assistant[10] = boardlist[(h*10)]
				spacing.board[h] = assistant
			end
		end
	end
	function encodeboard(boardlist,reftable)
		local encoding = ""
		for _,h in pairs(boardlist) do
			encoding = encoding .. reftable[h]
		end
		return encoding
	end
	function decodeboard(boardstring,reftable)
		local decoding = {}
		for h = 1, string.len(boardstring) do
			decoding[h] = reftable[string.sub(boardstring,h,h)]
		end
		return decoding
	end
function initplayer(player)
	player.board=
	{
	{"E","E","E","E","E","E","E","E","E","E",},
	{"E","E","E","E","E","E","E","E","E","E",},
	{"E","E","E","E","E","E","E","E","E","E",},
	{"E","E","E","E","E","E","E","E","E","E",},
	{"E","E","E","E","E","E","E","E","E","E",},
	{"E","E","E","E","E","E","E","E","E","E",},
	{"E","E","E","E","E","E","E","E","E","E",},
	{"E","E","E","E","E","E","E","E","E","E",},
	{"E","E","E","E","E","E","E","E","E","E",},
	{"E","E","E","E","E","E","E","E","E","E",},
	{"E","E","E","E","E","E","E","E","E","E",},
	{"E","E","E","E","E","E","E","E","E","E",},
	{"E","E","E","E","E","E","E","E","E","E",},
	{"E","E","E","E","E","E","E","E","E","E",},
	{"E","E","E","E","E","E","E","E","E","E",},
	{"E","E","E","E","E","E","E","E","E","E",},
	{"E","E","E","E","E","E","E","E","E","E",},
	{"E","E","E","E","E","E","E","E","E","E",},
	{"E","E","E","E","E","E","E","E","E","E",},
	{"E","E","E","E","E","E","E","E","E","E",},
	{"E","E","E","E","E","E","E","E","E","E",},
	{"E","E","E","E","E","E","E","E","E","E",},
	{"E","E","E","E","E","E","E","E","E","E",},
	{"E","E","E","E","E","E","E","E","E","E",},
	{"E","E","E","E","E","E","E","E","E","E",},
	{"E","E","E","E","E","E","E","E","E","E",},
	{"E","E","E","E","E","E","E","E","E","E",},
	{"E","E","E","E","E","E","E","E","E","E",},
	{"E","E","E","E","E","E","E","E","E","E",},
	{"E","E","E","E","E","E","E","E","E","E",},
	{"E","E","E","E","E","E","E","E","E","E",},
	{"E","E","E","E","E","E","E","E","E","E",},
	{"E","E","E","E","E","E","E","E","E","E",},
	{"E","E","E","E","E","E","E","E","E","E",},
	{"E","E","E","E","E","E","E","E","E","E",},
	{"E","E","E","E","E","E","E","E","E","E",},
	{"E","E","E","E","E","E","E","E","E","E",},
	{"E","E","E","E","E","E","E","E","E","E",},
	{"E","E","E","E","E","E","E","E","E","E",},
	{"E","E","E","E","E","E","E","E","E","E",},
	}
	player.pieceactive=false
	player.piecex=0
	player.piecey=0
	player.piecerotation=0
	player.piececurrent="E"
	player.piecequeue={"T15","T15","T15","T15","T15","T15","T15","T15",}
	player.attackincoming=0
	player.linecleartrigger=false
	player.lineclears=0
	player.dead=false
	player.ccwinput=false
	player.ccwlock=false
	player.cwinput=false
	player.cwlock=false
	player.holdinput=false
	player.holdlock=false
	player.holdpiece="E"
	player.tspin="no"
	player.btbs=-1
	player.combo=-1
	player.perfectclear=false
	player.leftinput=false
	player.leftdas=10
	player.rightinput=false
	player.rightdas=10
	player.sdinput=false
	player.hdinput=false
	player.donotnext=false
	player.stillholding=false
	player.amisafe=true
	player.downwardtime=downtimereset
	player.movereset=15
	player.rotreset=15
	player.locktime=30
	player.perfectclearframes=0
end
function collidetest(board,x,y)
	local clipping = false
	if x <= 0 or x >= 11 or (y <= 0 and (x <= 0 or x >= 11)) or y >= 41 then
		clipping = true
	else
		if y >= 1 then
			if board[y][x] ~= "E" then
				clipping = true
			end
		end
	end
	return clipping
end
function ShuffleInPlace(t)
    for i = #t, 2, -1 do
        local j = love.math.random(i)
        t[i], t[j] = t[j], t[i]
    end
end
function sevenbag()
	local bag = {"I","O","T","J","L","Z","S",}
	ShuffleInPlace(bag)
	return bag
end
function love.keypressed(key, scancode, isrepeat)
	if controleating then
	controls[whatcontroleating][1] = "kbd"
	controls[whatcontroleating][2] = key
	controleating = false
	love.audio.stop(tspinnotify)
	love.audio.play(tspinnotify)
	else
	if controls.P1CCW[1] == "kbd" and key == controls.P1CCW[2] then
		p1.ccwinput=true
	end
	if controls.P1CW[1] == "kbd" and key == controls.P1CW[2] then
		p1.cwinput=true
	end
	if controls.P1Left[1] == "kbd" and key == controls.P1Left[2] then
		p1.leftinput=true
	end
	if controls.P1Right[1] == "kbd" and key == controls.P1Right[2] then
		p1.rightinput=true
	end
	if controls.P1SoftDrop[1] == "kbd" and key == controls.P1SoftDrop[2] then
		p1.sdinput=true
	end
	if controls.P1HardDrop[1] == "kbd" and key == controls.P1HardDrop[2] then
		p1.hdinput=true
	end
	if controls.P1Hold[1] == "kbd" and key == controls.P1Hold[2] then
		p1.holdinput=true
	end
	if controls.P2CCW[1] == "kbd" and key == controls.P2CCW[2] then
		p2.ccwinput=true
	end
	if controls.P2CW[1] == "kbd" and key == controls.P2CW[2] then
		p2.cwinput=true
	end
	if controls.P2Left[1] == "kbd" and key == controls.P2Left[2] then
		p2.leftinput=true
	end
	if controls.P2Right[1] == "kbd" and key == controls.P2Right[2] then
		p2.rightinput=true
	end
	if controls.P2SoftDrop[1] == "kbd" and key == controls.P2SoftDrop[2] then
		p2.sdinput=true
	end
	if controls.P2HardDrop[1] == "kbd" and key == controls.P2HardDrop[2] then
		p2.hdinput=true
	end
	if controls.P2Hold[1] == "kbd" and key == controls.P2Hold[2] then
		p2.holdinput=true
	end
	end
end
function love.keyreleased(key)
	if controls.P1CCW[1] == "kbd" and key == controls.P1CCW[2] then
		p1.ccwinput=false
	end
	if controls.P1CW[1] == "kbd" and key == controls.P1CW[2] then
		p1.cwinput=false
	end
	if controls.P1Left[1] == "kbd" and key == controls.P1Left[2] then
		p1.leftinput=false
	end
	if controls.P1Right[1] == "kbd" and key == controls.P1Right[2] then
		p1.rightinput=false
	end
	if controls.P1SoftDrop[1] == "kbd" and key == controls.P1SoftDrop[2] then
		p1.sdinput=false
	end
	if controls.P1HardDrop[1] == "kbd" and key == controls.P1HardDrop[2] then
		p1.hdinput=false
	end
	if controls.P1Hold[1] == "kbd" and key == controls.P1Hold[2] then
		p1.holdinput=false
	end
	if controls.P2CCW[1] == "kbd" and key == controls.P2CCW[2] then
		p2.ccwinput=false
	end
	if controls.P2CW[1] == "kbd" and key == controls.P2CW[2] then
		p2.cwinput=false
	end
	if controls.P2Left[1] == "kbd" and key == controls.P2Left[2] then
		p2.leftinput=false
	end
	if controls.P2Right[1] == "kbd" and key == controls.P2Right[2] then
		p2.rightinput=false
	end
	if controls.P2SoftDrop[1] == "kbd" and key == controls.P2SoftDrop[2] then
		p2.sdinput=false
	end
	if controls.P2HardDrop[1] == "kbd" and key == controls.P2HardDrop[2] then
		p2.hdinput=false
	end
	if controls.P2Hold[1] == "kbd" and key == controls.P2Hold[2] then
		p2.holdinput=false
	end
end
function love.gamepadpressed(control, key)
	if controleating then
	controls[whatcontroleating][1] = control
	controls[whatcontroleating][2] = key
	controleating = false
	love.audio.stop(tspinnotify)
	love.audio.play(tspinnotify)
	else
	if controls.P1CCW[1] == control and key == controls.P1CCW[2] then
		p1.ccwinput=true
	end
	if controls.P1CW[1] == control and key == controls.P1CW[2] then
		p1.cwinput=true
	end
	if controls.P1Left[1] == control and key == controls.P1Left[2] then
		p1.leftinput=true
	end
	if controls.P1Right[1] == control and key == controls.P1Right[2] then
		p1.rightinput=true
	end
	if controls.P1SoftDrop[1] == control and key == controls.P1SoftDrop[2] then
		p1.sdinput=true
	end
	if controls.P1HardDrop[1] == control and key == controls.P1HardDrop[2] then
		p1.hdinput=true
	end
	if controls.P1Hold[1] == control and key == controls.P1Hold[2] then
		p1.holdinput=true
	end
	if controls.P2CCW[1] == control and key == controls.P2CCW[2] then
		p2.ccwinput=true
	end
	if controls.P2CW[1] == control and key == controls.P2CW[2] then
		p2.cwinput=true
	end
	if controls.P2Left[1] == control and key == controls.P2Left[2] then
		p2.leftinput=true
	end
	if controls.P2Right[1] == control and key == controls.P2Right[2] then
		p2.rightinput=true
	end
	if controls.P2SoftDrop[1] == control and key == controls.P2SoftDrop[2] then
		p2.sdinput=true
	end
	if controls.P2HardDrop[1] == control and key == controls.P2HardDrop[2] then
		p2.hdinput=true
	end
	if controls.P2Hold[1] == control and key == controls.P2Hold[2] then
		p2.holdinput=true
	end
	end
end
function love.gamepadreleased(control, key)
	if controls.P1CCW[1] == control and key == controls.P1CCW[2] then
		p1.ccwinput=false
	end
	if controls.P1CW[1] == control and key == controls.P1CW[2] then
		p1.cwinput=false
	end
	if controls.P1Left[1] == control and key == controls.P1Left[2] then
		p1.leftinput=false
	end
	if controls.P1Right[1] == control and key == controls.P1Right[2] then
		p1.rightinput=false
	end
	if controls.P1SoftDrop[1] == control and key == controls.P1SoftDrop[2] then
		p1.sdinput=false
	end
	if controls.P1HardDrop[1] == control and key == controls.P1HardDrop[2] then
		p1.hdinput=false
	end
	if controls.P1Hold[1] == control and key == controls.P1Hold[2] then
		p1.holdinput=false
	end
	if controls.P2CCW[1] == control and key == controls.P2CCW[2] then
		p2.ccwinput=false
	end
	if controls.P2CW[1] == control and key == controls.P2CW[2] then
		p2.cwinput=false
	end
	if controls.P2Left[1] == control and key == controls.P2Left[2] then
		p2.leftinput=false
	end
	if controls.P2Right[1] == control and key == controls.P2Right[2] then
		p2.rightinput=false
	end
	if controls.P2SoftDrop[1] == control and key == controls.P2SoftDrop[2] then
		p2.sdinput=false
	end
	if controls.P2HardDrop[1] == control and key == controls.P2HardDrop[2] then
		p2.hdinput=false
	end
	if controls.P2Hold[1] == control and key == controls.P2Hold[2] then
		p2.holdinput=false
	end
end
function love.gamepadaxis(control, key, activation)
	if controleating and activation >= 0.5 then
	controls[whatcontroleating][1] = control
	controls[whatcontroleating][2] = key
	love.audio.stop(tspinnotify)
	love.audio.play(tspinnotify)
	else
	if controls.P1CCW[1] == control and key == controls.P1CCW[2] then
		p1.ccwinput=activation >= 0.5
	end
	if controls.P1CW[1] == control and key == controls.P1CW[2] then
		p1.cwinput=activation >= 0.5
	end
	if controls.P1Left[1] == control and key == controls.P1Left[2] then
		p1.leftinput=activation >= 0.5
	end
	if controls.P1Right[1] == control and key == controls.P1Right[2] then
		p1.rightinput=activation >= 0.5
	end
	if controls.P1SoftDrop[1] == control and key == controls.P1SoftDrop[2] then
		p1.sdinput=activation >= 0.5
	end
	if controls.P1HardDrop[1] == control and key == controls.P1HardDrop[2] then
		p1.hdinput=activation >= 0.5
	end
	if controls.P1Hold[1] == control and key == controls.P1Hold[2] then
		p1.holdinput=activation >= 0.5
	end
	if controls.P2CCW[1] == control and key == controls.P2CCW[2] then
		p2.ccwinput=activation >= 0.5
	end
	if controls.P2CW[1] == control and key == controls.P2CW[2] then
		p2.cwinput=activation >= 0.5
	end
	if controls.P2Left[1] == control and key == controls.P2Left[2] then
		p2.leftinput=activation >= 0.5
	end
	if controls.P2Right[1] == control and key == controls.P2Right[2] then
		p2.rightinput=activation >= 0.5
	end
	if controls.P2SoftDrop[1] == control and key == controls.P2SoftDrop[2] then
		p2.sdinput=activation >= 0.5
	end
	if controls.P2HardDrop[1] == control and key == controls.P2HardDrop[2] then
		p2.hdinput=activation >= 0.5
	end
	if controls.P2Hold[1] == control and key == controls.P2Hold[2] then
		p2.holdinput=activation >= 0.5
	end
	end
end
function love.mousepressed( x, y, button, istouch, presses )
	if button ~= 1 then return end
	if controleating then
		love.audio.stop(dead)
		love.audio.play(dead)
		controleating = false
	elseif y <= 15 then
		if 0 <= x and x <= 15 then
			love.audio.stop(lock)
			love.audio.play(lock)
			controleating = true
			whatcontroleating = "P1CCW"
		end
		if 16 <= x and x <= 31 then
			love.audio.stop(lock)
			love.audio.play(lock)
			controleating = true
			whatcontroleating = "P1CW"
		end
		if 32 <= x and x <= 47 then
			love.audio.stop(lock)
			love.audio.play(lock)
			controleating = true
			whatcontroleating = "P1Left"
		end
		if 48 <= x and x <= 63 then
			love.audio.stop(lock)
			love.audio.play(lock)
			controleating = true
			whatcontroleating = "P1Right"
		end
		if 64 <= x and x <= 79 then
			love.audio.stop(lock)
			love.audio.play(lock)
			controleating = true
			whatcontroleating = "P1SoftDrop"
		end
		if 80 <= x and x <= 95 then
			love.audio.stop(lock)
			love.audio.play(lock)
			controleating = true
			whatcontroleating = "P1HardDrop"
		end
		if 96 <= x and x <= 111 then
			love.audio.stop(lock)
			love.audio.play(lock)
			controleating = true
			whatcontroleating = "P1Hold"
		end
		if 128 <= x and x <= 15+128 then
			love.audio.stop(lock)
			love.audio.play(lock)
			controleating = true
			whatcontroleating = "P2CCW"
		end
		if 16+128 <= x and x <= 31+128 then
			love.audio.stop(lock)
			love.audio.play(lock)
			controleating = true
			whatcontroleating = "P2CW"
		end
		if 32+128 <= x and x <= 47+128 then
			love.audio.stop(lock)
			love.audio.play(lock)
			controleating = true
			whatcontroleating = "P2Left"
		end
		if 48+128 <= x and x <= 63+128 then
			love.audio.stop(lock)
			love.audio.play(lock)
			controleating = true
			whatcontroleating = "P2Right"
		end
		if 64+128 <= x and x <= 79+128 then
			love.audio.stop(lock)
			love.audio.play(lock)
			controleating = true
			whatcontroleating = "P2SoftDrop"
		end
		if 80+128 <= x and x <= 95+128 then
			love.audio.stop(lock)
			love.audio.play(lock)
			controleating = true
			whatcontroleating = "P2HardDrop"
		end
		if 96+128 <= x and x <= 111+128 then
			love.audio.stop(lock)
			love.audio.play(lock)
			controleating = true
			whatcontroleating = "P2Hold"
		end
	end
end
function piececollidetest(board,piecetyperr,rotation,x,y)
	clipping = false
	for pies2 = 1 ,5 do
		for pies1 = 1 ,5 do
			if piecetype[piecetyperr][rotation][pies2][pies1] == 1 then
				if collidetest(board,x+pies1-1,y+pies2-1) == true then
					clipping = true
				end
			end
		end
	end
	return clipping
end
function tspintest(board,rotation,x,y)
	local tspin = "no"
	local tspina = collidetest(board,x+1,y+2)
	local tspinb = collidetest(board,x+3,y+2)
	local tspinc = collidetest(board,x+1,y+4)
	local tspind = collidetest(board,x+3,y+4)
	if rotation == 0 or rotation == 2 then
		if tspina and tspinb and (tspinc or tspind) then
			tspin = rotation == 0 and "full" or "mini"
		elseif tspinc and tspind and (tspina or tspinb) then
			tspin = rotation == 2 and "full" or "mini"
		end
	elseif rotation == 1 or rotation == 3 then
		if tspinb and tspind and (tspina or tspinc) then
			tspin = rotation == 1 and "full" or "mini"
		elseif tspina and tspinc and (tspinb or tspind) then
			tspin = rotation == 3 and "full" or "mini"
		end
	end
	return tspin
end
function modmod(a,b)return a-math.floor(a/b)*b end
function updateplayer(player)
	player.perfectclearframes=player.perfectclearframes-1
	if player.pieceactive == false and player.dead == false then
		player.pieceactive = true
		if not player.donotnext then
			player.piececurrent = table.remove(player.piecequeue,1)
			if #player.piecequeue < 1 then
				table.insert(player.piecequeue,table.remove(sharedpiecequeue,1))
			end
		end
		player.piecex = 3
		player.piecey = 16
		player.piecerotation = 0
		player.downwardtime=downtimereset
		player.locktime = 30
		player.movereset = 15
		player.rotreset = 15
		player.ccwlock = false
		player.cwlock = false
		player.holdlock = false
		player.tspin = "no"
		if (player.ccwinput or player.cwinput) and (not(player.ccwinput and player.cwinput)) then
			love.audio.stop(prerotate)
			love.audio.play(prerotate)
		end
		if (player.holdinput or player.stillholding) and (not player.donotnext) then
			love.audio.stop(prehold)
			love.audio.play(prehold)
		end
		if (player.holdinput or player.stillholding) then
			player.holdlock = true
			player.donotnext = false
			player.stillholding = false
			if player.holdpiece == "E" then
				player.holdpiece = player.piececurrent
				player.piececurrent = table.remove(player.piecequeue,1)
				if #player.piecequeue < 1 then
					table.insert(player.piecequeue,table.remove(sharedpiecequeue,1))
				end
			else
				player.holdpiece, player.piececurrent = player.piececurrent, player.holdpiece
			end
		end
		if piececollidetest(player.board,player.piececurrent,player.piecerotation,player.piecex,player.piecey) then
			player.dead = true
			love.audio.stop(dead)
			love.audio.play(dead)
		end
	end
	if player.pieceactive == true and player.dead == false then
		player.downwardtime=player.downwardtime-1
		if piececollidetest(player.board,player.piececurrent,player.piecerotation,player.piecex,player.piecey+1) then
			player.downwardtime=downtimereset
			player.locktime=player.locktime-1
		else
			player.locktime=30
		end
		if player.sdinput or player.downwardtime <= 0 then
			player.downwardtime=downtimereset
			player.piecey = player.piecey+1
			if piececollidetest(player.board,player.piececurrent,player.piecerotation,player.piecex,player.piecey) then
				player.piecey = player.piecey-1
			end
		end
		if not player.ccwinput then
			player.ccwlock = false
		end
		if player.ccwinput and (not player.ccwlock) then
			player.ccwlock = true
			local kicklol = player.piecerotation
			local kicksum = 0
			player.piecerotation = modmod(player.piecerotation-1,4)
			if piececollidetest(player.board,player.piececurrent,player.piecerotation,player.piecex,player.piecey) then
			while piececollidetest(player.board,player.piececurrent,player.piecerotation,player.piecex,player.piecey) do
				kicksum = kicksum + 1
				if kicksum > 4 then
					player.piecerotation = modmod(player.piecerotation+1,4)
				else
					if piecekicks[player.piececurrent] then
						player.piecex = player.piecex+piecekicks[player.piececurrent]["CCW"][kicklol][kicksum][1]
						player.piecey = player.piecey-piecekicks[player.piececurrent]["CCW"][kicklol][kicksum][2]
						if piececollidetest(player.board,player.piececurrent,player.piecerotation,player.piecex,player.piecey) then
							player.piecex = player.piecex-piecekicks[player.piececurrent]["CCW"][kicklol][kicksum][1]
							player.piecey = player.piecey+piecekicks[player.piececurrent]["CCW"][kicklol][kicksum][2]
						end
					else
						player.piecex = player.piecex+piecekicks["CCW"][kicklol][kicksum][1]
						player.piecey = player.piecey-piecekicks["CCW"][kicklol][kicksum][2]
						if piececollidetest(player.board,player.piececurrent,player.piecerotation,player.piecex,player.piecey) then
							player.piecex = player.piecex-piecekicks["CCW"][kicklol][kicksum][1]
							player.piecey = player.piecey+piecekicks["CCW"][kicklol][kicksum][2]
						end
					end
				end
			end
			end
			if kicksum <= 4 then
				love.audio.stop(rotate)
				love.audio.play(rotate)
				if player.piececurrent == "T" then
					player.tspin = tspintest(player.board,player.piecerotation,player.piecex,player.piecey)
					if kicksum == 4 and player.tspin == "mini" then
						player.tspin = "full"
					end
				end
				if player.locktime < 30 then
					player.locktime = 30
					player.rotreset = player.rotreset - 1
				end
			end
		end
		if not player.cwinput then
			player.cwlock = false
		end
		if player.cwinput and (not player.cwlock) then
			player.cwlock = true
			local kicklol = player.piecerotation
			local kicksum = 0
			player.piecerotation = modmod(player.piecerotation+1,4)
			if piececollidetest(player.board,player.piececurrent,player.piecerotation,player.piecex,player.piecey) then
			while piececollidetest(player.board,player.piececurrent,player.piecerotation,player.piecex,player.piecey) do
				kicksum = kicksum + 1
				if kicksum > 4 then
				player.piecerotation = modmod(player.piecerotation-1,4)
				else
					if piecekicks[player.piececurrent] then
						player.piecex = player.piecex+piecekicks[player.piececurrent]["CW"][kicklol][kicksum][1]
						player.piecey = player.piecey-piecekicks[player.piececurrent]["CW"][kicklol][kicksum][2]
						if piececollidetest(player.board,player.piececurrent,player.piecerotation,player.piecex,player.piecey) then
							player.piecex = player.piecex-piecekicks[player.piececurrent]["CW"][kicklol][kicksum][1]
							player.piecey = player.piecey+piecekicks[player.piececurrent]["CW"][kicklol][kicksum][2]
						end
					else
						player.piecex = player.piecex+piecekicks["CW"][kicklol][kicksum][1]
						player.piecey = player.piecey-piecekicks["CW"][kicklol][kicksum][2]
						if piececollidetest(player.board,player.piececurrent,player.piecerotation,player.piecex,player.piecey) then
							player.piecex = player.piecex-piecekicks["CW"][kicklol][kicksum][1]
							player.piecey = player.piecey+piecekicks["CW"][kicklol][kicksum][2]
						end
					end
				end
			end
			end
			if kicksum <= 4 then
				love.audio.stop(rotate)
				love.audio.play(rotate)
				if player.piececurrent == "T" then
					player.tspin = tspintest(player.board,player.piecerotation,player.piecex,player.piecey)
					if kicksum == 4 and player.tspin == "mini" then
						player.tspin = "full"
					end
				end
				if player.locktime < 30 then
					player.locktime = 30
					player.rotreset = player.rotreset - 1
					player.tspin = "no"
				end
			end
		end
		if (not player.leftinput) or (player.leftinput and player.rightinput) then
			player.leftdas = 10
		end
		if player.leftinput and (not(player.leftinput and player.rightinput)) then
			if player.leftdas == 10 or player.leftdas < 0 then
				ishemoving = true
				player.piecex = player.piecex - 1
				if piececollidetest(player.board,player.piececurrent,player.piecerotation,player.piecex,player.piecey) then
					ishemoving = false
					player.piecex = player.piecex + 1
				end
				if player.locktime < 30 and ishemoving then
					player.locktime = 30
					player.movereset = player.movereset - 1
					player.tspin = "no"
				end
			end
			player.leftdas = player.leftdas - 1
		end
		if (not player.rightinput) or (player.leftinput and player.rightinput) then
			player.rightdas = 10
		end
		if player.rightinput and (not(player.leftinput and player.rightinput)) then
			if player.rightdas == 10 or player.rightdas < 0 then
				ishemoving = true
				player.piecex = player.piecex + 1
				if piececollidetest(player.board,player.piececurrent,player.piecerotation,player.piecex,player.piecey) then
					ishemoving = false
					player.piecex = player.piecex - 1
				end
				if player.locktime < 30 and ishemoving then
					player.locktime = 30
					player.movereset = player.movereset - 1
				end
			end
			player.rightdas = player.rightdas - 1
		end
		if player.locktime <= 0 or player.movereset <= 0 or player.rotreset <= 0 and (not (player.hdinput or player.holdinput)) then
			while piececollidetest(player.board,player.piececurrent,player.piecerotation,player.piecex,player.piecey) == false do
				player.piecey = player.piecey+1
			end
			player.piecey = player.piecey-1
			player.pieceactive = false
			player.amisafe = false
			for pies2 = 1 ,5 do
				for pies1 = 1 ,5 do
					if (piecetype[player.piececurrent][player.piecerotation][pies2][pies1] == 1) and (player.piecey+pies2-1 >= 1) then
						player.board[player.piecey+pies2-1][player.piecex+pies1-1] = player.piececurrent
						if player.piecey+pies2 >= 22 then
							player.amisafe = true
						end
					end
				end
			end
			love.audio.stop(softlock)
			love.audio.play(softlock)
		end
		if player.hdinput then
			while piececollidetest(player.board,player.piececurrent,player.piecerotation,player.piecex,player.piecey) == false do
				player.piecey = player.piecey+1
			end
			player.piecey = player.piecey-1
			player.pieceactive = false
			player.hdinput = false
			player.amisafe = false
			for pies2 = 1 ,5 do
				for pies1 = 1 ,5 do
					if (piecetype[player.piececurrent][player.piecerotation][pies2][pies1] == 1) and (player.piecey+pies2-1 >= 1) then
						player.board[player.piecey+pies2-1][player.piecex+pies1-1] = player.piececurrent
						if player.piecey+pies2 >= 22 then
							player.amisafe = true
						end
					end
				end
			end
			love.audio.stop(lock)
			love.audio.play(lock)
		end
		if player.holdinput and (not (player.holdlock or player.hdinput)) then
			player.pieceactive = false
			player.donotnext = true
			player.stillholding = true
		end
	end
	if player.pieceactive == false and (not player.stillholding) and player.dead == false then
		player.linecleartrigger = true
		player.lineclears = 0
		local pccheck = true
		for ita = 1,40 do
			if not tablltablltabllcontains(player.board[ita],"E") then
				table.remove(player.board,ita)
				table.insert(player.board,1,{"E","E","E","E","E","E","E","E","E","E",})
				player.lineclears = player.lineclears + 1
			end
			for ite = 1,10 do
				if player.board[ita][ite] ~= "E" then
					pccheck = false
				end
			end
		end
		player.perfectclear = pccheck
		if pccheck then
			player.perfectclearframes=120
		end
		if player.lineclears > 0 then
			love.audio.stop(lineclear)
			love.audio.play(lineclear)
			if player.tspin == "full" then
				love.audio.stop(tspinnotify)
				love.audio.play(tspinnotify)
			end
			if player.lineclears == 1 then
				love.audio.stop(lineclearsingle)
				love.audio.play(lineclearsingle)
			elseif player.lineclears == 2 then
				love.audio.stop(linecleardouble)
				love.audio.play(linecleardouble)
			elseif player.lineclears == 3 then
				love.audio.stop(linecleartriple)
				love.audio.play(linecleartriple)
			elseif player.lineclears == 4 then
				love.audio.stop(lineclearquad)
				love.audio.play(lineclearquad)
			end
		end
		if not player.amisafe then
			player.dead = true
			love.audio.stop(dead)
			love.audio.play(dead)
		end
	end
end
resettime = 300
winner = "none"
randompieces = {"I5","J5","L5","Z5a","S5a","Z5b","S5b",}
randomsuperpieces = {"T9","T15","D13"}
function attackwardsplayer(player,target)
	if player.linecleartrigger then
		player.linecleartrigger = false
		if player.lineclears > 0 then
			player.combo = player.combo + 1
			if player.lineclears >= 4 or player.tspin ~= "no" then
				player.btbs = player.btbs + 1
			else
				player.btbs = -1
			end
			if player.lineclears >= 2 or player.combo >= 2 then
				local reattackeris = player.lineclears
				if player.lineclears < 4 and (not (player.tspin == "full")) then reattackeris = reattackeris - 1 end
				if player.tspin == "full" then reattackeris = reattackeris * 2 end
				if player.btbs >= 1 then reattackeris = reattackeris + 1 end
				if player.combo >= 2 then reattackeris = reattackeris + 1 end
				if player.combo >= 4 then reattackeris = reattackeris + 1 end
				if player.combo >= 6 then reattackeris = reattackeris + 1 end
				if player.combo >= 8 then reattackeris = reattackeris + 1 end
				if player.combo >= 11 then reattackeris = reattackeris + 1 end
				if player.perfectclear then reattackeris = reattackeris + 10 end
				while reattackeris > 0 do
					if #player.piecequeue >= 2 then
					nsffbhsdf = #player.piecequeue
					nsffbhsdfa = false
						while not (nsffbhsdfa or nsffbhsdf <= 2) do
							if not (piecetype[player.piecequeue[nsffbhsdf]].unoffsetable) then
								table.remove(player.piecequeue,nsffbhsdf)
								nsffbhsdfa = true
							end
							nsffbhsdf = nsffbhsdf - 1
						end
					end
					if #target.piecequeue >= 15 and (#player.piecequeue <= 1 or (not nsffbhsdfa)) then
					nsffbhsdf = 15
					nsffbhsdfa = false
						while not (nsffbhsdfa or nsffbhsdf <= 2) do
							if not (piecetype[target.piecequeue[nsffbhsdf]].unoffsetable) then
								target.piecequeue[nsffbhsdf] = randomsuperpieces[love.math.random(#randomsuperpieces)]
								nsffbhsdfa = true
							end
							nsffbhsdf = nsffbhsdf - 1
						end
					else
					table.insert(target.piecequeue,randompieces[love.math.random(#randompieces)])
					end
					reattackeris = reattackeris - 1
				end
			end
		else
			player.combo = -1
		end
	end
end
function love.update(dt)
frames = frames + (dt*60)
	while frames > 1 do
	frameticks = frameticks + 1
	if not (p1.dead or p2.dead) then
		resettime = 300
	end
	if not (p1.dead or p2.dead) or resettime > 240 then
		updateplayer(p1)
		updateplayer(p2)
	end
	if (p1.dead or p2.dead) and winner == "none" then
		if p1.dead and p2.dead then
			winner = "draw"
		elseif p2.dead then
			winner = "p1"
		elseif p1.dead then
			winner = "p2"
		end
	end
	if p1.dead or p2.dead then
		love.audio.stop(music)
		resettime = resettime - 1
		if resettime == 240 then
			p1.pieceactive = false
			p2.pieceactive = false
			if winner == "draw" then
				love.audio.stop(finishdraw)
				love.audio.play(finishdraw)
			else
				love.audio.stop(finish)
				love.audio.play(finish)
			end
			if winner == "draw" then
				love.audio.stop(finishdrawcom)
				love.audio.play(finishdrawcom)
			elseif winner == "p1" then
				love.audio.stop(finish1p)
				love.audio.play(finish1p)
			elseif winner == "p2" then
				love.audio.stop(finish2p)
				love.audio.play(finish2p)
			end
		end
		if resettime <= 0 then
			initplayer(p1)
			initplayer(p2)
			winner = "none"
			love.audio.play(music)
			sharedpiecequeue = sevenbag()
		end
	end
	attackwardsplayer(p1,p2)
	attackwardsplayer(p2,p1)
	if #sharedpiecequeue < 3 then
		for _, h in pairs(sevenbag()) do
			table.insert(sharedpiecequeue,h)
		end
	end
	frames = frames - 1
	end
end
function drawsprite(image,x,y,cx,cy,sx,sy,rt)
	love.graphics.push()
	love.graphics.translate( x, y)
	love.graphics.rotate(rt or 0)
	love.graphics.scale(sx, sy)
	love.graphics.draw(image or pieceimagetype.G, -cx, -cy)
	love.graphics.pop()
end
function drawpiece(sprite,piecetyperr,rotation,x,y,size,dimx,dimy,centx,centy)
	if not piecetyperr then return end
	if piecetyperr == "E" then return end
	sprite = sprite or pieceimagetype.G
	dimx = dimx or 16
	dimy = dimy or 16
	rookyboy = sprite:getWidth( )
	rookyboi = sprite:getHeight( )
	centx = centx or rookyboy/2
	centy = centy or rookyboi/2
	for pies2 = 1 ,5 do
		for pies1 = 1 ,5 do
			if piecetype[piecetyperr][rotation][pies2][pies1] == 1 then
				drawsprite(sprite, x+((pies1-1)*dimx*size), y+((pies2-1)*dimy*size),centx,centy,size/(rookyboy/dimx),size/(rookyboi/dimy))
			end
		end
	end
end
function nexttero(sprite,piecetyperr,rotation,x,y,size,dimx,dimy,centx,centy)
	if not piecetyperr then return end
	if piecetyperr == "E" then return end
	if pieceimagetypenexttero[piecetyperr] then
		dimx = dimx or 64
		dimy = dimy or 32
		rookyboy = pieceimagetypenexttero[piecetyperr]:getWidth( )
		rookyboi = pieceimagetypenexttero[piecetyperr]:getHeight( )
		centx = centx or rookyboy/2
		centy = centy or rookyboi/2
		drawsprite(pieceimagetypenexttero[piecetyperr], x+(2.5*16*size), y+(2.5*16*size),centx,centy,size/(rookyboy/dimx),size/(rookyboi/dimy))
	else
		drawpiece(sprite,piecetyperr,rotation,x,y,size,dimx,dimy,centx,centy)
	end
end
function holdtero(sprite,piecetyperr,rotation,x,y,size,dimx,dimy,centx,centy)
	if not piecetyperr then return end
	if piecetyperr == "E" then return end
	if pieceimagetypeholdtero[piecetyperr] then
		dimx = dimx or 64
		dimy = dimy or 32
		rookyboy = pieceimagetypeholdtero[piecetyperr]:getWidth( )
		rookyboi = pieceimagetypeholdtero[piecetyperr]:getHeight( )
		centx = centx or rookyboy/2
		centy = centy or rookyboi/2
		drawsprite(pieceimagetypeholdtero[piecetyperr], x+(2.5*16*size), y+(2.5*16*size),centx,centy,size/(rookyboy/dimx),size/(rookyboi/dimy))
	else
		drawpiece(sprite,piecetyperr,rotation,x,y,size,dimx,dimy,centx,centy)
	end
end
boarddrawable = love.graphics.newCanvas(320,480)
function drawplayer(player,x,y,size)
    love.graphics.setCanvas(boarddrawable)
	love.graphics.clear(0, 0, 0, 0)
	love.graphics.setBlendMode("alpha")
	if player.perfectclearframes > 0 then
		local sizexsize = 1
		if player.perfectclearframes > 90 then
			sizexsize = (120-player.perfectclearframes)/30
		end
		if player.perfectclearframes <= 30 then
			sizexsize = (player.perfectclearframes)/30
		end
		drawsprite(perfectclearboard,160,240,80,160,sizexsize,sizexsize)
	end
	for boardgridy = 1,40 do
		for boardgridx = 1,10 do
			if player.board[boardgridy][boardgridx] ~= "E" then
				rookyboy = pieceimagetype[player.board[boardgridy][boardgridx]]:getWidth( )
				rookyboi = pieceimagetype[player.board[boardgridy][boardgridx]]:getHeight( )
				drawsprite(pieceimagetype[player.board[boardgridy][boardgridx]], 160+(boardgridx*16)-(88), 240+(boardgridy*16)-((88+320+80)),rookyboy/2,rookyboi/2,1/(rookyboy/16),1/(rookyboi/16))
			end
		end
	end
	drawsprite(board, 160, 240,88,232,1,1)
	drawpiece(pieceimagetype[player.piecequeue[1]],player.piecequeue[1],0,160-(24+16),240-(216+16),1)
	nexttero(pieceimagetype[player.piecequeue[2]],player.piecequeue[2],0,160+(36-8),240-(196+8),.5)
	nexttero(pieceimagetype[player.piecequeue[3]],player.piecequeue[3],0,160+(68-8),240-(196+8),.5)
	for queeeeeeeeeeeen = 4,15 do
	nexttero(pieceimagetype[player.piecequeue[queeeeeeeeeeeen]],player.piecequeue[queeeeeeeeeeeen],0,160+(68-8+32),240-(196+8-(16*(queeeeeeeeeeeen-4))),.5)
	end
	holdtero(player.holdlock and pieceimagetype.G or pieceimagetype[player.holdpiece],player.holdpiece,0,160-(68),240-(196),.5)
	if player.pieceactive then
		if math.fmod(frameticks,2) == 0 then
			local fafjaeuo = player.piecey
			while piececollidetest(player.board,player.piececurrent,player.piecerotation,player.piecex,fafjaeuo) == false do
				fafjaeuo = fafjaeuo+1
			end
			fafjaeuo = fafjaeuo-1
			drawpiece(pieceimagetype[player.piececurrent],player.piececurrent,player.piecerotation,160-(88)+(player.piecex*16),240-((88+320+80))+(fafjaeuo*16),1)
		end
		local swgjrbjdrgbreh = pieceimagetype.Active
		if player.holdlock then
			swgjrbjdrgbreh = pieceimagetype.ActiveHold
		end
		if math.fmod(frameticks,2) == 0 then
			swgjrbjdrgbreh = pieceimagetype.ActiveDark
		end
		drawpiece(swgjrbjdrgbreh,player.piececurrent,player.piecerotation,160-(88)+(player.piecex*16),240-((88+320+80)+(player.piecey*16)),1,16,16,10,10)
		drawpiece(pieceimagetype[player.piececurrent],player.piececurrent,player.piecerotation,160-(88)+(player.piecex*16),240-((88+320+80))+(player.piecey*16),1)
	end
	local swgjrbjdrgbreh = "DNR"
	if math.fmod(frameticks,8) >= 6 then
		swgjrbjdrgbreh = garbageimagetype.white
	elseif math.fmod(frameticks,8) >= 4 then
		swgjrbjdrgbreh = garbageimagetype.yellow
	elseif math.fmod(frameticks,8) >= 2 then
		swgjrbjdrgbreh = garbageimagetype.red
	end
	for g = 1,4 do
		if swgjrbjdrgbreh ~= "DNR" and g <= player.attackincoming then
			drawsprite(swgjrbjdrgbreh,160+(84),240+((168-(g*16))),4,8,1,1)
		end
	end
	local swgjrbjdrgbreh = "DNR"
	if math.fmod(frameticks,8) >= 4 then
		swgjrbjdrgbreh = garbageimagetype.red
	end
	for g = 5,20 do
		if swgjrbjdrgbreh ~= "DNR" and g <= player.attackincoming then
			drawsprite(swgjrbjdrgbreh,160+(84),240+((168-(g*16))),4,8,1,1)
		end
	end
	local swgjrbjdrgbreh = "DNR"
	if math.fmod(frameticks,8) >= 4 then
		swgjrbjdrgbreh = garbageimagetype.yellow
	end
	for g = 21,36 do
		if swgjrbjdrgbreh ~= "DNR" and g <= player.attackincoming then
			drawsprite(swgjrbjdrgbreh,160+(84),240+((168-(20*16)+((g-21)*16))),4,8,1,1)
		end
	end
    love.graphics.setCanvas()
	love.graphics.setBlendMode("alpha", "premultiplied")
	drawsprite(boarddrawable,x,y,160,240,size,size)
end
function love.draw()
	love.graphics.draw(bg, 0, 0)
	drawplayer(p1,160,280,1)
	drawplayer(p2,480,280,1)
	drawpiece(pieceimagetype[sharedpiecequeue[1]],sharedpiecequeue[1],0,320-32,160,1)
	drawpiece(pieceimagetype[sharedpiecequeue[2]],sharedpiecequeue[2],0,320-12,160+44,.5)
	drawpiece(pieceimagetype[sharedpiecequeue[3]],sharedpiecequeue[3],0,320-12,160+44+16,.5)
	--font = love.graphics.getFont()
	if resettime <= 240 then
		if winner == "p1" then
			p1info = boardwin
			p2info = boardlose
		elseif winner == "p2" then
			p2info = boardwin
			p1info = boardlose
		elseif winner == "draw" then
			p1info = boarddraw
			p2info = boarddraw
		end
		local size = 1
		if resettime > 210 then
			size = (240-resettime)/30
		end
		if resettime <= 30 then
			size = (resettime)/30
		end
		drawsprite(p1info,160,280,80,160,size,size)
		drawsprite(p2info,480,280,80,160,size,size)
	end
end