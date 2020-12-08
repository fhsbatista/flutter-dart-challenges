import 'dart:collection';

enum Sexo { feminino, masculino }

extension on String {
  Sexo toSexo() {
    switch (this.toLowerCase()) {
      case 'masculino':
        {
          return Sexo.masculino;
        }
      case 'feminino':
        {
          return Sexo.feminino;
        }
    }
  }
}

extension on Sexo {
  String description() {
    switch (this) {
      case Sexo.masculino:
        {
          return 'Masculino';
        }
      case Sexo.feminino:
        {
          return 'Feminino';
        }
    }
  }
}

class Pessoa {
  final String nome;
  final int idade;
  final Sexo sexo;

  Pessoa({this.nome, this.idade, this.sexo});

  @override
  bool operator ==(Object other) {
    return this.nome == (other as Pessoa).nome &&
        this.idade == (other as Pessoa).idade &&
        this.sexo == (other as Pessoa).sexo;
  }

  @override
  int get hashCode => nome.hashCode ^ idade.hashCode ^ sexo.hashCode;

  @override
  String toString() => '$nome, idade: $idade, sexo: ${sexo.description()}';
}

void main(List<String> args) {
  var pessoasString = [
    'Rodrigo Rahman|35|Masculino',
    'Jose|56|Masculino',
    'Joaquim|84|Masculino',
    'Rodrigo Rahman|35|Masculino',
    'Maria|88|Feminino',
    'Helena|24|Feminino',
    'Leonardo|5|Masculino',
    'Laura Maria|29|Feminino',
    'Joaquim|72|Masculino',
    'Helena|24|Feminino',
    'Guilherme|15|Masculino',
    'Manuela|85|Masculino',
    'Leonardo|5|Masculino',
    'Helena|24|Feminino',
    'Laura|29|Feminino',
  ];

  final pessoas = pessoasString.map((e) {
    final data = e.split('|');
    return Pessoa(
        nome: data[0],
        idade: int.tryParse(data[1]) ?? 0,
        sexo: data[2].toSexo());
  }).toList();

  // Baseado na lista acima.
  // 1 - Remover os duplicados
  final HashSet<Pessoa> pessoasSemDuplicados = HashSet.from(pessoas);
  print('Pessoas sem duplicados');
  pessoasSemDuplicados.forEach((e) => print(e.toString()));

  // 2 - Me mostre a quantidade de pessoas do sexo Masculino e Feminino
  final quantMasculino =
      pessoasSemDuplicados.where((e) => e.sexo == Sexo.masculino).length;
  final quantFeminino =
      pessoasSemDuplicados.where((e) => e.sexo == Sexo.feminino).length;
  print('');
  print('A quantidade de homens é $quantMasculino');
  print('A quantidade de mulheres é $quantFeminino');

  // 3 - Filtrar e deixar a lista somente com pessoas maiores de 18 anos
  //     e mostre a quantidade de pessoas com mais de 18 anos
  final maiores18 = pessoasSemDuplicados.where((e) => e.idade > 18);
  print('');
  print('As pessoas maiores de 18 anos são');
  maiores18.forEach((e) => print(e));
  print('');
  print('A quantidade de pessoas maiores de 18 é ${maiores18.length}');

  // 4 - Encontre a pessoa mais velha.
  Pessoa pessoaMaisVelha;
  pessoasSemDuplicados.forEach((e) {
    if (pessoaMaisVelha == null || e.idade > pessoaMaisVelha.idade) {
      pessoaMaisVelha = e;
    }
  });
  print('');
  print('A pessoa mais velha é ${pessoaMaisVelha}');
}
