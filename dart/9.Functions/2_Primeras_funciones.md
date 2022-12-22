# Primeras funciones

Como bien dijimos, las funciones son bloques constructivos que nos permiten reciclar, reutilizar, no repetir código.

Imaginemos que queremos construir nuestra casa pero no tenemos suficiente dinero: si la pensáramos sin ninguna idea de base, tuviéramos que contratar arquitecto, calcular y preveer cada espacio, medir todos los elementos que irían dentro y demás, muchos de estos elementos serían especiales por lo que su valor sería altísimo. Además, el costo de todo el proceso de planificación, también sería muy alto.

Existen empresas constructoras que tienen soluciones preelaboradas y uno elige dentro de un número contado de opciones. Ellos ya tienen comprados por cantidad los materiales y todo se vuelve mucho más económico. Esas son las funciones, a diferencia que en este mucho de 0 y 1, podemos crearlas nosotros! 😃

Vamos con algún ejemplo y tratemos de pensar de atrás hacia adelante.

## Primer ejemplo

Supongamos que estoy en una panadería y a cada persona que viene, quiero decirle 'Buen día' y 'Muchas gracias'! Si escribiéramos eso en código podría verse algo así:

```dart
void main() {
  print('Good morning');
  print('Thank you very much');
  print('Good morning');
  print('Thank you very much');
  print('Good morning');
  print('Thank you very much');
  print('Good morning');
  print('Thank you very much');
  print('Good morning');
  print('Thank you very much');
  // Hasta el infinito y más allá! 🫣
}
```

Sería súmamente tedioso y trabajo y no se vería nada bien! Una primera mejora que podemos hacer, es crear un bloque, una función, que nos permite saludar. Lo hacemos primero diciendo el tipo de retorno que va a tener (ya veremos más de esto, pero en este caso `void` significa que no retorna nada), luego el nombre de dicha función (`greetings`), luego unos paréntesis bien pegaditos al nombre y que nos dicen que eso es una función y un espacio para abrir finalmente _curly-braces_, unas llaves que contendrán lo que la función va a realizar:

```dart
void main() {}
void greetings() {
  print('Good morning');
  print('Thank you very much');
}
```

Ya tenemos declarada nuestra primer función! Ahora vamos a llamar! Para hacerlo, simplemente tenemos que escribir su nombre y abrir y cerrar paréntesis que es la manera de ejecutarla:

```dart
void main() {
  greetings();
  greetings();
  greetings();
  greetings();
  greetings();
  greetings();
}
void greetings() {
  print('Good morning');
  print('Thank you very much');
}
```

Voilá! Hicimos por lo menos, la mitad del trabajo! Vamos a ir mejorándolo en los capítulos siguientes!

## Segundo ejemplo

Supongamos que tenemos una panadería y queremos saludar a cada persona que entra y llevar la cuenta de cuántas personas entraron en el día. Podríamos empezar desde atrás asegurándonos que el número de veces que saludamos es igual al número de personas que entraron (aunque en este caso sea obvio ya que vamos a establecer nosotros mismos cuántas personas van a entrar).

```dart
void main() {
  const incomingPersons = 50;
  var greetedPersons;

  assert(greetedPersons == incomingPersons,
      'greetedPersons should hold same quantity as incomingPersons');
}
```

Si empezáramos nuestro código de esta manera, arbitráriamente diciendo que van a entrar 50 personas y dejando en nulo la cantidad de personas saludadas, va a fallar diciendo que ambas variables deben tener la misma cantidad.

Bueno, podríamos empezar saludando y sumando 1 a `greetedPersons` por cada persona entrante:

```dart
void main() {
  const incomingPersons = 50;
  var greetedPersons;

  print('Good morning! 😄');
  print('How are you feeling today?');
  greetedPersons = 1;
  print('Good morning! 😄');
  print('How are you feeling today?');
  greetedPersons = 2;
  print('Good morning! 😄');
  print('How are you feeling today?');
  greetedPersons = 3;
  // Esto se está volviendo tedioso!
  // Creo que podemos hacerlo mejor!

  assert(greetedPersons == incomingPersons,
      'greetedPersons should hold same quantity as incomingPersons');
}
```

Imagínense escribiendo hasta el 50! Una locura total! Ustedes ya saben que repetir código no es ninguna buena idea ya que:

1. Si necesitan cambiarlo van a tener que ir a todos los lugares donde está ese código.
2. Es mucho más fácil cometer errores.
3. Es mucho más difícil de leer.
4. No se ve nada bello! 😂

Vamos a mejorarlo un poco:

```dart
void main() {
  const incomingPersons = 50;
  var greetedPersons;

  for(var i = 0; i < incomingPersons; i++ ) {
    print('Good morning! 😄');
    print('How are you feeling today?');
    greetedPersons += 1;
  }

  assert(greetedPersons == incomingPersons,
      'greetedPersons should hold same quantity as incomingPersons');
}
```

Ups! Un error! Qué pasó? No inicializamos `greetedPersons` en `0` y por lo tanto se trata de un valor `null` al que ya vimos, no le podemos ejecutar ninguna operación ya que solo tiene tres métodos: `toString()`, el operador `==` y el `hashCode` que ya veremos!

💀 Ahora lo vamos a hacer bien solo que voy a cambiar algo y me gustaría que piensen por qué falla:

```dart
void main() {
  const incomingPersons = 50;
  var greetedPersons = 0;

  for(var i = 1; i < incomingPersons; i++ ) {
    print('Good morning! 😄');
    print('How are you feeling today?');
    greetedPersons += 1;
  }

  assert(greetedPersons == incomingPersons,
      'greetedPersons should hold same quantity as incomingPersons');
}
```

Exacto, la cuenta irá hasta el 49 ya que eso le pedimos en el _loop_. Vamos bien ahora sí!

```dart
void main() {
  const incomingPersons = 50;
  var greetedPersons = 0;

  for(var i = 0; i < incomingPersons; i++ ) {
    print('Good morning! 😄');
    print('How are you feeling today?');
    greetedPersons += 1;
  }

  assert(greetedPersons == incomingPersons,
      'greetedPersons should hold same quantity as incomingPersons');
}
```

Ahora funciona según lo planeado y si bien cada `print` dice cosas distintas, ambas son partes de un saludo y podríamos simplificarlo
