import 'agendamentos.dart';

class AgendamentoService {
  static final List<Agendamento> agendamentos = [];

  static void adicionar(Agendamento agendamento) {
    agendamentos.add(agendamento);
  }

  static void remover(Agendamento agendamento) {
    agendamentos.remove(agendamento);
  }
}