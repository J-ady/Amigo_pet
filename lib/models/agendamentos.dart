import 'cuidador.dart';
import 'servico.dart';

class Agendamento {
  final Cuidador cuidador;
  final Servico servico;
  final DateTime data;

  Agendamento({
    required this.cuidador,
    required this.servico,
    required this.data,
  });
}