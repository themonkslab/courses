# Crear, correr y debuggear

Hasta el momento, nos manejamos casi todo el tiempo con Dartpad salvo en reducidas circunstancias. A llegado el tiempo de pegar el salto: vamos a trabajar casi absolutamente con VSCode de ahora en adelante dejando Dartpad para pequeños experimentos.

Allí, en VSCode, hemos creado archivos Dart y trabajado en ellos. Llegó también el tiempo de expandirnos un poco a través de los proyectos y para crearlos, podemos hacerlo de dos maneras: la terminal y VSCode. Empecemos por la más rockera! 🤘

## Crear un proyecto

Ya conocemos __el comando `dart__` y si lo ingresan a su__terminal__, van a poder observar que uno de sus comandos es `create`. Si luego introducen `dart create` van a ver que solamente podemos utilizarlo para pedir ayuda (`-h`) o__para utilizar un _template_ que es como un modelo para crear nuestro proyecto__.

Vamos a utilizar el primero de los _templates_ para __crear una aplicación para línea de comandos__. Introducimos entonces: `dart create -t console first_dart_project` y damos enter. Dart está creando el proyecto por nosotros! Para ingresar,... 💀 Ya tienen todos los elementos para abrir una instancia dentro de esa carpeta desde allí en VSCode! Prueben!

Probaron? Era simplemente entrar a esa carpeta utilizando `cd first_dart project` (recuerden que si introducen los primeros caracteres del nombre del directorio y luego la tecla `tab`, se los autocompleta) y allí `code .` (siendo `.` el directorio en el que nos encontramos).

Súper! Ya están dentro de su primer proyecto! 💪

Cómo podríamos __hacerlo desde VSCode__? Dentro de VSCode introducen la combinación de teclas `cmd/ctrl + shift + p` y allí teclean primero `dart`. Les va a listar todo lo que VSCode puede hacer con este comando siendo 'New Project' una de esas opciones. Haciendo click o presioando enter allí, luego les va a pedir que seleccionen el tipo de proyecto. Como queremos crear lo mismo que lo que hicimos en la terminal, seleccionan 'Console application', luego el directorio donde la quieren crear y finalmente el nombre.

Listo! Ahora ya saben cómo se crea un proyecto desde ambos lugares! Ah! 💀 Una tareita: vuelvan a crear otro proyecto desde VSCode y observen qué sucede en la esquina inferior derecha cuando terminan de poner el nombre del proyecto y dan enter.
