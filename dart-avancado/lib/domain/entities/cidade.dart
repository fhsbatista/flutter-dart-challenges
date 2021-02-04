import 'package:dart_avancado/domain/entities/estado.dart';

class Cidade {
  final int id;
  final String nome;
  final Estado estado;

  Cidade(this.id, this.nome, this.estado);

  @override
  String toString() {
    return '$nome - ${estado.sigla}';
  }
}