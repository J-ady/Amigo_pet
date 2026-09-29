import 'package:flutter/material.dart';

import '../models/cuidador.dart';
import '../models/servico.dart';
import '../styles/appbar_styles.dart';
import '../styles/drawer_styles.dart';
import 'detalhes_cuidador.dart';
import 'agendamentos.dart';

class CuidadoresPage extends StatefulWidget {
  const CuidadoresPage({super.key});

  @override
  State<CuidadoresPage> createState() =>
      _CuidadoresPageState();
}

class _CuidadoresPageState
    extends State<CuidadoresPage> {

  final List<Cuidador> cuidadores = [
    Cuidador(
      nome: 'Ana Silva',
      idade: 29,
      especialidade: 'Cães e passeios',
      avaliacao: 4.9,
      quantidadeAvaliacoes: 127,
      distancia: '0,8 km',
      cidade: 'São Paulo',
      inicial: 'A',
      email: 'ana@amigopet.com',
      telefone: '(11) 99999-1111',
      instagram: '@anasilvapets',
      autonomo: true,
      localTrabalho: 'Atendimento autônomo',
      animaisAtendidos: 86,
      animais: [
        'Thor - Golden Retriever',
        'Luna - Shih-tzu',
        'Mel - Poodle',
        'Max - Labrador',
      ],
      descricao:
      'Cuidadora apaixonada por animais, especializada em passeios, cuidados diários e hospedagem.',
      servicos: [
        Servico(
          nome: 'Passeio',
          preco: 35,
          duracao: '1 hora',
        ),
        Servico(
          nome: 'Hospedagem',
          preco: 90,
          duracao: '24 horas',
        ),
        Servico(
          nome: 'Banho e tosa',
          preco: 80,
          duracao: '1h30',
        ),
      ],
    ),

    Cuidador(
      nome: 'Carlos Oliveira',
      idade: 34,
      especialidade: 'Cães e gatos',
      avaliacao: 4.8,
      quantidadeAvaliacoes: 98,
      distancia: '1,2 km',
      cidade: 'São Paulo',
      inicial: 'C',
      email: 'carlos@amigopet.com',
      telefone: '(11) 98888-2222',
      instagram: '@carlos.pet',
      autonomo: false,
      localTrabalho: 'Pet Shop Amigo Animal',
      animaisAtendidos: 143,
      animais: [
        'Bob - Labrador',
        'Mia - Gato',
        'Nina - Poodle',
      ],
      descricao:
      'Profissional especializado em cães e gatos, com experiência em hospedagem e banho.',
      servicos: [
        Servico(
          nome: 'Passeio',
          preco: 40,
          duracao: '1 hora',
        ),
        Servico(
          nome: 'Hospedagem',
          preco: 100,
          duracao: '24 horas',
        ),
        Servico(
          nome: 'Banho e tosa',
          preco: 75,
          duracao: '1h20',
        ),
      ],
    ),

    Cuidador(
      nome: 'Mariana Costa',
      idade: 27,
      especialidade: 'Gatos e hospedagem',
      avaliacao: 4.7,
      quantidadeAvaliacoes: 84,
      distancia: '1,5 km',
      cidade: 'São Paulo',
      inicial: 'M',
      email: 'mariana@amigopet.com',
      telefone: '(11) 97777-3333',
      instagram: '@marianacats',
      autonomo: true,
      localTrabalho: 'Atendimento autônomo',
      animaisAtendidos: 71,
      animais: [
        'Luna - Persa',
        'Simba - Siamês',
        'Nala - SRD',
      ],
      descricao:
      'Especialista em gatos e cuidados durante viagens e períodos prolongados.',
      servicos: [
        Servico(
          nome: 'Hospedagem',
          preco: 85,
          duracao: '24 horas',
        ),
        Servico(
          nome: 'Banho e tosa',
          preco: 70,
          duracao: '1h30',
        ),
      ],
    ),

    Cuidador(
      nome: 'João Santos',
      idade: 31,
      especialidade: 'Passeios e banho',
      avaliacao: 4.6,
      quantidadeAvaliacoes: 65,
      distancia: '2,0 km',
      cidade: 'São Paulo',
      inicial: 'J',
      email: 'joao@amigopet.com',
      telefone: '(11) 96666-4444',
      instagram: '@joaopets',
      autonomo: false,
      localTrabalho: 'Pet Shop Patinhas',
      animaisAtendidos: 92,
      animais: [
        'Rex - Pastor Alemão',
        'Mel - Beagle',
        'Toby - Yorkshire',
      ],
      descricao:
      'Profissional que trabalha com passeios, banho e cuidados básicos.',
      servicos: [
        Servico(
          nome: 'Passeio',
          preco: 30,
          duracao: '50 minutos',
        ),
        Servico(
          nome: 'Banho e tosa',
          preco: 65,
          duracao: '1h20',
        ),
      ],
    ),

    Cuidador(
      nome: 'Beatriz Lima',
      idade: 36,
      especialidade: 'Cães e gatos',
      avaliacao: 4.9,
      quantidadeAvaliacoes: 154,
      distancia: '2,3 km',
      cidade: 'São Paulo',
      inicial: 'B',
      email: 'beatriz@amigopet.com',
      telefone: '(11) 95555-5555',
      instagram: '@beatrizpets',
      autonomo: true,
      localTrabalho: 'Atendimento autônomo',
      animaisAtendidos: 187,
      animais: [
        'Max - Labrador',
        'Lola - Pug',
        'Mel - Golden Retriever',
        'Nino - Gato',
      ],
      descricao:
      'Cuidadora experiente em passeios, hospedagem e cuidados especiais.',
      servicos: [
        Servico(
          nome: 'Passeio',
          preco: 38,
          duracao: '1 hora',
        ),
        Servico(
          nome: 'Hospedagem',
          preco: 95,
          duracao: '24 horas',
        ),
        Servico(
          nome: 'Banho e tosa',
          preco: 85,
          duracao: '1h30',
        ),
      ],
    ),
  ];

  String filtroAtual = 'Mais próximos';

  void ordenar(String filtro) {
    setState(() {
      filtroAtual = filtro;

      if (filtro == 'Mais próximos') {
        cuidadores.sort(
              (a, b) => _distancia(a).compareTo(_distancia(b)),
        );
      } else {
        cuidadores.sort(
              (a, b) =>
              b.avaliacao.compareTo(a.avaliacao),
        );
      }
    });
  }

  double _distancia(Cuidador cuidador) {
    return double.parse(
      cuidador.distancia
          .replaceAll(' km', '')
          .replaceAll(',', '.'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFEE7C5),

      appBar: AppBar(
        backgroundColor: AppBarStyles.azulEscuro,

        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(
                Icons.menu_rounded,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),

        title: const Row(
          children: [
            Icon(
              Icons.pets_rounded,
              color: Color(0xFF04CAEF),
            ),
            SizedBox(width: 8),
            Text(
              'AmigoPet',
              style: AppBarStyles.titulo,
            ),
          ],
        ),

        actions: [
          PopupMenuButton<String>(
            icon: const Icon(
              Icons.tune_rounded,
            ),
            onSelected: ordenar,
            itemBuilder: (context) {
              return const [
                PopupMenuItem(
                  value: 'Mais próximos',
                  child: Text(
                    'Mais próximos',
                  ),
                ),
                PopupMenuItem(
                  value: 'Melhor avaliados',
                  child: Text(
                    'Melhor avaliados',
                  ),
                ),
              ];
            },
          ),
        ],
      ),

      drawer: _criarDrawer(),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(
            18,
            20,
            18,
            0,
          ),
          child: Column(
            crossAxisAlignment:
            CrossAxisAlignment.start,
            children: [
              _cabecalho(),

              const SizedBox(height: 20),

              Row(
                children: [
                  const Text(
                    'Profissionais',
                    style: TextStyle(
                      color: Color(0xFF00428E),
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const Spacer(),

                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 7,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFB6EDFF),
                      borderRadius:
                      BorderRadius.circular(20),
                    ),
                    child: Text(
                      '${cuidadores.length} disponíveis',
                      style: const TextStyle(
                        color: Color(0xFF00428E),
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 5),

              Text(
                'Ordenado por $filtroAtual',
                style: TextStyle(
                  color: Colors.grey.shade700,
                  fontSize: 13,
                ),
              ),

              const SizedBox(height: 14),

              Expanded(
                child: ListView.builder(
                  physics:
                  const BouncingScrollPhysics(),
                  itemCount: cuidadores.length,
                  itemBuilder: (context, index) {
                    return _cardCuidador(
                      cuidadores[index],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _cabecalho() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xFF00428E),
            Color(0xFF057ED9),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(26),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF00428E)
                .withOpacity(0.20),
            blurRadius: 16,
            offset: const Offset(0, 7),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment:
              CrossAxisAlignment.start,
              children: [
                const Text(
                  'Seu pet em boas mãos 🐾',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 8),

                Text(
                  'Encontre cuidadores de confiança '
                      'para cuidar de quem você ama.',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.88),
                    fontSize: 14,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: 10),

          Container(
            width: 58,
            height: 58,
            decoration: BoxDecoration(
              color: const Color(0xFF04CAEF),
              borderRadius:
              BorderRadius.circular(18),
            ),
            child: const Icon(
              Icons.pets_rounded,
              color: Colors.white,
              size: 31,
            ),
          ),
        ],
      ),
    );
  }

  Widget _cardCuidador(
      Cuidador cuidador,
      ) {
    final menorPreco = cuidador.servicos
        .map((servico) => servico.preco)
        .reduce((a, b) => a < b ? a : b);

    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(23),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF00428E)
                .withOpacity(0.07),
            blurRadius: 12,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(23),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  DetalhesCuidadorPage(
                    cuidador: cuidador,
                  ),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 64,
                    height: 64,
                    decoration: BoxDecoration(
                      gradient:
                      const LinearGradient(
                        colors: [
                          Color(0xFF057ED9),
                          Color(0xFF04CAEF),
                        ],
                      ),
                      borderRadius:
                      BorderRadius.circular(19),
                    ),
                    child: Center(
                      child: Text(
                        cuidador.inicial,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 27,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(width: 14),

                  Expanded(
                    child: Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                cuidador.nome,
                                style: const TextStyle(
                                  color:
                                  Color(0xFF00428E),
                                  fontSize: 18,
                                  fontWeight:
                                  FontWeight.bold,
                                ),
                              ),
                            ),

                            const Icon(
                              Icons.verified_rounded,
                              color: Color(0xFF04CAEF),
                              size: 19,
                            ),
                          ],
                        ),

                        const SizedBox(height: 4),

                        Text(
                          cuidador.especialidade,
                          style: TextStyle(
                            color:
                            Colors.grey.shade600,
                          ),
                        ),

                        const SizedBox(height: 7),

                        Row(
                          children: [
                            const Icon(
                              Icons.star_rounded,
                              color:
                              Color(0xFFFEBE74),
                              size: 18,
                            ),
                            const SizedBox(width: 3),
                            Text(
                              '${cuidador.avaliacao}',
                              style: const TextStyle(
                                fontWeight:
                                FontWeight.bold,
                              ),
                            ),
                            Text(
                              ' (${cuidador.quantidadeAvaliacoes})',
                              style: TextStyle(
                                color: Colors
                                    .grey
                                    .shade600,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  const Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Color(0xFF057ED9),
                    size: 18,
                  ),
                ],
              ),

              const SizedBox(height: 15),

              Wrap(
                spacing: 7,
                runSpacing: 7,
                children: [
                  _badge(
                    Icons.location_on_rounded,
                    cuidador.distancia,
                    const Color(0xFFB6EDFF),
                    const Color(0xFF00428E),
                  ),

                  _badge(
                    cuidador.autonomo
                        ? Icons.person_rounded
                        : Icons.store_rounded,
                    cuidador.autonomo
                        ? 'Autônomo'
                        : 'Pet Shop',
                    const Color(0xFFFFDBBB),
                    const Color(0xFF8A4D00),
                  ),

                  _badge(
                    Icons.pets_rounded,
                    '${cuidador.animaisAtendidos} pets',
                    const Color(0xFFFEE7C5),
                    const Color(0xFF8A4D00),
                  ),
                ],
              ),

              const SizedBox(height: 15),

              Container(
                padding: const EdgeInsets.all(13),
                decoration: BoxDecoration(
                  color: const Color(0xFFF5FBFF),
                  borderRadius:
                  BorderRadius.circular(15),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.payments_outlined,
                      color: Color(0xFF057ED9),
                    ),

                    const SizedBox(width: 8),

                    const Text(
                      'A partir de ',
                      style: TextStyle(
                        color: Color(0xFF00428E),
                      ),
                    ),

                    Text(
                      'R\$ ${menorPreco.toStringAsFixed(2).replaceAll('.', ',')}',
                      style: const TextStyle(
                        color: Color(0xFF00428E),
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const Spacer(),

                    const Text(
                      'Ver perfil',
                      style: TextStyle(
                        color: Color(0xFF057ED9),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _badge(
      IconData icon,
      String texto,
      Color fundo,
      Color textoCor,
      ) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 7,
      ),
      decoration: BoxDecoration(
        color: fundo,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 14,
            color: textoCor,
          ),
          const SizedBox(width: 5),
          Text(
            texto,
            style: TextStyle(
              color: textoCor,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _criarDrawer() {
    return Drawer(
      backgroundColor: Colors.white,
      child: Column(
        children: [
          Container(
            height: 225,
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(
              24,
              50,
              24,
              22,
            ),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF00428E),
                  Color(0xFF057ED9),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(35),
              ),
            ),
            child: Column(
              crossAxisAlignment:
              CrossAxisAlignment.start,
              children: [
                Container(
                  width: 58,
                  height: 58,
                  decoration: BoxDecoration(
                    color: const Color(0xFF04CAEF),
                    borderRadius:
                    BorderRadius.circular(18),
                  ),
                  child: const Icon(
                    Icons.pets_rounded,
                    color: Colors.white,
                    size: 32,
                  ),
                ),

                const SizedBox(height: 13),

                const Text(
                  'AmigoPet',
                  style: DrawerStyles.titulo,
                ),

                const SizedBox(height: 2),

                const Text(
                  'Cuidando de quem você ama.',
                  style: DrawerStyles.subtitulo,
                ),
              ],
            ),
          ),

          const SizedBox(height: 12),

          _drawerItem(
            Icons.people_alt_rounded,
            'Cuidadores',
            true,
                () {
              Navigator.pop(context);
            },
          ),

          _drawerItem(
            Icons.calendar_month_rounded,
            'Meus agendamentos',
            false,
                () {
              Navigator.pop(context);

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                  const AgendamentosPage(),
                ),
              );
            },
          ),

          _drawerItem(
            Icons.settings_rounded,
            'Configurações',
            false,
                () {
              Navigator.pop(context);

              ScaffoldMessenger.of(context)
                  .showSnackBar(
                const SnackBar(
                  content: Text(
                    'Configurações em desenvolvimento.',
                  ),
                ),
              );
            },
          ),

          _drawerItem(
            Icons.help_outline_rounded,
            'Ajuda',
            false,
                () {
              Navigator.pop(context);
            },
          ),

          const Spacer(),

          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              'AmigoPet • versão 1.0',
              style: TextStyle(
                color: Colors.grey.shade500,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _drawerItem(
      IconData icon,
      String titulo,
      bool selecionado,
      VoidCallback onTap,
      ) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 3,
      ),
      decoration: BoxDecoration(
        color: selecionado
            ? const Color(0xFFB6EDFF)
            : Colors.transparent,
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListTile(
        leading: Icon(
          icon,
          color: selecionado
              ? const Color(0xFF00428E)
              : Colors.grey.shade600,
        ),
        title: Text(
          titulo,
          style: TextStyle(
            color: selecionado
                ? const Color(0xFF00428E)
                : Colors.grey.shade800,
            fontWeight: selecionado
                ? FontWeight.bold
                : FontWeight.w500,
          ),
        ),
        onTap: onTap,
      ),
    );
  }
}