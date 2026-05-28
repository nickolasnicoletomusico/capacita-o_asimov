import 'item_biblioteca.dart'; 

class Livro extends ItemBiblioteca {
  String autor;
  String isbn; 

  Livro({
    required String titulo,
    required int anoPublicacao,
    required int quantidadeCopias,
    required this.autor,
    required this.isbn,
  }) : super(
          titulo: titulo,
          anoPublicacao: anoPublicacao,
          quantidadeCopias: quantidadeCopias,
          precoBase: 15.00,        // Custo base de R$15,00
          precoPorDiaAtraso: 2.50, // Multa de R$2,50/dia
        );

  @override
  void exibirDetalhes() {
    print('📚 [LIVRO] "$titulo" | Autor: $autor | ISBN: $isbn | Ano: $anoPublicacao | Estoque: $quantidadeCopias');
  }
}