import 'package:my_book_store/flavors/flavor.dart';

class FlavorConfig {
  // Singleton instance
  static final FlavorConfig _instance = FlavorConfig._();

  // Private constructor
  FlavorConfig._();

  late final Flavor flavor;

  // Getter para acesso global
  static FlavorConfig get instance => _instance;

  // Inicializador
  void init(Flavor flavor) {
    this.flavor = flavor;
  }

  String get apiBaseUrl {
    switch (flavor) {
      case Flavor.qa:
        return 'https://api-flutter-prova-qa.hml.sesisenai.org.br/';
      case Flavor.producao:
        return ' https://api-flutter-prova.hml.sesisenai.org.br/';
    }
  }
}
