# _Iterating on maps_

Ya vimos en _lists_ y _sets_ que podemos iterar, recorrerlos y utilizar sus valores. Qué pasa si intentamos hacer lo mismo con un `Map`?

```dart
void main() {
    final mau = <String,dynamic>{
        'name': 'Mauro',
        'age': 38,
        'height': 1.65,
    };
    for (var item in mau) {}
}
```

Van a ver que Dart nos tira un error: _'The type `Map<String, dynamic>` used in the `for` loop must implement Iterable'_. Qué significa esto? Qué es un `Iterable`?

__`Iterable` es una colección de items a la que puede accederse de forma secuencial.__ Las listas y los sets, son iterables.

Cómo hacemos para iterar entonces en un `Map`?

## map.keys

Una forma sería acceder a las `keys` de dicho `Map` y allí, obtener cada `key` o aun si queremos, el valor que contiene cada una:

```dart
void main() {
    final mau = <String,dynamic>{
        'name': 'Mauro',
        'age': 38,
        'height': 1.65,
    };
    for (var key in mau.keys) {
        print('key: $key');
        print('value: ${mau[key]}');
    }
}
```

💀 Fíjense qué les dice Dart cuando se paran sobre la palabra `keys` en `mau.keys`! Nos dice que es un `Iterable<String>` o sea un iterable de `String`s y por ello es que podemos recorrerlas.

## map.values

De la misma forma, podemos hacer lo mismo con los valores:

```dart
void main() {
    final mau = <String,dynamic>{
        'name': 'Mauro',
        'age': 38,
        'height': 1.65,
    };
    for (var value in mau.values) {
        print('value: $value}');
    }
}
```

## map.entries

Esta última forma nos permite acceder a uno y el otro:

```dart
void main() {
    final mau = <String,dynamic>{
        'name': 'Mauro',
        'age': 38,
        'height': 1.65,
    };
    for (var entry in mau.entries) {
        print('key: ${entry.key}');
        print('value: ${entry.value}');
    }
}
```

## 💪 Pidiendo pizza

__Requirement__: dado un `Map` con precios de pizzas, escribir un programa que calcule el total de una orden. Si la orden contiene una pizza que no está en el menú, debe imprimir `The ${nombre de pizza} pizza is not in the menu`.

```dart
void main() {
    const pizzaPrices = {
        'margherita': 5.5,
        'pepperoni': 7.5,
        'vegetarian': 6.5,
        'vegan': 6.2,
    };

    // order example:
    const order = ['margherita', 'vegan'];
    // program should print `Total $11.70`
}
```

---

__💀 Solución__:

```dart
void main() {
    const pizzaPrices = {
        'margherita': 5.5,
        'pepperoni': 7.5,
        'vegetarian': 6.5,
        'vegan': 6.2,
    };

    // order example:
    const order = ['margherita', 'vegan'];
    var total = 0.0;

    for(var pizza in order) {
        final price = pizzaPrices[pizza];
        if(price != null) {
            total += pizzaPrices[pizza] as double;
        } else {
            print('The $pizza pizza is not in the menu');
        }
      
    }
    print('Total: $total');
}
```
