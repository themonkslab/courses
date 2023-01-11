# _Getters_ y _Setters_

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

## 💪 Getteando en la cocina

__Requirement__: dada una clase `Recipe`, en la que puedan cambiar su dificultad y puedan agregarle las siguientes funcionalidades:

- Calcular el tiempo total de realización en horas.
- Setear el tiempo total de realización en minutos, desde horas.
- Tener un contructor nombrado para recetas cortas por debajo de los 15 minutos
- Utilizarla creando una receta para hacer Tabuleh en la que su realización lleva 14 minutos, cambiarle le dificultad a muy fácil y calcular cuánto demora realizarla en horas para luego actualizar el tiempo de realización a 0.1 horas y ver cuánto sería eso en minutos.

```dart
enum Difficulty { superEasy, easy, medium, hard }

class Recipe {
  Recipe({
    required this.ingredients,
    required this.minutes,
    required this.difficulty,
    required this.implementation,
  });

  final List<String> ingredients;
  double minutes;
  final Difficulty difficulty;
  final String implementation;
}
```

---

__💀 Solución__:

```dart
enum Difficulty { superEasy, easy, medium, hard }

class Recipe {
  Recipe({
    required this.ingredients,
    required this.minutes,
    required this.difficulty,
    required this.implementation,
  });

  final List<String> ingredients;

  double minutes;
  double get hours => double.parse((minutes / 60).toStringAsFixed(2));
  set hours(double hours) => minutes = hours * 60;

  Difficulty difficulty;
  final String implementation;

  Recipe.short({
    required this.ingredients,
    required this.minutes,
    required this.difficulty,
    required this.implementation,
  }) : assert(
            minutes < 15, 'Total amount of time should not surpass 15 minutes');
}

void main() {
  final tabouliSalad = Recipe.short(
    ingredients: [
      '½ cup fine bulgur wheat',
      '4 firm Roma tomatoes, very finely chopped',
      '1 English cucumber (hothouse cucumber), very finely chopped',
      '2 bunches parsley, part of the stems removed, washed and well-dried, very finely chopped',
      '12-15 fresh mint leaves, stems removed, washed, well-dried, very finely chopped',
      '4 green onions, white and green parts, very finely chopped',
      'Salt',
      '3-4 tablespoon lime juice (lemon juice, if you prefer)',
      '3-4 tablespoon Early Harvest extra virgin olive oil',
      'Romaine lettuce leaves to serve, optional',
    ],
    minutes: 14,
    difficulty: Difficulty.easy,
    implementation: '...',
  );

  tabouliSalad.difficulty = Difficulty.superEasy;
  print(tabouliSalad.hours);
  tabouliSalad.hours = 0.1;
  print(tabouliSalad.minutes);
}
```
