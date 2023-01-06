# Introducción a _Classes_

En Dart, las _Classes_ son formas de crear tipos o _types_ nuevos. Hasta ahora estuvimos manejándonos con los _built-in types_, que son los propios del lenguaje: `String`, `int`, `double`, etc. No obstante dijimos que __en el paradigma de _OOP_ buscamos representar el mundo y sus problemas a través de objetos y para ello, los tipos básicos del lenguaje, no nos van a servir.__

Para representar por ejemplo, a una persona, una cuenta de banco o un juego específico dentro de una aplicación de apuestas, __necesitamos crear un tipo nuevo y para ello, utilizamos las _Classes_.__

Imaginemos que vamos a hacer una aplicación para una verdulería de nuestro barrio. Cada uno tendría allí, una cuenta y lo más básico que debería tener, sería un balance. Vamos a crear la clase que va a representar dicha cuenta primero, __utilizando ahora mayúscula para la primer letra de la clase__ y luego, una variable dentro para representar el balance. __Las variables que representan características de nuestra clase, se llaman _member variables_ (variables del miembro) o bien _properties_ (propiedades).__

```dart
class GreensAccount {
  double balance = 0;
}

void main(){}
```

Ya tenemos nuestra clase creada. Cómo la utilizamos? Debemos instanciarla o crear una instancia (_instance_) de esa clase y lo hacemos albergándola en una variable e inicializándola con el nombre de la clase y unos `()`. Una vez con dicha instancia, podemos por ejemplo, acceder a sus propiedades mediante el _dot operator_ y hacer lo que queramos con ella, como imprimirla:

```dart
class GreensAccount {
  double balance = 0;
}

void main() {
  final mauGreensAccount = GreensAccount();
  print(mauGreensAccount.balance); // 0
}
```

En este caso leímos la propiedad `balance` de nuestra instancia de la clase `mauGreensAccount` pero también podríamos setearla:

```dart
class GreensAccount {
  double balance = 0;
}

void main() {
  final mauGreensAccount = GreensAccount();
  print(mauGreensAccount.balance); // 0
  mauGreensAccount.balance = 100;
  print(mauGreensAccount.balance); // 100
}
```

Y fíjense que siempre estamos hablando de una instancia particular de nuestra clase llamada `mauGreensAccount` pero podríamos instanciar nuestra clase cuantas veces querramos, por ejemplo con otra llamada `martinGreensAccount` y así llevar la cuenta de otro cliente de nuestra verdulería:

```dart
class GreensAccount {
  double balance = 0;
}

void main() {
  final mauGreensAccount = GreensAccount();
  final martinGreensAccount = GreensAccount();

  print(mauGreensAccount.balance); // 0
  print(martinGreensAccount.balance); // 0
  mauGreensAccount.balance = 100;
  martinGreensAccount.balance = 450;
  print(mauGreensAccount.balance); // 100
  print(martinGreensAccount.balance); // 450
}
```

Ya van imaginándose el poder que tiene esto? 😃
