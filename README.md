# Interia
Motor de Historias Interactivas, hecho en Lua para la feria de ciencias INNOVA 2021

Como funciona
---

Interia carga las historias desde una carpeta en específico:

`/home/usuario/.local/share/Interia/stories` en Linux

`C:\Documents and Settings\usuario\Application Data\Interia\stories` en Windows XP

`C:\Users\usuario\AppData\Roaming\Interia\stories` en Windows Vista, 7, 8 y 10

`/Users/usuario/Library/Application Support/Interia/stories` en Mac

Nótese que se reemplaza `usuario` con el nombre de usuario del que esté actualmente usando la aplicación

También carga la configuración (ejemplo más adelante) en:

`/home/usuario/.local/share/Interia/config/conf.lua` en Linux

`C:\Documents and Settings\usuario\Application Data\Interia\config\conf.lua` en Windows XP

`C:\Users\usuario\AppData\Roaming\Interia\config\conf.lua` en Windows Vista, 7, 8 y 10

`/Users/usuario/Library/Application Support/Interia/config/conf.lua` en Mac

Nótese que se reemplaza `usuario` con el nombre de usuario del que esté actualmente usando la aplicación

Luego las lee e interpreta cada párrafo, sección, línea y letra siguiendo un conjunto de reglas (detallado más adelante) y las transforma en un conjunto de elementos que la computadora puede entender

Este conjunto luego se separa en secciones 

QMQ9-Y6UA-39XA-BAP8
