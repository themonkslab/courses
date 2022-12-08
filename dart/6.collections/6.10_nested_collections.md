# _Nested collections_

Ahora que entendemos sobre colecciones, podemos conocer organizaciones más complejas de ellas. _Nested_ significa __anidadas__ y refiere a __colecciones que se encuentran dentro de otras colecciones__.

Supongamos que queremos representar un listado de listOfRestaurant con la siguiente información:

```dart
void main() {
  // name: 'Loving Hut'
  // cuisine: 'Vegan Fast Food'
  // rating: [4.7, 4.4, 4.3]

  // name: 'Los Sabios'
  // cuisine: 'Vegan & Vegetarian'
  // rating: [4.9, 4.2, 3.9]
  
  // name: 'Nona Fortuna'
  // cuisine: 'Italian, Vegan, Vegetarian'
  // rating: [4.9, 4.5, 4.7]
}
```

Cómo representamos estos datos? Lo vamos a hacer con mapas de la siguiente manera:

```dart
void main() {
  // name: 'Loving Hut'
  // cuisine: 'Vegan Fast Food'
  // rating: [4.7, 4.4, 4.3]
  
  // name: 'Los Sabios'
  // cuisine: 'Vegan & Vegetarian'
  // rating: [4.9, 4.2, 3.9]
  
  // name: 'Nona Fortuna'
  // cuisine: 'Italian, Vegan, Vegetarian'
  // rating: [4.9, 4.5, 4.7]
  var listOfRestaurants = [
    {
      'name': 'Loving Hut',
      'cuisine': 'Vegan Fast Food',
      'rating': [4.7, 4.4, 4.3],
    },
    {
      'name': 'Los Sabios',
      'cuisine': 'Vegan & Vegetarian',
      'rating': [4.9, 4.2, 3.9],
    },
    {
      'name': 'Nona Fortuna',
      'cuisine': 'Italian, Vegan, Vegetarian',
      'rating': [4.9, 4.5, 4.7],
    }
  ];
}


```

En este ejemplo podemos observar que los `rating`, son un listado de `int` dentro de cada `Map` y cada uno de ellos a su vez, pertenece a una `List`, a la que podríamos declararle el tipo así: `List<Map<String, dynamic>>`.

Podemos también iterar sobre cada uno de ellos así:

```dart
void main() {
  var listOfRestaurants = [
    {
      'name': 'Loving Hut',
      'cuisine': 'Vegan Fast Food',
      'rating': [4.7, 4.4, 4.3],
    },
    {
      'name': 'Los Sabios',
      'cuisine': 'Vegan & Vegetarian',
      'rating': [4.9, 4.2, 3.9],
    },
    {
      'name': 'Nona Fortuna',
      'cuisine': 'Italian, Vegan, Vegetarian',
      'rating': [4.9, 4.5, 4.7],
    }
  ];
  for(var restaurant in listOfRestaurants) {
    print('Restaurant: \n $restaurant');
  }
}
```

## 💪 Average rating

__Requirement__: dada la previa lista de restaurantes, calcular el promedio de rating de cada uno y sumarlo a su respectivo map con la _key_ `avgRating`. Utilicen de base, el código que les dejo. Poner el `avgRating` solamente con un decimal.

```dart
void main() {
  var listOfRestaurants = [
    {
      'name': 'Loving Hut',
      'cuisine': 'Vegan Fast Food',
      'rating': [4.7, 4.4, 4.3],
    },
    {
      'name': 'Los Sabios',
      'cuisine': 'Vegan & Vegetarian',
      'rating': [4.9, 4.2, 3.9],
    },
    {
      'name': 'Nona Fortuna',
      'cuisine': 'Italian, Vegan, Vegetarian',
      'rating': [4.9, 4.5, 4.7],
    }
  ];
  for(var restaurant in listOfRestaurants) {
    final listOfRatings = restaurant['rating'] as List<double>;
    // TODO: calculate average rating
    restaurant['avgRaiting'] = /* value here */;
    print(restaurant);
  }
}
```

---

__💀 Solución__:

```dart
void main() {
  var listOfRestaurants = [
    {
      'name': 'Loving Hut',
      'cuisine': 'Vegan Fast Food',
      'rating': [4.7, 4.4, 4.3],
    },
    {
      'name': 'Los Sabios',
      'cuisine': 'Vegan & Vegetarian',
      'rating': [4.9, 4.2, 3.9],
    },
    {
      'name': 'Nona Fortuna',
      'cuisine': 'Italian, Vegan, Vegetarian',
      'rating': [4.9, 4.5, 4.7],
    }
  ];
  for(var restaurant in listOfRestaurants) {
    final listOfRatings = restaurant['rating'] as List<double>;
    var total = 0.0;
    for(var rating in listOfRatings) {
        total += rating;
    }
    final avgRaiting = (total / listOfRatings.length).toStringAsFixed(1);    
    restaurant['avgRaiting'] = avgRaiting;
    print(restaurant);
  }
}
```
