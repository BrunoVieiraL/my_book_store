import 'package:get_it/get_it.dart';
import 'package:my_book_store/ui/ui.dart';

injector() {
  final GetIt getIt = GetIt.instance;

  getIt.registerSingleton(LoginBloc());
}
