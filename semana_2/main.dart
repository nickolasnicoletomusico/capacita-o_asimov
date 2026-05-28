import 'dart:io';
import 'item_biblioteca.dart'; 
import 'livro.dart';           
import 'revista.dart';         

void main() {
  print('UNIFEI - SISTEMA DE GESTÃO BIBLIOTECÁRIA');

  // Cadastro
  stdout.write('Digite seu nome para acessar o sistema: ');
  String nomeUsuario = stdin.readLineSync() ?? 'Usuário';

  stdout.write('Digite seu telefone: ');
  String telefoneUsuario = stdin.readLineSync() ?? 'Não informado';

  stdout.write('Digite seu CPF: ');
  String cpfUsuario = stdin.readLineSync() ?? 'Não informado';

  print('\nOlá, $nomeUsuario! Cadastro realizado com sucesso.');
  print(' Tel: $telefoneUsuario |  CPF: $cpfUsuario\n');

  // Livros e revistas
  List<ItemBiblioteca> acervo = [
    Livro(titulo: 'Motores de Combustão Interna', anoPublicacao: 2013, quantidadeCopias: 2, autor: 'Franco Brunetti', isbn: '9788521207436'),
    Livro(titulo: 'Fundamentos da Engenharia Automotiva', anoPublicacao: 2008, quantidadeCopias: 1, autor: 'Heisler Heinz', isbn: '9788521204398'),
    Livro(titulo: 'Dinâmica dos Veículos Automotores', anoPublicacao: 2014, quantidadeCopias: 3, autor: 'Thomas D. Gillespie', isbn: '9788535277129'),
    Livro(titulo: 'Projetos de Motores a Combustão', anoPublicacao: 2021, quantidadeCopias: 2, autor: 'John B. Heywood', isbn: '9780070286375'),
    Livro(titulo: 'Sistemas de Exaustão e Admissão de Alta Performance', anoPublicacao: 2012, quantidadeCopias: 1, autor: 'Philip Smith', isbn: '9780837617022'),
     
    Revista(titulo: 'Quatro Rodas', anoPublicacao: 2024, quantidadeCopias: 2, numeroEdicao: 780, mesPublicacao: 'Dezembro'),
    Revista(titulo: 'Car and Driver Brasil', anoPublicacao: 2018, quantidadeCopias: 4, numeroEdicao: 120, mesPublicacao: 'Agosto'),
    Revista(titulo: 'Racecar Engineering', anoPublicacao: 2015, quantidadeCopias: 1, numeroEdicao: 354, mesPublicacao: 'Novembro'),
    Revista(titulo: 'Fullpower', anoPublicacao: 2021, quantidadeCopias: 3, numeroEdicao: 205, mesPublicacao: 'Março'),
    Revista(titulo: 'Revista AutoEsporte', anoPublicacao: 2009, quantidadeCopias: 5, numeroEdicao: 712, mesPublicacao: 'Fevereiro'),
  ];

  List<ItemBiblioteca> meusItensEmprestados = [];

  bool rodando = true;
  while (rodando) {
    print('\n               MENU PRINCIPAL                 ');
    print('1. Listar Estoque da Biblioteca ');
    print('2. Pegar Item Emprestado ');
    print('3. Devolver Item ');
    print('4. Sair do Sistema');
    stdout.write('  Escolha uma opção (1-4): ');
    String opcao = stdin.readLineSync() ?? '';

    // OPÇÃO 1: Listar estoque completo
    if (opcao == '1') {
      print('\n    ESTOQUE COMPLETO ');
      for (var item in acervo) {
        item.exibirDetalhes(); 
      }
    }

    // OPÇÃO 2: Empréstimo
    else if (opcao == '2') {
      print('\n    SOLICITAR EMPRÉSTIMO    ');
      
      // Listar itens disponíveis
      for (int i = 0; i < acervo.length; i++) {
        print('ID [$i] - ${acervo[i].titulo} (Cópias: ${acervo[i].quantidadeCopias})');
      }
      
      stdout.write('  Digite o número ID do item que deseja: ');
      String entradaId = stdin.readLineSync() ?? '';
      int id = int.tryParse(entradaId) ?? -1;

      if (id >= 0 && id < acervo.length) {
        var itemEscolhido = acervo[id];
        
        if (itemEscolhido.emprestar()) {
          meusItensEmprestados.add(itemEscolhido);
          print('  Sucesso! "${itemEscolhido.titulo}" foi retirado da biblioteca.');
        } else {
          print('  Indisponível: Não há cópias de "${itemEscolhido.titulo}" em estoque!');
        }
      } else {
        print('  ID inválido!');
      }
    }

    // OPÇÃO 3: Devolução
    else if (opcao == '3') {
      print('\n   PROCESSAR DEVOLUÇÃO    ');
      if (meusItensEmprestados.isEmpty) {
        print('Você não possui nenhum item emprestado no momento.');
        continue;
      }

      print('Seus itens sob posse atual:');
      for (int i = 0; i < meusItensEmprestados.length; i++) {
        print(' [$i] ${meusItensEmprestados[i].titulo}');
      }

      stdout.write('  Digite o número do item que vai devolver: ');
      String entradaDev = stdin.readLineSync() ?? '';
      int idDevolucao = int.tryParse(entradaDev) ?? -1;

      if (idDevolucao >= 0 && idDevolucao < meusItensEmprestados.length) {
        var itemParaDevolver = meusItensEmprestados[idDevolucao];

        stdout.write('  Quantos dias de atraso teve essa devolução? (Digite 0 se não atrasou): ');
        String entradaDias = stdin.readLineSync() ?? '0';
        int diasAtraso = int.tryParse(entradaDias) ?? 0;

        double valorCobrado = itemParaDevolver.calcularCusto(diasAtraso);

        // Atualiza o acervo e remove da lista de itens emprestados
        itemParaDevolver.devolver();
        meusItensEmprestados.removeAt(idDevolucao);

        print('\n  RECIBO DE DEVOLUÇÃO EMITIDO:');
        itemParaDevolver.exibirDetalhes(); 
        print('      Dias em atraso: $diasAtraso dia(s)');
        print('      Valor total a pagar: R\$ ${valorCobrado.toStringAsFixed(2)}');
      } else {
        print(' Opção inválida!');
      }
    }

    // OPÇÃO 4: Sair do sistema 
    else if (opcao == '4') {
      print('\nEncerrando sessão. Até logo, $nomeUsuario!');
      rodando = false;
    }

    else {
      print('Comando inválido!');
    }
  }
}