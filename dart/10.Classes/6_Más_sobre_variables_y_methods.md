# Más sobre _variables_ y _methods_

Hasta ahora, cuando queríamos acceder a una variable de una clase, teníamos que hacer una instancia de ella y acceder dentro de dicha instancia de la siguiente manera:

```dart
class Car {
  Car({required this.speed});
  double speed;
}

void main() {
  final myCar = Car(speed: 220);
  print(myCar.speed);
}
```

Pero saben existen otro tipo de variables donde no es necesario instanciar la clase...

## _Static variables_

Son variables que pertenecen a la clase en sí y no a sus instancias. Nosotros solemos utilizarlas para crear valores constantes en un proyecto y así organizarlo. Por ejemplo:

```dart
class AppAssets {
  // * Logos
  static String facebookLogo = 'assets/images/logos/facebook_logo_minimal.svg';
  static String instagramLogo = 'assets/images/logos/instagram_logo_minimal.svg';
  static String linkedinLogo = 'assets/images/logos/linkedin_logo_minimal.svg';
  static String twitterLogo = 'assets/images/logos/twitter_logo_minimal.svg';
  static String monkslabNoBackground =
      'assets/images/logos/monkslab_logo_no_background.png';
}
```

Luego, cuando necesitamos utilizarlos por ejemplo en este caso para insertar un logo en nuestro proyecto, simplemente llamamos a la clase sin instanciarla y a su variable:

```dart
class AppAssets {
  // * Logos
  static String facebookLogo = 'assets/images/logos/facebook_logo_minimal.svg';
  static String instagramLogo = 'assets/images/logos/instagram_logo_minimal.svg';
  static String linkedinLogo = 'assets/images/logos/linkedin_logo_minimal.svg';
  static String twitterLogo = 'assets/images/logos/twitter_logo_minimal.svg';
  static String monkslabNoBackground =
      'assets/images/logos/monkslab_logo_no_background.png';
}

void main() {
  print(AppAssets.facebookLogo);
}
```

En este caso, recordemos que si estamos declarando una variable que no va a cambiar a lo largo de todo el proyecto y es definida en el momento de compilación podríamos declararla como `const` y al mismo tiempo, utilizar el _type inference_ de Dart y sacarle el `String`. En ese caso, estaríamos definiendo una variable global que pertenece a una clase:

```dart
class AppAssets {
  // * Logos
  static const facebookLogo = 'assets/images/logos/facebook_logo_minimal.svg';
  static const instagramLogo = 'assets/images/logos/instagram_logo_minimal.svg';
  static const linkedinLogo = 'assets/images/logos/linkedin_logo_minimal.svg';
  static const twitterLogo = 'assets/images/logos/twitter_logo_minimal.svg';
  static const monkslabNoBackground =
      'assets/images/logos/monkslab_logo_no_background.png';
}

void main() {
  print(AppAssets.facebookLogo);
}
```

## Static methods

Lo mismo podemos hacer con un método! Por ejemplo, podríamos querer uno al que le pasemos el nombre del archivo, y le sume el _path_ 'assets/images/logos' así:

```dart
class AppAssets {
  // * Logos
  static const facebookLogo = 'assets/images/logos/facebook_logo_minimal.svg';
  static const instagramLogo = 'assets/images/logos/instagram_logo_minimal.svg';
  static const linkedinLogo = 'assets/images/logos/linkedin_logo_minimal.svg';
  static const twitterLogo = 'assets/images/logos/twitter_logo_minimal.svg';
  static const monkslabNoBackground =
      'assets/images/logos/monkslab_logo_no_background.png';
  static String addBasePath(String fileName) => 'assets/images/logo/$fileName';
}

void main() {
  print(AppAssets.facebookLogo);
  print(AppAssets.addBasePath('myNewLogo.svg'));
}
```

Finalmente, si tienen un método que no es estático dentro de la clase, puede acceder a sus variables estáticas de forma normal, sin ser necesario utilizar el nombre de la clase:

```dart
class AppAssets {
  // * Logos
  static const facebookLogo = 'assets/images/logos/facebook_logo_minimal.svg';
  static const instagramLogo = 'assets/images/logos/instagram_logo_minimal.svg';
  static const linkedinLogo = 'assets/images/logos/linkedin_logo_minimal.svg';
  static const twitterLogo = 'assets/images/logos/twitter_logo_minimal.svg';
  static const monkslabNoBackground =
      'assets/images/logos/monkslab_logo_no_background.png';
  static String addBasePath(String fileName) => 'assets/images/logo/$fileName';

  void printFabebookWithoutBasePath() => print(facebookLogo.split('/').last);
}

void main() {
  print(AppAssets.facebookLogo);
  print(AppAssets.addBasePath('myNewLogo.svg'));
  final nowWeNeedToInstantiate = AppAssets();
  nowWeNeedToInstantiate.printFabebookWithoutBasePath();
}
```
