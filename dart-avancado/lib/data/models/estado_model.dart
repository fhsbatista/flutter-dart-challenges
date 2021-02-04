import 'package:dart_avancado/domain/entities/estado.dart';
import 'package:mysql1/mysql1.dart';

class EstadoModel extends Estado {
  EstadoModel(int id, String sigla, String nome) : super(id, sigla, nome);

  factory EstadoModel.fromJson(Map<String, dynamic> json) => EstadoModel(
        json['id'],
        json['sigla'],
        json['nome'],
      );

  factory EstadoModel.fromEntity(Estado estado) => EstadoModel(
        estado.id,
        estado.sigla,
        estado.nome,
      );

  Future persist(MySqlConnection conn) {
    return conn.query('insert estados(id, nome) values($id, \'$nome\');');
  }
}
