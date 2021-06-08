-- Interia
-- Motor e interprete de historias interactivas
-- Hecho en Lua
-- Por Mateo Crimella (También conocido como Bowuigi)
-- Registrado bajo la licencia GNU GPLv3

u = require("utils") -- Util de util.lua

local parser = {}

function parser.parse(t)
	sectionName = ""
	out = {}
	out["sections"]={}
	indexFromSection = 1

	for i = 1, #t, 1 do
		s=t[i]
		if s=="" then
			-- Seguir si no hay nada en la línea
			goto continue
		end
		if u.isSection(s) then
			sectionName = s:sub(1,-2)
			out[sectionName] = {}
			out[sectionName].titles = {}
			out[sectionName].links = {}
			out[sectionName].linksto = {}
			out[sectionName].content = {}
			out["sections"][#out["sections"]+1]=sectionName
			indexFromSection = 0
		elseif u.isTitle(s) then
			if #out[sectionName].titles>=1 and #out[sectionName].links>=1 then
				out[sectionName].titles[#out[sectionName].titles+1]=indexFromSection-1
			else
				out[sectionName].titles[#out[sectionName].titles+1]=indexFromSection
			end
			out[sectionName].content[#out[sectionName].content+1]=s:sub(3)
		elseif u.isLink(s) then
			if #out[sectionName].links>=1 then
				indexFromSection = indexFromSection - 1
			end
			out[sectionName].links[#out[sectionName].links+1]=indexFromSection
			out[sectionName].linksto[indexFromSection]=s:sub(3)
		else
			out[sectionName].content[#out[sectionName].content+1]=s:sub(2)
		end
		indexFromSection = indexFromSection + 1

		::continue::
	end
	return out
end

return parser

