import 'package:flutter/material.dart';
import 'package:flutter_application_1/login.dart';
import 'package:flutter_application_1/formulario.dart';
import 'package:flutter_application_1/screen/auth_screen.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: AuthScreen()));
}




// void main() {
  
//   Imovel casa1 = Imovel("Casa em Ubatuba", 500000, "Rua Arlindo Silva, 551");
//   casa1.exibirInfo();
// }

// class Imovel {
//   String titulo;
//   double preco;
//   String endereco;

//   Imovel(this.titulo, this.preco, this.endereco);

//   void exibirInfo(){
//     print('${this.titulo} no endereço: ${this.endereco} valor: ${this.preco}');
//   }
// }

// class Casa extends Imovel{
//   bool quintal;
  
//   Casa(super.titulo, super.preco, super.endereco, this.quintal);
  
//   //polimorfismo
//   @override
//   void exibirInfo() {
//     String ver  = this.quintal ? "Tem quintal": "Não tem quintal";
//     print('${this.titulo} no endereço: ${this.endereco} valor: ${this.preco} $ver');
    
//   }
//}