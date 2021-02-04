import 'package:dart_avancado/data/ibge_datasource.dart';
import 'package:dart_avancado/domain/entities/cidade.dart';
import 'package:dart_avancado/domain/entities/estado.dart';
import 'package:dart_avancado/domain/ibge_repository.dart';

class IbgeRepositoryImpl implements IbgeRepository {
  final IbgeDatasource datasource;

  IbgeRepositoryImpl(this.datasource);

  @override
  Future<List<Estado>> getEstados() => datasource.getEstados();

  @override
  Future<List<Cidade>> getCidadesByEstado(Estado estado) =>
      datasource.getCidadesByEstado(estado);

  @override
  Future persistEstados(List<Estado> estados) =>
      datasource.persistEstados(estados);

  @override
  Future<void> persistCidades(List<Cidade> cidades) {
    datasource.persistCidades(cidades);
  }
}
