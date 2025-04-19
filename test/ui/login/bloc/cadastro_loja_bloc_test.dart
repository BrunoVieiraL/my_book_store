import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:my_book_store/blocs/blocs.dart';
import 'package:my_book_store/data/data.dart';
import 'package:my_book_store/ui/ui.dart';

class MockCadastroLojaRepository extends Mock
    implements CadastroLojaRepository {}

void main() {
  late CadastroLojaBloc bloc;
  late CadastroLojaRepository cadastroLojaRepository;

  setUp(() {
    cadastroLojaRepository = MockCadastroLojaRepository();
    bloc = CadastroLojaBloc(cadastroLojaRepository);
  });

  group('CadastroLojaBloc', () {
    test('emite [SenhaInvalida] quando senha não atende critérios', () {
      bloc.add(SenhaChanged('123'));

      expectLater(
        bloc.stream,
        emitsInOrder([
          isA<SenhaInvalida>(),
        ]),
      );
    });

    test('emite [ConfirmacaoIncorreta] quando senhas não coincidem', () {
      bloc.add(SenhaChanged('Senha1!'));
      bloc.add(ConfirmarSenhaChanged('Diferente1!'));

      expectLater(
        bloc.stream,
        emitsInOrder([
          isA<FormularioValido>(), // senha válida
          isA<ConfirmacaoIncorreta>(), // senhas diferentes
        ]),
      );
    });

    test('emite [FormularioValido] quando senha e confirmação estão corretas',
        () {
      bloc.add(SenhaChanged('Senha1!'));
      bloc.add(ConfirmarSenhaChanged('Senha1!'));

      expectLater(
        bloc.stream,
        emits(isA<FormularioValido>()),
      );
    });
  });
}
