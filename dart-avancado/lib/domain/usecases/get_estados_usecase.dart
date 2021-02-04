import 'package:dart_avancado/domain/entities/estado.dart';
import 'package:dart_avancado/domain/ibge_repository.dart';

class GetEstadosUsecase {
  final IbgeRepository repository;

  GetEstadosUsecase(this.repository);

  Future<List<Estado>> call() => repository.getEstados();
}