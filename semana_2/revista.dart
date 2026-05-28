import 'item_biblioteca.dart'; 

class Revista extends ItemBiblioteca {
  int numeroEdicao;
  String mesPublicacao;

  Revista({
    required String titulo,
    required int anoPublicacao,
    required int quantidadeCopias,
    required this.numeroEdicao,
    required this.mesPublicacao,
  }) : super(
          titulo: titulo,
          anoPublicacao: anoPublicacao,
          quantidadeCopias: quantidadeCopias,
          precoBase: 5.00,         // Custo base de R$5,00
          precoPorDiaAtraso: 1.00, // Multa de R$1,00/dia
        );

  @override
  void exibirDetalhes() {
    print('📰 [REVISTA] "$titulo" | Edição: #$numeroEdicao | Mês: $mesPublicacao | Ano: $anoPublicacao | Estoque: $quantidadeCopias');
  }
}