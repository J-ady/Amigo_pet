import 'servico.dart';

class Cuidador {
  final String nome;
  final int idade;
  final String especialidade;
  final double avaliacao;
  final int quantidadeAvaliacoes;
  final String distancia;
  final String descricao;
  final String inicial;
  final String cidade;
  final String email;
  final String telefone;
  final String instagram;
  final bool autonomo;
  final String localTrabalho;
  final int animaisAtendidos;
  final List<String> animais;
  final List<Servico> servicos;

  Cuidador({
    required this.nome,
    required this.idade,
    required this.especialidade,
    required this.avaliacao,
    required this.quantidadeAvaliacoes,
    required this.distancia,
    required this.descricao,
    required this.inicial,
    required this.cidade,
    required this.email,
    required this.telefone,
    required this.instagram,
    required this.autonomo,
    required this.localTrabalho,
    required this.animaisAtendidos,
    required this.animais,
    required this.servicos,
  });
}