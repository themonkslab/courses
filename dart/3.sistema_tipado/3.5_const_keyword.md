# _Const keyword_

Ya vimos que `var` nos permite cambiar el contenido de una variable e inferir automáticamente su tipo; `final` nos permite setear una variable también infiriendo su tipo pero que sería de solo lectura y calculada mientras ejecutamos un programa. Para qué queremos una palabra clave más?

Continuemos con el ejemplo de los días y el entrenamiento. Supongamos que hay días que serán feriados y no vamos a entrenar dichos días. Sería una __información que tendríamos antes de empezar__ a entrenar, de hecho la tendríamos aun antes __de hacer nuestro programa y además, no cambiaría__: en Argentina desde que es Argentina, todos los años el 9 de Julio es el día de la independencia. Cómo haríamos esto? Muy simple:

```dart
void main() {
    const independenceDay = '9 de Julio';
}
```

Podemos declarar esa variable como `const` porque la inicializamos con un `String` literal que en sí, es también `const`. Sin embargo, 💀 fíjense qué sucede si intentamos hacer algo así:

```dart
void main() {
    const independenceDay = '9 de Julio';
    final independenceDayUpperCase = independenceDay.toUpperCase();
}
```

Nos dice que una variable constante debe ser inicializada con un valor constante y eso es porque Dart puede evaluar esa expresión en tiempo de ejecución y no antes.

No obstante, hay cosas que Dart sí puede calcular de antemano:

```dart
void main() {
    const x = 1;
    const y = 6;
    const result = x + y;
}
```

Y para cerrar, como son variables constantes, solamente pueden ser fijadas una vez; no podremos asignarle otro valor en el futuro.

Por esta razón, es que __Dart prefiere este tipo de variables__ ya que le permite optimizar enormemente el programa. Por lo que siempre __prefieran este orden__, cuando la situación lo permita: __`const` sobre `final` y luego `final` sobre `var`.__

Ah! Antes me gustaría mostrarles que esto es correcto solo que no es necesario ya que Dart infiere el tipo sin nosotros tener que decirle: `const String myName = 'Mauro';`.

## 💪 _final_, _const_ o _var_?

__Requirement__: Analicen el siguiente código y determinen cuál variable puede ser declaradas con `const`, `final` o `var` y que siga resultando en un programa válido.

```dart
void main() {
    String text = 'I like pizza';
    String topping = 'with tomatoes';
    String favourite = '$text $topping';
    String newText = favourite.replaceAll('pizza', 'pasta');
    favourite = 'Now I like curry';
    print(newText);
}
```

---

__💀 Solución__:

```dart
void main() {
    const text = 'I like pizza';
    const topping = 'with tomatoes';
    var favourite = '$text $topping';
    final newText = favourite.replaceAll('pizza', 'pasta');
    favourite = 'Now I like curry';
    print(newText);
}
```

Pero existe una mejor solución... cuál sería?

__💀 Mejor solución__:

```dart
void main() {
    const text = 'I like pizza';
    const topping = 'with tomatoes';
    const favourite = '$text $topping';
    final newText = favourite.replaceAll('pizza', 'pasta');
    const newFavourite = 'Now I like curry'; // como esta variable no se utiliza 
    // bien podríamos crear una nueva.
    // Además Dart nos avisa que no se utiliza!
    print(newText);
}
```
