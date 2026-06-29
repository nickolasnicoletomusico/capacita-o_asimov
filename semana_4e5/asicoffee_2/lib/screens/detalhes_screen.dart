import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/produtos_provider.dart';

class DetalhesScreen extends ConsumerWidget {
  final String produtoId;

  const DetalhesScreen({super.key, required this.produtoId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final produtos = ref.watch(produtosProvider);
    final produto = produtos.firstWhere((p) => p.id == produtoId);

    return Scaffold(
      appBar: AppBar(
        title: Text(produto.nome),
        actions: [
          IconButton(
            icon: Icon(produto.isFavorito ? Icons.favorite : Icons.favorite_border),
            color: produto.isFavorito ? Colors.red : null,
            onPressed: () {
              ref.read(produtosProvider.notifier).alternarFavorito(produto.id);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(produto.imagemUrl, width: double.infinity, height: 300, fit: BoxFit.cover),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('R\$ ${produto.preco.toStringAsFixed(2)}', style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.brown)),
                  const SizedBox(height: 16),
                  Text(produto.descricao, style: const TextStyle(fontSize: 16)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}