import 'dart:io';

String fixture(String name) =>
    File("test/fixtures/elements/$name").readAsStringSync();
