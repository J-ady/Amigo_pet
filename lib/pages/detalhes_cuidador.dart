import 'package:flutter/material.dart';

import '../models/agendamentos.dart';
import '../models/agendamento_service.dart';
import '../models/cuidador.dart';
import '../models/servico.dart';
import '../styles/appbar_styles.dart';
import '../styles/bottomsheet_styles.dart';
import '../styles/simpledialog_styles.dart';

class DetalhesCuidadorPage extends StatefulWidget {
  final Cuidador cuidador;

  const DetalhesCuidadorPage({
    super.key,
    required this.cuidador,
  });

  @override
  State<DetalhesCuidadorPage> createState() =>
      _DetalhesCuidadorPageState();
}

class _DetalhesCuidadorPageState
    extends State<DetalhesCuidadorPage> {
  void _mostrarTipoServico() {
    showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          title: const Text(
            'Escolha o tipo de serviço',
            style: SimpleDialogStyles.titulo,
          ),
          children: widget.cuidador.servicos.map(
                (servico) {
              return SimpleDialogOption(
                onPressed: () {
                  Navigator.pop(context);

                  _confirmarAgendamento(
                    servico,
                  );
                },
                child: Row(
                  children: [
                    const Icon(
                      Icons.pets,
                      color: Color(0xFFB6EDFF),
                    ),
                    const SizedBox(width: 12),

                    Expanded(
                      child: Column(
                        crossAxisAlignment:
                        CrossAxisAlignment.start,
                        children: [
                          Text(
                            servico.nome,
                            style:
                            SimpleDialogStyles.opcao,
                          ),
                          Text(
                            '${servico.duracao} • R\$ ${servico.preco.toStringAsFixed(2).replaceAll('.', ',')}',
                            style: TextStyle(
                              color: Colors.grey.shade600,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ).toList(),
        );
      },
    );
  }

  void _confirmarAgendamento(Servico servico) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            'Confirmar agendamento',
          ),
          content: Text(
            'Deseja agendar ${servico.nome} com '
                '${widget.cuidador.nome}?\n\n'
                'Duração: ${servico.duracao}\n'
                'Valor: R\$ ${servico.preco.toStringAsFixed(2).replaceAll('.', ',')}',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('VOLTAR'),
            ),
            ElevatedButton(
              onPressed: () {
                final agendamento = Agendamento(
                  cuidador: widget.cuidador,
                  servico: servico,
                  data: DateTime.now().add(
                    const Duration(days: 1),
                  ),
                );

                AgendamentoService.adicionar(
                  agendamento,
                );

                Navigator.pop(context);

                ScaffoldMessenger.of(context)
                    .showSnackBar(
                  SnackBar(
                    content: Text(
                      '${servico.nome} agendado com sucesso!',
                    ),
                  ),
                );
              },
              child: const Text('AGENDAR'),
            ),
          ],
        );
      },
    );
  }

  void _mostrarMaisOpcoes() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(22),
        ),
      ),
      builder: (context) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(18),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 45,
                  height: 5,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius:
                    BorderRadius.circular(10),
                  ),
                ),

                const SizedBox(height: 18),

                const Text(
                  'Mais opções',
                  style: BottomSheetStyles.titulo,
                ),

                const SizedBox(height: 10),

                ListTile(
                  leading: const Icon(
                    Icons.share,
                    color: Color(0xFFB6EDFF),
                  ),
                  title: const Text(
                    'Compartilhar perfil',
                  ),
                  onTap: () {
                    Navigator.pop(context);

                    ScaffoldMessenger.of(context)
                        .showSnackBar(
                      const SnackBar(
                        content: Text(
                          'Perfil pronto para compartilhar.',
                        ),
                      ),
                    );
                  },
                ),

                ListTile(
                  leading: const Icon(
                    Icons.flag,
                    color: Colors.red,
                  ),
                  title: const Text(
                    'Denunciar',
                  ),
                  onTap: () {
                    Navigator.pop(context);

                    ScaffoldMessenger.of(context)
                        .showSnackBar(
                      const SnackBar(
                        content: Text(
                          'Denúncia selecionada.',
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _cancelarAgendamento() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            'Cancelar agendamento?',
          ),
          content: const Text(
            'O botão abaixo simula o cancelamento de '
                'um agendamento deste cuidador.',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('VOLTAR'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);

                ScaffoldMessenger.of(context)
                    .showSnackBar(
                  const SnackBar(
                    content: Text(
                      'Agendamento cancelado.',
                    ),
                  ),
                );
              },
              child: const Text('CANCELAR'),
            ),
          ],
        );
      },
    );
  }

  void _mostrarAvaliacao() {
    int nota = 0;

    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setStateDialog) {
            return AlertDialog(
              title: const Text(
                'Avaliar profissional',
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Escolha uma nota:',
                  ),

                  const SizedBox(height: 12),

                  Row(
                    mainAxisAlignment:
                    MainAxisAlignment.center,
                    children: List.generate(
                      5,
                          (index) {
                        return IconButton(
                          onPressed: () {
                            setStateDialog(() {
                              nota = index + 1;
                            });
                          },
                          icon: Icon(
                            index < nota
                                ? Icons.star
                                : Icons.star_border,
                            color: Colors.amber,
                          ),
                        );
                      },
                    ),
                  ),

                  const SizedBox(height: 10),

                  const TextField(
                    maxLines: 3,
                    decoration: InputDecoration(
                      hintText:
                      'Escreva um comentário...',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('CANCELAR'),
                ),
                ElevatedButton(
                  onPressed: nota == 0
                      ? null
                      : () {
                    Navigator.pop(context);

                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Avaliação de $nota estrelas enviada!',
                        ),
                      ),
                    );
                  },
                  child: const Text('ENVIAR'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final cuidador = widget.cuidador;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F7F5),

      appBar: AppBar(
        backgroundColor: AppBarStyles.corPrincipal,
        foregroundColor: Colors.white,

        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),

        title: const Row(
          children: [
            Icon(Icons.pets),
            SizedBox(width: 8),
            Text(
              'AmigoPet',
              style: AppBarStyles.titulo,
            ),
          ],
        ),

        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: _mostrarMaisOpcoes,
          ),
        ],
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(18),
        child: Column(
          children: [
            CircleAvatar(
              radius: 55,
              backgroundColor: const Color(0xFFE8F5E9),
              child: Text(
                cuidador.inicial,
                style: const TextStyle(
                  color: Color(0xFFB6EDFF),
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 12),

            Text(
              cuidador.nome,
              style: const TextStyle(
                fontSize: 27,
                fontWeight: FontWeight.bold,
              ),
            ),

            Text(
              '${cuidador.idade} anos • ${cuidador.especialidade}',
              style: TextStyle(
                color: Colors.grey.shade600,
              ),
            ),

            const SizedBox(height: 10),

            Row(
              mainAxisAlignment:
              MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                Text(
                  ' ${cuidador.avaliacao}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  ' (${cuidador.quantidadeAvaliacoes} avaliações)',
                ),
              ],
            ),

            const SizedBox(height: 20),

            _cardInformacao(
              titulo: 'Sobre o profissional',
              children: [
                Text(cuidador.descricao),
                const SizedBox(height: 12),
                Text(
                  cuidador.autonomo
                      ? 'Trabalha de forma autônoma'
                      : 'Trabalha em ${cuidador.localTrabalho}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),

            _cardInformacao(
              titulo: 'Contato',
              children: [
                Text('📧 ${cuidador.email}'),
                const SizedBox(height: 7),
                Text('📱 ${cuidador.telefone}'),
                const SizedBox(height: 7),
                Text('📸 ${cuidador.instagram}'),
              ],
            ),

            _cardInformacao(
              titulo: 'Serviços e preços',
              children: cuidador.servicos.map(
                    (servico) {
                  return ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: const Icon(
                      Icons.pets,
                      color: Color(0xFFB6EDFF),
                    ),
                    title: Text(
                      servico.nome,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      servico.duracao,
                    ),
                    trailing: Text(
                      'R\$ ${servico.preco.toStringAsFixed(2).replaceAll('.', ',')}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                },
              ).toList(),
            ),

            _cardInformacao(
              titulo: 'Experiência',
              children: [
                Text(
                  'Já cuidou de ${cuidador.animaisAtendidos} animais.',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 12),

                ...cuidador.animais.map(
                      (animal) => Padding(
                    padding:
                    const EdgeInsets.only(bottom: 7),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.pets,
                          size: 18,
                          color: Color(0xFFB6EDFF),
                        ),
                        const SizedBox(width: 8),
                        Text(animal),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            _cardInformacao(
              titulo: 'Avaliações',
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: 30,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      '${cuidador.avaliacao}',
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 12),

                const Text(
                  '“Muito cuidadosa e atenciosa com meu cachorro!”',
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                  ),
                ),

                const SizedBox(height: 6),

                Text(
                  '— Cliente AmigoPet',
                  style: TextStyle(
                    color: Colors.grey.shade600,
                  ),
                ),

                const SizedBox(height: 15),

                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton.icon(
                    onPressed: _mostrarAvaliacao,
                    icon: const Icon(Icons.star),
                    label: const Text(
                      'Avaliar este profissional',
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 5),

            // BOTÃO EXIGIDO
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: _mostrarTipoServico,
                icon: const Icon(Icons.pets),
                label: const Text(
                  'Tipo de serviço',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                  const Color(0xFFB6EDFF),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.all(16),
                ),
              ),
            ),

            const SizedBox(height: 10),

            // BOTÃO EXIGIDO
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: _cancelarAgendamento,
                icon: const Icon(Icons.cancel_outlined),
                label: const Text(
                  'Cancelar agendamento',
                ),
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.red,
                  padding: const EdgeInsets.all(16),
                ),
              ),
            ),

            const SizedBox(height: 10),

            // BOTÃO EXIGIDO
            SizedBox(
              width: double.infinity,
              child: TextButton.icon(
                onPressed: _mostrarMaisOpcoes,
                icon: const Icon(Icons.more_horiz),
                label: const Text(
                  'Mais opções',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _cardInformacao({
    required String titulo,
    required List<Widget> children,
  }) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(17),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 7,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment:
        CrossAxisAlignment.start,
        children: [
          Text(
            titulo,
            style: const TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          ...children,
        ],
      ),
    );
  }
}