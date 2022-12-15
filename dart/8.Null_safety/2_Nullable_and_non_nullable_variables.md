# _Nullable and non nullable variables_

Recuerdan en la introducción de esta sección que todos los valores por defecto no pueden ser nulos y les daba el siguiente ejemplo:

```dart
void main() {
    int x = null;
}
```

Ahora... cómo podemos volver a ese valor _nulleable_ o lo que es lo mismo que decir, que puede recibir _null_ como valor? Muy simple: agregando un signo de preguntas luego del tipo en el momento de declararla. Con ello, ya podemos asignarle _null_ a nuestra variable `x`.

```dart
void main() {
    int? x = null;
}
```

Supongamos que ahora agregamos otra variable y queremos sumar ambas. 💀 Qué sucedería y por qué?

```dart
void main() {
    int? x = null;
    int y = 5;
    print(x + y);
}
```

_The operator '+' can't be unconditionally invoked because the receiver can be 'null'._ Nos dice que el operador no puede ser invocado porque quien lo recibe puede ser nulo!
