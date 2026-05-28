abstract class ItemBiblioteca {
  String titulo;
  int anoPublicacao;
  int quantidadeCopias;
  double precoBase;
  double precoPorDiaAtraso;

  ItemBiblioteca({
    required this.titulo,
    required this.anoPublicacao,
    required this.quantidadeCopias,
    required this.precoBase,
    required this.precoPorDiaAtraso,
  });

  // Empréstimo
  bool emprestar() {
    if (quantidadeCopias > 0) {
      quantidadeCopias = quantidadeCopias - 1;
      return true;
    }
    return false;
  }

  // Devolução
  void devolver() {
    quantidadeCopias = quantidadeCopias + 1;
  }

  // Custo (Preço base + dias de atraso * multa) 
  double calcularCusto(int diasAtraso) {
    return precoBase + (diasAtraso * precoPorDiaAtraso);
  }

  // Detalhes
  void exibirDetalhes();
}