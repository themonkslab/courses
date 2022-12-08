# _Type annotations_

Hasta ahora, declaramos listas como `var`. Eso nos permitiría hacer algo como lo siguiente? 🤔 ... 💀

```dart
void main() {
    var cities = ['Cordoba', 'New York', 'Paris'];
    cities.add(2);
    print(cities);
}
```

No! Pero por qué? Si se fijan en el error, Dart nos dice que el argumento `int` no puede asignarse al parámetro del tipo `String`. Esto sucede porque cuando declaramos la lista, solo incluimos en ella valores del tipo `String`. Dart entonces, infiere que es una lista de valores `String`. Si hubiéramos agregado algún `int` en nuestra primer lista, podríamos hacerlo, ya que sería una lista de objetos:

```dart
void main() {
    var cities = ['Cordoba', 'New York', 'Paris', 1];
    cities.add(2);
    print(cities);
}
```

La inferencia de tipo que hizo Dart en el primer ejemplo es correcta pero nosotros podemos reforzarla para no perder de vista su tipo, de la siguiente manera:

```dart
void main() {
    List<String> cities = ['Cordoba', 'New York', 'Paris'];
    print(cities);
}
```

💀 Y qué sucedería en este caso? Podríamos incluir el número entero?

```dart
void main() {
    List cities = ['Cordoba', 'New York', 'Paris', 1];
    print(cities);
}
```

Así es, porque simplemente estamos diciendo que es una lista pero no especificando el tipo de valor de los elementos de esa lista mediante `<Tipo>`.

En general sin embargo, es preferible declarar variables utilizando `var`, `final` o `const`. Pero cómo podríamos hacer para decirle a Dart entonces, que queremos una lista solamente de, en este caso, `String`? De la siguiente manera:

```dart
void main() {
    var cities = <String>['Cordoba', 'New York', 'Paris'];
    print(cities);
}
```

`<String>`, es una _type annotation_ o anotación de tipo en Dart y ellas son opcionales, mas se van a encontrar mucho con ellas y ayudan mucho a desarrollar mejor código.
