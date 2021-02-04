import 'package:dart_avancado/domain/entities/cidade.dart';
import 'package:dart_avancado/domain/entities/estado.dart';
import 'package:mysql1/mysql1.dart';

class CidadeModel extends Cidade {
  CidadeModel({
    int id,
    String nome,
    Estado estado,
  }) : super(
          id,
          nome,
          estado,
        );

  factory CidadeModel.fromJson(Estado estado, Map<String, dynamic> json) =>
      CidadeModel(
        id: json['id'],
        nome: json['nome'],
        estado: estado,
      );

  factory CidadeModel.fromEntity(Cidade cidade) => CidadeModel(
        id: cidade.id,
        nome: cidade.nome,
        estado: cidade.estado,
      );

  Future persist(MySqlConnection conn) {
    return conn.query(
      'insert cidades(id, id_estado, nome) values($id, ${estado.id}, \'${nome.replaceAll('\'', '')}\');',
    );
  }
}
