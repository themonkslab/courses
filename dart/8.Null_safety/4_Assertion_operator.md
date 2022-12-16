# _Assertion operator_

Supongamos que tenemos una tienda en línea y queremos dar un bono a aquellos que compren por encima de $5000. Podríamos representarlo con el siguiente código:

```dart
void main() {
    const cart = 5001;
    double? maybeBonus;
    if(cart > 5000) {
        maybeBonus = 500;
    }
    double bonus = maybeBonus;
    print('You have a bonus of $bonus');
}
```

Qué sucede con `maybeBonus` (talvez bonus)? Como Dart no puede calcularlo con _static type_ antes de compilar, no puede saber si `maybeBonus` será nulo al momento de querer asignarlo a `bonus` por lo que nos dice que un valor del tipo `double?` (un `double` nulleable) no puede ser asignado a un `double` (un `double` no nulleable). 💀 Para solucionarlo, qué podrían hacer? Tienen todos los elementos! Vayan a prevenir nulos usando operadores!!!

```dart
void main() {
const cart = 5001;
  double? maybeBonus;
  if (cart > 5000) {
    maybeBonus = 500;
  }
  double bonus = maybeBonus ?? 0;
  if (bonus == 0) print('You have no bonus');
  if (bonus > 0) print('You have a bonus of $bonus');
}
}
```

En este caso, utilizamos primero un `??` operator que dice que si `maybeBonus` no es nulo, entonces sea utilizado; si es nulo entonces utilice el valor que ponemos a su derecha, `0` en este caso. Luego de ello, chequeamos si `bonus` es igual a `0` o no para imprimir distintos mensajes.

Ahora bien, esto parece mucho embrollo si estamos seguros de que la compra ha sido mayor a 5000, que es algo que en muchas instancias nos va a suceder: habremos hechos los chequeos y tests necesarios para tener esa seguridad en dicho lugar. Tenemos entonces que escribir todo este código o podemos hacer algo distinto?

Claro que podemos y se trata de utilizar el _assertion operator_ u operador de afirmación (`!`), que nos permite asignar un valor nulleable a una variable no nulleable. Se vería totalmente igual al primer caso solo con un agregado:

```dart
void main() {
  const cart = 5001;
  double? maybeBonus;
  if (cart > 5000) {
    maybeBonus = 500;
  }
  double bonus =
      maybeBonus!; // 💃🏼 nota de atención para que vean el agregado 🤣
  print('You have a bonus of $bonus');
}

```

Ya verán que en este caso, no nos salta ningún tipo de error y esto es porque nosotros le dijimos a Dart 'quedate tranquilo que sabemos lo que hacemos'. Debido a que en este caso somos nosotros los que estamos en control, realmente tienen que estar seguros de lo que hacen!

Y qué sucede cuando creen uno está absolutamente seguro pero resulta que algo en el proceso no era exactamente como lo previmos y llega a ese lugar y el valor resulta ser nulo? 💥 Baaaang! Explota todo! 🤣 Y por esta razón es que a este operador también se lo llama el _bang operator_!
