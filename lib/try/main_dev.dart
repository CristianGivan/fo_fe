import 'package:flutter/material.dart';
import 'package:fo_fe/main_init.dart' as sl;

import 'app_dev.dart';

void main() async {
  sl.init();
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}
