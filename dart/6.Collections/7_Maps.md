# _Maps_

Los mapas o también llamados _dictionaries_ (diccionarios), son __colecciones de pares de claves y valores, _key:value pairs_.__

Supongamos que tenemos las siguientes _keys_ con sus respectivos _values_ que describen a una persona.

```dart
// name: Mau
// age: 38
// height: 1.65
```

Podemos crear un mapa que lo represente, abriendo `{}`,estableciendo las claves y los valores, que dependerán del _type_ que necesitemos para representar cada caso:

```dart
// name: Mauro
// age: 38
// height: 1.65
void main() {
    var mau = {
        'name': 'Mauro',
        'age': 38,
        'height': 1.65,
    }
}

```

💀 Fíjense qué pasa si introducen una clave dos veces! Si bien no es un error, Dart nos avisa que __no tiene sentido tener la misma clave dos veces__.

Cuando declaramos un `Map` utilizando `var`, `final` y `const`, _keys_ y _values_ pueden tener el tipo que nosotros queramos; alternativamente podemos explicitar los _types_ que deseemos. Tengan en cuenta que el tipo `dynamic` nos permite poner cualquier tipo de valor. 💀 Prueben que sucede si definen el mapa como <String, String>:

```dart
void main() {
    Map<String,dynamic> mau = {
        'name': 'Mauro',
        'age': 38,
        'height': 1.65,
    }
}

```

También pueden añadir las anotaciones de tipo a los `Map` literal como ya lo hicieron con `Set`s y `List`s que si bien no es estrictamente requerido, es una buena idea para mantener el código seguro:

```dart
final mau = <String,dynamic>{
    'name': 'Mauro',
    'age': 38,
    'height': 1.65,
}
```

Como en las listas, podemos __acceder a sus valores__ __utilizando el _subscript operator_ u operador de subíndice__ y llamando al valor no ya por índice sino __por su _key_ entre comillas__:

```dart
void main() {
    final mau = <String,dynamic>{
        'name': 'Mauro',
        'age': 38,
        'height': 1.65,

        final name = mau['name'];
        print(name);
    }
}
```

También podemos __cambiar sus valores__ accediendo a ellos de la misma manera:

```dart
void main() {
    final mau = <String,dynamic>{
        'name': 'Mauro',
        'age': 38,
        'height': 1.65,
    };
    final name = mau['name'];
    print(name);
    mau['age'] = 39;
    print(mau);
}
```

Y finalmente, podemos agregar nuevos valores también con el _subscript operator_:

```dart
void main() {
    final mau = <String,dynamic>{
        'name': 'Mauro',
        'age': 38,
        'height': 1.65,
    };
    final name = mau['name'];
    print(name);
    mau['age'] = 39;
    print(mau);
    mau['likesMusic'] = true;
    print(mau);
}
```

Ah! Les quería dejar una pregunta: de qué tipo creen que es la variable `name` a la que le asignamos `mau['name']`? Se los respondo en el artículo siguiente! 😄
