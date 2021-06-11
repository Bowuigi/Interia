# Interia
Motor de Historias Interactivas, hecho en Lua y Love2D para la feria de ciencias INNOVA 2021

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

Este conjunto luego se separa en secciones y se muestra cada sección según corresponda

Instalación
---

- Instalar [Love2D](https://love2d.org), no es necesario si se descarga el `.exe`.

- Descargar y abrir el archivo `.love` (está en la página de [releases](https://github.com/Bowuigi/Interia/releases)) con Love2D o en Windows, descargar el zip, extraerlo y ejecutar el `.exe`

- Poner las historias en el lugar detallado anteriormente

- Cambiar la configuración a gusto (opcional)

Como hacer historias
---

- Crear un archivo de texto plano en su editor de texto favorito (debe ser texto plano, el motor no interpreta PDF o archivos de Word). El archivo debe tener la extensión `.txt` o `.his` (que es un `.txt` pero renombrado)

El editor de texto podría ser, por ejemplo el block de notas en Windows, Gedit/Micro/Nano/Vim/etc. en Linux, y el que sea que pueda exportar a texto plano o simple en Mac

- Guardarlo en el lugar donde se buscan las historias (detallado más arriba)

- Abrir Interia

- Elegir la historia recién creada

- Desde ahí, se puede leer y editar las historias

Las historias deben escribirse de una manera en específico.

Reglas
---

Reglas generales:

**Secciones:**

La historia se separa por secciones, las secciones se crean de la siguiente manera:

```yaml

seccion:
	texto normal
	otra línea
	otro ejemplo

```

Esto crearía una sección llamada `seccion`, más abajo las reglas para nombrar las secciones.

Nótese que hay una sangría en cada línea perteneciente a la sección recién declarada, esta sangría es de un carácter y se consigue con un espacio o una tabulación (que se consigue apretando tab, que es la tecla con dos flechas apuntando a lados opuestos)

Esta sangría es obligatoria y se usa para diferenciar el contenido de las secciones de la declaración de las mismas.

Solo la primera sección se mostrará en la aplicación, esto se puede cambiar con links (vínculos), que se explican más abajo.

**Contenido:**

Cada sección puede o no tener contenido. Como se agrega el contenido está explicado más arriba, pero sería algo como:

```yaml

nombre_de_seccion:
	Este texto es parte del contenido
	La cantidad de contenido que puede tener una sección no tiene límites, además de la memoria y el tamaño del texto
	Se puede mover hacia ambos lados para ver el texto completo si la línea es muy larga

```

**Títulos:**

Los títulos son una parte importante de las historias, y también en Interia.

Los títulos se declaran de la siguiente manera:

```yaml

capitulo_1:
	#Capítulo 1, la pared

```

Si se prueba en la aplicación, se verá que la línea con el `#` se ve resaltada, pero el `#` no se muestra, esto porque es la manera de declarar un título.

Un título puede ir en cualquier parte de una sección. Una sección puede no contener títulos.

**Links (vínculos):**

El link es una forma de cambiar la sección por una con un nombre en específico. Si esa sección no está disponible, se toma como un link a una página web y se abre en el navegador.

El link se declara de la siguiente forma:

```yaml

capitulo_1:
	@capitulo_2
	Texto que se muestra en lugar de "@capitulo_2"

capitulo_2:
	Hola!
	@capitulo_1
	Click aqui para ir al capítulo anterior

```

Si se prueba esto desde la aplicación, se ve solo el contenido del primer capítulo, que es un link al segundo, en lugar de verse `@capitulo_2` se ve el texto que está debajo.

Si se le da click, te lleva a la sección con el nombre luego del "@", en este caso `capitulo_2`, mostrando el contenido de ese capítulo.

Si en lugar de el nombre de una sección se utiliza un hipervínculo, como "https://gnu.org", abrirá el navegador para mostrar la página correspondiente.

Esto permite que Interia se pueda extender con páginas que permitan usar imágenes, videos, presentaciones y otros.

**Reglas acerca de los nombres de las secciones:**

Los nombres de las secciones no pueden contener:

- Espacios.

- Caracteres fuera de la tabla ASCII (como í,ó,→,etc.), esto es por un tema de codificación.

- Líneas nuevas (lo que aparece cuando se presiona enter).

- El nombre `sections`; esto es por un tema interno, si una sección se llama de esa manera se reemplazara, posiblemente resultando en problemas.

**Reglas acerca de los links:**

No hay límites en la cantidad de links que se pueden poner.

Acerca de los links a archivos, se pueden crear usando `file://` y luego la dirección del archivo.

No se recomienda el uso de estos porque la ubicación de las cosas cambia según el sistema operativo (por ejemplo, las direcciones en Windows llevan \\, y en Linux y MacOS llevan / , por lo que resultaría en un error o no dependiendo de donde se abre)

