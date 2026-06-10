// cardapio.dart
import 'package:flutter/material.dart';
import 'produto.dart';
import 'carrinho.dart';

class TelaCardapio extends StatefulWidget {
  final String nomeUsuario;
  const TelaCardapio({super.key, required this.nomeUsuario});

  @override
  State<TelaCardapio> createState() => _TelaCardapioState();
}

class _TelaCardapioState extends State<TelaCardapio> {
  bool apenasFavoritos = false;

  Widget _construirItemCardapio(Produto produto) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                produto.imagemUrl,
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(produto.nome, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 2),
                  Text(
                    produto.descricao,
                    style: TextStyle(fontSize: 11, color: Colors.grey[600]),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'R\$ ${produto.preco.toStringAsFixed(2)}',
                    style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Color(0xFF4A2C11)),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                IconButton(
                  icon: Icon(
                    produto.isFavorito ? Icons.favorite : Icons.favorite_border,
                    color: produto.isFavorito ? Colors.red : Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      produto.isFavorito = !produto.isFavorito;
                    });
                  },
                ),
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.remove_circle_outline, size: 20),
                      onPressed: produto.quantidadeNoCarrinho > 0
                          ? () {
                              setState(() {
                                produto.quantidadeNoCarrinho--;
                              });
                            }
                          : null,
                    ),
                    Text('${produto.quantidadeNoCarrinho}', style: const TextStyle(fontWeight: FontWeight.bold)),
                    IconButton(
                      icon: const Icon(Icons.add_circle_outline, size: 20),
                      onPressed: () {
                        setState(() {
                          produto.quantidadeNoCarrinho++;
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final cafes = cardapioCompleto
        .where((p) => p.categoria == 'Cafés' && (!apenasFavoritos || p.isFavorito))
        .toList();

    final salgados = cardapioCompleto
        .where((p) => p.categoria == 'Salgados' && (!apenasFavoritos || p.isFavorito))
        .toList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF4A2C11),
        foregroundColor: Colors.white,
        title: Text('Olá, ${widget.nomeUsuario}', style: const TextStyle(fontSize: 18)),
        actions: [
          IconButton(
            icon: Icon(apenasFavoritos ? Icons.favorite : Icons.favorite_border),
            onPressed: () {
              setState(() {
                apenasFavoritos = !apenasFavoritos;
              });
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (cafes.isNotEmpty)
              const Padding(
                padding: EdgeInsets.all(12.0),
                child: Text('Nossos Cafés', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: cafes.length,
              itemBuilder: (context, index) => _construirItemCardapio(cafes[index]),
            ),
            if (salgados.isNotEmpty)
              const Padding(
                padding: EdgeInsets.all(12.0),
                child: Text('Salgados', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: salgados.length,
              itemBuilder: (context, index) => _construirItemCardapio(salgados[index]),
            ),
            const SizedBox(height: 80), 
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: const Color(0xFF4A2C11),
        foregroundColor: Colors.white,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const TelaCarrinho()),
          ).then((value) => setState(() {}));
        },
        label: const Text('Ver meu Carrinho'),
      ),
    );
  }
}