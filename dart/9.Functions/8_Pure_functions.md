# _Pure functions_

Las funciones puras son funciones a las que __pasándoles los mismos argumentos, producen los mismos resultados y no tienen efectos secundarios o _side effects_.__ Vamos a verlo en la práctica.

Recuperemos nuestra ya utilizada función de suma:

```dart
void main() {
  sum(5, 8);
}

void sum(int a, int b) {
  print(a + b);
}
```

En este caso, siempre que le pasemos `5` y `8` a nuestra `sum`, va a imprimir `13`; siempre nos entrega el mismo resultado con los mismos argumentos.

Pero qué sucedería si la función tomara uno de los valores desde fuera de su _scope_ y al mismo tiempo lo alterara cada vez que se ejecuta?:

```dart
var b = 0;

void main() {
  sum(5);
  sum(5);
  sum(5);
  sum(5);
  sum(5);
}

void sum(int a) {
  b++;
  print(a + b);
}
```

Esta función no es pura ya que cada vez que se ejecuta, nos arroja un resultado distinto, por más que siempre le pasemos `a`. Además tiene un _side effect_, porque no solo imprime el valor de la suma sino que antes de ello, alteró el valor de `b`. __Esto es algo que debemos evitar a toda costa!__ Recordemos que __las funciones deben tener un solo propósito__ y a esto le sumemos que
__deben arrojar el mismo resultado si se las llama con los mismos argumentos y no deben tener efectos secundarios__. Por qué les recalco esto? Porque aquí en el ejemplo, que es muy pequeño, podemos darnos cuenta cuál es el valor que está cambiando, los _side effects_ y sus implicancias, pero __en proyectos reales de mucha mayor embergadura, esto se vuelve imposible y vuelve imposible de mantener dicho proyecto.__

## _Global state_

En el último ejemplo pudimos observar que toda nuestro programita, dependía del estado de la variable `b`. Diríamos en este caso que `b` sería el estado global de nuestra aplicación y en este caso, sería un estado mutable o susceptible de ser alterado.

Esta es otra práctica que tenemos que evitar porque vuelve a nuestra aplicación no solo inmanejable sino también insegura. __Dejemos para variables globales, solo variables constantes que no pueden ser alteradas al momento de ejecución.__
