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
	indexFromSection = 1

	for i = 1, #t, 1 do
		s=t[i]
		if s=="" then
			goto continue
		end
		if u.isSection(s) then print("\027[1;31m"..s:sub(1,-2).."\027[0m")
			sectionName = s:sub(1,-2)
			out[sectionName] = {}
			out[sectionName].titles = {}
			out[sectionName].links = {}
			out[sectionName].content = {}
			indexFromSection = 0
		elseif u.isTitle(s) then print("\027[1;32m"..s:sub(3).."\027[0m")
			out[sectionName].titles[#out[sectionName].titles+1]=indexFromSection
			out[sectionName].content[#out[sectionName].content+1]=s:sub(3)
			indexFromSection = indexFromSection - 1
		elseif u.isLink(s) then
			out[sectionName].links[#out[sectionName].links+1]=indexFromSection
		else print("\027[0;37m"..s:sub(2).."\027[0m")
			out[sectionName].content[#out[sectionName].content+1]=s:sub(2)
		end
		indexFromSection = indexFromSection + 1

		::continue::
	end
	return out
end

return parser

