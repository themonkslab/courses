# _Dynamic keyword_

Es una palabra clave que __nos permite salirnos del _type safety_ (seguridad de tipo) que nos propone Dart; nos permite declarar una variable que puede ser de cualquier tipo en cualquier momento__. Veamos primero cómo se utiliza y luego entendamos el por qué en casos muy específicos, puede sernos de utilidad:

```dart
void main() {
    int x = 1;
    x = true; // error
    dynamic y = 6;
    y = false; // no hay error! 😵‍💫
}
```

Ya vimos todas las ventajas que nos trae el tipado de Dart, __porqué habríamos de abandonarlo?__

En casos muy específicos como cuando trabajemos con archivos del tipo _json_ y no sepamos qué contenido va a tener cada variable, se nos hará muy útil utilizar _keyword_:

```dart
{
    "employee": {
        "name": "Mau Di Bert",
        "age": 38,
        "height": 1.65 
    }
}
```

Si bien aun nos falta información para entenderlo completamente, podemos observar que los __valores__ de la derecha __van cambiando__ y por ello, __necesitamos el tipo dinámico__ para crear las variables que alojen este tipo de datos.
