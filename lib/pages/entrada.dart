import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nomundodasluas_v7/classes/LeAuth.dart';
import 'package:nomundodasluas_v7/classes/rowAppBar.dart';
import 'package:nomundodasluas_v7/pages/principal.dart';

class Entrada extends StatefulWidget {
  @override
  _EntradaState createState() => _EntradaState();
}

class _EntradaState extends State<Entrada> {
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();

  LeAuth leAuth = LeAuth('email@email', '1234567', '');

  //Controladores

  TextEditingController _controllerEmail = TextEditingController(text: "");

  String _mensagemErro = "";
  String _autoriza = '';

  verificaEmail() async {
    //Recupera dados dos campos
    String email = _controllerEmail.text;

    if (email.isNotEmpty && email.contains("@")) {
      _mensagemErro = "";
      var autoriza = await leAuth.getAccessAuth(
          _controllerEmail.text.toLowerCase(), '1234567');
      _autoriza = autoriza.toString();
      print('função =  $_autoriza');
      if (_autoriza == 'autorizado') {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return Principal(email);
        }));
      } else {
        {
          setState(() {
            _mensagemErro = 'nao autorizou $_autoriza .';
          });
        }
      }
    } else {
      setState(() {
        _mensagemErro = "Preencha o E-mail utilizando @";
      });
    }
  }

  void initState() {}

  @override
  Widget build(BuildContext context) {
    final widthlua = MediaQuery.of(context).size.width;
    final heightlua = MediaQuery.of(context).size.height;
    bool portrait = (heightlua > widthlua);
    double fontAdj = portrait
        ? sqrt(heightlua) / (heightlua / widthlua)
        : sqrt(heightlua) / (widthlua / heightlua);
    double horizonte = ((widthlua > 1400)
        ? widthlua * 0.25
        : (widthlua > 1200)
            ? widthlua * 0.20
            : (widthlua > 1000)
                ? widthlua * 0.15
                : (widthlua > 800)
                    ? widthlua * 0.10
                    : (widthlua > 600)
                        ? widthlua * 0.05
                        : 0);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: RowAppBarr('Usuario Cadastrado', widthlua, heightlua, '', ''),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/fundodatas.png"),
            fit: BoxFit.cover,
          ),
        ),
        padding: EdgeInsets.all(16),
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 0, horizontal: horizonte),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(
                    flex: 5,
                    child: Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/images/logo.png'),
                                fit: BoxFit.fitWidth)),
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          "Entrar com e-mail cadastrado. ",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white, fontSize: fontAdj * 0.7),
                        ))),
                Expanded(
                    flex: 1,
                    child: Container(
                      alignment: Alignment.center,
                      child: TextField(
                        controller: _controllerEmail,
                        keyboardType: TextInputType.emailAddress,
                        style:
                            TextStyle(color: Colors.black, fontSize: fontAdj),
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                            hintText: "E-mail",
                            hintStyle: TextStyle(color: Colors.grey),
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(32))),
                      ),
                    )),
                Expanded(
                    flex: 1,
                    child: RawMaterialButton(
                      fillColor: Colors.deepOrange,
                      onPressed: () {
                        if (_controllerEmail.text.isEmpty) {
                          showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              backgroundColor: Colors.white,
                              title: const Text('E-MAIL'),
                              content: const Text(
                                  'Preenchimento do campo E-MAIL é obrigatorio. '),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () => Navigator.pop(context, 'OK'),
                                  child: const Text('OK'),
                                ),
                              ],
                            ),
                          );
                        } else if (_controllerEmail.text.contains("@") &&
                            _controllerEmail.text.contains(".")) {
                          verificaEmail();
                        } else {
                          showDialog<String>(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                      backgroundColor: Colors.white,
                                      title: const Text('E-MAIL'),
                                      content: const Text(
                                          'Campo E-mail precisa ter "@" e "." em seu conteudo.'),
                                      actions: <Widget>[
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(context, 'OK'),
                                          child: const Text('OK'),
                                        )
                                      ]));
                        }
                      },
                      shape: CircleBorder(),
                      padding: const EdgeInsets.all(24.0),
                      child: Text('ENTRAR',
                          style: TextStyle(fontSize: (fontAdj / 2))),
                    )),
                Expanded(
                  flex: 1,
                  child: Center(
                    child: Text(
                      _mensagemErro,
                      style: TextStyle(color: Colors.red, fontSize: fontAdj),
                    ),
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
