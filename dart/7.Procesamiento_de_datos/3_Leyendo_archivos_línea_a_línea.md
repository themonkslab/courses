# Leyendo archivos línea a línea

Para este ejercicio, vamos a utilizar un archivo que representa la subida del precio del dólar oficial en Argentina; pueden encontrar aquí [el archivo original](https://datos.gob.ar/series/api/series/?ids=168.1_T_CAMBIOR_D_0_0_26) aunque vamos a trabajar con el siguiente y de la siguiente forma:

1. Ir a [este link](). Allí podrán ver un _preview_ o vista previa del archivo, cómo se vería tabulado.
2. Hacer click donde dice _raw_ o crudo.
3. Copiar todo el contenido.
4. Crear un archivo nuevo en el directorio en el que se encuentran trabajando, con nombre data_to_read.csv
5. Pegar el contenido en dicho archivo.
6. Guardarlo.

Deberían ver algo como lo siguiente: ![Data to read en VS Code](./3.1_data_to_read_csv_example.png)

## Leyendo el archivo por líneas

Ahora que ya tenemos nuestro archivo guardado, vamos a tratar de leer su contenido. Para ello crearemos una referencia a nuestro archivo con la clase `File` pasándole como argumento el archivo que introdujimos para leerlo línea por línea con el comando `readAsLinesSync`, que nos va a devolver una lista de líneas. Finalmente, vamos a almacenar todo en una variable llamada `contentInLines` y lo vamos a imprimir para ver cómo resulta:

```dart
void main(List<String> arguments) {
  if (arguments.isEmpty) {
    print('Usage: dart data_processing.dart <inputFile.csv>');
    exit(1);
  }
  final inputFile = arguments.first;
  final contentInLines = File(inputFile).readAsLinesSync();
  for (var line in contentInLines) {
    print(line);
  }
}
```
