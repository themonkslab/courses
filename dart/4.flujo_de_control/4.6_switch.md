# _Switch statement_

Supongamos creamos una carrera y queremos otorgar premios según la posición en la que cada competidor llegue. Podríamos hacer algo así:

```dart
void main() {
    const pos = 1;
    if (pos == 1) {
        print('Gold! 🤩');
    } else if (pos == 2) {
        print('Silver! 😁');       
    } else if (pos == 3) {
        print('Bronze! 😊');
    } else {
        print('No medal! Try again! 💪');
    }
}
```

Esto funciona perfectamente pero podríamos tener una manera más clara para escribirlo: _switch statements_.

Consiste en __definir una variable__ que vamos a observar y __plantear escenarios o casos según el valor__ de dicha variable. __Al final de cada caso__ debemos __incluir una forma de terminar con el _loop_.__ La más común es hacerlo con un _break_ (pero existen otras! 😉). Y __finalmente__, el último de los casos __(_default_)__ es un _fallback_ o solución alternativa por si ninguna de las condiciones anteriores se cumple.

```dart
void main() {
    const pos = 1;
    switch (pos) {
        case 1:
            print('Gold! 🤩');
            break;
        case 2:
            print('Silver! 😁');       
            break;
        case 3:
            print('Bronze! 😊');
            break;
        default:
            print('No medal! Try again! 💪');
            break;
    }
}
```

Si bien logramos lo mismo que con los `if`, es más claro de leer cuando se acostumbran pero sobre todo, __les hará mucho sentido cuando utilicen _enumerations_!__
