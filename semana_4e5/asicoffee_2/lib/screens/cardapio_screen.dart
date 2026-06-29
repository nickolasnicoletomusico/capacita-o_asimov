import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/produtos_provider.dart';
import 'detalhes_screen.dart';

class CardapioScreen extends ConsumerWidget {
  final bool mostrarApenasFavoritos;

  const CardapioScreen({super.key, required this.mostrarApenasFavoritos});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var produtos = ref.watch(produtosFiltradosProvider);

    if (mostrarApenasFavoritos) {
      produtos = produtos.where((p) => p.isFavorito).toList();
    }

    if (produtos.isEmpty) {
      return const Center(child: Text('Nenhum produto encontrado por aqui.'));
    }

    return ListView.builder(
      itemCount: produtos.length,
      itemBuilder: (ctx, index) {
        final produto = produtos[index];

        return Dismissible(
          key: ValueKey(produto.id),
          direction: DismissDirection.endToStart,
          background: Container(
            color: Colors.red,
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.only(right: 20),
            child: const Icon(Icons.delete, color: Colors.white),
          ),
          onDismissed: (direction) {
            ref.read(produtosProvider.notifier).removerProduto(produto.id);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('${produto.nome} foi removido.')),
            );
          },
          child: Card(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(produto.imagemUrl),
              ),
              title: Text(produto.nome),
              subtitle: Text('R\$ ${produto.preco.toStringAsFixed(2)}'),
              trailing: IconButton(
                icon: Icon(
                  produto.isFavorito ? Icons.favorite : Icons.favorite_border,
                  color: produto.isFavorito ? Colors.red : null,
                ),
                onPressed: () {
                  ref.read(produtosProvider.notifier).alternarFavorito(produto.id);
                },
              ),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (ctx) => DetalhesScreen(produtoId: produto.id),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}