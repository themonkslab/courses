import 'dart:io';

// 'contentUrl':
//     'https://raw.githubusercontent.com/themonkslab/courses/main/dart/1.introduccion/1.1_sacar_provecho_del_curso.md',
void main() async {
  // Save directories as Directory in List, without 'assets'
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

  // Saves '.md' files in directory
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

    articles.sort(((a, b) {
      final aDouble = double.parse((a['title']).split('.').first);
      final bDouble = double.parse((b['title']).split('.').first);
      return aDouble.compareTo(bDouble);
    }));

    directoriesList.add({
      'path': directory.path,
      'title': directoryName,
      'description': '',
      'articles': articles,
    });
  }

  // final orderedDirectoriesMap = Map.fromEntries(directoriesMap.entries.toList()
  //   ..sort(((a, b) => a.key.compareTo(b.key))));

  // for (var orderedDirectory in orderedDirectoriesMap.entries) {}

  // final orderedArticles = List.from(mdFiles.asMap().entries.toList()
  //   ..sort(((a, b) => a.key.compareTo(b.key))));

  // final Map sections = {};

  // for (Directory directory in directories) {
  //   final name =
  //       (directory.path.replaceAll('./dart/', '')).replaceAll('_', ' ');
  //   sections[int.parse(name[0])] = {
  //     'title': name,
  //     'path': directory.path,
  //   };
  // }

  // final orderedSections = Map.fromEntries(
  //     sections.entries.toList()..sort((e1, e2) => e1.key.compareTo(e2.key)));
  // return orderedSections;
}

//TODO -CONT- 2.10 smaller than 2.1 -> rename to 10 and 1