import 'package:dart_avancado/domain/entities/cidade.dart';
import 'package:dart_avancado/domain/entities/estado.dart';

abstract class IbgeRepository {
  Future<List<Estado>> getEstados();
  Future<List<Cidade>> getCidadesByEstado(Estado estado);
  Future<void> persistEstados(List<Estado> estados);
  Future<void> persistCidades(List<Cidade> cidades);
}