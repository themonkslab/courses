import 'dart:convert';
import 'dart:io';

void main() async {
  // Get course from local files
  final course = await createDartCourse();
  // Create file to store a json
  final filename = 'dart_course.txt';
  // Encode it
  final jsonCourse = json.encode(course);
  // Write the file
  await File(filename).writeAsString(jsonCourse);
}

Future<List<dynamic>> createDartCourse() async {
  // Save directories as Directory in List, without 'assets' directory
  final directories = <Directory>[];
  final dir = Directory('./dart');

  final List<FileSystemEntity> entities = await dir.list().toList();
  for (var entity in entities) {
    if (await FileSystemEntity.isDirectory(entity.path)) {
      if (!(entity.path.substring(entity.path.lastIndexOf('/') + 1) ==
          'assets')) {
        directories.add(entity as Directory);
      }
    }
  }

  // Save '.md' files in directory
  final directoriesList = [];
  for (var directory in directories) {
    final articles = [];
    final directoryNameWithUnderscore =
        (directory.path.replaceAll('./dart/', ''));
    final directoryName =
        (directory.path.replaceAll('./dart/', '')).replaceAll('_', ' ');

    final List<FileSystemEntity> subEntities = await directory.list().toList();
    for (var entity in subEntities) {
      if (await FileSystemEntity.isFile(entity.path)) {
        final String articleExtension;
        try {
          articleExtension = "." + entity.uri.toString().split('.').last;
        } catch (e) {
          throw e;
        }
        if (articleExtension == '.md') {
          final articleName = (entity.path
              .replaceAll('./dart/$directoryNameWithUnderscore/', '')
              .replaceAll('_', ' ')
              .replaceFirst(' ', '.'));

          final baseContentUrl =
              'https://raw.githubusercontent.com/themonkslab/courses/main';

          final contentUrl = entity.path.replaceFirst('.', baseContentUrl);

          articles.add({
            'path': entity.path,
            'title': articleName,
            'description': '',
            // example: https://raw.githubusercontent.com/themonkslab/courses/main/dart/1.introduccion/1.2_que_esperamos_nosotros.md
            'contentUrl': contentUrl,
            'author': 'Mau Di Bert',
            'published': '',
          });
        }
      }
    }

    articles.sort(((a, b) => orderList(a, b)));

    directoriesList.add({
      'path': directory.path,
      'title': directoryName,
      'description': '',
      'articles': articles,
    });
  }

  directoriesList.sort((a, b) => orderList(a, b));
  return directoriesList;
}

int orderList(a, b) {
  final aDouble = double.parse((a['title']).split('.').first);
  final bDouble = double.parse((b['title']).split('.').first);
  return aDouble.compareTo(bDouble);
}
