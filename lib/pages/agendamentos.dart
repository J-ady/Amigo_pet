import 'package:flutter/material.dart';

import '../models/agendamento_service.dart';
import '../models/agendamentos.dart';

class AgendamentosPage extends StatefulWidget {
  const AgendamentosPage({super.key});

  @override
  State<AgendamentosPage> createState() =>
      _AgendamentosPageState();
}

class _AgendamentosPageState
    extends State<AgendamentosPage> {
  String _formatarData(DateTime data) {
    return '${data.day.toString().padLeft(2, '0')}/'
        '${data.month.toString().padLeft(2, '0')}/'
        '${data.year}';
  }

  void _cancelar(Agendamento agendamento) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            'Cancelar agendamento?',
          ),
          content: Text(
            'Deseja cancelar ${agendamento.servico.nome} '
                'com ${agendamento.cuidador.nome}?',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('NÃO'),
            ),
            ElevatedButton(
              onPressed: () {
                AgendamentoService.remover(
                  agendamento,
                );

                Navigator.pop(context);

                setState(() {});

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      'Agendamento cancelado.',
                    ),
                  ),
                );
              },
              child: const Text('SIM, CANCELAR'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final agendamentos =
        AgendamentoService.agendamentos;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F7F5),

      appBar: AppBar(
        backgroundColor: const Color(0xFF1DB0CA),
        foregroundColor: Colors.white,
        title: const Text(
          'Meus agendamentos',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: agendamentos.isEmpty
          ? const Center(
        child: Column(
          mainAxisAlignment:
          MainAxisAlignment.center,
          children: [
            Icon(
              Icons.calendar_month,
              size: 70,
              color: Colors.grey,
            ),
            SizedBox(height: 15),
            Text(
              'Você não possui agendamentos.',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 6),
            Text(
              'Escolha um cuidador para agendar um serviço.',
            ),
          ],
        ),
      )
          : ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: agendamentos.length,
        itemBuilder: (context, index) {
          final agendamento =
          agendamentos[index];

          return Card(
            margin: const EdgeInsets.only(
              bottom: 14,
            ),
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 28,
                        backgroundColor:
                        const Color(0xFFE8F5E9),
                        child: Text(
                          agendamento
                              .cuidador
                              .inicial,
                          style: const TextStyle(
                            color:
                            Color(0xFF1DB0CA),
                            fontWeight:
                            FontWeight.bold,
                            fontSize: 21,
                          ),
                        ),
                      ),

                      const SizedBox(width: 12),

                      Expanded(
                        child: Column(
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          children: [
                            Text(
                              agendamento
                                  .cuidador
                                  .nome,
                              style:
                              const TextStyle(
                                fontSize: 18,
                                fontWeight:
                                FontWeight.bold,
                              ),
                            ),
                            Text(
                              agendamento
                                  .servico
                                  .nome,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  const Divider(height: 28),

                  Row(
                    children: [
                      const Icon(
                        Icons.calendar_today,
                        size: 19,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        _formatarData(
                          agendamento.data,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 10),

                  Row(
                    children: [
                      const Icon(
                        Icons.timer,
                        size: 19,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        agendamento
                            .servico
                            .duracao,
                      ),
                    ],
                  ),

                  const SizedBox(height: 10),

                  Row(
                    children: [
                      const Icon(
                        Icons.attach_money,
                        size: 19,
                        color: Colors.blueAccent,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'R\$ ${agendamento.servico.preco.toStringAsFixed(2).replaceAll('.', ',')}',
                        style: const TextStyle(
                          fontWeight:
                          FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 15),

                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton.icon(
                      onPressed: () {
                        _cancelar(
                          agendamento,
                        );
                      },
                      icon: const Icon(
                        Icons.cancel_outlined,
                      ),
                      label: const Text(
                        'Cancelar agendamento',
                      ),
                      style:
                      OutlinedButton.styleFrom(
                        foregroundColor:
                        Colors.red,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}