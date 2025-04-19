import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:my_book_store/config/dependencies.dart';
import 'package:my_book_store/firebase_options.dart';
import 'package:my_book_store/ui/my_app.dart';
import 'package:my_book_store/flavors/flavor_config.dart';
import 'flavors/flavor.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  FlavorConfig.instance.init(Flavor.producao);

  injector();

  runApp(const MyApp());
}
