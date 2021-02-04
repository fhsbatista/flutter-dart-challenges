import 'package:dart_avancado/data/ibge_datasource.dart';
import 'package:dart_avancado/data/ibge_repository_impl.dart';
import 'package:dart_avancado/domain/entities/cidade.dart';
import 'package:dart_avancado/domain/entities/estado.dart';
import 'package:dart_avancado/domain/usecases/get_cidades_by_estado_usecase.dart';
import 'package:dart_avancado/domain/usecases/persist_cidades_usecase.dart';
import 'package:dart_avancado/domain/usecases/persist_estados_usecase.dart';

import 'domain/usecases/get_estados_usecase.dart';

void printEstados() async {
  final getEstadosUsecase = GetEstadosUsecase(
    IbgeRepositoryImpl(
      IbgeDatasourceImpl(),
    ),
  );
  print('Buscando lista de estados...');
  final estados = await getEstadosUsecase();
  estados.forEach((e) => print(e));
  estados.forEach((e) async {
    final cidades = await _getCidades(e);
    print('\nAs cidades do estado $e são:');
    cidades.forEach((e) => print(e));
    await _persistEstados([e]);
    await _persistCidades(cidades);
  });
}

Future<List<Cidade>> _getCidades(Estado estado) async {
  final getCidadesByEstadoUsecase = GetCidadesByEstadoUsecase(
    IbgeRepositoryImpl(
      IbgeDatasourceImpl(),
    ),
  );
  final cidades = await getCidadesByEstadoUsecase(estado);
  return cidades;
}

Future _persistEstados(List<Estado> estados) {
  final persistEstadosUsecase = PersistEstadosUsecase(
    IbgeRepositoryImpl(
      IbgeDatasourceImpl(),
    ),
  );
  return persistEstadosUsecase(estados);
}

Future _persistCidades(List<Cidade> cidades) {
  final persistCidadesUsecase = PersistCidadesUsecase(
    IbgeRepositoryImpl(
      IbgeDatasourceImpl(),
    ),
  );
  return persistCidadesUsecase(cidades);
}
