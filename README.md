
# &Iacute;ndice

1.  [Como funciona](#org642be05)
2.  [Instalación](#org087375b)
    1.  [Linux](#orge34ee65)
    2.  [Windows](#org943207c)
    3.  [MacOS](#orgf2662b8)
3.  [Post instalación](#org62051f6)
4.  [Historias](#orgbd5a4b2)
5.  [Reglas](#orge043bc5)
    1.  [Secciones](#org8bb864c)
    2.  [Contenido](#orgd14aca8)
    3.  [Títulos](#orga88c688)
    4.  [Links (vínculos)](#org420a19f)
    5.  [Acerca de los nombres de las secciones](#org05ff502)
    6.  [Acerca de los links (vínculos)](#org278d32f)
6.  [Configuración](#orgcba8f82)
    1.  [Por defecto](#orge78cbb1)
    2.  [Descripción](#orgaf5e2eb)
        1.  [Teclas](#org5e95ac2)
        2.  [Traducción](#orgcb43ca5)
        3.  [Tema (colores)](#org4721028)

Motor de Historias Interactivas, hecho en Lua y Love2D para la feria de ciencias INNOVA 2021


<a id="org642be05"></a>

# Como funciona

Interia carga las historias desde una carpeta en específico:

`/home/usuario/.local/share/Interia/stories` en Linux

`C:\Documents and Settings\usuario\Application Data\Interia\stories` en Windows XP

`C:\Users\usuario\AppData\Roaming\Interia\stories` en Windows Vista, 7, 8 y 10

`/Users/usuario/Library/Application Support/Interia/stories` en Mac

Nótese que se reemplaza `usuario` con el nombre del usuario que esté actualmente usando la aplicación

También carga la [configuración](#orgcba8f82) en:

`/home/usuario/.local/share/Interia/config/conf.lua` en Linux

`C:\Documents and Settings\usuario\Application Data\Interia\config\conf.lua` en Windows XP

`C:\Users\usuario\AppData\Roaming\Interia\config\conf.lua` en Windows Vista, 7, 8 y 10

`/Users/usuario/Library/Application Support/Interia/config/conf.lua` en Mac

En este también se reemplaza `usuario` con el nombre de usuario que usa la aplicación

Luego las lee e interpreta cada párrafo, sección, línea y letra siguiendo un conjunto de [reglas](#orge043bc5) y las transforma en un conjunto de elementos que la computadora puede entender

Este conjunto se separa en [secciones](#org8bb864c) y se muestra cada una según corresponda


<a id="org087375b"></a>

# Instalación


<a id="orge34ee65"></a>

## Linux

Descargar e instalar [Love2D](https://love2d.org), posiblemente también esté en su gestor de paquetes.

Descargar el archivo **Interia.love** desde la página de [releases](https://github.com/Bowuigi/Interia/releases)

El commando para abrir Interia es `love --fused "/lugar/de/interia.love"`

Este se puede poner en un **script** o en un **archivo .desktop** para poder abrirlo desde el menú de aplicaciones


<a id="org943207c"></a>

## Windows

Descargar el archivo **Interia-Win.zip** desde la página de [releases](https://github.com/Bowuigi/Interia/releases).

Extraer el archivo zip (Click derecho > `Extraer en Interia-Win/`).

Entrar a la carpeta **Interia-Win** recién creada.

Dar doble click al archivo **Interia.exe**.

Si se desea, se puede arrastrar el mismo archivo a la barra de tareas o al escritorio para no tener que navegar a la carpeta cada vez que desee lanzar la herramienta.


<a id="orgf2662b8"></a>

## MacOS

Descargar el archivo **Interia-OSX.zip** desde la página de [releases](https://github.com/Bowuigi/Interia/releases)

Extraer el mismo en una carpeta

Verificar que **interia.app** sea ejecutable

Ejecutarlo


<a id="org62051f6"></a>

# Post instalación

Poner las [historias](#orgbd5a4b2) obtenidas en el [lugar correspondiente](#org642be05).

Cambiar la [configuración](#orgcba8f82) a gusto.


<a id="orgbd5a4b2"></a>

# Historias

Son un archivo de texto plano (no son documentos de Word ni PDF), generalmente tienen las extensiones **.his** o **.txt** y pueden ser creadas y editadas por distintos editores de texto, como:

-   Linux
    -   El por defecto de su entorno de escritorio (generalmente llamado &laquo;editor de texto&raquo;)
    -   Cualquier editor de terminal (nvim, micro, nano, ne, etc.)
-   Windows
    -   Block de notas
-   MacOS
    -   TextEdit (En la pestaña &laquo;Formato&raquo;, seleccione &laquo;Crear texto sin formato&raquo;)
    -   Cualquier editor de terminal (nvim, nano, ne, micro, etc.)

Cuando se selecciona **editar** en una historia dentro de Interia, se abre el mismo archivo en el editor de texto predeterminado.

Para crear una nueva historia, abra Interia, presione **abrir la carpeta de historias**, crear un archivo de **texto plano** en esa ubicación, y escriba la historia según las [reglas](#orge043bc5)


<a id="orge043bc5"></a>

# Reglas


<a id="org8bb864c"></a>

## Secciones

Las historias de Interia se separan por secciones, estas se crean de la siguiente manera

    seccion:
    	El texto va aquí
    	Otra línea de texto

Esto crea una sección llamada **seccion** que contiene dos lineas de texto

Nótese que hay una sangría en cada línea perteneciente a la sección recién declarada, esta sangría es de solo un carácter y se consigue con un espacio o una tabulación (que se consigue apretando tab, que es la tecla con dos flechas apuntando a lados opuestos)

Esta sangría es obligatoria y se usa para diferenciar el contenido de las secciones de la declaración de las mismas, esta misma sangría no se ve en la aplicación.

Solo la primera sección se mostrará en la aplicación, esto se puede cambiar con links (vínculos), que se explican más abajo.

Relevante: [5.5](#org05ff502)


<a id="orgd14aca8"></a>

## Contenido

Cada sección puede o no tener contenido. Como se agrega el contenido está explicado más arriba, pero sería algo como:

    nombre_de_seccion:
    	Este texto es parte del contenido
    	La cantidad de contenido que puede tener una sección no tiene límites, además de la memoria y el tamaño del texto
    	Se puede mover hacia ambos lados para ver el texto completo si la línea es muy larga

Esto crea una sección llamada **nombre<sub>de</sub><sub>seccion</sub>** que en Interia se ve de la siguiente manera:

    Este texto es parte del contenido
    La cantidad de contenido que puede tener una sección no tiene límites, además de la memoria y el tamaño del texto
    Se puede mover hacia ambos lados para ver el texto completo si la línea es muy larga


<a id="orga88c688"></a>

## Títulos

Los títulos son una parte importante de las historias, y también en Interia.

Los títulos se definen de la siguiente manera:

    capitulo_1:
    	#Capítulo 1, la pared
    	Texto de ejemplo

Si se prueba en la aplicación, se verá que la línea con el `#` se ve resaltada, pero el `#` mismo no se muestra, esto significa que es un título.

Un título puede ir en cualquier parte de una sección. Así como una sección puede no contener títulos.


<a id="org420a19f"></a>

## Links (vínculos)

El link es una forma de cambiar la sección visible por una con un nombre en específico. Si esa sección no está disponible, se toma como un link a una página web y se abre en el navegador.

El link se declara de la siguiente forma:

    capitulo_1:
    	@capitulo_2
    	Texto que se muestra en lugar de "@capitulo_2"
    
    capitulo_2:
    	Hola!
    	@capitulo_1
    	Click aqui para ir al capítulo anterior

Si se prueba esto desde la aplicación, se ve solo el contenido del primer capítulo, que es un link al segundo, en lugar de verse `@capitulo_2` se ve el texto que está debajo.

Si se le da click, te lleva a la sección con el nombre luego del **@**, en este caso `capitulo_2`, mostrando el contenido de ese capítulo.

Si en lugar de el nombre de una sección se utiliza un hipervínculo, como &laquo;<https://gnu.org>&raquo;, abrirá el navegador para mostrar la página correspondiente.

Esto permite que Interia se pueda extender con páginas que permitan usar imágenes, videos, presentaciones y otros.

Relevante: [5.6](#org278d32f)


<a id="org05ff502"></a>

## Acerca de los nombres de las secciones

Los nombres de las secciones no pueden contener:

-   Espacios.

-   Caracteres fuera de la tabla ASCII (como í,ó,→,etc.), esto es por un tema de codificación.

-   Líneas nuevas (lo que aparece cuando se presiona enter).

-   El nombre **sections**; esto es por un tema interno, si una sección se llama de esa manera se reemplazara, posiblemente resultando en problemas.


<a id="org278d32f"></a>

## Acerca de los links (vínculos)

No hay límites en la cantidad de links que se pueden poner.

Los links a archivos se pueden crear usando `file://` y luego la dirección del archivo.

No se recomienda el uso de estos porque la ubicación de las cosas cambia según el sistema operativo (por ejemplo, las direcciones en Windows llevan `\\`, y en Linux y MacOS llevan `/`, por lo que resultaría en un error o no dependiendo de donde se abre)


<a id="orgcba8f82"></a>

# Configuración

La misma se ubica en la carpeta de configuración de Interia, cerca de la carpeta de historias, reemplazando `stories` por `config`

Específicamente en el archivo **conf.lua** de la misma carpeta.


<a id="orge78cbb1"></a>

## Por defecto

```lua
-- Configuración de Interia, el motor de historias interactivas
keys= {
	--   Normales | Vi
	up=   {"up",   "k"},
	down= {"down", "j"},
	left= {"left", "h"},
	right={"right","l"},
}
scrollspeed=15

-- Traducción
nostoriesstr="No hay ninguna historia en %s\nAgrega una para que aparezca aquí!" -- Necesita %s en donde iría la carpeta
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
```

<a id="orgaf5e2eb"></a>

## Descripción


<a id="org5e95ac2"></a>

### Teclas

```lua
keys= {
	--   Normales | Vi
	up=   {"up",   "k"},
	down= {"down", "j"},
	left= {"left", "h"},
	right={"right","l"},
}
scrollspeed=15
```

Acá se cambian cuales teclas de el teclado se usan para hacer distintas cosas, además de la velocidad a la que se mueve la pantalla.

La lista **keys** contiene todas las acciones que se pueden realizar en el teclado en Interia, las cuales son:

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-left" />

<col  class="org-left" />
</colgroup>
<thead>
<tr>
<th scope="col" class="org-left">Variable</th>
<th scope="col" class="org-left">Acción</th>
<th scope="col" class="org-left">Por defecto</th>
</tr>
</thead>

<tbody>
<tr>
<td class="org-left">up</td>
<td class="org-left">Moverse hacia arriba</td>
<td class="org-left">{&laquo;up&raquo;,    &laquo;k&raquo;}</td>
</tr>


<tr>
<td class="org-left">down</td>
<td class="org-left">Moverse hacia abajo</td>
<td class="org-left">{&laquo;down&raquo;,  &laquo;j&raquo;}</td>
</tr>


<tr>
<td class="org-left">left</td>
<td class="org-left">Moverse hacia la izquierda</td>
<td class="org-left">{&laquo;left&raquo;,  &laquo;h&raquo;}</td>
</tr>


<tr>
<td class="org-left">right</td>
<td class="org-left">Moverse hacia la derecha</td>
<td class="org-left">{&laquo;right&raquo;, &laquo;l&raquo;}</td>
</tr>
</tbody>
</table>

Se pueden añadir más opciones cambiando la parte por defecto por algo como lo siguiente:

```lua
keys= {
	--   Normales | Vi | Extras recien añadidas
	up=   {"up",   "k", "w"},
	down= {"down", "j", "s"},
	left= {"left", "h", "a"},
	right={"right","l", "d"},
}
scrollspeed=15
```

`scrollspeed` es una variable que define la velocidad a la que se mueve la pantalla, es **15** por defecto.


<a id="orgcb43ca5"></a>

### Traducción

```lua
-- Traducción
nostoriesstr="No hay ninguna historia en %s\nAgrega una para que aparezca aquí!" -- Necesita %s en donde iría la carpeta
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
```

Esta sección corresponde al texto que contiene Interia, se puede cambiar simplemente reemplazando el texto que está entre comillas, aquí un ejemplo, conteniendo una traducción en inglés:

```lua
-- Traducción
nostoriesstr="There is no stories in %s\nAdd one so it can appear here!" -- Necesita %s en donde iría la carpeta
storiesdirstr="Stories go in %s" -- Necesita %s en donde iría la carpeta
storyselstr={
	sel="You chose:",
	nosel="Select a story:",
}
menustr={
	read="Read",
	edit="Edit",
	cancel="Cancel",
}

exitstr="Exit"
folderstr="Open the stories folder"
```

<a id="org4721028"></a>

### Tema (colores)

```lua
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
```

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-left" />
</colgroup>
<thead>
<tr>
<th scope="col" class="org-left">Variable</th>
<th scope="col" class="org-left">Significado</th>
</tr>
</thead>

<tbody>
<tr>
<td class="org-left">background</td>
<td class="org-left">Color de fondo (RGB)</td>
</tr>


<tr>
<td class="org-left">panelcolors</td>
<td class="org-left">Colores del menú que aparece al dar click a una historia (RGBA)</td>
</tr>


<tr>
<td class="org-left">textcolors</td>
<td class="org-left">Color del texto en general (bg=fondo (RGB), fg=texto (RGB))</td>
</tr>


<tr>
<td class="org-left">buttoncolors</td>
<td class="org-left">Color de casi todos los botones en estados activo, con el mouse encima y normal (RGB cada uno)</td>
</tr>


<tr>
<td class="org-left">exitbuttoncolors</td>
<td class="org-left">Lo mismo pero solo para el botón de salir de la historia</td>
</tr>
</tbody>
</table>

