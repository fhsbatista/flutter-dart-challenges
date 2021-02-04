import 'package:dart_avancado/data/models/cidade_model.dart';
import 'package:dart_avancado/data/models/estado_model.dart';
import 'package:dart_avancado/domain/entities/cidade.dart';
import 'package:dart_avancado/domain/entities/estado.dart';
import 'package:dio/dio.dart';
import 'package:dart_avancado/data/mysql_helper.dart';

abstract class IbgeDatasource {
  Future<List<Estado>> getEstados();

  Future<List<Cidade>> getCidadesByEstado(Estado estado);

  Future persistEstados(List<Estado> estados);

  Future persistCidades(List<Cidade> cidades);
}

class IbgeDatasourceImpl implements IbgeDatasource {
  @override
  Future<List<Estado>> getEstados() async {
    final url = 'https://servicodados.ibge.gov.br/api/v1/localidades/estados';
    final response = await Dio().get(url);
    return (response.data as List).map((e) => EstadoModel.fromJson(e)).toList();
  }

  @override
  Future<List<Cidade>> getCidadesByEstado(Estado estado) async {
    final url =
        'https://servicodados.ibge.gov.br/api/v1/localidades/estados/${estado.id}/distritos';
    final response = await Dio().get(url);
    return (response.data as List).map((e) => CidadeModel.fromJson(estado, e)).toList();
  }

  @override
  Future persistEstados(List<Estado> estados) async {
    final _mysqlConn = await MySqlHelper().conn;
    estados.forEach((e) => EstadoModel.fromEntity(e).persist(_mysqlConn));
    await _mysqlConn.close();
  }

  @override
  Future persistCidades(List<Cidade> cidades) async {
    final _mysqlConn = await MySqlHelper().conn;
    cidades.forEach((e) => CidadeModel.fromEntity(e).persist(_mysqlConn));
    await _mysqlConn.close();
  }
}
