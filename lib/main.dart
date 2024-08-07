import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tramatch_test/firebase_options.dart';
import 'package:tramatch_test/injection_container.dart' as si;

import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  si.init();
  runApp(
    const MyApp(),
  );
}
