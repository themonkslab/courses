# Valor de retorno

Por ahora, las funciones que estuvimos declarando y creando, no nos devuelven nada; solamente han impreso en consola lo que le dijimos que imprima. __Pero qué tal si yo quiero que esa función nos devuelva algo? Que tenga un _return value_ o valor de retorno?__

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

En este caso se vuelve un poco tedioso tener que describir a Julia cada vez que la presentemos y además, ella es la única persona con la que vamos juntos a la fiesta por lo que no tiene sentido repetirlo una y otra vez, pudiéndonos equivocar en cada oportunidad. Qué tal si esta función que creamos nos devolviera esa descripción y pudiéramos utilizarla? Totalmente posible!

Primero, en la función que creamos, declaramos el tipo de valor que queremos retorne (una `String` en este caso), luego removemos el `print` y retornamos (`return`) esa `String`. Fíjense que si no especificamos el `return` nos dice que esa función debería retornar un `String` pero no lo está haciendo.

Cuando decimos que retornamos es simplemente eso: __la función se va a ejecutar entera, tenga uno o mil pasos pero va a retornar aquello que le pidamos retorne y allí terminará de ejecutarse.__

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

## 💪 Calculadora versión dos

__Requirement__:

1. Crear una función que reciba dos valores del tipo `double` y un tipo de operación matemática (suma, resta, multiplicación y división) a ejecutar con esos dos valores.
2. Crear un solo `assertion` para asegurarse de que los dos valores introducidos son del tipo `double`.
3. Explicar el porqué del paso previo.
4. Crear un `assertion` para asegurarse de que el resultado es el correcto.
5. Crear otra función para imprimir una frase que muestre qué valores se utilizaron y la operación elegida, cambiando el texto según el tipo de operación:
  a. 'The result of a + b is 47'.
  b. 'The result of a - b is -27'.
  c. 'The result of a * b is 370'.
  d. 'The result of a / b is 0.27...'.

__Example__:

Para los valores 10.0 y 37.0, el resultado de sumar sería 47 y la frase sería 'The result of a + b is 47'.

---

__💀 Solución__:

```dart
enum MathOperation { add, substract, multiply, divide }

void main() {
  const a = 10.0;
  const b = 37.0;
  assert(a is double && b is double, 'a and b should be of type double');
  const operation = MathOperation.add;
  final result = calculate(a, b, operation);
  assert(result == 47, 'Something went wrong with your calculate function');
  printResult(operation, result);
}

double calculate(double a, double b, MathOperation operation) {
  switch (operation) {
    case MathOperation.add:
      return a + b;
    case MathOperation.substract:
      return a - b;
    case MathOperation.multiply:
      return a * b;
    case MathOperation.divide:
      return a / b;
  }
}

void printResult(MathOperation operation, double result) {
  switch (operation) {
    case MathOperation.add:
      return print('The result of a + b is $result');
    case MathOperation.substract:
      return print('The result of a - b is $result');
    case MathOperation.multiply:
      return print('The result of a * b is $result');
    case MathOperation.divide:
      return print('The result of a / b is $result');
  }
}
```

Y la explicación del porqué tienen que ser del tipo `double` es porque si usáramos números enteros `int` para `a` y `b`, la división va a resultar en un `double`.

Además, dejo ese `assertion` en la solución para que lo puedan ver ustedes pero Dart ya nos avisa de que no es necesario debido a que mediante el _static check_, él sabe que son `double`.

Finalmente, podríamos haber hecho una función para juntar ambas operaciones pero... PEEEERO... 🧐 Exacto... ya ustedes saben que __una función como una variable debe tener una y solo una razón para existir__. Esto es algo que veremos en el futuro cuando aprendamos sobre _SOLID_, que básicamente refiere a escribir código limpio, simple y fácil de mantener. El que tenga cada pedazo de nuestro código una sola razón para existir refiere a la __primera letra del acrónimo _SOLID_, _Single responsability_, una sola responsabilidad.__
