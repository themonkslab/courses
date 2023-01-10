# _Getters and Setters_

Imaginemos que estamos haciendo un pequeño programita que nos permita medir una distancia dada tanto en kilómetros como en millas. Podríamos almacenar la distancia en kilómetros ya que es a lo que estamos más acostumbrados pero tener la posibilidad de ingresar también millas, siendo nuestra clase quien las convierta automáticamente a kilómetros:

```dart
class Distance {
  Distance.kilometers(this.kilometers);
  Distance.miles(double miles) : kilometers = miles * 1.60934;
  final double kilometers;
}

void main() {
  final distance1 = Distance.kilometers(100);
  final distance2 = Distance.miles(100);
  print(distance1.kilometers);
  print(distance2.kilometers);
}
```

En este caso, debido a como construimos la clase, solo podemos acceder y setear los kilómetros pero no podemos hacer lo mismo con las millas. Cómo podríamos hacerlo? Podríamos crear un método que calcule por nosotros esa conversión y cada vez que lo llamamos, nos arroje la versión en millas de los kilómetros que tenemos almacenados en la instancia de la clase:

```dart
class Distance {
  Distance.kilometers(this.kilometers);
  Distance.miles(double miles) : kilometers = miles * 1.60934;
  final double kilometers;
  double miles() => kilometers / 1.60934;
}

void main() {
  final distance1 = Distance.kilometers(100);
  final distance2 = Distance.miles(100);
  print(distance1.kilometers);
  print(distance2.kilometers);
  print(distance1.miles());
}
```

No obstante, recuerdan __cómo dijimos que las funciones debían nombrarse? Con acciones!__ Por lo que en realidad, lo que escribimos debería llamarse `getMiles` pero nosotros __no queremos realmente una función aquí sino poder llamar a las millas como lo hacemos con los kilómetros__. Cómo podemos hacer esto? __Utilizando un _getter_.__

A la función que creamos, le sacamos los `()` y le agregamos un `get` antes y listo! Ya tenemos nuestro _getter_ funcionando y lo llamamos como una _member variable_ más:

```dart
class Distance {
  Distance.kilometers(this.kilometers);
  Distance.miles(double miles) : kilometers = miles * 1.60934;
  final double kilometers;
  double get miles => kilometers / 1.60934;
}

void main() {
  final distance1 = Distance.kilometers(100);
  final distance2 = Distance.miles(100);
  print(distance1.kilometers);
  print(distance2.kilometers);
  print(distance1.miles);
}
```

Los _getters_ son como computaciones de otras _properties_ de la clase y por eso también son llamados _computed variables_ o variables computadas.

Y ya sé! 😳 Ahora ustedes me van a decir que no solo querrían obtener la distancia en millas sino también poder setearla. Resulta que también tenemos _setters_ y se escriben de manera muy simple:

```dart
class Distance {
  Distance.kilometers(this.kilometers);
  Distance.miles(double miles) : kilometers = miles * 1.60934;
  double kilometers;
  double get miles => kilometers / 1.60934;
  set miles(double miles) => kilometers = miles * 1.60934;
}

void main() {
  final distance1 = Distance.kilometers(100);
  final distance2 = Distance.miles(100);
  print(distance1.kilometers);
  print(distance2.kilometers);
  print(distance1.miles);
  distance1.miles = 50;
  print(distance1.miles);
  print(distance1.kilometers);
}
```

Es casi como si fuera una función, sin retornos, llamándose sin acción y seteando una _property_! 🤣 Sin embargo, muy importante: descubrieron qué otra cosa cambió del código entre el ejemplo último y el anterior además de crear el _setter_ y llamarlo luego? 💀 Vayan a revisar y vuelvan! Más les vale encuentren la única diferencia! 😆

```dart
```dart
class Distance {
  Distance.kilometers(this.kilometers);
  Distance.miles(double miles) : kilometers = miles * 1.60934;
  double kilometers; // 👁️
  double get miles => kilometers / 1.60934;
  set miles(double miles) => kilometers = miles * 1.60934;
}

void main() {
  final distance1 = Distance.kilometers(100);
  final distance2 = Distance.miles(100);
  print(distance1.kilometers);
  print(distance2.kilometers);
  print(distance1.miles);
  distance1.miles = 50;
  print(distance1.miles);
  print(distance1.kilometers);
}
```

Teníamos a `kilometers` como `final` por lo que no íbamos a poder setear nada en dicha _property_!

Y listo! Ya tenemos nuestra clase bastante completita! ⚡️
