import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/formulario.dart';
//import 'package:flutter_application_1/screen/home_screen.dart';
import 'package:flutter_application_1/screen/produtos_screen.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_application_1/services/auth_service.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  //============= variáveis e funções ==============
  final String url = "https://api.liliaborges.com.br/api/auth/login";
  final _email = TextEditingController();
  final _senha = TextEditingController();
  final prefs = SharedPreferences.getInstance();

  Future<void> salvarToken(token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
  }

  //Função assincrona, precisa aguardar a resposta async await
  bool _carregando = false;

  final _authService = AuthService();

  Future<void> _login() async {
    setState(() {
      //alterar estado da variável
      _carregando = true;
    });
    final token = await _authService.login(_email.text, _senha.text);
    setState(() {
      //alterar estado da variável
      _carregando = false;
    });
    if (token != '') {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => ProdutosScreen()),
      );
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Email ou senha incorretos")));
    }
  }

  //================================================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.deepPurple, Colors.deepPurple.shade200],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),

        child: Center(
          child: Padding(
            padding: EdgeInsetsGeometry.all(50),
            child: Card(
              elevation: 6,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20), //arredondar bordas
              ),
              child: Padding(
                padding: EdgeInsetsGeometry.all(24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      "images/shop.png",
                      width: 50,
                      height: 50,
                    ), //https://www.svgrepo.com/
                    SizedBox(height: 12),
                    Text(
                      "Entrar no MyShop",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    TextField(
                      controller: _email,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        label: Text("Email"),
                        prefixIcon: Icon(Icons.email_outlined),
                      ),
                    ),
                    SizedBox(height: 12),
                    TextField(
                      controller: _senha,
                      decoration: InputDecoration(
                        label: Text("Senha"),
                        prefixIcon: Icon(Icons.lock_outline),
                      ),
                      obscureText: true,
                    ),
                    SizedBox(height: 24),
                    SizedBox(
                      width: double.infinity,
                      child: FilledButton(
                        style: FilledButton.styleFrom(
                          backgroundColor: Colors.deepPurple,
                          padding: EdgeInsets.only(bottom: 16, top: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () => {_carregando ? null : _login()},
                        child: _carregando
                            ? CircularProgressIndicator()
                            : Text("Entrar"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
