# Acciones Externas

Así como podemos crear nuetros propios trabajos, es posible también utilizar acciones de otros desarrolladores hosteadas en _GitHub_, lo cual nos facilita mucho más el trabajo de integración. A continuación vamos a crear un nuevo __Workflow__ invocando a una acción externa y pasandole parámetros.

## Hola mundo con acción externa

Utilizarmos la siguiente acción externa, que hemos creado para el proposito de éste curso; la cual es un buen ejemplo para los que les interese crear un acción, [https://github.com/EugenioTesio/hello-world-dart-action](https://github.com/EugenioTesio/hello-world-dart-action). Ingresando al link anterior podemos ver que es en realidad un _hello world_ escrito en __Dart__ que acepta un parámetro de entrada ```who-to-greet``` y podemos capturar un resultado de salida ```time```.

Comenzaremos creando un nuevo archivo de __Workflow__ al cual llamaremos ```acciones_externas.yml```. Para ello, nos ubicamos en el root del proyecto ya creado y ejecutamos las siguientes líneas de código:

```bash
cd .github/workflows
nano acciones_externas.yml
```

Luego copiamos las líneas de codigo del [snipet](acciones_externas.yml), las cuales explicaremos a continuación.

![acciones externas explicación](3.1_external_action_explanation.png)

Con respecto a la acción externa, en este caso utilizamos el TAG ```v1.0``` ya que así lo indica la documentación, pero no es la única opción, podemos también utilizar:

- _Nombre de la rama._ ```EugenioTesio/hello-world-dart-action@main```
- _El hash de un commit específico._ ```EugenioTesio/hello-world-dart-action@45a902258783cf077787f4652051fb531a2e6a1b```

Por último haremos el commit y el push.

```bash
git add .
git commit -m "ci: acciones externas"
git push origin main
```

El resultado del Workflow se muestra en la siguiente imagen:

![acciones externas resultado 1](3.2_external_action_result.png)

![acciones externas resultado 1](3.3_external_action_result.png)

Como es posible ver en el paso __Hello world Dart__, se imprimió en consola "Hello Mauro" y en el paso __Log output__ se imprimió la fecha de la variable ```time```.
