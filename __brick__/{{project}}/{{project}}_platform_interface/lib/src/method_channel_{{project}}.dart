import 'package:flutter/services.dart';

import '{{project}}_platform_interface.dart';

class MethodChannel{{project.pascalCase()}} extends {{project.pascalCase()}}Platform {
  static const MethodChannel _channel =
      const MethodChannel('io.ambergroup.plugins/{{project}}');

  @override
  Future<String> getPlatformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version ?? '';
  }
}
