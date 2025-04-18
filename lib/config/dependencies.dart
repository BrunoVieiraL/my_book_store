import 'package:get_it/get_it.dart';
import 'package:my_book_store/data/data.dart';
import 'package:my_book_store/ui/ui.dart';

final GetIt getIt = GetIt.instance;

void injector() {
  getIt.registerSingleton<ApiService>(ApiService());

  getIt.registerSingleton<StoreRepository>(
    StoreRepository(getIt<ApiService>()),
  );

  getIt.registerSingleton<LoginBloc>(LoginBloc());
}
