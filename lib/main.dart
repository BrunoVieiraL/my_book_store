import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:my_book_store/config/dependencies.dart';
import 'package:my_book_store/ui/my_app.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  injector();

  runApp(const MyApp());
}
