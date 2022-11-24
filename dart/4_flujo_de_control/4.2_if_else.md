# _if/else statements_

Supongamos que estamos en la entrada de un museo y queremos escribir un programa que haga lo siguiente:

_Pseudo code_:

```dart
//  Si la persona es menor de 16
//      Emito un ticket de menor
//      Le cobro $100
//  Si la persona es mayor o igual a 60
//      Emito un ticket de mayor
//      Le cobro $50
//  Si no
//      Emito un ticket regular
//      Le cobro $200
//  A todos voy a decirles: 'Disfruten su visita'
```

Veamos cómo podemos traducir esto en código.

Empezaremos en primer lugar con lo que necesitamos y siempre sucederá sin importar el caso:

1. Necesitamos la edad del visitante.
2. Necesitamos un chequeo de que hayamos introducido bien la edad.
3. Siempre saludaremos a todos, sin importar su edad.

```dart
void main() {
    const visitorsAge = 10;
    assert(visitorsAge > 0, 'Age should be at least 1');
    print('Enjoy your visit!');
}
```

💀 Aquí, qué imaginan que sucede si ingresan un 0 o número negativo en `visitorsAge`? Prueben!

Luego simplemente podemos ir traduciendo el primer 'si' (_if_):

```dart
void main() {
    const visitorsAge = 10;
    assert(visitorsAge > 0, 'Age should be at least 1');
    // Si la persona es menor de 16
    if(visitorsAge < 16) {
        // Emito un ticket de menor
        print('Junior ticket');
        // Le cobro $100
        print('Price is \$100');
    }
    // Siempre los saludaré! 😄
    print('Enjoy your visit!');
}
```

💀 Qué sucede si ingresan un número que es menor de 16? Y si ingresan uno mayor?

Lo primero que sucede es una evaluación dentro de `(...)` y si resulta en `true` (si la condición se cumple), ingresa dentro de los `{...}` y ejecuta lo que se encuentra allí, sino salta el bloque _block_ de código y ejecuta lo que sigue.

En el caso de introducir una edad menor a 16, ingresa, ejecuta el código y luego va al final que no tiene una condición, esto es ejecuta el último `print('Enjoy your visit!`); si la edad que introducimos es mayor, omite ese bloque y salta al final.

Vamos a terminarlo!

```dart
void main() {
    const visitorsAge = 10;
    assert(visitorsAge > 0, 'Age should be at least 1');
    // Si la persona es menor de 16
    if(visitorsAge < 16) {
        // Emito un ticket de menor
        print('Junior ticket');
        // Le cobro $100
        print('Price is \$100');
    // Si la persona es mayor o igual a 60
    } else if (visitorsAge >= 60) {
        // Emito un ticket de mayor
        print('Senior ticket');
        // Le cobro $50
        print('Price is \$50');        
    // Si no
    } else {
        // Emito un ticket regular
        print('Regular ticket');
        // Le cobro $200
        print('Price is \$200');         
    }
    // Siempre los saludaré! 😄
    print('Enjoy your visit!');
}
```

Podríamos escribir el mismo código si los `else-if` o el `else` pero lo anterior lo vuelve más claro! 💀 Cómo sería hecho solo con `if`?

```dart
void main() {
    const visitorsAge = 10;
    assert(visitorsAge > 0, 'Age should be at least 1');
    // Si la persona es menor de 16
    if(visitorsAge < 16) {
        // Emito un ticket de menor
        print('Junior ticket');
        // Le cobro $100
        print('Price is \$100');
    // Si la persona es mayor o igual a 60
    }
    if (visitorsAge >= 60) {
        // Emito un ticket de mayor
        print('Senior ticket');
        // Le cobro $50
        print('Price is \$50');        
    // Si no
    }
    if (visitorsAge > 15 && visitorsAge < 60){
        // Emito un ticket regular
        print('Regular ticket');
        // Le cobro $200
        print('Price is \$200');         
    }
    // Siempre los saludaré! 😄
    print('Enjoy your visit!');
}
```

Vayan a estirar un poco esas piernas, refrescar la cabeza y vuelvan para un ejercicio!

## 💪 Situación financiera

__Requirement__: Escribir un código que tome en cuenta dos variables: cuánto dinero ganaron en el mes y cuántos gastos tienen, para luego imprimir si pueden ahorrar algo, si deben algo o si no cambió su balance mensual.

---

__💀 Solución__:

_Pseudo code_, modo inverso:

- Imprimir según balance final:
    1. Si puedo ahorrar
    2. Si debo dinero
    3. Si estoy igual al mes anterior
- Calcular balance final.
- Almacenar lo que gané y lo que gasté, asegurándome de que haya introducido bien los números.

_Código_:

```dart
void main() {
    double netSalary = 600;
    assert(netSalary > 0, 'The amount should be greater than 0');
    double expenses = 430;
    assert(expenses > 0, 'The amount should be greater than 0');

    double finalBalance = netSalary - expenses;

    if(finalBalance > 0) {
        print('😃 I can save money!');
    } else if(finalBalance < 0) {
        print('😅 I am in debt!');
    } else {
        print('🤨 I have to earn more!');
    }
}
```
