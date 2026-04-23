import 'package:flutter/material.dart';

class Formulario extends StatefulWidget {
  const Formulario({super.key});

  @override
  State<Formulario> createState() => _FormularioState();
}

class _FormularioState extends State<Formulario> {
  //------------aqui vai estar as variaveis -------------------
  final _nomeController = TextEditingController();
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();
  final _descricaoController = TextEditingController();

  // bool _aceitaTermos = false;
  bool _politicaPrivacidade = false;
  double _sliderNumber = 0;
  String _opcao = "";
  bool _mostrarSenha = true;

  //----------------------------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //cabeçalho do app
      appBar: AppBar(
        title: Text("Formulario de validação"), //titulo do app
      ),
      body: SingleChildScrollView(
        //permitir rolagem da tela
        //padding espaçamento entre a borda e o conteudo
        child: Padding(
          padding: EdgeInsets.all(16), //espaçamento
          //formulario que vai conter todos os inputs
          child: Form(
            //alinhamento vertical
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //varios elementos(filhos)
                Center(
                  child: SizedBox(
                    width: 120,
                    height: 120,
                    child: Stack(
                      //caixa que permite sobreposição
                      alignment: Alignment.bottomCenter,
                      children: [
                        CircleAvatar(
                          //foto de usuario
                          backgroundColor: Colors.grey[300],
                          radius: 60,
                          backgroundImage: AssetImage(
                            "images/cat-avatar.png",
                          ), //imagem de fundo
                        ),
                        //container para estilizar fundo button
                        Container(
                          height: 60,
                          alignment: Alignment.topCenter,
                          decoration: BoxDecoration(
                            //classe recebe as config
                            color: const Color.fromARGB(181, 224, 224, 224),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(60),
                              bottomRight: Radius.circular(60),
                            ),
                          ),
                          child: //botao que abrira a galeria
                          TextButton(
                            onPressed: () {}, //acao do botao
                            child: Column(
                              //coluna que contera o icone e texto
                              children: [
                                Icon(Icons.camera_alt),
                                Text("Editar"),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ), //termina acao do avatar
                  ), //caixa
                ), //fim imagem
                const SizedBox(height: 24), //espacamento
                TextFormField(
                  //nome
                  controller: _nomeController,
                  validator: (valor) {
                    if (valor == null) {
                      return "Digite um nome válido";
                    }
                  },
                  decoration: InputDecoration(
                    labelText: "Nome",
                    prefixIcon: Icon(Icons.person),
                  ),
                ), //nome
                const SizedBox(height: 24),

                TextFormField(
                  //email
                  controller: _emailController,
                  validator: (valor) {
                    if (valor == null) {
                      return "Informe um email";
                    }
                    if (valor.contains("@")) {
                      return "Email invalido";
                    }
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: "Email",
                    prefixIcon: Icon(Icons.email),
                  ),
                ), //email
                const SizedBox(height: 24),

                TextFormField(
                  //senha
                  controller: _senhaController,
                  validator: (valor) {
                    if (valor == null) {
                      return "Informe uma senha";
                    }
                  },
                  obscureText: _mostrarSenha, //ocultar senha
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: "Senha",
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: IconButton(
                      onPressed: () => {
                        setState(() {
                          _mostrarSenha = !_mostrarSenha;
                        }),
                      },
                      icon: Icon(
                        _mostrarSenha ? Icons.visibility : Icons.visibility_off,
                      ),
                    ), //deixar o olha senha
                  ),
                ), //senha
                //textArea
                TextFormField(maxLines: 3),
                const SizedBox(height: 24),

                //necessita de variavel para mudar o value
                //serve para aceitar notificacao
                // Checkbox(
                //   value: false,
                //   onChanged: (valor) {},
                //   semanticLabel: "Aceitar termos",
                // ),
                // const SizedBox(height: 24),
                CheckboxListTile(
                  title: Text("Aceitar politicas de privacidade"),
                  value: _politicaPrivacidade,
                  onChanged: (v) {
                    setState(() {
                      _politicaPrivacidade =
                          v ??
                          false; //se valor for vdd ele recebe, se não ele é falso
                    });
                  },
                ),
                const SizedBox(height: 24),

                ///['Item 1', 'Item 2']
                DropdownButton(
                  items: [
                    DropdownMenuItem(value: "Turma A", child: Text("Turma A")),
                    DropdownMenuItem(value: "Turma B", child: Text("Turma B")),
                  ],
                  onChanged: (valor) {
                    setState(() {
                      _opcao = valor.toString(); //transforma o valor em string
                    });
                  },
                ),
                Text(_opcao),
                const SizedBox(height: 24),

                Slider(
                  value: _sliderNumber,
                  label: '$_sliderNumber', //mostra o número no slider
                  min: 0,
                  max: 10,
                  divisions: 10, //porcentagem 10 em 10%
                  onChanged: (valor) {
                    setState(() {
                      _sliderNumber = valor.toDouble();
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
