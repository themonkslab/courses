# _Function types_

Retomemos un poquito el ejemplo anterior y vamos a ir dándole utilidad de vida real a esos ejemplos.

En el último, veíamos que creábamos una función llamada `welcome` y que esa función era de un tipo específico ya que retornaba un `String` y pedía otro como argumento. __Qué tal si pudiéramos definir una especie de _alias_ o nombre para ese tipo y poder lograr que cada vez que tengamos que llamarlo, no tengamos que escribir todo:__ `String Function(String)`?

```dart
// Aquí aparecerá el código mágico 🧙🏼‍♀️
typedef SayHi = String Function(String);
//

void main() {
  final sayHey = (name) => 'Hey! How are you $name?';
  welcome(sayHey, 'Mau');
}

// Y lo usaremos aquí en el argumento
// para reemplazar ese gran llamado
// y lo dejo como comentario para que puedan comparar
// void welcome(String Function(String) hi, String name) {
void welcome(SayHi hi, String name) { 
  print(hi(name));
  print('Welcome to TheMonksLab! 😁');
}
```

Díganme si no es mucho más bello? En este caso, solo lo utilizamos una vez pero imaginen un código lleno de `SayHi` _functions_! Cuánto tiempo nos ahorraríamos y cuánto más bello se vería?

Como buenos _Monks_, habrán observado que ese nombre nada tiene para decirnos sobre el tipo de función que creamos pero está escrito a los fines de que se pueda seguir el hilo ahora que las cosas se van poniendo más complicadas! Aunque podríamos darle alguna utilidad 🧐...

Qué tal si queremos saludar en diferentes idiomas? Podríamos crear esas funciones y pasárselas a la función `welcome` ya que coinciden con nuestro tipo definido:

```dart
typedef SayHi = String Function(String);
String sayHola(String name) => 'Hola $name!';
String sayBonjour(String name) => 'Bonjour $name!';
String sayGutenMorgen(String name) => 'Guten Morgen $name!';

void main() {
  final sayHey = (name) => 'Hey! How are you $name?';
  welcome(sayGutenMorgen, 'Mau');
}

void welcome(SayHi hi, String name) { 
  print(hi(name));
  print('Welcome to TheMonksLab! 😁');
}
```

Y finalmente, __existe otra forma para definir el tipo de una función__ y aunque yo prefiero la primera, quiero mostrárselas:

```dart
// forma preferida
// typedef SayHi = String Function(String);
// forma abreviada
typedef String SayHi(String name);
String sayHola(String name) => 'Hola $name!';
String sayBonjour(String name) => 'Bonjour $name!';
String sayGutenMorgen(String name) => 'Guten Morgen $name!';

void main() {
  final sayHey = (name) => 'Hey! How are you $name?';
  welcome(sayGutenMorgen, 'Mau');
}

void welcome(SayHi hi, String name) { 
  print(hi(name));
  print('Welcome to TheMonksLab! 😁');
}
```
