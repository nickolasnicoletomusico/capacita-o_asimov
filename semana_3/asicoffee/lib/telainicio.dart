// telainicio.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'cardapio.dart';

class TelaCapa extends StatefulWidget {
  const TelaCapa({super.key});

  @override
  State<TelaCapa> createState() => _TelaCapaState();
}

class _TelaCapaState extends State<TelaCapa> {
  final TextEditingController _controleNome = TextEditingController();
  final TextEditingController _controleTelefone = TextEditingController();
  final _chaveFormulario = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDF8F5),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _chaveFormulario,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.coffee_rounded, size: 80, color: Color(0xFF4A2C11)),
                const SizedBox(height: 16),
                Text(
                  'Bem-vindo ao AsiCoffee',
                  style: GoogleFonts.lobster(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF4A2C11),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Insira seus dados abaixo para iniciar o seu pedido',
                  style: TextStyle(color: Colors.grey[600], fontSize: 14),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 32),
                TextFormField(
                  controller: _controleNome,
                  decoration: const InputDecoration(
                    labelText: 'Nome Completo',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.person),
                  ),
                  validator: (valor) {
                    if (valor == null || valor.trim().isEmpty) {
                      return 'Por favor, digite seu nome';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _controleTelefone,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    labelText: 'Telefone',
                    hintText: '(XX) XXXXX-XXXX',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.phone),
                  ),
                  validator: (valor) {
                    if (valor == null || valor.isEmpty) {
                      return 'Por favor, digite seu telefone';
                    }
                    final expressaoTelefone = RegExp(r'^\(\d{2}\) \d{5}-\d{4}$');
                    if (!expressaoTelefone.hasMatch(valor)) {
                      return 'Digite no formato correto: (XX) XXXXX-XXXX';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 32),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF4A2C11),
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () {
                      if (_chaveFormulario.currentState!.validate()) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TelaCardapio(nomeUsuario: _controleNome.text),
                          ),
                        );
                      }
                    },
                    child: const Text('Fazer Pedido', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}