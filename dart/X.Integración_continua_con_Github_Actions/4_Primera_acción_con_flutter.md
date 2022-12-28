# Primera acción con Flutter

Nuestra intensión con el curso, más allá de aprender, es que le quede código al estudiante que pueda reutilizar en sus proyectos, es por esto que nuestra __primera acción__ específica para Flutter será correr un par de __checkeos__ de código cada vez que se realize un ```push``` en el código.

## Creando el projecto ejemplo

Utilizaremos el tipico ejemplo que viene con Flutter, para ello nos ubicamos en el root del proyecto de cicd que venimos utilizando y ejecutamos

```
flutter create ./
```

Luego correremos el test para verificar si está todo ok.

```bash
flutter analyze
flutter test
```

## Agregando los checks con la acción push

