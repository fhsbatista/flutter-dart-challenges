import 'package:dart_avancado/domain/entities/estado.dart';
import 'package:dart_avancado/domain/ibge_repository.dart';

class PersistEstadosUsecase {
  final IbgeRepository repository;

  PersistEstadosUsecase(this.repository);

  Future call(List<Estado> estados) =>
      repository.persistEstados(estados);
}
