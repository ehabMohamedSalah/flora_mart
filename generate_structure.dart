import 'dart:convert';
import 'dart:io';

void createStructure(Map<String, dynamic> jsonMap, String basePath) {
  jsonMap.forEach((key, value) {
    String path = key.isEmpty ? basePath : '$basePath/$key';

    if (value is List) {
      Directory(path).createSync(recursive: true);
      for (var file in value) {
        File('$path/$file').createSync(recursive: true);
      }
    } else if (value is Map<String, dynamic>) {
      createStructure(value, path);
    }
  });
}

// THIS IS THE MAIN FUNCTION ↓↓↓
void main() {
  final file = File('structure.json');
  if (!file.existsSync()) {
    return;
  }

  final content = json.decode(file.readAsStringSync());
  createStructure(content, Directory.current.path);
}
