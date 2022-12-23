# Argumentos posicionales y nombrados

Hasta ahora, utilizamos argumentos para hacer que nuestra función, sea posible de utilizar en distintos escenarios. El tipo de argumentos que esa función pedía eran _posicionales_, ya que para llamarla correctamente, debíamos pasarle los argumentos tal y como habían sido citados en su declaración. Repasemos:

```dart
void main() {
  final friend = describe('Julia', 32, 'Soccer');
  sayHiTo('Marcos');
  print(friend);
  sayHiTo('Aurelius');
  print(friend);
}

void sayHiTo(String newPerson) {
  print('Hi $newPerson!');
}

String describe(String friendName, int age, String sport) {
  return 'This is $friendName!. She is $age years old and she likes to play $sport!';
}
```

Cuando llamamos a `describe`, fíjense que le pasamos el nombre, la edad y finalmente el deporte, tal y cual como lo pedimos en la función. Estos argumentos además de requerir ser pasados en la misma posición, son obligatorios ya que si no se los pasan va a dar un error. 💀 Vayan a probarlo!

Hasta acá, todo perfecto! Pero __qué sucedería si tuvieran más argumentos? O si esta función se encontrara en otro archivo?__ Tendrían que ir y venir cada vez para asegurarse que estén en el orden correcto y eso es muy _prone to error_ o susceptible de que cometamos un error. Por ello, Dart agrega los _named parameters_ o parámetros nombrados.

## _Named parameters_

Para crear este tipo de argumentos, solo tenemos que rodear los posicionales que ya tenemos, con `{}` y listo: `String describe({String friendName, int age, String sport}) {}`. Sin embargo, observen qué sucede si solamente cambiamos la declaración de la función y no el llamado:

```dart
void main() {
  final friend = describe('Julia', 32, 'Soccer');
  sayHiTo('Marcos');
  print(friend);
  sayHiTo('Aurelius');
  print(friend);
}

void sayHiTo(String newPerson) {
  print('Hi $newPerson!');
}

String describe({String friendName, int age, String sport}) {
  return 'This is $friendName!. She is $age years old and she likes to play $sport!';
}
```

Un montón de errores pero todos producto del primero: 'Too many positional arguments: 0 expected, but 3 found.' Dice que hay muchos argumentos posicionales pero se esperaban 0. Luego los próximos errores dicen que los parámetros nombrados no pueden tener un valor nulo por el tipo de ellos, solo que esto es porque nunca se los pasamos como nombrados. Para hacerlo, en el llamado de la función podemos ponerlos en cualquier orden pero tenemos que utilizar la variable con la que los nombramos:

```dart
void main() {
  final friend = describe(
    friendName: 'Julia',
    age: 32,
    sport: 'Soccer', // Noten que por la _trailing comma_, lo organiza distinto
  );
  sayHiTo('Marcos');
  print(friend);
  sayHiTo('Aurelius');
  print(friend);
}

void sayHiTo(String newPerson) {
  print('Hi $newPerson!');
}

String describe({String friendName, int age, String sport}) {
  return 'This is $friendName!. She is $age years old and she likes to play $sport!';
}
```

Pero qué pasó!? 😭 Sigue dando errores! Y es porque Dart no está seguro de que esos valores lleguen cada vez que llamamos a la función! Cómo hacemos esto!?

## _Required_ y _default values_

Como declaramos nuestros parámetros en el ejemplo anterior, esto es con _named parameters_, le estamos por diciendo a Dart que por defecto esos valores no son pedidos de forma obligatoria. Para ello, debemos agregar una palabrita: _required_:

```dart
void main() {
  final friend = describe(
    friendName: 'Julia',
    age: 32,
    sport: 'Soccer',
  );
  sayHiTo('Marcos');
  print(friend);
  sayHiTo('Aurelius');
  print(friend);
}

void sayHiTo(String newPerson) {
  print('Hi $newPerson!');
}

String describe({required String friendName,required int age,required String sport}) {
  return 'This is $friendName!. She is $age years old and she likes to play $sport!';
}
```

Sin embargo, qué sucedería si quisiéramos declarar una función con _named parameters_ pero que no todos sean obligatorios? Deberíamos declarar esos con un tipo nulleable. Veamos cómo podría transformarse el ejemplo:

```dart
void main() {
  final friend = describe(
    friendName: 'Julia',
    age: 32,
  );
  sayHiTo('Marcos');
  print(friend);
  sayHiTo('Aurelius');
  print(friend);
}

void sayHiTo(String newPerson) {
  print('Hi $newPerson!');
}

String describe({required String friendName,required int age, String? sport}) {
  return 'This is $friendName!. She is $age years old. ${sport != null ? 'She loves to play $sport!': 'She does not like to play sports!'}';
}
```

En este último caso nos permitimos chequear si el valor que le pasamos es nulo y cambiamos nuestra descripción en concordancia. Y qué pasaría si Julia fuera Argentina que ganó la tercera copa del mundo, lo que hizo que cada persona Argentina viva ame el fútbol? A lo mejor ella lo dice cuando se describe, o a lo mejor quiere mencionar otro deporte pero seguro seguro seguro, el fútbol será uno de los deportes favoritos. Y si no pone nada pero igual ya sabemos esto del fútbol? Qué podemos hacer?

## _Default values_

Podemos poner un valor por defecto: si ella no menciona ninguno, el valor por defecto será `soccer` y si lo hace, será aquél que ella mencione. Se hace simplemente sacándole el tipo nulleable (ya que jamás será nulo) y poniendo un signo `=` con el valor por defecto luego. 💀 Sin embargo, van a tener una advertencia. Por qué?:

```dart
void main() {
  final friend = describe(
    friendName: 'Julia',
    age: 32,
  );
  sayHiTo('Marcos');
  print(friend);
  sayHiTo('Aurelius');
  print(friend);
}

void sayHiTo(String newPerson) {
  print('Hi $newPerson!');
}

String describe(
    {required String friendName, required int age, String sport = 'Soccer'}) {
  return 'This is $friendName!. She is $age years old. ${sport != null ? 'She loves to play $sport!' : 'She does not like to play sports!'}';
}
```

Exacto! Nunca jamás `sport` podrá ser nulo por lo que nuestro resguardo ya no tiene sentido. Y recuerden observar que en el llamado a la función, no le estamos pasando ningún valor a `sport` sino que toma el que está por defecto. Prueben, _nonetheless_ (no obstante), qué sucedería si le pasan un valor:

```dart
void main() {
  final friend = describe(
    friendName: 'Julia',
    age: 32,
  );
  sayHiTo('Marcos');
  print(friend);
  sayHiTo('Aurelius');
  print(friend);
}

void sayHiTo(String newPerson) {
  print('Hi $newPerson!');
}

String describe(
    {required String friendName, required int age, String sport = 'Soccer'}) {
  return 'This is $friendName!. She is $age years old. She loves to play $sport!';
}
```

Finalmente también podemos declarar valores posicionales opcionales y hasta darles un valor por defecto. Para hacerlos opcionales, los rodeamos con `[]` y agregamos el `?`:

```dart
void main() {
  final friend = describe(
    'Julia',
    32,
  );
  sayHiTo('Marcos');
  print(friend);
  sayHiTo('Aurelius');
  print(friend);
}

void sayHiTo(String newPerson) {
  print('Hi $newPerson!');
}

String describe(
    String friendName, int age, [String? sport]) {
  return 'This is $friendName!. She is $age years old. ${sport != null ? 'She loves to play $sport!' : 'She does not like to play sports!'}';
}
```

Y  para declarar  _default values_ lo hacen igual que en los casos anteriores, solamente que siguen rodeando al valor con `[]`:

```dart
void main() {
  final friend = describe(
    'Julia',
    32,
  );
  sayHiTo('Marcos');
  print(friend);
  sayHiTo('Aurelius');
  print(friend);
}

void sayHiTo(String newPerson) {
  print('Hi $newPerson!');
}

String describe(
    String friendName, int age, [String sport = 'Soccer']) {
  return 'This is $friendName!. She is $age years old. ${sport != null ? 'She loves to play $sport!' : 'She does not like to play sports!'}';
}
```
