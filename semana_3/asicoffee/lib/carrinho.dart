// carrinho.dart
import 'package:flutter/material.dart';
import 'produto.dart';

class TelaCarrinho extends StatefulWidget {
  const TelaCarrinho({super.key});

  @override
  State<TelaCarrinho> createState() => _TelaCarrinhoState();
}

class _TelaCarrinhoState extends State<TelaCarrinho> {
  @override
  Widget build(BuildContext context) {
    final itensNoCarrinho = cardapioCompleto.where((p) => p.quantidadeNoCarrinho > 0).toList();

    double valorTotalGeral = 0.0;
    for (var produto in itensNoCarrinho) {
      valorTotalGeral += (produto.preco * produto.quantidadeNoCarrinho);
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF4A2C11),
        foregroundColor: Colors.white,
        title: const Text('Meu Carrinho'),
      ),
      body: itensNoCarrinho.isEmpty
          ? const Center(
              child: Text(
                'Seu carrinho está vazio.\nAdicione itens no cardápio!',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: itensNoCarrinho.length,
                    itemBuilder: (context, index) {
                      final produto = itensNoCarrinho[index];
                      double subtotalItem = produto.preco * produto.quantidadeNoCarrinho;

                      return Card(
                        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        child: ListTile(
                          leading: ClipRRect(
                            borderRadius: BorderRadius.circular(4),
                            child: Image.network(produto.imagemUrl, width: 50, height: 50, fit: BoxFit.cover),
                          ),
                          title: Text(produto.nome, style: const TextStyle(fontWeight: FontWeight.bold)),
                          subtitle: Text('${produto.quantidadeNoCarrinho}x de R\$ ${produto.preco.toStringAsFixed(2)}'),
                          trailing: Text(
                            'R\$ ${subtotalItem.toStringAsFixed(2)}',
                            style: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF4A2C11)),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10, offset: const Offset(0, -2))],
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Total do Pedido:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                          Text(
                            'R\$ ${valorTotalGeral.toStringAsFixed(2)}',
                            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xFF4A2C11)),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF4A2C11),
                            foregroundColor: Colors.white,
                          ),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: const Text('Pedido Confirmado!'),
                                content: const Text('Seu pedido foi enviado com sucesso para a cozinha do AsiCoffee.'),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      for (var p in cardapioCompleto) {
                                        p.quantidadeNoCarrinho = 0;
                                      }
                                      Navigator.pop(context);
                                      Navigator.popUntil(context, (route) => route.isFirst);
                                    },
                                    child: const Text('OK'),
                                  ),
                                ],
                              ),
                            );
                          },
                          child: const Text('Finalizar Pedido', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}