import 'package:flutter/material.dart';
import 'package:fo_fe/injection_container.dart' as di;

import 'app_dev.dart';

void main() async {
  di.init();
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MaterialApp(
    home: AppDev(),
  ));
}
