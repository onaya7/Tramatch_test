import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tramatch_test/core/injection/sl.dart';
import 'package:tramatch_test/firebase_options.dart';

import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  configureDependencies();
  runApp(
    const MyApp(),
  );
}
