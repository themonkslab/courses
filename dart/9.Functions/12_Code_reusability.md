# _Code reusability_

Ya hemos citado muchas veces el porqué tratar de evitar la repetición de código (_DRY_) pero es algo que siempre tenemos que tener presente ya que nos ahorra toneladas de energía. __Si reutilizamos código de forma correcta, evitamos tener que mantener código y solucionar bugs producto de código repetido que no actualizamos__.

Vamos entonces a ver cómo podemos utilizar lo que aprendimos de funciones para lograr un mejor código.

## Funciones como argumentos

Recordemos el último ejemplo:

```dart
void main() {
  const people = ['Jack', 'Justin', 'Martin', 'Eugenio'];
  final  peopleWithTitle = people.map((person)=> 'Dr. $person').toList();
  print( peopleWithTitle);
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

## Aclaración final

Me gustaría sin embargo hacer una aclaración: reusar código no es lo mismo que embellecer: a veces tenemos la tendencia a escribir código solamente para hacer el código anterior más bonito, más legible. La idea sería escribir ese código en la primer vez! 😂 Si solamente estamos agregando una función para que se vea más lindo algo que ya hicimos en otra, evitémoslo y mejoremos la anterior!
