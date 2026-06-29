import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/produto.dart';
import '../providers/produtos_provider.dart';

class NovoProdutoModal extends ConsumerStatefulWidget {
  const NovoProdutoModal({super.key});

  @override
  ConsumerState<NovoProdutoModal> createState() => _NovoProdutoModalState();
}

class _NovoProdutoModalState extends ConsumerState<NovoProdutoModal> {
  final _formKey = GlobalKey<FormState>();
  var _nomeInserido = '';
  var _precoInserido = 0.0;
  var _categoriaSelecionada = Categoria.cafes;
  DateTime? _dataSelecionada;

  void _abrirDatePicker() async {
    final agora = DateTime.now();
    final dataEscolhida = await showDatePicker(
      context: context,
      initialDate: agora,
      firstDate: DateTime(agora.year - 1),
      lastDate: agora,
    );
    setState(() {
      _dataSelecionada = dataEscolhida;
    });
  }

  void _submeterDados() {
    if (!_formKey.currentState!.validate() || _dataSelecionada == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Por favor, preencha todos os campos e a data!')),
      );
      return;
    }
    _formKey.currentState!.save();

    ref.read(produtosProvider.notifier).adicionarProduto(
      Produto(
        nome: _nomeInserido,
        preco: _precoInserido,
        imagemUrl: 'https://images.unsplash.com/photo-1541167760496-1628856ab772?w=400',
        categoria: _categoriaSelecionada,
        descricao: 'Novo item adicionado pelo gerenciamento administrativo.',
        dataLancamento: _dataSelecionada!,
      ),
    );

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 16,
        left: 16,
        right: 16,
        bottom: MediaQuery.of(context).viewInsets.bottom + 16,
      ),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              decoration: const InputDecoration(labelText: 'Nome do Produto'),
              validator: (v) => v == null || v.isEmpty ? 'Insira um nome válido' : null,
              onSaved: (v) => _nomeInserido = v!,
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Preço (R\$)'),
              keyboardType: TextInputType.number,
              validator: (v) => v == null || double.tryParse(v) == null || double.parse(v) <= 0 ? 'Insira um preço válido' : null,
              onSaved: (v) => _precoInserido = double.parse(v!),
            ),
            DropdownButtonFormField<Categoria>(
              value: _categoriaSelecionada,
              items: Categoria.values.map((cat) => DropdownMenuItem(value: cat, child: Text(cat.name.toUpperCase()))).toList(),
              onChanged: (value) => setState(() => _categoriaSelecionada = value!),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(_dataSelecionada == null ? 'Nenhuma data selecionada' : '${_dataSelecionada!.day}/${_dataSelecionada!.month}/${_dataSelecionada!.year}'),
                TextButton(onPressed: _abrirDatePicker, child: const Text('Escolher Data')),
              ],
            ),
            const SizedBox(height: 16),
            ElevatedButton(onPressed: _submeterDados, child: const Text('Cadastrar Produto')),
          ],
        ),
      ),
    );
  }
}