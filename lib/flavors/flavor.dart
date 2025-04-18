enum Flavor {
  qa,
  producao,
}

extension FlavorExtension on Flavor {
  String get name {
    switch (this) {
      case Flavor.qa:
        return "QA";
      case Flavor.producao:
        return "Produção";
    }
  }
}
