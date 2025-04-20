import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_book_store/blocs/blocs.dart';

class NavigationBarBloc extends Bloc<NavigationBarEvent, NavigationBarState> {
  NavigationBarBloc() : super(NavigationBarInitialState()) {
    on<NavigationBarDestinationChangeEvent>((event, emit) {
      emit(NavigationBarDestinationChangedState(event.index));
    });
  }
}
