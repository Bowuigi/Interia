-- Interia
-- Motor e interprete e historias interactivas
-- Hecho en Lua
-- Por Mateo Crimella (También conocido como Bowuigi)
-- Registrado bajo la licencia GNU GPLv3

S = require("suit")
P = require("parser")
U = require("utils")

function love.load()

	-- Fuentes
	fontsize=16
	defaultfont = love.graphics.newFont("assets/Comfortaa-Light.ttf",fontsize)
	titlefont = love.graphics.newFont("assets/Comfortaa-Light.ttf",fontsize*2)

	-- Interno
	Parsedt={}
	kdown=love.keyboard.isDown
	savedir=love.filesystem.getSaveDirectory()
	storiesdir=savedir.."/stories/"
	configfile=savedir.."/config/conf.lua"

	-- Conseguir las historias en el directorio de guardados
	dstories,stories=getfiles("/stories")

	-- UI
	width = love.graphics.getWidth()
	height = love.graphics.getHeight()
	-- 1: Selector de historias | 2: Lector de historias
	mode=1

	-- Scroll
	scrollY=0
	scrollX=0
	maxscrollY=0
	maxscrollX=0

	-- Configuración
	keys= {
		--   Normales | Vi
		up=   {"up",   "k"},
		down= {"down", "j"},
		left= {"left", "h"},
		right={"right","l"},
	}
	scrollspeed=15

	-- Traducción
	nostoriesstr="No hay ninguna historia en %s\nAgrega una para que aparezca aquí!"
	storiesdirstr="Las historias van en %s" -- Necesita %s en donde iría la carpeta
	storyselstr={
		sel="Elegiste:",
		nosel="Elige tu historia:",
	}
	menustr={
		read="Leer",
		edit="Editar",
		cancel="Cancelar",
	}
	exitstr="Salir"
	folderstr="Abrir la carpeta de historias"

	-- Los colores son de 0 a 1
	-- Y son en formato R,G,B
	theme= {
		background = {
			0,0,0
		},
		panelcolors = {
			0.2,0.2,0.2
		},
		textcolors = {
			normal = {bg={0,0,0},fg={1,1,1}}
		},
		buttoncolors = {
			normal  = {bg={0,0,0,0},fg={0,0.3,1}},
			hovered = {bg={0,0,0,0},fg={1,1,1}},
			active  = {bg={0,0,0,0},fg={1,1,1}},
		},
		exitbuttoncolors = {
			normal  = {bg={0,0.1,1},fg={1,1,1}},
			hovered = {bg={0,0.7,0.2},fg={1,1,1}},
			active  = {bg={0,0.3,1},fg={1,1,1}},
		}
	}

	if love.filesystem.getInfo("/config/conf.lua")~=nil then
		dofile(configfile)
	end
end

function love.update(dt)

	-- Actualizar la interfaz
	if kdown(keys.right) then
		scrollX=scrollX-scrollspeed*dt*15
	elseif kdown(keys.left) then
		scrollX=scrollX+scrollspeed*dt*15
	end

	if kdown(keys.down) then
		scrollY=scrollY-scrollspeed*dt*15
	elseif kdown(keys.up) then
		scrollY=scrollY+scrollspeed*dt*15
	end

	-- Corregir valores incorrectos
	scrollX=math.floor(scrollX)
	scrollY=math.floor(scrollY)

	scrollX=clamp(maxscrollX,scrollX,0)
	scrollY=clamp(maxscrollY,scrollY,0)

	-- Reiniciar la UI
	S.layout:reset(scrollX,scrollY,10,10)
	S.layout:row(math.huge,fontsize)

	if mode==1 then

		S.Label("Interia",{align = "left",font=titlefont,color=theme.textcolors}, center(S.layout:row()))
		S.Label(string.format(storiesdirstr,storiesdir),{align = "left",font=defaultfont,color=theme.textcolors}, center(S.layout:row()))
		if S.Button(folderstr,{align="left",font=defaultfont,color=theme.buttoncolors},center(S.layout:row())).hit then
			love.filesystem.createDirectory("stories")
			love.filesystem.createDirectory("config")
			love.system.openURL("file://"..storiesdir)
		end
		if hitted==nil then
			S.Label(storyselstr.nosel,{align = "left",font=defaultfont,color=theme.textcolors}, center(S.layout:row()))
		else
			S.Label(storyselstr.sel,{align = "left",font=defaultfont,color=theme.textcolors}, center(S.layout:row()))
		end


		if #stories==0 then
			S.Label(string.format(nostoriesstr,storiesdir),{align = "center", font=defaultfont, color=theme.textcolors},0,0,width,height)
		end
		for i,v in ipairs(dstories) do
			if hitted==nil or hitted==i then
				if S.Button("    "..v,{cornerRadius=0,id=i,align="left",font=defaultfont,color=theme.buttoncolors},S.layout:row()).hit or hitted==i then
					hitted=i
					if S.Button(menustr.read,{cornerRadius=0,align="center",font=defaultfont,color=theme.buttoncolors},0,height/2-30,width).hit then
						local f=io.open(storiesdir..stories[i],"r")
						mode=2
						usestream(f)
						f:close()
					end
					if S.Button(menustr.edit,{align="center",font=defaultfont,color=theme.buttoncolors},0,height/2,width).hit then
						love.system.openURL("file://"..storiesdir..stories[i])
					end
					if S.Button(menustr.cancel,{align="center",font=defaultfont,color=theme.buttoncolors},0,height/2+30,width).hit then
						hitted=nil
					end
				end
			end
		end
		maxscrollY=-#stories*fontsize

	elseif mode==2 then
		-- Dibujar el botón de salir
		if S.Button(" "..exitstr.." ",{cornerRadius=10,align="left",font=defaultfont,color=theme.exitbuttoncolors},10,10).hit then
			scrollX=0
			scrollY=0
			hitted=nil
			mode=1
		end

		-- Dibujar las secciones requeridas
		for i,v in ipairs(Parsedt[section].content) do -- Separar el contenido del texto
			-- Si la linea es un título, dibujarla como un título
			if where(i,Parsedt[section].titles) then
				S.Label(v, {cornerRadius=0, align = "left",id=i,font=titlefont,color=theme.textcolors}, center(S.layout:row()))
			-- Si la linea es un link, dibujarla como un link
			elseif Parsedt[section].linksto[i]~=nil then
				if S.Button(v,{cornerRadius=0, id=i,align="left",font=defaultfont,color=theme.buttoncolors}, S.layout:row()).hit then
					-- Si la sección a la que se linkea no existe, tratar el link como una URL y abrirla en el navegador
					if Parsedt[Parsedt[section].linksto[i]]~=nil then
						section=Parsedt[section].linksto[i]
						scrollX=0
						scrollY=0
					else
						love.system.openURL(Parsedt[section].linksto[i])
					end
				end
			else
				-- Si no es ninguna de las anteriores, dibujarla como texto normal
				S.Label(v, {cornerRadius=0, align = "left",id=i,font=defaultfont,color=theme.textcolors}, S.layout:row())
			end
			-- Calcular el máximo que se puede ir hacia la derecha
			if maxscrollX>(-#v*fontsize) then maxscrollX=(-#v*fontsize)/2 end
		end
		-- Calcular el máximo que se puede ir hacia abajo
		maxscrollY=-#Parsedt[section].content*fontsize
	end
end

-- Necesario para que la librería de UI funcione correctamente
function love.draw()
	love.graphics.setBackgroundColor(theme.background[1],theme.background[2],theme.background[3])
	if hitted~=nil and mode==1 then
		love.graphics.setColor(theme.panelcolors)
		love.graphics.rectangle("fill",width/2-60,height/2-40,60*2,60*1.7)
	end
	S.draw()
end

-- Hacer scroll al mover la rueda del mouse (como en una página web)
function love.wheelmoved(x,y)
	scrollY=scrollY+y*scrollspeed
end

function love.resize(w,h)
	width=w
	height=h
end

-- Busca un valor de cualquier tipo en una tabla, solo devuelve coincidencias exactas
function where(val,t)
	for i=1,#t,1 do
		if t[i]==val then
			return i
		end
	end
	return nil
end

-- Fijar un valor entre dos límites
function clamp(min,val,max)
	return math.max(math.min(max,val),min)
end

-- Centrar el texto en la pantalla
function center(x,y,w,h)
	x=scrollX+20
	return x,y,w,h
end

-- Cambiar el archivo mostrado actualmente
function usestream(stream)
	Parsedt = P.parse(U.readFrom(stream))
	section=Parsedt.sections[1]
	scrollX=0
	scrollY=0
	maxscrollX=0
	maxscrollY=0
end

-- Recorta una línea de texto
function truncate(str,size)
	if size<#str then
		return str:sub(1,size-3).."..."
	else
		return str
	end
end

function getfiles(dir)
	local usedtypes={"file","symlink"}
	local files = love.filesystem.getDirectoryItems(dir)
	local fret={}
	local tmp={}
	local j=0
	for i=1,#files do
		local fileinfo=love.filesystem.getInfo(dir.."/"..files[i])
		if where(fileinfo.type,usedtypes)~=nil then
			j=j+1
			tmp[j]=truncate(files[i],64)
			fret[j]=files[i]
		end
	end
	return tmp,fret
end
