class Paciente {
  final String nomeCompleto;
  final int idade;

  Paciente({
    this.nomeCompleto,
    this.idade,
  })  : assert(nomeCompleto != null),
        assert(idade != null);

  String get sobrenome => nomeCompleto.split(' ').last;
}

extension on String {
  Paciente toPaciente() {
    final data = this.split('|');
    return Paciente(
      nomeCompleto: data[0],
      idade: int.tryParse(data[1]) ?? 0,
    );
  }
}

void main(List<String> args) {
  var nomesPacientes = [
    'Rodrigo Rahman|35|desenvolvedor|SP',
    'Manoel Silva|12|estudante|MG',
    'Joaquim Rahman|18|estudante|SP',
    'Fernando Verne|35|estudante|MG',
    'Gustavo Silva|40|estudante|MG',
    'Sandra Silva|40|estudante|MG',
    'Regina Verne|35|estudante|MG',
    'João Rahman|55|Jornalista|SP',
  ];

  final pacientes = nomesPacientes.map((e) => e.toPaciente());

  // Baseado no array acima monte um relatório onde mostre
  // Apresente a quantidade de pacientes com mais de 20 anos
  int pacientesMais20 = pacientes.where((e) => e.idade > 20).length;
  print('A quantidade de pacientes com mais de 20 anos é $pacientesMais20');

  // Agrupar os pacientes por familia(considerar o sobrenome) apresentar por familia.
  List<String> familias = pacientes.map((e) => e.sobrenome).toSet().toList();
  familias.forEach((familia) {
    print('Família $familia');
    pacientes.where((e) => e.sobrenome == familia).forEach((paciente) {
      print(' ${paciente.nomeCompleto}');
    });
  });
}
