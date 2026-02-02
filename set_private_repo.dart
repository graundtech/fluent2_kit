import 'dart:io';

var additionalLine =
    "publish_to: https://dart.indicacode.com";

void main() {
  final file = File("pubspec.yaml");
  final content = file.readAsStringSync();
  file.writeAsString(
    content.replaceFirst("version:", "$additionalLine\nversion:"),
  );
}
