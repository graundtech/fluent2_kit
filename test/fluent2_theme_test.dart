import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluent2_kit/theme_data.dart';

void main() {
  group('Fluent theme data', () {
    test('exposes light and dark themes', () {
      expect(theme.brightness, Brightness.light);
      expect(darkTheme.brightness, Brightness.dark);
    });
  });
}
