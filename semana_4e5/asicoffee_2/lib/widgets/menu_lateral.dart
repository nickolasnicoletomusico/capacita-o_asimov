import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/produtos_provider.dart';

class MenuLateral extends ConsumerWidget {
  const MenuLateral({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filtroAtivo = ref.watch(filtroProvider);

    return Drawer(
      child: Column(
        children: [
          AppBar(
            title: const Text('Filtros AsiCoffee'),
            automaticallyImplyLeading: false,
          ),
          RadioListTile<Filtro>(
            title: const Text('Mostrar Todos'),
            value: Filtro.todos,
            groupValue: filtroAtivo,
            onChanged: (value) => ref.read(filtroProvider.notifier).setFiltro(value!),
          ),
          RadioListTile<Filtro>(
            title: const Text('Apenas Cafés'),
            value: Filtro.apenasCafes,
            groupValue: filtroAtivo,
            onChanged: (value) => ref.read(filtroProvider.notifier).setFiltro(value!),
          ),
          RadioListTile<Filtro>(
            title: const Text('Apenas Salgados'),
            value: Filtro.apenasSalgados,
            groupValue: filtroAtivo,
            onChanged: (value) => ref.read(filtroProvider.notifier).setFiltro(value!),
          ),
          RadioListTile<Filtro>(
            title: const Text('Apenas Doces'),
            value: Filtro.apenasDoces,
            groupValue: filtroAtivo,
            onChanged: (value) => ref.read(filtroProvider.notifier).setFiltro(value!),
          ),
        ],
      ),
    );
  }
}