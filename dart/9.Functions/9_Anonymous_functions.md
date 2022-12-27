# Anonymous functions

Hasta ahora, vimos _named functions_ o funciones a las que ponemos un nombre cuando declaramos. Sin embargo podríamos declarar una función anónima! Cómo?

Supongamos que quiero crear una función para saludar; podría recibir un nombre como argumento y retornar un `String` con el saludo:

```dart
void main() {
  (name) => 'Hey! How are you $name';
}
```

Listo! Ya creamos nuestra primer función anónima, que recibe el argumento `name` (sin definir su tipo, cosa muy común en _anonymous functions_) y luego una _arrow function_ (_fat arrow notation_ recuerdan?) para retornar un `String`. Pero... cómo la utilizamos?

Podemos asignar esa función anónima a una variable y luego llamarla:

```dart
void main() {
  final sayHey = (name) => 'Hey! How are you $name?';
  print(sayHey('Mau'));
}
```

Sí, sí... van a tener una sugerencia en Dartpad ya que esta no es una buena práctica pero simplemente quería mostrárselas porque luego las verán mucho en lugares donde sí es una buena práctica!

Y para continuar con malas prácticas que serán buenas luego... 😛 También podemos pasar las funciones como argumentos de otras funciones. Por ejemplo, podemos crear una nueva función `welcome` que reciba a nuestra función anterior como argumento, reciba también una `String name` como otro argumento (que require nuestra función `sayHey`) y haga algo más ella solita:

```dart
void main() {
  final sayHey = (name) => 'Hey! How are you $name?';
  welcome(sayHey, 'Mau');
}

void welcome(String Function(String) sayHey, String name) {
  print(sayHey(name));
  print('Welcome to TheMonksLab! 😁');
}
```

Notaron cómo especificamos el tipo de función que esperamos como primer argumento de `welcome`? Primero ponemos lo que va retornar, un `String`. Luego, lo que es, una `Function` y allí mismo, el tipo de parámetro que esa función recibe entre `(String)`. Finalmente, el nombre que le ponemos al argumento. Para que lo entiendan más rápidamente, lo nombré igual que la función que teníamos antes pero podríamos haberle puesto otro nombre, así:

```dart
void main() {
  final sayHey = (name) => 'Hey! How are you $name?';
  welcome(sayHey, 'Mau');
}

void welcome(String Function(String) hi, String name) { // Cambio de nombre al argumento
  print(sayHey(name));
  print('Welcome to TheMonksLab! 😁');
}
```

Lo importante es que coincide el tipo de función que esperamos con el tipo de función que le pasamos. Lo siguiente, daría un error:

```dart
void main() {
  final sayHey = (int age) => 'Hey! How are you bro! Are you $age years old?';
  welcome(sayHey, 'Mau');
}

void welcome(String Function(String) hi, String name) { // Cambio de nombre al argumento
  print(sayHey(name));
  print('Welcome to TheMonksLab! 😁');
}
```

_The argument type 'String Function(int)' can't be assigned to the parameter type 'String Function(String)'._ Queremos asignar una función que como argumento recibe un `int` en lugar de un `String` y por eso falla!

Nuevamente es algo que ya veremos será de utilidad muy prontito por más que ahora pudieran haber hecho este ejemplo de la forma correcta sin utilizarlo.
