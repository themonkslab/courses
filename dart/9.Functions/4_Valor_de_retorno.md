# Valor de retorno

Por ahora, las funciones que estuvimos declarando y creando, no nos devuelven nada; solamente han impreso en consola lo que le dijimos que imprima. Pero qué tal si yo quiero que esa función nos devuelva algo? Que tenga un _return value_ o valor de retorno?

Volvamos al ejemplo último pero vamos a decir más de nuestra amiga:

```dart
void main() {
  sayHiTo('Marcos');
  introduce('Julia', 32, 'Soccer');
  // Julia goes to the bathroom
  sayHiTo('Jupiter');
  // Julia come back
  sayHiTo('Aurelius');
  introduce('Julia', 32, 'Soccer');
}

void sayHiTo(String newPerson) {
  print('Hi $newPerson!');
}

void introduce(String friendName, int age, String sport) {
  print(
      'This is $friendName!. She is $age years old and she likes to play $sport!');
}

```

En este caso se vuelve un poco tedioso tener que describir a Julia cada vez que la presentemos y además, ella es la única amiga que llevamos a la fiesta por lo que no tiene sentido repetirlo una y otra vez, pudiéndonos equivocar en cada oportunidad. Qué tal si esta función que creamos nos devolviera esa descripción y pudiéramos utilizarla? Totalmente posible!

Primero declaramos el tipo de valor que queremos retorne (una `String` en este caso) y luego removemos el `print` y retornamos (`return`) esa `String`. Fíjense que si no especificamos el `return` nos dice que esa función debería retornar un `String` pero no lo está haciendo.

Finalmente, guardamos el valor retornado en una variable y lo utilizamos en el `print`!

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
