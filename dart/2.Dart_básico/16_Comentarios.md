# _Comments_

Los comentarios son una _feature_ que cualquier lenguaje de programación posee y nos permite __hacer aclaraciones del código__ (_documentation_), guías para otros desarrolladores o nosotros mismos o hasta recordarnos tareas a futuro; __todas ellas serán omitidos por el compilador__.

Existen __dos tipos de _comments_: _single-line_ (con dos subtipos) y _multi-line_.__ Vamos a verlos!

## _Single-line comments_

Podemos empezar un comentario del tipo _single-line_ agregando `//` o bien `///`. A simple vista, parecerían no traer diferencias sin embargo prueben lo siguiente (💀):

1. Escriban en Dartpad el código que está a continuación.
2. Párense sobre la palabra `main`.
3. Vean en el cuadrante inferior de la columna derecha, el que dice _Documentation_ si algo apareció!

```dart
// entry point of a Dart program
void main() {}
```

Ahora prueben lo mismo pero en lugar de utilizar dos barras para hacer el comentario, utilicen tres. Qué sucedió?

```dart
/// entry point of a Dart program
void main() {} 
```

__Al utilizar tres barras (`///`), Dart genera automáticamente una documentación__ que en Dartpad ven en ese lugar pero en escritores de código podrán ver si se paran encima, lo cual es __sumamente útil para quienes lean nuestro código o para cuando nosotros estemos leyendo códigos de otros desarrolladores__ generosos que se encargaron de explicarnos cómo está escrito su código y por qué!

Por otro lado, es __muy común utilizar las dobles barras para notas a nosotros mismos o _TODOs_ (a hacer)__ e incluso en ese caso, Dartpad también los reconoce y nos recuerda de esas tareas:

```dart
/// entry point of a Dart program
void main() {
    // Solo un comentario
    // TODO una tarea que Dartpad va a resaltar para nosotros!
} 
```

Además, __los editores de código pueden enriquecer cómo los comentarios se ven__, sumar extensiones para hacer cosas específicas con ellos, etc. Les dejo para que vean comentarios dentro de una documentación de _Flutter_:

![Comentarios en una documentación](https://raw.githubusercontent.com/themonkslab/courses/main/dart/2.Dart_b%C3%A1sico/16.1_comentarios_vida_real.png)

Para terminar con estos comentarios de línea simple, podría agregarles que también sirven cuando quieren omitir alguna operación, variable o lo que necesiten. En el siguiente ejemplo, podemos ver cómo omitimos temporalmente el código `print('Program started');`.

```dart
void main() {
    // print('Program started');
    String apiVersion = '2.3';
    // TODO: increment in one when X is implemented
}
```

## _Multi-lines comment_

Los comentarios de líneas múltiples son __utilizados cuando aquello que queremos dejar como comentario, es de mayor tamaño.__ Para ello, empezamos el bloque de texto con `/*`, introducimos nuestro gran comentario y luego lo cerramos con `*/`. Noten que para mantener una alineación, utilizamos `*` al comienzo de cada línea del bloque pero no es necesario hacerlo:

```dart
void main() {
    // print('Program started');
    String recipeVersion = '2.3';
    // TODO: increment in one when without TACC is implemented
    /* Version 2.4 will include:
    * - Base made with rice
    * - 0 sugar
    * - 0 fat
    * Expected to be super popular!
    */ 
}
```

## Cuándo utilizar comentarios y por qué

Este asunto es muy debatido en la comunidad y varía según lo que estén escribiendo pero en términos generales, nosotros pensamos que:

- Es __útil__ escribir comentarios que __explican el porqué de un código que no sigue las convenciones__, si eso no queda claro en el contexto.

- __No es útil__ escribir comentarios que __explican qué estamos haciendo__ ya que eso __debería quedar claro con nuestro código__. Si nuestro código no es claro, entonces deberíamos re escribirlo. Para esto último, recuerden que lo más importante es __cómo nombramos__ variables, métodos, clases, etc, haciéndolo de forma tal que __describa con precisión qué intentamos hacer__ con ella.
