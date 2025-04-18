import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:my_book_store/config/dependencies.dart';
import 'package:my_book_store/firebase_options.dart';
import 'package:my_book_store/my_app.dart';
import 'package:my_book_store/utils/flavor_config.dart';
import 'flavor.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  injector();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FlavorConfig.instance.init(Flavor.qa);

  runApp(const MyApp());
}
