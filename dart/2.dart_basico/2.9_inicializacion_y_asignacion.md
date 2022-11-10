# _Initialization and Assignment_ Inicialización y asignación

Ya vimos que una variable para poder guardar un valor, debe ser declarada definiendo su tipo y un nombre que represente su contenido: `String myFirstName;`. En este caso la estamos declarando.

Allí solamente hicimos la declaración de variable pero no contiene nada adentro. Lo que aprendimos a hacer es, al mismo momento que la declaramos, inicializamos: `String myFirstName = 'Mauro';`.

Sin embargo, podríamos hacerlo en dos líneas distintas, teniendo cuidado de utilizarla luego de haber sido asignada.

```dart
void main() {
    String myFirstName;
    myFirstName = 'Mauro';
    print(myFirstName);
}
```

💀 Quiero que me digan, qué se imaginan que sucedería si la _function_ `print`, se utilizara antes de haberle asignado un valor a la _variable_ `myFirstName`.

1. Me señalaría con un señalado azul que puede mejorarse el código.
2. Me señalaría un error con rojo diciendo que la variable tiene que _asignarse_ antes de ser utilizada.
3. No me señalaría nada.

La respuesta correcta es la número dos! Y otro error sucedería, uno de referencia ahora, si intentan una asignación o llamado, antes de ser declarada:

```dart
void main() {
    myFirstName = 'Mauro';
    String myFirstName;
    print(myFirstName);
}
```

## Valores cambiantes

Supongamos que a medida que vamos utilizando el programa, en algún punto, necesito que la misma variable ahora contenga todos los caracteres en mayúsculas. Qué haríamos? Podríamos mediante la asignación, darle a esa variable, otro valor o contenido (por suerte se llama _variable_ 😂):

```dart
void main() {
    String myFirstName;
    myFirstName = 'Mauro';
    print(myFirstName); // Mauro
    // pasa un tiempo
    // y otro
    // y ahora necesitamos esté en mayúsculas
    myFirstName = 'Mauro'.toUpperCase();
    print(myFirstName); // MAURO
}
```

💀 Existe otra manera de lograr esa asignación en mayúsculas. Les doy una pista y vayan a probar: en este caso utilicé un _method_ sobre un _`String` literal_, o una cadena de texto literal. Podrían llamar ese método sobre algo más?

```dart
void main() {
    String myFirstName;
    myFirstName = 'Mauro';
    print(myFirstName); // Mauro
    // pasa un tiempo
    // y otro
    // y ahora necesitamos esté en mayúsculas
    myFirstName = myFirstName.toUpperCase();
    print(myFirstName); // MAURO
}
```

Esta última versión sería aun más segura porque nos cercioramos de que utilizamos exactamente el mismo valor anterior; podríamos cometer un error al tipearlo nuevamente como `String`.

💀 Y para cerrar, quiero que hagan un ejemplo pero no reasignando un valor a la variable. Supongamos que solamente necesitamos imprimir ese valor, en ese momento en mayúsculas y luego seguir utilizándolo en su versión original. Cómo harían?

```dart
void main() {
    String myFirstName;
    myFirstName = 'Mauro';
    print(myFirstName); // Mauro
    // pasa un tiempo
    // y otro
    // y ahora necesitamos esté en mayúsculas
    // solo al momento de la impresión!
    print(myFirstName.toUpperCase()); // MAURO
}
```
