import 'package:flutter/material.dart';

// st + enter cria o StatefulWidget automaticamente no VSCode

class Exibirdados extends StatefulWidget {
  final String nome;
  final String email;
  final String senha;
  final bool politica;
  final bool termos;
  final double slider;
  final String opcao;

  const Exibirdados({
    super.key,
    this.nome = "",
    this.email = "",
    this.senha = "",
    this.politica = false,
    this.termos = false,
    this.slider = 0,
    this.opcao = "",
  }); // deixar vazio "" para que as informações não sejam obrigatórias

  @override
  State<Exibirdados> createState() => _ExibirdadosState();
}

class _ExibirdadosState extends State<Exibirdados> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Dados Recebidos",
          style: TextStyle(color: Colors.blue, fontSize: 24),
        ),
        backgroundColor: Colors.amber,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Nome: ${widget.nome}"),
            Text("Email: ${widget.email}"),
            Text("Senha: ${widget.senha}"),
            Text("Política: ${widget.politica ? "Aceitou" : "Não aceitou"}"),
            Text("Termos: ${widget.termos ? "Aceitou" : "Não aceitou"}"),
            Text("Slider: ${widget.slider.toStringAsFixed(1)}"),
            Text("Opção escolhida: ${widget.opcao}"),
          ],
        ),
      ),
    );
  }
}
