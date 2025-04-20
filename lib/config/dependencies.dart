import 'package:get_it/get_it.dart';
import 'package:my_book_store/data/data.dart';
import 'package:my_book_store/ui/ui.dart';

final GetIt getIt = GetIt.instance;

void injector() {
  getIt.registerSingleton<ApiService>(ApiService());

  getIt.registerSingleton<CreateStoreRepository>(
    CreateStoreRepository(getIt<ApiService>()),
  );

  getIt.registerSingleton<AuthRepository>(
    AuthRepository(getIt<ApiService>()),
  );

  getIt.registerSingleton(
    HomeRepository(getIt<ApiService>()),
  );

  getIt.registerSingleton<EmployeeRepository>(
    EmployeeRepository(getIt<ApiService>()),
  );

  getIt.registerSingleton<LoginBloc>(
    LoginBloc(getIt<AuthRepository>()),
  );

  getIt.registerSingleton<CreateStoreBloc>(
    CreateStoreBloc(getIt<CreateStoreRepository>()),
  );

  getIt.registerSingleton<NavigationBarBloc>(NavigationBarBloc());

  getIt.registerSingleton<HomeBloc>(
    HomeBloc(getIt<HomeRepository>()),
  );

  getIt.registerSingleton<EmployeeBloc>(
    EmployeeBloc(getIt<EmployeeRepository>()),
  );
}
