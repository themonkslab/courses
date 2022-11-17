# _Increment and Decrement operators_

Dart ofrece esta forma ya conocida de hacer nuestro código más conciso:

```dart
void main() {
    int x = 1;
    x += 1;
    print(x); // 2
}
```

Sin embargo, hay una forma aun más concisa y son los operadores de incremento y decremento, por lo que sirve tanto para '+' como para '-':

```dart
void main() {
    int x = 1;
    x++;
    print(x); // 2
}
```

En el caso anterior vemos cómo agregamos a modo de 'sufijo' el operador '++' a haciendo que su valor se incremente en 1. Podríamos encontrarnos también con el caso en donde lo agreguemos a modo de 'prefijo': `++x`. Veamos las diferencias:

```dart
void main() {
    int x = 1;
    int y = x++;
    print('x: $x, y: $y'); // x: 2, y:1 
}
```

Utilizando el _sufix operator_, primero asignamos `x` (`x` que es igual a 1 se asigna a `y`) y luego la incrementamos (`x` ahora vale 2). Qué sucedería utilizando el _prefix operator_?

```dart
void main() {
    int x = 1;
    int y = ++x;
    print('x: $x, y: $y'); // x: 2, y:2 
}
```

Se preguntarán por qué esto funciona de esta manera! 🙃 La respuesta es que muchos de los lenguajes que derivan de __C__ (un lenguaje desarrollado entre 1969 y 1972), adoptaron esta convención en los últimos 50 años y Dart es uno de ellos.

Estos operadores pueden confundirnos bastante si no estamos acostumbrados a utilizarlos. Y ustedes ya saben cuál es la forma de acostumbrase! 🤣

## 💪 Adivinando el futuro

__Requirement__: escriban cuál sería el resultado de `print`.

```dart
void main() {
    int x = 1;
    int y = x++;
    int z = --y;
    print('x: $x, y: $y, z: $z');
}
```

__💀 Solución__:

```dart
void main() {
    int x = 1;
    int y = x++;
    int z = --y;
    print('x: $x, y: $y, z: $z'); // x: 2, y: 0, z: 0
}
```

Pueden utilizar estos operadores para hacer su código más conciso, pero recuerden que tiene que ser legible por personas y no solamente por máquinas. Si sienten que podría complicarle a algún _coworker_ (compañero de trabajo) en el futuro, no lo utilicen.
