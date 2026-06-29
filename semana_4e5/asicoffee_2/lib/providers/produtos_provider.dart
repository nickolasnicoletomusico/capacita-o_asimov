import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:asicoffee_2/models/produto.dart';

class ProdutosNotifier extends StateNotifier<List<Produto>> {
  ProdutosNotifier() : super(produtosIniciais);

  void adicionarProduto(Produto novoProduto) {
    state = [...state, novoProduto];
  }

  void removerProduto(String id) {
    state = [
      for (final p in state)
        if (p.id != id) p,
    ];
  }

  void alternarFavorito(String id) {
    state = [
      for (final p in state)
        if (p.id == id)
          Produto(
            id: p.id,
            nome: p.nome,
            preco: p.preco,
            imagemUrl: p.imagemUrl,
            categoria: p.categoria,
            descricao: p.descricao,
            dataLancamento: p.dataLancamento,
            isFavorito: !p.isFavorito,
          )
        else
          p,
    ];
  }
}

final produtosProvider = StateNotifierProvider<ProdutosNotifier, List<Produto>>((ref) {
  return ProdutosNotifier();
});

enum Filtro { todos, apenasCafes, apenasSalgados, apenasDoces }

class FiltroNotifier extends StateNotifier<Filtro> {
  FiltroNotifier() : super(Filtro.todos);

  void setFiltro(Filtro novoFiltro) {
    state = novoFiltro;
  }
}

final filtroProvider = StateNotifierProvider<FiltroNotifier, Filtro>((ref) {
  return FiltroNotifier();
});

final produtosFiltradosProvider = Provider<List<Produto>>((ref) {
  final listaCompleta = ref.watch(produtosProvider);
  final filtroAtivo = ref.watch(filtroProvider);

  if (filtroAtivo == Filtro.apenasCafes) {
    return listaCompleta.where((p) => p.categoria == Categoria.cafes).toList();
  }
  if (filtroAtivo == Filtro.apenasSalgados) {
    return listaCompleta.where((p) => p.categoria == Categoria.salgados).toList();
  }
  if (filtroAtivo == Filtro.apenasDoces) {
    return listaCompleta.where((p) => p.categoria == Categoria.doces).toList();
  }
  return listaCompleta;
});