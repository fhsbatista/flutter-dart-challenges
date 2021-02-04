import 'package:dart_avancado/domain/entities/cidade.dart';
import 'package:dart_avancado/domain/entities/estado.dart';
import 'package:dart_avancado/domain/ibge_repository.dart';

class GetCidadesByEstadoUsecase {
  final IbgeRepository repository;

  GetCidadesByEstadoUsecase(this.repository);

  Future<List<Cidade>> call(Estado estado) =>
      repository.getCidadesByEstado(estado);
}
