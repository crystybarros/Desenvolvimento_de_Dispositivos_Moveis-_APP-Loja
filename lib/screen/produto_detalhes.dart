import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/produto.dart';
import 'dart:io';

class ProdutoDetalhes extends StatefulWidget {
  const ProdutoDetalhes({super.key, required this.id, required this.onVoltar});

  final int id;
  final VoidCallback onVoltar;

  @override
  State<ProdutoDetalhes> createState() => _ProdutoDetalhesState();
}

class _ProdutoDetalhesState extends State<ProdutoDetalhes> {
  late Produto produto;

  final List<Produto> produtos = [
    Produto(
      id: 1,
      nome: "Arroz Branco",
      descricao: "Pacote de 5kg de arroz branco",
      categoria: 1,
      imagem: "https://exemplo.com/arroz.png",
      marca: "Marca Boa",
      peso: "5kg",
      codigoBarras: "123456789",
    ),
    Produto(
      id: 2,
      nome: "Feijão Preto",
      descricao: "Pacote de 1kg de feijão preto",
      categoria: 1,
      imagem: "https://exemplo.com/feijao.png",
      marca: "Marca Forte",
      peso: "1kg",
      codigoBarras: "987654321",
    ),
  ];

  @override
  void initState() {
    super.initState();

    produto = produtos.firstWhere(
      (p) => p.id == widget.id,
      orElse: () => Produto(
        id: 0,
        nome: "Produto não encontrado",
        descricao: "Nenhuma informação disponível",
        categoria: 0,
        imagem: "",
        marca: "",
        peso: "",
        codigoBarras: "",
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(produto.nome),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: widget.onVoltar,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (produto.imagem.isNotEmpty)
              produto.imagem.startsWith('http')
                  ? Image.network(produto.imagem, height: 150)
                  : Image.file(File(produto.imagem), height: 150),

            const SizedBox(height: 16),

            Text("Descrição: ${produto.descricao}"),
            Text("Marca: ${produto.marca}"),
            Text("Peso: ${produto.peso}"),
            Text("Código de Barras: ${produto.codigoBarras}"),
          ],
        ),
      ),
    );
  }
}
