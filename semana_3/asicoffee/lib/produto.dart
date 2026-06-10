// produto.dart

class Produto {
  final String nome;
  final double preco;
  final String imagemUrl;
  final String categoria;
  final String descricao; 
  bool isFavorito;
  int quantidadeNoCarrinho; 

  Produto({
    required this.nome,
    required this.preco,
    required this.imagemUrl,
    required this.categoria,
    required this.descricao,
    this.isFavorito = false,
    this.quantidadeNoCarrinho = 0, // carrinho começa zerado
  });
}

// Lista de produtos
List<Produto> cardapioCompleto = [
  // Cafes
  Produto(
    nome: 'Espresso Tradicional',
    preco: 6.50,
    imagemUrl: 'https://images.unsplash.com/photo-1514432324607-a09d9b4aefdd?w=400',
    categoria: 'Cafés',
    descricao: 'Café expresso curto, extraído sob alta pressão, sabor intenso e marcante.',
  ),
  Produto(
    nome: 'Cappuccino Italiano',
    preco: 9.90,
    imagemUrl: 'https://images.unsplash.com/photo-1534778101976-62847782c213?w=400',
    categoria: 'Cafés',
    descricao: 'Dose de expresso com leite vaporizado e uma camada cremosa de espuma de leite.',
  ),
  Produto(
    nome: 'Latte Macchiato',
    preco: 11.00,
    imagemUrl: 'https://images.unsplash.com/photo-1541167760496-1628856ab772?w=400',
    categoria: 'Cafés',
    descricao: 'Leite quente texturizado manchado com uma dose suave de café expresso.',
  ),
  
  Produto(
    nome: 'Mocha com Chocolate',
    preco: 12.50,
    imagemUrl: 'https://images.unsplash.com/photo-1578314675249-a6910f80cc4e?w=400',
    categoria: 'Cafés',
    descricao: 'Combinação perfeita de expresso, leite vaporizado e calda de chocolate belga.',
  ),
  Produto(
    nome: 'Iced Latte (Gelado)',
    preco: 12.00,
    imagemUrl: 'https://images.unsplash.com/photo-1517701604599-bb29b565090c?w=400',
    categoria: 'Cafés',
    descricao: 'Versão refrescante de café com leite servido com cubos de gelo.',
  ),
 
  Produto(
    nome: 'Café com Doce de Leite',
    preco: 11.50,
    imagemUrl: 'https://images.unsplash.com/photo-1536256263959-770b48d82b0a?w=400',
    categoria: 'Cafés',
    descricao: 'Expresso cremoso misturado com legítimo doce de leite cremoso nacional.',
  ),

  // SALGADOS
  Produto(
    nome: 'Croissant de Manteiga',
    preco: 8.00,
    imagemUrl: 'https://images.unsplash.com/photo-1555507036-ab1f4038808a?w=400',
    categoria: 'Salgados',
    descricao: 'Massa folhada francesa super leve, crocante por fora e macia por dentro.',
  ),
  Produto(
    nome: 'Coxinha de Frango',
    preco: 7.50,
    imagemUrl: 'https://images.unsplash.com/photo-1585435557343-3b092031a831?w=500',
    categoria: 'Salgados',
    descricao: 'Salgado frito com massa de batata, recheado com frango desfiado temperado.',
  ),
  Produto(
    nome: 'Empada de Palmito',
    preco: 7.00,
    imagemUrl: 'https://images.unsplash.com/photo-1608039755401-742074f0548d?w=500',
    categoria: 'Salgados',
    descricao: 'Massa podre que derrete na boca com recheio cremoso de palmito e ervas.',
  ),
  Produto(
    nome: 'Folhado de Presunto e Queijo',
    preco: 8.50,
    imagemUrl: 'https://images.unsplash.com/photo-1600891964599-f61ba0e24092?w=500',
    categoria: 'Salgados',
    descricao: 'Massa folhada crocante recheada com presunto cozido e queijo muçarela derretido.',
  ),
  Produto(
    nome: 'Pastel de Queijo ou Carne',
    preco: 6.50,
    imagemUrl: 'https://images.unsplash.com/photo-1600891964599-f61ba0e24092?w=500',
    categoria: 'Salgados',
    descricao: 'Pastel assado feito com massa leve, recheado com carne moída bem temperada.',
  ),
 
  Produto(
    nome: 'Enroladinho de Salsicha',
    preco: 5.50,
    imagemUrl: 'https://images.unsplash.com/photo-1544025162-d76694265947?w=400',
    categoria: 'Salgados',
    descricao: 'Massa de pão fofinha recheada com salsicha de primeira qualidade e gergelim.',
  ),
 
  Produto(
    nome: 'Panqueca de Morango',
    preco: 15.00,
    imagemUrl: 'https://images.unsplash.com/photo-1587314168485-3236d6710814?w=400',
    categoria: 'Salgados',
    descricao: 'Pão francês cortado ao meio, dourado na chapa com manteiga e saída de requeijão.',
  ),
];