import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'method_channel_{{project}}.dart';

abstract class {{project.pascalCase()}}Platform extends PlatformInterface {
  {{project.pascalCase()}}Platform() : super(token: _token);

  static final Object _token = Object();

  static {{project.pascalCase()}}Platform _instance = MethodChannel{{project.pascalCase()}}();

  static {{project.pascalCase()}}Platform get instance => _instance;

  static set instance({{project.pascalCase()}}Platform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> get platformVersion async {
    throw UnimplementedError('platformVersion has not been implemented.');
  }
}
