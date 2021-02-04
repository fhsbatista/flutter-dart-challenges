import 'package:dart_avancado/domain/entities/cidade.dart';
import 'package:dart_avancado/domain/ibge_repository.dart';

class PersistCidadesUsecase {
  final IbgeRepository repository;

  PersistCidadesUsecase(this.repository);

  Future call(List<Cidade> cidades) =>
      repository.persistCidades(cidades);
}
