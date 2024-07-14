import 'package:flutter/material.dart';
import 'package:fo_fe/service_locator.dart' as sl;

import 'app_dev.dart';

void main() async {
  sl.init();
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}
