import 'package:flutter_test/flutter_test.dart';
import 'package:{{project}}_platform_interface/{{project}}_platform_interface.dart';
import 'package:mockito/mockito.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

void main() {
  group('${{project.pascalCase()}}Platform', () {
    test('$MethodChannel{{project}} is the default instance', () {
      expect({{project.pascalCase()}}Platform.instance, isA<MethodChannel{{project.pascalCase()}}>());
    });

    test('Cannot be implemented with `implements`', () {
      expect(() {
        {{project.pascalCase()}}Platform.instance = Implements{{project.pascalCase()}}Platform();
      }, throwsA(isA<Error>()));
    });

    test('Can be extended', () {
      {{project.pascalCase()}}Platform.instance = Extends{{project.pascalCase()}}Platform();
    });

    test('Can be mocked with `implements`', () {
      {{project.pascalCase()}}Platform.instance = ImplementsWithIsMock();
    });
  });
}

class ImplementsWithIsMock extends Mock
    with MockPlatformInterfaceMixin
    implements {{project.pascalCase()}}Platform {}

class Implements{{project.pascalCase()}}Platform extends Mock
    implements {{project.pascalCase()}}Platform {}

class Extends{{project.pascalCase()}}Platform extends {{project.pascalCase()}}Platform {}
