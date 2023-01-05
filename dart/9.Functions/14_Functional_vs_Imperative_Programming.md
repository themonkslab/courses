# _Functional vs Imperative Programming_

Cuando empezamos a programar, nuestra meta principal es hacer que las cosas funcionen, como sea. __A medida que vamos ganando mayor experiencia, empezamos a utilizar paquetes o librerías que son conjuntos de funciones que nos ahorran tiempo y hacen nuestro código más simple.__ Y también nuestra vida! 😂

Esto __nos permite reducir la complejidad sin saber muchas veces, qué sucede dentro de esas librerías__. Cada librería es una especie de caja negra en donde uno interactúa con las partes que el desarrollador de la librería expuso (comunmente es llamado _API, application programmer interface_ o interface de programación de aplicaciones), sin tener mucha idea de qué pasa dentro.

__Este mecanismo se llama _Composability_ o componibilidad y consiste en crear funciones o clases (ya veremos qué son), que se pueden combinar fácilmente.__ Así, si creamos una función A, podemos luego aplicarle a ella una función B y no necesariamente tenemos que saber qué hace una o la otra sino, conocer cuáles son sus argumentos requeridos y sus retornos.

A su vez, el utilizar este tipo de enfoque sería solamente decirle a la máquina mediante nuestro código y funciones, aquello que nos importa en lugar de hacerlo paso a paso. __Nos estaríamos concentrando en el qué y no en el cómo. Esto sería _Functional programming_ o programación funcional.__

Por el otro lado, __el paradigma imperativo de programación o _Imperative Programming_, se encarga de decirle paso a paso a la máquina lo que tiene que hacer, sería concentrarse en el cómo.__

Veámoslo más claramente en un ejemplo! Recuerdan la función `reduce` que vimos en el capítulo anterior? Eso sería hacer programación funcional ya que no nos preocupamos por lo que dicha función hace _under the hood_ (dentro de su código), sino por lo que nos permite hacer y qué necesitamos para hacerla.

```dart
void main() {
  const list = [1, 2, 3, 4];
  final sum = list.reduce((value, element) => value + element);
  print(sum); // 10
  // value:   1 => 3 => 6
  // element: 2 => 3 => 4
}
```

Si nosotros tuviéramos que hacerlo de forma declarativa, haríamos algo así:

```dart
void main() {
  const list = [1, 2, 3, 4];
  var sum = 0;
  for(var i = 0; i < list.length; i++) {
    sum += list[i];
  }
  print(sum); // 10
}
```

Hasta aquí podemos ver que en el primer ejemplo, la complejidad es mucho menor pero fíjense qué sucede cuando queremos sumar complejidad, en uno y otro caso.

Ahora vamos a querer sumar solamente los números que son mayores a 2:

```dart
void main() {
  const list = [1, 2, 3, 4];
  final sum = list
      .where((element) => element > 2)
      .reduce((value, element) => value + element);
  print(sum); // 7
}
```

Fíjense qué bello y simple: ahora apilamos las funciones mediante la utilización de `.`: como cada método retorna una lista entonces primero filtrando los números mayores a 2 y luego sobre la nueva lista, aplicamos el reduce. Así, la lista original no se altera y logramos todo con unos caracteres más.

Cómo haríamos esto de forma declarativa?

```dart
void main() {
  const list = [1, 2, 3, 4];
  var sum = 0;
  for (var i = 0; i < list.length; i++) {
    if (list[i] > 2) {
      sum += list[i];
    }
  }
  print(sum); // 7
}
```

Lo importante a notar en este caso, no es solamente que el segundo ejemplo tiene más líneas de código sino que nos vimos obligados a tener que entender la lógica interna del bucle _for_ para agregarle el condicional.

En el ejemplo funcional, solamente agregamos una función antes de la función previa sin tener que pensar en su implementación interna. Esto es programación funcional.

## Por qué una mixtura de ambos

Como habrán podido ver, escribir código solamente declarativo vuelve nuestro código más engorroso, difícil de mantener, imposible de componer y al final de cuentas, una experiencia de programación menos deseada.

Ahora que conocen sobre funciones, pueden empezar desde las bases, inclinándose a un tipo de programación funcional, en donde cuiden la pureza de las funciones y utilicen métodos como `map`, `where` o los que vayan conociendo para hacer su código más simple y componible.

Existen diferentes paquetes que facilitan este tipo de paradigma pero por el momento nos vamos a concentrar en las herramientas que Dart tiene para darnos y con ellas, hasta el infinito! ♾️ 
