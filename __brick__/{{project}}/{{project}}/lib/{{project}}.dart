
import 'dart:async';

import 'package:{{project}}_platform_interface/{{project}}_platform_interface.dart';

class {{project.pascalCase()}} {
  static Future<String?> getPlatformVersion => {{project.pascalCase()}}Platform.instance.getPlatformVersion();
}
