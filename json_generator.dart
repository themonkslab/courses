import 'dart:convert';
import 'dart:io';

void main() async {
  final list = List.of({'dart', 'cicd'});

  for (var item in list) {
    // Get course from local files
    final course = await createCourseFromPath(item);
    // Create file to store a json
    final filename = '${item}_course.json';
    // Encode it
    final jsonCourse = json.encode(course);
    // Write the file
    await File(filename).writeAsString(jsonCourse);
  }
  
}

Future<List<dynamic>> createCourseFromPath(String path) async {
  // Save directories as Directory in List, without 'assets' directory
  final directories = <Directory>[];
  final dir = Directory('./$path');

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
  final sections = [];
  for (var directory in directories) {
    final articles = [];
    final directoryNameWithUnderscore =
        (directory.path.replaceAll('./$path/', ''));
    final directoryName =
        (directory.path.replaceAll('./$path/', '')).replaceAll('_', ' ');

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
              .replaceAll('./$path/$directoryNameWithUnderscore/', '')
              .replaceAll('_', ' ')
              .replaceFirst(' ', '.')
              .replaceAll('.md', ''));

          final baseContentUrl =
              'https://raw.githubusercontent.com/themonkslab/courses/main';

          final contentUrl = entity.path.replaceFirst('.', baseContentUrl);
          final articlePath = entity.path
              .replaceFirst('./$path/', '')
              .replaceAll('/', '_')
              .replaceAll('.md', '');

          articles.add({
            'path': articlePath,
            'title': articleName,
            'description': '',
            // example: https://raw.githubusercontent.com/themonkslab/courses/main/dart/1.introduccion/1.2_que_esperamos_nosotros.md
            'contentUrl': contentUrl,
            'author': 'The Monkslab',
            'published': DateTime.now().toString(),
          });
        }
      }
    }

    articles.sort(((a, b) => orderList(a, b)));
    // for (var i = 0; i < articles.length; i++) {
    //   articles[i]['path'] = 'article_$i';
    // }
    final sectionPath = directory.path.replaceFirst('./$path/', '');
    sections.add({
      'path': sectionPath,
      'title': directoryName,
      'description': '',
      'articles': articles,
    });
  }

  sections.sort((a, b) => orderList(a, b));
  // for (var i = 0; i < sections.length; i++) {
  //   sections[i]['path'] = 'section_$i';
  // }
  return sections;
}

int orderList(a, b) {
  final aDouble = double.parse((a['title']).split('.').first);
  final bDouble = double.parse((b['title']).split('.').first);
  return aDouble.compareTo(bDouble);
}
