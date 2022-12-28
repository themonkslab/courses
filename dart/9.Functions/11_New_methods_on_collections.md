# _New methods on collections_

Ahora que ya tenemos un conocimiento más profundo sobre funciones, podemos explorar nuevos métodos para nuestras colecciones.

## `forEach` _method_

Ya vimos cómo iterar con un bucle _for-in_ en una colección. Pero podemos hacerlo de forma más suscinta:

```dart
void main() {
  const people = ['Jack', 'Justin', 'Martin', 'Eugenio'];
  people.forEach((person) => print(person));
}
```

La verdad solo se los mostré porque pueden verlo por ahí pero prueben escribir este ejemplo en Dartpad y vean qué sucede. 💀 Tómense su debido tiempo!

_Avoid using `forEach` with a function literal._ Dice que evitemos utilizar el `forEach` en una función literal. Qué es aquello que le pasamos al `forEach`? Esta parte: `(person) => print(person)`? 💀 Nuevamente, piensen.

Y noten que van a encontrar más 💀 a medida avancemos ya que vamos a ir complicando más la cuestión ahora que están hechos unos y unas ninjas! 🥷

Esta parte que les preguntaba, es una función nueva, una anónima, aquella que conocimos hace poco y Dart nos pide que no lo hagamos de esa forma sino que utilicemos el ya conocido _for-in_:

```dart
void main() {
  const people = ['Jack', 'Justin', 'Martin', 'Eugenio'];
  for (var person in people) {
    print(person);
  }
}
```

 Sin embargo, __recuerdan que podemos pasar una función como parámetro de otra función si ambas tienen la misma firma o son declaradas esperando los mismos retornos y argumentos?__

Resulta que en este caso, nuestro `forEach` tiene esta declaración:
`void Function(String))` y el ya conocido `print` tiene la siguiente: `void print(Object?)`. Aun nos faltan cosas para entenderlo un poco más pero básicamente:

- Ambos retornan `void` o vacío.
- Ambos reciben un `Object?` como argumento ya que el `Object?` puede contener un `Object` y el `String` es un `Object`.

Por ende, sí podemos hacer nuestra función más suscinta si se trata de utilizar una función nombrada con anterioridad, como es el caso de `print`:

```dart
void main() {
  const people = ['Jack', 'Justin', 'Martin', 'Eugenio'];
  people.forEach(print);
}
```

En este caso, el parámetro al `print` se pasa de forma implícita desde el `forEach`.

## `map` _operator_

Este operador nos permite __tomar una colección, transformar como queramos cada uno de sus elementos y retornar con todos ellos, una nueva colección__.

Supongamos que tenemos la misma lista de personas del ejemplo anterior, y una vez más, queremos sumar un sufijo a sus nombres. Vamos a hacerlo primero con nuestro conocido _for-in_ y luego con `map`. Miren qué bello y simple se vuelve con este último:

```dart
void main() {
  const people = ['Jack', 'Justin', 'Martin', 'Eugenio'];
  final peopleWithSuffix = [];
  for (var person in people) {
    peopleWithSuffix.add('Dr. $person');
  }
  print(peopleWithSuffix);
}
```

```dart
void main() {
  const people = ['Jack', 'Justin', 'Martin', 'Eugenio'];
  final peopleWithSuffix = people.map((person)=> 'Dr. $person');
  print(peopleWithSuffix);
}
```

Ahora... notan alguna diferencia en la variable resultante `peopleWithSuffix` en un caso y en el otro? 💀 Vayan a investigar!

Fíjense que en el primer caso imprime '[Dr. Jack, Dr. Justin, ...]' y en el segundo '(Dr. Jack, Dr. Justin, ...)'. Esto es porque __nuestro `map` retorna un `Iterable` que si recuerdan, era el padre de las `List` y de `Map` y representa una colección de elementos a los que se puede acceder de forma secuencial.__

Si nos ponemos a ver más en detalle su firma y la docu de Dartpad, vamos a ver varias cosas nuevas:

- `Iterable<T> map<T>(T Function(String) toElement)`.

`T` refiere a una tipo especial, el genérico, que ya vamos a ver.

- _'The returned iterable is lazy, so it won't iterate the elements of this iterable until it is itself iterated'_

Dice que lo que retorna es un _lazy_ (flojo) _iterable_: esto quiere decir que hasta que no utilicemos ese resultado, no se va a llamar a la función anónima dentro del `map` y esto es una optimización de performance.

Y qué pasa si queremos tener como retorno específicamente una `List` en lugar de un `Iterable`? Podemos agregarle al `map` al final el método `toList()` de la siguiente manera:

```dart
void main() {
  const people = ['Jack', 'Justin', 'Martin', 'Eugenio'];
  final peopleWithSuffix = people.map((person)=> 'Dr. $person').toList();
  print(peopleWithSuffix);
}
```
