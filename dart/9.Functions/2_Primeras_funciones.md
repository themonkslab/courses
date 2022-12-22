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