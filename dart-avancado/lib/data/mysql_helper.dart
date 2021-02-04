import 'package:mysql1/mysql1.dart';

class MySqlHelper {
  static const host = 'localhost';
  static const port = 3306;
  static const user = 'root';
  static const password = 'root';
  static const db = 'curso_dart_avancado';
  final settings = ConnectionSettings(
    host: host,
    port: port,
    user: user,
    password: password,
    db: db,
  );

  MySqlConnection _conn;

  Future<MySqlConnection> get conn async {
    if (_conn != null) {
      return _conn;
    } else {
      _conn = await _initializeConnection();
      return _conn;
    }
  }

  Future<MySqlConnection> _initializeConnection() async {
    return MySqlConnection.connect(settings);
  }
}