# _Type test operators_

Les había dejado una pregunta en el artículo anterior. De qué tipo era la variable `name`:

```dart
void main() {
    final mau = <String,dynamic>{
        'name': 'Mauro',
        'age': 38,
        'height': 1.65,
    };
    final name = mau['name'];
    print(name);
}
```

Una forma de ayudarse a decubrirlo, sería ponerle un punto a la variable y ver qué métodos nos proporciona Dart. 💀 Como imagino habrán podido ver, solamente nos ofrece cuatro métodos y no todos los que esperamos por ser una `String`. Eso es porque definimos el tipo de `value` dentro del `Map` como un `dynamic`. Sin embargo, __podríamos
castear un objeto si sabemos de qué tipo es, utilizando el _cast operator_ `as`.__ Sería que nosotros le confirmamos a Dart que se trata de un tipo `String` en este caso, y él mismo se encarga de cambiar el tipo `dynamic` a uno del tipo `String`:

```dart
void main() {
    final mau = <String,dynamic>{
        'name': 'Mauro',
        'age': 38,
        'height': 1.65,
    };
    final name = mau['name'] as String;
    print(name.toUpperCase());
}
```

Del mismo modo podríamos utilizar el _is_ y el _is!_ y aseverar que se trata o no de un tipo, aunque solamente se los menciono aquí ya que deberíamos entender otros conceptos para ahondar:

```dart
void main() {
    final mau = <String,dynamic>{
        'name': 'Mauro',
        'age': 38,
        'height': 1.65,
    };
    final name = mau['name'] as String;
    assert(name is String, 'The conversion did not worked correctly');
    print(name.toUpperCase());
}
```

En el caso anterior, vemos que funciona perfectamente y nuestro `assert` pasa de largo. Sin embargo, qué pasaría si intentáramos hacer lo mismo con el `age`? 💀

```dart
void main() {
    final mau = <String,dynamic>{
        'name': 'Mauro',
        'age': 38,
        'height': 1.65,
    };
    final name = mau['age'];
    assert(name is String, 'The conversion did not worked correctly');
    print(name.toUpperCase());
}
```

Aquí ahora salta el `assert` ya que `age` es en realidad un `int`. 💀 Y los dejo solitos para que prueben qué pasa si intentan castear a un `String` ese `int`.
