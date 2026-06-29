import 'package:uuid/uuid.dart';

const uuid = Uuid();

enum Categoria { cafes, salgados, doces }

class Produto {
  final String id;
  final String nome;
  final double preco;
  final String imagemUrl;
  final Categoria categoria;
  final String descricao;
  final DateTime dataLancamento;
  bool isFavorito;

  Produto({
    String? id,
    required this.nome,
    required this.preco,
    required this.imagemUrl,
    required this.categoria,
    required this.descricao,
    required this.dataLancamento,
    this.isFavorito = false,
  }) : id = id ?? uuid.v4();
}

final produtosIniciais = [
  Produto(
    nome: 'Espresso Tradicional',
    preco: 6.50,
    imagemUrl: 'https://images.unsplash.com/photo-1514432324607-a09d9b4aefdd?w=400',
    categoria: Categoria.cafes,
    descricao: 'Café expresso curto, sabor intenso e marcante.',
    dataLancamento: DateTime.now(),
  ),
  Produto(
    nome: 'Pão de Queijo Mineiro',
    preco: 4.50,
    imagemUrl: 'https://images.unsplash.com/photo-1590080875515-8a3a8dc5735e?w=400',
    categoria: Categoria.salgados,
    descricao: 'Tradicional pão de queijo feito com queijo canastra.',
    dataLancamento: DateTime.now(),
  ),
  Produto(
    nome: 'Bolo Red Velvet',
    preco: 14.90,
    imagemUrl: 'https://images.unsplash.com/photo-1586788680434-30d324b2d46f?w=400',
    categoria: Categoria.doces,
    descricao: 'Fatia clássica com massa aveludada e recheio de cream cheese.',
    dataLancamento: DateTime.now(),
  ),
];