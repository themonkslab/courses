# Introducción

Para poder explicarles qué es _Null safety_, tenemos que ver más en detalle algo que vimos un poco por arriba: valores nulos.

## _Null value_

Supongamos que creamos una aplicación para un restaurante. Dicha app guarda datos de todos los usuarios que suelen comprar en dicho restaurante. Cada vez que hacen un pedido, la persona encargada de tomarlo pregunta si tienen alguna comida favorita para tener en cuenta en nuevas preparaciones de la carta. Y finalmente, supongan que escribimos una funcionalidad de dicho programa que crea una carta en función de las comidas favoritas de todos los usuarios. __Cada usuario tendrá una comida favorita? Si no la tiene, qué lo representa? Exacto: un valor nulo o _null value_.__

Bien! Ahora sigamos suponiendo que empezamos a crear la funcionalidad y __no tenemos en cuenta de que no todos los usuarios tienen una comida favorita__. Qué sucede? Nuestra app explota y se cae a pedazos! 🤣

Recuerdan que hablamos de dos estadíos de una app o etapas? __Si nuestro error fuera detectado en__ la primera de ellas, __la etapa de desarrollo__, __solo nos tocaría tratar de seguir el error hasta encontrarlo, repararlo y listo__; __si en cambio nos toca en__ la segunda, __la etapa de producción__, sería muy mal visto por el usuario que en muchas oportunidades llegaría a dejar nuestra aplicación para nunca volver. Además encontrar allí el error se vuelve mucho más difícil, tomando aun más tiempo el arreglarlo, generar una nueva app con el problema resuelto, que lo aprueben las tiendas, etc. __Sería un enorme problema que empeoraría cuanto más radical sea la funcionalidad que se rompe.__

No sería mucho mejor poder descubrir estos errores cuando estamos escribiendo el código? Sí! Y para ello se creó _Sound null safety_ en Dart! 😍

## _Sound null safety_

Es una _feature_ de Dart que dice que todo valor no podrá ser nulo a no ser que explicitemos lo contrario. Cómo se vería esto? 💀 Simplemente prueben escribir el siguiente código en Dartpad y traten de entender el error:

```dart
void main() {
    int x = null;
}
```

_A value of type 'Null' can't be assigned to a variable of type 'int'_, que significa que un valor del tipo nulo no puede ser asignado a uno de tipo entero. Esto es porque como dijimos, por defecto, cada tipo en Dart no puede ser nulo.

Así, __nos aseguramos de no tener valores nulos donde no los esperamos__ y nos tirará _no null reference errors_ o errores relativos a la nulidad de ciertos valores. __Así, los errores que sucederían en tiempo real, ahora suceden en tiempo de análisis y escritura de código,__ lo cual lo vuelve muchísimo más fácil de corregir.

Es importante entender que __el objetivo de _null safety_ no es eliminar estos valores ya que son los únicos que nos permiten representar el vacío en un valor__. El problema no es este tipo de valor en sí sino que tengamos estos valores donde no los esperamos.
