class Estado {
  final int id;
  final String sigla;
  final String nome;

  Estado(this.id, this.sigla, this.nome);

  @override
  String toString() {
    return '$sigla - $nome';
  }
}