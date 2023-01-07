# _New methods part two_

Ya que conocemos sobre funciones anónimas, podemos conocer otros métodos útiles para seguir agregando a nuestra lista.

## _Where_

El método _where_ o 'donde', __nos permite analizar una _collection_ valor por valor mediante una función anónima que le pasemos. Va a retornar un `Iterable` con todos aquellos valores que han retornado `true` según la función anónima que le hayamos pasado.__

Supongamos que tenemos una lista de números y queremos retornar solo los números pares. Sabemos que los pares son aquellos que divididos por dos, tienen un resto de 0. Entonces, podemos pasarle al `where` una función que utilice el `%` para dividir por `2` y si su resultado es `0`, habrá dado `true` por lo que significa que se trata de un número par:

```dart
void main() {
  const list = [1, 2, 3, 4, 5, 6];
  final even = list.where((value) => value % 2 == 0);
  print(even);
}
```

## _First where_

Este método __también recibe una función anónima como primer parámetro solo que retorna el primer valor que habiendo sido analizado por la función que le pasemos, retorne `true`__. Veamos un ejemplo en donde el número `2` se repite varias veces:

```dart
void main() {
  const list = [1, 2, 3, 2, 4, 2, 5, 2, 6];
  final even = list.where((value) => value % 2 == 0);
  print(even);
  final firstTwoElement = list.firstWhere((value) => value % 2 == 0);
  print(firstTwoElement);
}
```

Este método a su vez, __nos permite en su segundo parámetro nombrado (`orElse`), recibir otra función anónima que se ejecutará solo si en ninguna de las iteraciones o vueltas, la función que le hayamos pasado retorna `true`.__

Por ejemplo, queremos retornar el valor que multiplicado por `10` sea igual a 100. Como ningún número de la lista nos dará dicho resultado, vamos a retornar un `-1`:

```dart
void main() {
  const list = [1, 2, 3, 2, 4, 2, 5, 2, 6];
  final even = list.where((value) => value % 2 == 0);
  print(even);
  final firstTwoElement = list.firstWhere((value) => value % 2 == 0);
  print(firstTwoElement);
  final multipliedBy10is100 =
      list.firstWhere((value) => value * 10 == 100, orElse: () => -1);
  print(multipliedBy10is100);
}
```

## 💪 Encontrando el precio

__Requirement__: dado el siguiente texto, creen una función que reciba dicho texto, lo separe en oraciones a través de sus puntos y retornen un listado de todas las oraciones que contienen la palabra _price_. Imprímanlo para corroborarlo.

```dart
  const airpodsArticle = '''
Apple's AirPods lineup has grown more complex over the years, and rumors pointed to a middle-tier earbud that would take on characteristics of the AirPods Pro at a much lower price. Rumors about the supposed "AirPods Pro Lite" have stopped, and Apple released the third-generation AirPods at \$179 in late 2021, which may be the rumored earbuds.
Rumors suggested that Apple was prepared to release a new set of AirPods in the middle of the lineup. While it wasn't a final product name, these rumored earbuds were referred to as the 
AirPods, AirPods with wireless charging case, and AirPods Pro already offer a clear upgrade path
The third-generation AirPods appear to be the rumored "AirPods Pro Lite," but the rumor mill hasn't directly acknowledged this possibility as of yet. The new AirPods are improved second-generation AirPods with a design similar to AirPods Pro but don't have ANC features or changeable ear tips.
It is possible that another set of earbuds are in development that feature the below rumors, however, it is more likely that they do not exist given the third-generation AirPods' existence. Apple tends to develop multiple versions of a product and only one makes it out, so while this rumored product may have existed at some point, it seems the third-generation AirPods won out.
Rumors about "AirPods Pro Lite"
As with all unreleased Apple products, it is likely this product falls into one of three camps: it doesn't exist, it exists and is never announced, or it exists and is imminent. Very little concrete information is available, and all that is known is a rumored name leaked from the supply chain.
A rumor from avid leaker Jon Prosser in April 2020 placed a release of new AirPods products sometime in October, though that didn't come to pass. Apple released the over-the-ear AirPods Max in December with no indication of other AirPods refreshes coming.
Reports from The Elec, a South Korean material supplier with a weak rumor history, suggest that the new earbuds would start shipping in early 2021 and fall into the \$199 price point. They were apparently ready at the end of 2019, but the popularity of the more expensive AirPods Pro pushed the release back.
As we got further into 2021 it was apparent they either never existed or got scrapped last second in favor of other products. Again, there is always the possibility the "AirPods Pro Lite" is a different product that has already been released, like the third-generation AirPods.
Potential Lineup Changes
If these are an AirPods product, then a change in the lineup for a more obvious upgrade path would be in order. Right now, wireless charging is a premium in the line, and as Apple has continued production of the wireless charging case, it may have cheapened the cost of including the more versatile case.

There is not much room in the AirPods lineup for the “AirPods Pro Lite.”
With the entry of third-generation AirPods, adding yet another product between AirPods Pro and third-generation AirPods is unlikely. The \$179 price point fits as a perfect price point between the now discounted \$129 AirPods and \$249 AirPods Pro.
Possible Beats Product
Another possibility is the term is likely a placeholder, and may not even be AirPods at all. The rumored cheaper AirPods Pro could be a Beats by Dre product as well, and it's also possible the rumors were referring to Beats Fit Pro or other earbuds in the lineup.

Beats Solo Pro was the first to receive Apple’s new H1 chip, and more will follow.
Supply chain observers never get the full picture when looking at a specific part or company, so Apple could easily be developing new Beats products that are similar to AirPods and use a codename to reflect that.
"AirPods Pro Lite" Pricing
A new earbud falling between the one-size-fits-all AirPods and the premium AirPods Pro seems unlikely, as the two device sets are already very close in price and have an obvious upgrade path. If you are in the market for totally wireless earbuds, it likely won't benefit you to wait for the unannounced "AirPods Pro Lite." Check out AppleInsider's Price Guide for deals on AirPods.
''';
```

---

__💀 Solución__:

```dart
void main() {
  const airpodsArticle = '''
Apple's AirPods lineup has grown more complex over the years, and rumors pointed to a middle-tier earbud that would take on characteristics of the AirPods Pro at a much lower price. Rumors about the supposed "AirPods Pro Lite" have stopped, and Apple released the third-generation AirPods at \$179 in late 2021, which may be the rumored earbuds.
Rumors suggested that Apple was prepared to release a new set of AirPods in the middle of the lineup. While it wasn't a final product name, these rumored earbuds were referred to as the 
AirPods, AirPods with wireless charging case, and AirPods Pro already offer a clear upgrade path
The third-generation AirPods appear to be the rumored "AirPods Pro Lite," but the rumor mill hasn't directly acknowledged this possibility as of yet. The new AirPods are improved second-generation AirPods with a design similar to AirPods Pro but don't have ANC features or changeable ear tips.
It is possible that another set of earbuds are in development that feature the below rumors, however, it is more likely that they do not exist given the third-generation AirPods' existence. Apple tends to develop multiple versions of a product and only one makes it out, so while this rumored product may have existed at some point, it seems the third-generation AirPods won out.
Rumors about "AirPods Pro Lite"
As with all unreleased Apple products, it is likely this product falls into one of three camps: it doesn't exist, it exists and is never announced, or it exists and is imminent. Very little concrete information is available, and all that is known is a rumored name leaked from the supply chain.
A rumor from avid leaker Jon Prosser in April 2020 placed a release of new AirPods products sometime in October, though that didn't come to pass. Apple released the over-the-ear AirPods Max in December with no indication of other AirPods refreshes coming.
Reports from The Elec, a South Korean material supplier with a weak rumor history, suggest that the new earbuds would start shipping in early 2021 and fall into the \$199 price point. They were apparently ready at the end of 2019, but the popularity of the more expensive AirPods Pro pushed the release back.
As we got further into 2021 it was apparent they either never existed or got scrapped last second in favor of other products. Again, there is always the possibility the "AirPods Pro Lite" is a different product that has already been released, like the third-generation AirPods.
Potential Lineup Changes
If these are an AirPods product, then a change in the lineup for a more obvious upgrade path would be in order. Right now, wireless charging is a premium in the line, and as Apple has continued production of the wireless charging case, it may have cheapened the cost of including the more versatile case.

There is not much room in the AirPods lineup for the “AirPods Pro Lite.”
With the entry of third-generation AirPods, adding yet another product between AirPods Pro and third-generation AirPods is unlikely. The \$179 price point fits as a perfect price point between the now discounted \$129 AirPods and \$249 AirPods Pro.
Possible Beats Product
Another possibility is the term is likely a placeholder, and may not even be AirPods at all. The rumored cheaper AirPods Pro could be a Beats by Dre product as well, and it's also possible the rumors were referring to Beats Fit Pro or other earbuds in the lineup.

Beats Solo Pro was the first to receive Apple’s new H1 chip, and more will follow.
Supply chain observers never get the full picture when looking at a specific part or company, so Apple could easily be developing new Beats products that are similar to AirPods and use a codename to reflect that.
"AirPods Pro Lite" Pricing
A new earbud falling between the one-size-fits-all AirPods and the premium AirPods Pro seems unlikely, as the two device sets are already very close in price and have an obvious upgrade path. If you are in the market for totally wireless earbuds, it likely won't benefit you to wait for the unannounced "AirPods Pro Lite." Check out AppleInsider's Price Guide for deals on AirPods.
''';

  print(findPrice(airpodsArticle));
}

List<String> findPrice(String rawDocument) {
  final parsedList = rawDocument.split('.');
  final sentencesWithPrice = parsedList.where(
      (sentence) => sentence.contains('price') || sentence.contains('Price'));
  return sentencesWithPrice.toList();
}

```

## 💪 Implementando nosotros mismos el _where_

__Requirement__: implementar la función `where` como si no estuviera escrita. Es un método que tiene que recibir una lista de items y una función que evalúe cada item de dicha lista para luego retornar todos aquellos valores que hayan cumplido con la condición pedida en la función. Utilizar genéricos para que sirva con listas de cualquier tipo y demostrar su funcionamiento pasándole a su nueva función `where` la lista `[1,2,3,4,5,6]` y una función como parámetro que devuelva los números impares. El resultado debiera ser `[1, 3, 5]`.

---

__💀 Solución__:

```dart
void main() {
  const list = [1, 2, 3, 4, 5, 6];
  final newList = where(list, (value) => value % 2 != 0);
  print(newList);
}

List<T> where<T>(List<T> items, bool Function(T value) check) {
  final filteredItems = <T>[];
  for (var item in items) {
    final shouldBeAdded = check(item);
    if (shouldBeAdded) {
      filteredItems.add(item);
    }
  }
  return filteredItems;
}
```

## _Reduce_

Este método nos permite combinar todos los elementos en una lista y producir un resultado único. El ejemplo más común es sumar todos los elementos de una lista y evitar tener que usar un _for-in_. Veámoslo con un ejemplo.

Supongamos que tenemos una lista de `int` y queremos sumar todos sus items. Vamos a llamar al método `reduce` en dicha lista y éste va a recibir una función que va a retornar un `int` y va a tomar dos valores como argumentos, ambos `int` y va a ejecutar dicha función de forma iterativa, como les muestro en los comentarios:

```dart
void main() {
  const list = [1, 2, 3, 4];
  final sum = list.reduce((value, element) => value + element);
  print(sum); // 10
  // value:   1 => 3 => 6
  // element: 2 => 3 => 4
}
```

En la primera iteración, el `value` es nuestro primer item en la lista, y nuestro segundo item, el `element`. Efectúa la operación y se mueve a la siguiente iteración. El `value` ahora habrá sido actualizado con el resultado de la primer suma, de la iteración previa y el `element` ahora será el tercer item. Finalmente en la última iteración, el `value` es el resultado de la suma de la iteración anterior y el `element` nuestro último item de la lista. Lo que retorna al final es el último valor alcanzado por el `value`.
