import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:nomundodasluas_v7/classes/LeAuth.dart';
import 'package:nomundodasluas_v7/classes/rowAppBar.dart';
import 'package:nomundodasluas_v7/pages/precoFotos1.dart';

class CompraSemCadastro extends StatefulWidget {
  final String codVenda;
  final String dataPicket1;
  final String dataPicket2;
  final String dataPicket3;
  final String dataPicket4;
  final String dataPicket5;
  final String dataPicket6;
  final double distanciadb1;
  final double distanciadb2;
  final double distanciadb3;
  final double distanciadb4;
  final double distanciadb5;
  final double distanciadb6;
  final String email;
  final String hemisferio;
  final String hemisferio2;
  final String hemisferio3;
  final String hemisferio4;
  final String hemisferio5;
  final String hemisferio6;
  final int luadiadb1;
  final int luadiadb2;
  final int luadiadb3;
  final int luadiadb4;
  final int luadiadb5;
  final int luadiadb6;
  final String nome1;
  final String nome2;
  final String nome3;
  final String nome4;
  final String nome5;
  final String nome6;
  final String nomefamilia;
  final int numberPicture;
  final String proximodb1;
  final String proximodb2;
  final String proximodb3;
  final String proximodb4;
  final String proximodb5;
  final String proximodb6;
  final String signo1;
  final String signo2;
  final String signo3;
  final String signo4;
  final String signo5;
  final String signo6;
  final String timedb1;
  final String timedb2;
  final String timedb3;
  final String timedb4;
  final String timedb5;
  final String timedb6;
  final String timenasc1;
  final String timenasc2;
  final String timenasc3;
  final String timenasc4;
  final String timenasc5;
  final String timenasc6;

  CompraSemCadastro(
      {this.codVenda = '0',
      this.dataPicket1 = '',
      this.dataPicket2 = '',
      this.dataPicket3 = '',
      this.dataPicket4 = '',
      this.dataPicket5 = '',
      this.dataPicket6 = '',
      this.distanciadb1 = 0,
      this.distanciadb2 = 0,
      this.distanciadb3 = 0,
      this.distanciadb4 = 0,
      this.distanciadb5 = 0,
      this.distanciadb6 = 0,
      this.email = '',
      this.hemisferio = '',
      this.hemisferio2 = '',
      this.hemisferio3 = '',
      this.hemisferio4 = '',
      this.hemisferio5 = '',
      this.hemisferio6 = '',
      this.luadiadb1 = 0,
      this.luadiadb2 = 0,
      this.luadiadb3 = 0,
      this.luadiadb4 = 0,
      this.luadiadb5 = 0,
      this.luadiadb6 = 0,
      this.nome1 = '',
      this.nome2 = '',
      this.nome3 = '',
      this.nome4 = '',
      this.nome5 = '',
      this.nome6 = '',
      this.nomefamilia = '',
      this.numberPicture = 0,
      this.proximodb1 = '',
      this.proximodb2 = '',
      this.proximodb3 = '',
      this.proximodb4 = '',
      this.proximodb5 = '',
      this.proximodb6 = '',
      this.signo1 = '',
      this.signo2 = '',
      this.signo3 = '',
      this.signo4 = '',
      this.signo5 = '',
      this.signo6 = '',
      this.timedb1 = '',
      this.timedb2 = '',
      this.timedb3 = '',
      this.timedb4 = '',
      this.timedb5 = '',
      this.timedb6 = '',
      this.timenasc1 = '',
      this.timenasc2 = '',
      this.timenasc3 = '',
      this.timenasc4 = '',
      this.timenasc5 = '',
      this.timenasc6 = ''});

  @override
  _CompraSemCadastroState createState() => _CompraSemCadastroState();
}

class _CompraSemCadastroState extends State<CompraSemCadastro> {
  final emailTextController = TextEditingController();
  final nameTextController = TextEditingController();

  LeAuth leAuth = LeAuth('email@email', '1234567', "");

  //Controladores
  TextEditingController _controllerNome = TextEditingController(text: "");
  TextEditingController _controllerEmail = TextEditingController(text: "");

  String _mensagemErro = "";
  String _autoriza = '';

  verificaEmail() async {
    //Recupera dados dos campos
    String email = _controllerEmail.text;
    String nome = _controllerNome.text;
    print(nome);
    print(email);
    if (nome.isNotEmpty &&
        email.isNotEmpty &&
        email.contains("@") &&
        email.contains(".")) {
      _mensagemErro = "";
      var autoriza = await leAuth.createNewUser(
        email.toLowerCase(),
        '1234567',
        _controllerNome.text,
      );
      _autoriza = autoriza.toString();

      if (_autoriza == 'autorizado') {
        await gravaUsuario();
      } else {
        {
          await gravaUsuario();
        }
      }
    } else {
      setState(() {
        _mensagemErro = "Preencha o E-mail utilizando @ e .";
      });
    }
  }

  void initState() {}

  Future gravaUsuario() async {
    CollectionReference users = FirebaseFirestore.instance
        .collection('usuarios')
        .doc(_controllerEmail.text)
        .collection('fotos');
    if (widget.numberPicture == 1) {
      users.doc(widget.codVenda).set({
        'codVenda': widget.codVenda,
        'email': _controllerEmail.text,
        'dataPicket1': widget.dataPicket1,
        'distanciadb1': widget.distanciadb1,
        'hemisferio': widget.hemisferio,
        'luadiadb1': widget.luadiadb1,
        'nome1': widget.nome1,
        'numberPicture': 1,
        'proximodb': widget.proximodb1,
        'signo1': widget.signo1,
        'timedb1': widget.timedb1,
        'timenasc1': widget.timenasc1
      });
    } else if (widget.numberPicture == 2) {
      users.doc(widget.codVenda).set({
        'nomefamilia': widget.nomefamilia,
        'codVenda': widget.codVenda,
        'email': widget.email,
        'numberPicture': 2,
        'dataPicket1': widget.dataPicket1,
        'distanciadb1': widget.distanciadb1,
        'hemisferio': widget.hemisferio,
        'luadiadb1': widget.luadiadb1,
        'nome1': widget.nome1,
        'proximodb': widget.proximodb1,
        'signo1': widget.signo1,
        'timedb1': widget.timedb1,
        'timenasc1': widget.timenasc1,
        'dataPicket2': widget.dataPicket2,
        'distanciadb2': widget.distanciadb2,
        'hemisferio2': widget.hemisferio2,
        'luadiadb2': widget.luadiadb2,
        'nome2': widget.nome2,
        'proximodb2': widget.proximodb2,
        'signosdb2': widget.signo2,
        'timedb2': widget.timedb2,
        'timenasc2': widget.timenasc2
      });
    } else if (widget.numberPicture == 3) {
      users.doc(widget.codVenda).set({
        'codVenda': widget.codVenda,
        'email': widget.email,
        'nomefamilia': widget.nomefamilia,
        'numberPicture': 3,
        'dataPicket1': widget.dataPicket1,
        'distanciadb1': widget.distanciadb1,
        'hemisferio': widget.hemisferio,
        'luadiadb1': widget.luadiadb1,
        'nome1': widget.nome1,
        'proximodb': widget.proximodb1,
        'signo1': widget.signo1,
        'timedb1': widget.timedb1,
        'timenasc1': widget.timenasc1,
        'dataPicket2': widget.dataPicket2,
        'distanciadb2': widget.distanciadb2,
        'hemisferio2': widget.hemisferio2,
        'luadiadb2': widget.luadiadb2,
        'nome2': widget.nome2,
        'proximodb2': widget.proximodb2,
        'signosdb2': widget.signo2,
        'timedb2': widget.timedb2,
        'timenasc2': widget.timenasc2,
        'dataPicket3': widget.dataPicket3,
        'distanciadb3': widget.distanciadb3,
        'hemisferio3': widget.hemisferio3,
        'luadiadb3': widget.luadiadb3,
        'nome3': widget.nome3,
        'proximodb3': widget.proximodb3,
        'signosdb3': widget.signo3,
        'timedb3': widget.timedb3,
        'timenasc3': widget.timenasc3,
      });
    } else if (widget.numberPicture == 4) {
      users.doc(widget.codVenda).set({
        'codVenda': widget.codVenda,
        'email': widget.email,
        'numberPicture': 4,
        'nomefamilia': widget.nomefamilia,
        'dataPicket1': widget.dataPicket1,
        'distanciadb1': widget.distanciadb1,
        'hemisferio': widget.hemisferio,
        'luadiadb1': widget.luadiadb1,
        'nome1': widget.nome1,
        'proximodb': widget.proximodb1,
        'signo1': widget.signo1,
        'timedb1': widget.timedb1,
        'timenasc1': widget.timenasc1,
        'dataPicket2': widget.dataPicket2,
        'distanciadb2': widget.distanciadb2,
        'hemisferio2': widget.hemisferio2,
        'luadiadb2': widget.luadiadb2,
        'nome2': widget.nome2,
        'proximodb2': widget.proximodb2,
        'signosdb2': widget.signo2,
        'timedb2': widget.timedb2,
        'timenasc2': widget.timenasc2,
        'dataPicket3': widget.dataPicket3,
        'distanciadb3': widget.distanciadb3,
        'hemisferio3': widget.hemisferio3,
        'luadiadb3': widget.luadiadb3,
        'nome3': widget.nome3,
        'proximodb3': widget.proximodb3,
        'signosdb3': widget.signo3,
        'timedb3': widget.timedb3,
        'timenasc3': widget.timenasc3,
        'dataPicket4': widget.dataPicket4,
        'distanciadb4': widget.distanciadb4,
        'hemisferio4': widget.hemisferio4,
        'luadiadb4': widget.luadiadb4,
        'nome4': widget.nome4,
        'proximodb4': widget.proximodb4,
        'signosdb4': widget.signo4,
        'timedb4': widget.timedb4,
        'timenasc4': widget.timenasc4,
      });
    } else if (widget.numberPicture == 5) {
      users.doc(widget.codVenda).set({
        'codVenda': widget.codVenda,
        'email': widget.email,
        'numberPicture': 5,
        'nomefamilia': widget.nomefamilia,
        'dataPicket1': widget.dataPicket1,
        'distanciadb1': widget.distanciadb1,
        'hemisferio': widget.hemisferio,
        'luadiadb1': widget.luadiadb1,
        'nome1': widget.nome1,
        'proximodb': widget.proximodb1,
        'signo1': widget.signo1,
        'timedb1': widget.timedb1,
        'timenasc1': widget.timenasc1,
        'dataPicket2': widget.dataPicket2,
        'distanciadb2': widget.distanciadb2,
        'hemisferio2': widget.hemisferio2,
        'luadiadb2': widget.luadiadb2,
        'nome2': widget.nome2,
        'proximodb2': widget.proximodb2,
        'signosdb2': widget.signo2,
        'timedb2': widget.timedb2,
        'timenasc2': widget.timenasc2,
        'dataPicket3': widget.dataPicket3,
        'distanciadb3': widget.distanciadb3,
        'hemisferio3': widget.hemisferio3,
        'luadiadb3': widget.luadiadb3,
        'nome3': widget.nome3,
        'proximodb3': widget.proximodb3,
        'signosdb3': widget.signo3,
        'timedb3': widget.timedb3,
        'timenasc3': widget.timenasc3,
        'dataPicket4': widget.dataPicket4,
        'distanciadb4': widget.distanciadb4,
        'hemisferio4': widget.hemisferio4,
        'luadiadb4': widget.luadiadb4,
        'nome4': widget.nome4,
        'proximodb4': widget.proximodb4,
        'signosdb4': widget.signo4,
        'timedb4': widget.timedb4,
        'timenasc4': widget.timenasc4,
        'dataPicket5': widget.dataPicket5,
        'distanciadb5': widget.distanciadb5,
        'hemisferio5': widget.hemisferio5,
        'luadiadb5': widget.luadiadb5,
        'nome5': widget.nome5,
        'proximodb5': widget.proximodb5,
        'signosdb5': widget.signo5,
        'timedb5': widget.timedb5,
        'timenasc5': widget.timenasc5,
      });
    } else if (widget.numberPicture == 6) {
      users.doc(widget.codVenda).set({
        'codVenda': widget.codVenda,
        'email': widget.email,
        'numberPicture': 6,
        'dataPicket1': widget.dataPicket1,
        'distanciadb1': widget.distanciadb1,
        'hemisferio': widget.hemisferio,
        'luadiadb1': widget.luadiadb1,
        'nome1': widget.nome1,
        'proximodb': widget.proximodb1,
        'signo1': widget.signo1,
        'timedb1': widget.timedb1,
        'timenasc1': widget.timenasc1,
        'dataPicket2': widget.dataPicket2,
        'distanciadb2': widget.distanciadb2,
        'hemisferio2': widget.hemisferio2,
        'luadiadb2': widget.luadiadb2,
        'nome2': widget.nome2,
        'proximodb2': widget.proximodb2,
        'signosdb2': widget.signo2,
        'timedb2': widget.timedb2,
        'timenasc2': widget.timenasc2,
        'dataPicket3': widget.dataPicket3,
        'distanciadb3': widget.distanciadb3,
        'hemisferio3': widget.hemisferio3,
        'luadiadb3': widget.luadiadb3,
        'nome3': widget.nome3,
        'proximodb3': widget.proximodb3,
        'signosdb3': widget.signo3,
        'timedb3': widget.timedb3,
        'timenasc3': widget.timenasc3,
        'dataPicket4': widget.dataPicket4,
        'distanciadb4': widget.distanciadb4,
        'hemisferio4': widget.hemisferio4,
        'luadiadb4': widget.luadiadb4,
        'nome4': widget.nome4,
        'proximodb4': widget.proximodb4,
        'signosdb4': widget.signo4,
        'timedb4': widget.timedb4,
        'timenasc4': widget.timenasc4,
        'dataPicket5': widget.dataPicket5,
        'distanciadb5': widget.distanciadb5,
        'hemisferio5': widget.hemisferio5,
        'luadiadb5': widget.luadiadb5,
        'nome5': widget.nome5,
        'proximodb5': widget.proximodb5,
        'signosdb5': widget.signo5,
        'timedb5': widget.timedb5,
        'timenasc5': widget.timenasc5,
        'dataPicket6': widget.dataPicket6,
        'distanciadb6': widget.distanciadb6,
        'hemisferio6': widget.hemisferio6,
        'luadiadb6': widget.luadiadb6,
        'nome6': widget.nome6,
        'proximodb6': widget.proximodb6,
        'signosdb6': widget.signo6,
        'timedb6': widget.timedb6,
        'timenasc6': widget.timenasc6,
      });
    }

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return PrecoFoto1(
          codVenda: widget.codVenda,
          email: _controllerEmail.text,
          numberPicture: widget.numberPicture,
          dataPicket1: widget.dataPicket1,
          nome1: widget.nome1,
          distanciadb1: widget.distanciadb1,
          luadiadb1: widget.luadiadb1,
          proximodb1: widget.proximodb1,
          signo1: widget.signo1,
          timedb1: widget.timedb1,
          timenasc1: widget.timenasc1,
          hemisferio: widget.hemisferio,
          dataPicket2: widget.dataPicket2,
          nome2: widget.nome2,
          distanciadb2: widget.distanciadb2,
          luadiadb2: widget.luadiadb2,
          proximodb2: widget.proximodb2,
          signo2: widget.signo2,
          timedb2: widget.timedb2,
          timenasc2: widget.timenasc2,
          hemisferio2: widget.hemisferio2,
          dataPicket3: widget.dataPicket3,
          nome3: widget.nome3,
          distanciadb3: widget.distanciadb3,
          luadiadb3: widget.luadiadb3,
          proximodb3: widget.proximodb3,
          signo3: widget.signo3,
          timedb3: widget.timedb3,
          timenasc3: widget.timenasc3,
          hemisferio3: widget.hemisferio3,
          dataPicket4: widget.dataPicket4,
          nome4: widget.nome4,
          distanciadb4: widget.distanciadb4,
          luadiadb4: widget.luadiadb4,
          proximodb4: widget.proximodb4,
          signo4: widget.signo4,
          timedb4: widget.timedb4,
          timenasc4: widget.timenasc4,
          hemisferio4: widget.hemisferio4,
          dataPicket5: widget.dataPicket5,
          nome5: widget.nome5,
          distanciadb5: widget.distanciadb5,
          luadiadb5: widget.luadiadb5,
          proximodb5: widget.proximodb5,
          signo5: widget.signo5,
          timedb5: widget.timedb5,
          timenasc5: widget.timenasc5,
          hemisferio5: widget.hemisferio5,
          dataPicket6: widget.dataPicket6,
          nome6: widget.nome6,
          distanciadb6: widget.distanciadb6,
          luadiadb6: widget.luadiadb6,
          proximodb6: widget.proximodb6,
          signo6: widget.signo6,
          timedb6: widget.timedb6,
          timenasc6: widget.timenasc6,
          hemisferio6: widget.hemisferio6);
    }));
  }

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
        title: RowAppBarr('', widthlua, heightlua, '', ''),
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
                          "Para verificar preços e formas de compra, é necessario o cadastro de e-mail. Caso já seja cadastrado" +
                              " entre com seu nome e e-mail.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white, fontSize: fontAdj * 0.7),
                        ))),
                Expanded(
                    flex: 1,
                    child: Container(
                      alignment: Alignment.center,
                      child: TextField(
                        controller: _controllerNome,
                        keyboardType: TextInputType.emailAddress,
                        style:
                            TextStyle(color: Colors.black, fontSize: fontAdj),
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                            hintText: "Nome",
                            hintStyle: TextStyle(color: Colors.grey),
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(32))),
                      ),
                    )),
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
                        if (_controllerNome.text.isEmpty) {
                          showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              backgroundColor: Colors.white,
                              title: const Text('Nome'),
                              content: const Text(
                                  'Preenchimento do campo NOME é obrigatorio. '),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () => Navigator.pop(context, 'OK'),
                                  child: const Text('OK'),
                                ),
                              ],
                            ),
                          );
                        } else if (_controllerEmail.text.isEmpty) {
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
