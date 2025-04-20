import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:my_book_store/blocs/blocs.dart';
import 'package:my_book_store/data/data.dart';
import 'package:my_book_store/domain/domain.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository _homeRepository;

  final searchTextController = TextEditingController();
  final bookTitleTextController = TextEditingController();
  final bookAuthorTextController = TextEditingController();

  HomeBloc(this._homeRepository) : super(HomeInitialState()) {
    on<HomeSearchEvent>(
      (event, emit) async {
        await _homeRepository.getBooks(Filter());
      },
    );
  }
}
