import 'package:flutter/material.dart';
import 'package:fo_fe/core/config/app_init.dart' as sl;

import 'app_dev.dart';

void main() async {
  sl.appInit();
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}
