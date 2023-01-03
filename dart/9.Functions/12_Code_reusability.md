# _Code reusability_

Ya hemos citado muchas veces el porqué tratar de evitar la repetición de código (_DRY_) pero es algo que siempre tenemos que tener presente ya que nos ahorra toneladas de energía. __Si reutilizamos código de forma correcta, evitamos tener que mantener código y solucionar bugs producto de código repetido que no actualizamos__.

Vamos entonces a ver cómo podemos utilizar lo que aprendimos de funciones para lograr un mejor código.

## Funciones como argumentos

Recordemos el último ejemplo:

```dart
void main() {
  const people = ['Jack', 'Justin', 'Martin', 'Eugenio'];
  final  peopleWithTitle = people.map((person)=> 'Dr. $person').toList();
  print(peopleWithTitle);
}
```

Supongamos que no es el único lugar en el que queremos agregarle el prefijo a un listado de profesionales o que necesitamos hacerlo varias veces con distintas listas de profesionales o bien que podría tratarse de personas de distintas profesiones y necesitaríamos cambiar el prefijo cada vez. Qué tal si extraemos la utilidad en una función? 💀 No me quedan dudas que tienen ganas de ir a probarlo ustedes y lo pueden hacer perfectamente!

```dart
void main() {
  const sirsWithoutTitle = ['Jack', 'Justin', 'Martin', 'Eugenio'];
  final sirsWithTitle = addPrefix(initialList: sirsWithoutTitle, prefix: 'Sir');
  print(sirsWithTitle);
  const doctorsWithoutTitle = ['Florence', 'Marian'];
  final doctorsWithTitle =
      addPrefix(initialList: doctorsWithoutTitle, prefix: 'Dr');
  print(doctorsWithTitle);
}

List<String> addPrefix(
    {required List<String> initialList, required String prefix}) {
  return initialList.map((person) => '$prefix $person').toList();
}
```

Súper! Ya mejoramos bastante nuestro código teniendo una sola función que mantener o testear en el futuro. Pero __qué pasa si queremos que esta función pueda agregar un título a veces y otras un sufijo? Y aun así seguir siendo una función pura, lo que significa que tiene una sola razón de existir y con los mismos argumentos arroja los mismos resultados?__ Podemos pedir en nuestra función, una función anónima como argumento!

```dart
void main() {
  const sirsWithoutTitle = [
    'Jack',
    'Justin',
    'Martin',
    'Eugenio',
  ];
  final sirsWithTitle = giveTitles(
    initialList: sirsWithoutTitle,
    transform: (value) => 'Sir $value',
  );
  print(sirsWithTitle);
  final sirsWithSuffix = giveTitles(
    initialList: sirsWithoutTitle,
    transform: (value) => '$value, The Sir! 👑',
  );
  print(sirsWithSuffix);
}

List<String> giveTitles({
  required List<String> initialList,
  required String Function(String) transform,
}) {
  return initialList.map(transform).toList();
}
```

Fíjense lo que hicimos:

1. Renombramos la función que habíamos extraído para que sea más representativa.
2. Suplantamos el segundo argumento, por una función que va a retornar un `String` y pide un `String` como argumento.
3. Dentro del `map`, insertamos nuestra función. Tengamos en cuenta que nos permite hacerlo ya que el `map` toma un `String` como argumento (debido a que aplicamos un `map` en una lista de `String`) y luego efectúa una operación en él para retornar un valor, lo mismo que la función que le pasamos.
4. Llamamos dos veces a esta función, con dos funciones anónimas distintas pero que ambas respetan la firma que pedimos en nuestro argumento, la primera para agregar un prefijo y la segunda un sufijo.

Así podemos observar todo el poder que tiene esta función que recibe otra función anónima como argumento y cada vez que se ejecute va a retornar el mismo resultado con los mismos argumentos, lo cual es requisito para que sea una función pura. Al mismo tiempo, cumple con una sola función, la de retornar una `List<String>` performando la operación que le pasemos. Una verdadera ganga! 🤣

## _Generics_

Estuvimos viendo que podíamos hacer funciones que reciban funciones como parámetros pero siempre recibían y retornaban el mismo tipo de variable. Qué sucede si queremos hacer una función que sirva para varios tipos? Veámoslo con un ejemplo bien sencillo: supongamos que tenemos una lista de `int` y queremos tener una función que nos permita ejecutar distintas operaciones en ellos. Crearemos entonces una función que reciba otra como argumento:

```dart
void main() {
  const list = [1, 2, 3];
  print(transform(list, (x) => x * 2));
  print(transform(list, (x) => x * 10));
}

List<int> transform(List<int> list, int Function(int) operation) {
  return list.map(operation).toList();
}
```

Fíjense que hasta aquí funciona perfecto: podemos ejecutar dos operaciones distintas en nuestra lista original, primero multiplicar los valores originales por 2 y luego por 10. Qué sucede sin embargo si quisieran hacer lo siguiente?

```dart
void main() {
  const list = [1, 2, 3];
  print(transform(list, (x) => x * 2));
  print(transform(list, (x) => x * 10));
  print(transform(list, (x) => x / 2)); // 👁️ aquí aparece un problema
}

List<int> transform(List<int> list, int Function(int) operation) {
  return list.map(operation).toList();
}
```

_'The return type 'double' isn't a 'int', as required by the closure's context.'_ Dice que el tipo de retorno `double` no es un `int` como require el contexto de nuestra _closure_. Recuerdan que una _closure_ es una función anónima pero que utiliza una variable que está fuera de su _scope_ y en este caso, está hablando de la `operation` que le pasamos a nuestro `transform`: dicha `operation` retorna un `int` pero si le pedimos que divida, vamos necesariamente a estar retornando un `double` por lo que no coincide con el tipo especificado. Cómo podemos hacer entonces? Utilizando genéricos!

__Los genéricos o _generics_ son tipos que pueden tener otros tipos formales como parámetros__, o algo así como pasa en las funciones: una función recibe argumentos que luego puede utilizar; en el caso de los tipos, estos pueden recibir como parámetros otros tipos para utilizar. Cómo haríamos esto? En lugar del tipo ya conocido, por ejemplo `List<int>`, ponemos una letra mayúscula para representar lo que esperamos reciba, como convención nemotécnica. Dart sin embargo, cuenta ya con las siguientes convenciones:

- `E` para elemento.
- `K` y `V` para key y value respectivamente.
- `R` para un tipo de retorno.
- `T`, `S` y `U` para tipos genéricos.
- Si ninguno de los tipos anteriores sirvió a nuestros fines, cualquier letra mayúscula puede servir.

Cómo haríamos con nuestro ejemplo anterior? Podríamos decirle a nuestra `transform` que reciba un parámetro de un tipo genérico en lugar de `int` para que pueda luego retornar también un `double`. Para esto, cuando declaramos la función, tenemos que ponerle dentro de `<...>` aquella letra que represente el genérico. Vamos a utilizar `T`:

```dart
void main() {
  const list = [1, 2, 3];
  print(transform(list, (x) => x * 2));
  print(transform(list, (x) => x * 10));
  print(transform(list, (x) => x / 2)); // 👁️ aquí sigue nuestro problema
}

List<T> transform<T>(List<T> list, T Function(T) operation) {
  return list.map(operation).toList();
}
```

Ya agregamos nuestro tipo genérico pero sin embargo continua fallando! Qué sucede? Que estamos especificando un tipo genérico como parámetro de valor de entrada y salida cuando lo que queremos es que podamos introducir un tipo para la entrada y otro diferente para la salida, pudiendo así tener una lista de `int` que retorne un `double`. Cómo hacemos esto? Como con las funciones: les pasamos otro tipo genérico como parámetro, ahora llamado `S`:

```dart
void main() {
  const list = [1, 2, 3];
  print(transform(list, (x) => x * 2));
  print(transform(list, (x) => x * 10));
  print(transform(list, (x) => x / 2));
}

List<S> transform<T, S>(List<T> list, S Function(T) operation) {
  return list.map(operation).toList();
}
```

Ahora, nuestra función `transform` recibe los tipos genéricos `T` y `S` y luego los utiliza de la siguiente manera: la lista que esperamos es de tipo `T` (`int` en nuestro caso). Luego `operation` retorna un tipo `S` (`double`) pero espera un tipo `T` como parámetro (el `int` para coincidir con la lista anterior) y el retorno total de nuestra función es del tipo `S` coincidiendo con la de nuestra `operation`.

Sé que puede sonar bastante complicado o enrevesado pero si lo escriben un par de veces, van a ir entendiendo cómo viene la mano.

## Aclaración final

Me gustaría hacer una aclaración: reusar código no es lo mismo que embellecer: a veces tenemos la tendencia a escribir código solamente para hacer el código anterior más bonito, más legible. La idea sería escribir ese código la primera vez! 😂 Si solamente estamos agregando una función para que se vea más lindo algo que ya hicimos en otra, evitémoslo y mejoremos la anterior! Si lo hacemos para decir más lindo funciones propias de Dart, evitémoslo nuevamente ya que van a ver que al hacer mucho uso de ellas, les parecerán lo suficientemente bellas para dejarlas como están y van a evitar de esta manera, olvidarse del lenguaje.
