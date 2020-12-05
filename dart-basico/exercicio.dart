void main() {
  exercicio1();
  exercicio2();
  exercicio3();
  exercicio4();
  exercicio5();
  exercicio6();
}

void exercicio1() {
  print('EXERCICIO 1');
  final nomes =
      'Pedro de Alcântara Francisco Antônio João Carlos Xavier de Paula Miguel Rafael Joaquim José Gonzaga Pascoal Cipriano Serafim de Bragança e Bourbon';
  print('A variável nome possui ${nomes.length} caractres');
}

void exercicio2() {
  print('EXERCICIO 2');
  final nomes = [
    'Fernando',
    'Henrique',
    'Silva',
    'Batista',
    'Lionel',
    'Cristiano',
    'Rodolfo',
    'Sheila',
    'João',
    'Rodrigo',
  ];
  for (int i = 0; i < nomes.length; i++) {
    print(nomes[i]);
  }
}

void exercicio3() {
  print('EXERCICIO 3');
  final nomes =
      'Pedro de Alcântara Francisco Antônio João Carlos Xavier de Paula Miguel Rafael Joaquim José Gonzaga Pascoal Cipriano Serafim de Bragança e Bourbon';
  print('A variável possui ${nomes.split(' ').length} nomes');
}

void exercicio4() {
  print('EXERCICIO 4');
  List<String> pacientes = [
    'Rodrigo Rahman|35',
    'Guilheme Rahman|10',
    'João Rahman|20',
    'Joaquin Rahman|25',
    'Luan Rahman|23'
  ];

  for (int i = 0; i < pacientes.length; i++) {
    final nome = (pacientes)[i].split('|')[0];
    final idade = (pacientes)[i].split('|')[1];
    print('$nome tem $idade anos');
  }
}

void exercicio5() {
  print('EXERCICIO 5');

  List<String> pacientes = [
    'Rodrigo Rahman|35',
    'Guilheme Rahman|10',
    'João Rahman|20',
    'Joaquin Rahman|25',
    'Luan Rahman|23',
  ];

  pacientes.removeLast();
  pacientes.removeLast();

  for (int i = 0; i < pacientes.length; i++) {
    final nome = (pacientes)[i].split('|')[0];
    final idade = (pacientes)[i].split('|')[1];
    print('$nome tem $idade anos');
  }
}

void exercicio6() {
  print('EXERCICIO 6');
  List<String> pacientes = [
    'Rodrigo Rahman|35',
    'Guilheme Rahman|10',
    'João Rahman|17',
    'Joaquin Rahman|28',
    'Luan Rahman|23',
  ];

  for (int i = 0; i < pacientes.length; i++) {
    final idade = int.tryParse((pacientes)[i].split('|')[1]) ?? 0;
    pacientes.removeWhere(
        (element) => int.tryParse(element.split('|')[1]) < 18 ?? 0);

    for (int i = 0; i < pacientes.length; i++) {
      final nome = (pacientes)[i].split('|')[0];
      final idade = (pacientes)[i].split('|')[1];
      print('$nome tem $idade anos');
    }
  }
}
