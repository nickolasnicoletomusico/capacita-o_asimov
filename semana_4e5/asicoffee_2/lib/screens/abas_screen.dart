import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'cardapio_screen.dart';
import '../widgets/menu_lateral.dart';
import '../widgets/novo_produto_modal.dart';

class AbasScreen extends ConsumerStatefulWidget {
  const AbasScreen({super.key});

  @override
  ConsumerState<AbasScreen> createState() => _AbasScreenState();
}

class _AbasScreenState extends ConsumerState<AbasScreen> {
  int _abaSelecionadaIndex = 0;

  void _selecionarAba(int index) {
    setState(() {
      _abaSelecionadaIndex = index;
    });
  }

  void _abrirModalCadastro(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (ctx) => const NovoProdutoModal(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> telas = [
      const CardapioScreen(mostrarApenasFavoritos: false),
      const CardapioScreen(mostrarApenasFavoritos: true),
    ];

    final List<String> titulos = [
      'AsiCoffee - Cardápio',
      'Meus Favoritos',
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(titulos[_abaSelecionadaIndex]),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => _abrirModalCadastro(context),
          ),
        ],
      ),
      drawer: const MenuLateral(),
      body: telas[_abaSelecionadaIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _abaSelecionadaIndex,
        onTap: _selecionarAba,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.restaurant_menu),
            label: 'Cardápio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favoritos',
          ),
        ],
      ),
    );
  }
}