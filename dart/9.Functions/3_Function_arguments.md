# _Function arguments_

Vamos a cambiar continuar con el ejemplo anterior y ya que estamos en una panadería, podría conocer a casi todos los clientes, por lo que quiero saludarlos con su nombre:

```dart
void main() {
  const client1 = 'Pedro';
  const client2 = 'Julian';
  const client3 = 'Beth';
  const client4 = 'Alex';
  const client5 = 'Martin';
  print('Hi $client1! 😄 How are you feeling today?');
  print('Hi $client2! 😄 How are you feeling today?');
  print('Hi $client3! 😄 How are you feeling today?');
  print('Hi $client4! 😄 How are you feeling today?');
  print('Hi $client5! 😄 How are you feeling today?');
  // Again, hasta el inifinito! 😅
}
```

Vamos a definir una función que nos permite ahorrarnos esas repeticiones:

```dart
void main() {
  const client1 = 'Pedro';
  const client2 = 'Julian';
  const client3 = 'Beth';
  const client4 = 'Alex';
  const client5 = 'Martin';
  greetings();
  greetings();
  greetings();
  greetings();
  greetings();
}

void greetings() {
  print('Hi $client1! 😄 How are you feeling today?');
}
```

Qué sucede? Dentro de nuestra función tenemos un error que nos dice que `client1` no está definido. Por qué? Porque `void greetings(){}` no sabe nada de lo que sucede dentro de `void main() {}`; lo que sucede dentro de los `{}` queda dentro de los `{}` 😂!

Y cómo hacemos para hacerle llegar el nombre de cada cliente? Muy sencillo: pasándole argumentos:

```dart
void main() {
  const client1 = 'Pedro';
  const client2 = 'Julian';
  const client3 = 'Beth';
  const client4 = 'Alex';
  const client5 = 'Martin';
  greetings(client1);
  greetings(client2);
  greetings(client3);
  greetings(client4);
  greetings(client5);
}

void greetings(String name) {
  print('Hi $name! 😄 How are you feeling today?');
}
```

Ahora podemos ver que ahorramos varios caracteres ya que dentro de `greetings`, la variable `name` dentro del `print`, es 'llenada' por el argumento `name` que recibe. Fíjense que establecemos qué tipo de valor vamos a querer recibir en dicha función. Luego, cada vez que la llamamos, nuestro contenedor `name` va a llenarse con el que le pasemos, en este caso, el nombre de nuestro primer cliente, luego el segundo y luego el tercero y así! No es una maravilla?

Y supongamos que justo hoy tenemos una promoción y queremos ofrecerla a cada cliente! Con nuestras funciones funcionando (😂), no tenemos más que actualizar la función `greetings`:

```dart
void main() {
  const client1 = 'Pedro';
  const client2 = 'Julian';
  const client3 = 'Beth';
  const client4 = 'Alex';
  const client5 = 'Martin';
  greetings(client1);
  greetings(client2);
  greetings(client3);
  greetings(client4);
  greetings(client5);
}

void greetings(String name) {
  print('Hi $name! 😄 How are you feeling today?\nWe have a 50% discount! Wow! 💃🏼');
}
```

Díganme si no es una belleza total? Imagínense todo el trabajo que habría sido teniendo `print` por cada saludo! Una verdadera pesadilla! E imaginen en aplicaciones reales de miles de líneas de código... Imposible! Por esto, _DRY (don't repeat yourself)_ o no se repitan y utilicen funciones para no hacerlo! Ah! Noten que utilizamos `\n` para hacer un salto a la línea siguiente!

Y me gustaría contarles, que no importa si a la función le pasan como argumento una `variable` como en el ejemplo, una expresión o un _literal_, siempre y cuando respeten el orden y el tipo. Veamos:

Logrando el mismo resultado que en el último ejemplo:

```dart
void main() {
  greetings('Pedro');
  greetings('Julian');
  greetings('Beth');
  greetings('Alex');
  greetings('Martin');
}

void greetings(String name) {
  print('Hi $name! 😄 How are you feeling today?\nWe have a 50% discount! Wow! 💃🏼');
}
```

Pero qué sucede si le pasan un valor de un tipo distinto del que la función espera?

```dart
void main() {
  greetings('Pedro');
  greetings(true);
  greetings('Beth');
  greetings('Alex');
  greetings('Martin');
}

void greetings(String name) {
  print('Hi $name! 😄 How are you feeling today?\nWe have a 50% discount! Wow! 💃🏼');
}
```

Muy simple y muchas gracias Dart: nos avisa que el parámetro del tipo `bool` no puede ser asignado a uno del tipo `String`! Bendito _static check_ que nos avisa y previene de estos errores! De la misma forma, si nos olvidamos de pasar un parámetro, Dart también nos avisa!

Y como para cerrar: ya vimos que __las funciones nos sirven para hacer algo__ por lo que __deben declararse con un verbo__, mientras que __los nombres deben declararse como sustantivos__.
