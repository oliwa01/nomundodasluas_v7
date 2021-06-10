import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nomundodasluas_v7/classes/containerNomeFamilia.dart';
import 'package:nomundodasluas_v7/classes/dateTime.dart';
import 'package:nomundodasluas_v7/classes/rowAppBar.dart';
import 'package:nomundodasluas_v7/constantes/constantes.dart';
import 'package:nomundodasluas_v7/pages/pageFoto6.dart';
import 'package:nomundodasluas_v7/pages/principal.dart';
import 'package:url_launcher/url_launcher.dart';

import 'home.dart';
import 'luas.dart';

class Lua6 extends StatefulWidget {
  Lua6(this.email);
  String email;
  @override
  _Lua6State createState() => _Lua6State();
}

class _Lua6State extends State<Lua6> {
  String _selectedNomeFamilia = '';
  String _selectedDateNasc = "DD/MM/AAAA";
  String _selectedTimeNasc = "HH:MM";
  String _selectedNome = '';
  String _selectedHemisferio = '';
  String _selectedDateNasc2 = "DD/MM/AAAA";
  String _selectedTimeNasc2 = "HH:MM";
  String _selectedNome2 = '';
  String _selectedHemisferio2 = '';
  String _selectedDateNasc3 = "DD/MM/AAAA";
  String _selectedTimeNasc3 = "HH:MM";
  String _selectedNome3 = '';
  String _selectedHemisferio3 = '';
  String _selectedDateNasc4 = "DD/MM/AAAA";
  String _selectedTimeNasc4 = "HH:MM";
  String _selectedNome4 = '';
  String _selectedHemisferio4 = '';
  String _selectedDateNasc5 = "DD/MM/AAAA";
  String _selectedTimeNasc5 = "HH:MM";
  String _selectedNome5 = '';
  String _selectedHemisferio5 = '';
  String _selectedDateNasc6 = "DD/MM/AAAA";
  String _selectedTimeNasc6 = "HH:MM";
  String _selectedNome6 = '';
  String _selectedHemisferio6 = '';
  //

  @override
  DateTimeHemisferio dateTimeHemisferio1 = DateTimeHemisferio();

  //
  DateTimeHemisferio dateTimeHemisferio2 = DateTimeHemisferio();

  //
  DateTimeHemisferio dateTimeHemisferio3 = DateTimeHemisferio();

  //
  DateTimeHemisferio dateTimeHemisferio4 = DateTimeHemisferio();

  //
  DateTimeHemisferio dateTimeHemisferio5 = DateTimeHemisferio();

  //
  DateTimeHemisferio dateTimeHemisferio6 = DateTimeHemisferio();

  ContainerNomeFamilia containerNomeFamilia = ContainerNomeFamilia();
  Widget build(BuildContext context) {
    final widthlua = MediaQuery.of(context).size.width;
    final heigthlua = MediaQuery.of(context).size.height;
    bool portrait = (heigthlua > widthlua);
    double fontAdj = portrait
        ? sqrt(heigthlua) / (heigthlua / widthlua)
        : sqrt(heigthlua) / (widthlua / heigthlua);

    //
    DateTime now = DateTime.now();
    String _formattedDate2 = DateFormat('MMddkkmmss').format(now);
    String _codVenda = _formattedDate2;
    //

    //
    double _distanciadb1 = 0.0;
    int _luadiadb1 = 0;
    String _proximoDb = '';
    String _signosDb = '';
    String _timedb1 = '';
    //
    double _distanciadb2 = 0.0;
    int _luadiadb2 = 0;
    String _proximoDb2 = '';
    String _signosDb2 = '';
    String _timedb2 = '';
    //
    double _distanciadb3 = 0.0;
    int _luadiadb3 = 0;
    String _proximoDb3 = '';
    String _signosDb3 = '';
    String _timedb3 = '';
    //
    double _distanciadb4 = 0.0;
    int _luadiadb4 = 0;
    String _proximoDb4 = '';
    String _signosDb4 = '';
    String _timedb4 = '';
    //
    double _distanciadb5 = 0.0;
    int _luadiadb5 = 0;
    String _proximoDb5 = '';
    String _signosDb5 = '';
    String _timedb5 = '';
    //
    double _distanciadb6 = 0.0;
    int _luadiadb6 = 0;
    String _proximoDb6 = '';
    String _signosDb6 = '';
    String _timedb6 = '';
    //
    _launchInBrowser(String url) async {
      if (await canLaunch(url)) {
        await launch(
          url,
          forceSafariVC: true,
          forceWebView: true,
          headers: <String, String>{'my_header_key': 'my_header_value'},
        );
      } else {
        throw 'Could not launch $url';
      }
    }

    int _selectedIndex = 0;
    void _onItemTapped(int index) {
      setState(() {
        (index == 0)
            ? Navigator.push(context, MaterialPageRoute(builder: (context) {
                return Principal(widget.email);
              }))
            : (index == 1)
                ? Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Luas(widget.email);
                  }))
                : (index == 2)
                    ? _launchInBrowser("https://loja.nomundodasluas.com.br/")
                    : Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                        return Home();
                      }));
      });
    }

    Future _gravaDados() async {
      CollectionReference users = FirebaseFirestore.instance
          .collection('usuarios')
          .doc(widget.email)
          .collection('fotos');
      //
      CollectionReference luas =
          FirebaseFirestore.instance.collection('DiarioLuas');
      //
      luas
          .doc(dateTimeHemisferio1.datanasc)
          .get()
          .then((DocumentSnapshot docSn) {
        _distanciadb1 = docSn["Distanciadb"];
        _luadiadb1 = docSn["LuadiaDb"];
        _proximoDb = docSn["ProximoDb"];
        _signosDb = docSn["SignosDb"];
        _timedb1 = docSn["TimeDb"];
        //
        luas
            .doc(dateTimeHemisferio2.datanasc)
            .get()
            .then((DocumentSnapshot docSn2) {
          _distanciadb2 = docSn2["Distanciadb"];
          _luadiadb2 = docSn2["LuadiaDb"];
          _proximoDb2 = docSn2["ProximoDb"];
          _signosDb2 = docSn2["SignosDb"];
          _timedb2 = docSn2["TimeDb"];
          luas
              .doc(dateTimeHemisferio3.datanasc)
              .get()
              .then((DocumentSnapshot docSn3) {
            _distanciadb3 = docSn3["Distanciadb"];
            _luadiadb3 = docSn3["LuadiaDb"];
            _proximoDb3 = docSn3["ProximoDb"];
            _signosDb3 = docSn3["SignosDb"];
            _timedb3 = docSn3["TimeDb"];
            luas
                .doc(dateTimeHemisferio4.datanasc)
                .get()
                .then((DocumentSnapshot docSn4) {
              _distanciadb4 = docSn4["Distanciadb"];
              _luadiadb4 = docSn4["LuadiaDb"];
              _proximoDb4 = docSn4["ProximoDb"];
              _signosDb4 = docSn4["SignosDb"];
              _timedb4 = docSn4["TimeDb"];
              luas
                  .doc(dateTimeHemisferio5.datanasc)
                  .get()
                  .then((DocumentSnapshot docSn5) {
                _distanciadb5 = docSn5["Distanciadb"];
                _luadiadb5 = docSn5["LuadiaDb"];
                _proximoDb5 = docSn5["ProximoDb"];
                _signosDb5 = docSn5["SignosDb"];
                _timedb5 = docSn5["TimeDb"];
                luas
                    .doc(dateTimeHemisferio6.datanasc)
                    .get()
                    .then((DocumentSnapshot docSn6) {
                  _distanciadb6 = docSn6["Distanciadb"];
                  _luadiadb6 = docSn6["LuadiaDb"];
                  _proximoDb6 = docSn6["ProximoDb"];
                  _signosDb6 = docSn6["SignosDb"];
                  _timedb6 = docSn6["TimeDb"];

                  users.doc(_codVenda).set({
                    'codVenda': _codVenda,
                    'nomefamilia': containerNomeFamilia.nomeFamilia,
                    'email': widget.email,
                    'numberPicture': 6,
                    'nome1': dateTimeHemisferio1.nome,
                    'dataPicket1': dateTimeHemisferio1.datanasc,
                    'distanciadb1': docSn["Distanciadb"],
                    'luadiadb1': docSn["LuadiaDb"],
                    'hemisferio': dateTimeHemisferio1.hemisferio,
                    'proximodb': docSn["ProximoDb"],
                    'signo1': docSn["SignosDb"],
                    'timedb1': docSn["TimeDb"],
                    'timenasc1': dateTimeHemisferio1.horanasc == 'HH:MM'
                        ? '9999'
                        : dateTimeHemisferio1.horanasc,
                    'nome2': dateTimeHemisferio2.nome,
                    'dataPicket2': dateTimeHemisferio2.datanasc,
                    'distanciadb2': docSn2["Distanciadb"],
                    'luadiadb2': docSn2["LuadiaDb"],
                    'hemisferio2': dateTimeHemisferio1.hemisferio,
                    'proximodb2': docSn2["ProximoDb"],
                    'signo2': docSn2["SignosDb"],
                    'timedb2': docSn2["TimeDb"],
                    'timenasc2': dateTimeHemisferio2.horanasc == 'HH:MM'
                        ? '9999'
                        : dateTimeHemisferio1.horanasc,
                    'nome3': dateTimeHemisferio3.nome,
                    'dataPicket3': dateTimeHemisferio3.datanasc,
                    'distanciadb3': docSn3["Distanciadb"],
                    'luadiadb3': docSn3["LuadiaDb"],
                    'hemisferio3': dateTimeHemisferio1.hemisferio,
                    'proximodb3': docSn3["ProximoDb"],
                    'signo3': docSn3["SignosDb"],
                    'timedb3': docSn3["TimeDb"],
                    'timenasc3': dateTimeHemisferio3.horanasc == 'HH:MM'
                        ? '9999'
                        : dateTimeHemisferio1.horanasc,
                    'nome4': dateTimeHemisferio4.nome,
                    'dataPicket4': dateTimeHemisferio4.datanasc,
                    'distanciadb4': docSn4["Distanciadb"],
                    'luadiadb4': docSn4["LuadiaDb"],
                    'hemisferio4': dateTimeHemisferio1.hemisferio,
                    'proximodb4': docSn4["ProximoDb"],
                    'signo4': docSn4["SignosDb"],
                    'timedb4': docSn4["TimeDb"],
                    'timenasc4': dateTimeHemisferio4.horanasc == 'HH:MM'
                        ? '9999'
                        : dateTimeHemisferio1.horanasc,
                    'nome5': dateTimeHemisferio5.nome,
                    'dataPicket5': dateTimeHemisferio5.datanasc,
                    'distanciadb5': docSn5["Distanciadb"],
                    'luadiadb5': docSn5["LuadiaDb"],
                    'hemisferio5': dateTimeHemisferio1.hemisferio,
                    'proximodb5': docSn5["ProximoDb"],
                    'signo5': docSn5["SignosDb"],
                    'timedb5': docSn5["TimeDb"],
                    'timenasc5': dateTimeHemisferio5.horanasc == 'HH:MM'
                        ? '9999'
                        : dateTimeHemisferio1.horanasc,
                    'nome6': dateTimeHemisferio6.nome,
                    'dataPicket6': dateTimeHemisferio6.datanasc,
                    'distanciadb6': docSn6["Distanciadb"],
                    'luadiadb6': docSn6["LuadiaDb"],
                    'hemisferio6': dateTimeHemisferio1.hemisferio,
                    'proximodb6': docSn6["ProximoDb"],
                    'signo6': docSn6["SignosDb"],
                    'timedb6': docSn6["TimeDb"],
                    'timenasc6': dateTimeHemisferio6.horanasc == 'HH:MM'
                        ? '9999'
                        : dateTimeHemisferio1.horanasc
                  });

                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return PageFoto6(
                      origem: 'luas',
                      email: widget.email,
                      codVenda: _codVenda,
                      nomefamilia: containerNomeFamilia.nomeFamilia,
                      numberPicture: 6,
                      dataPicket1: dateTimeHemisferio1.datanasc,
                      nome1: dateTimeHemisferio1.nome,
                      distanciadb1: _distanciadb1,
                      luadiadb1: _luadiadb1,
                      proximodb1: _proximoDb,
                      signo1: _signosDb,
                      timedb1: _timedb1,
                      timenasc1: dateTimeHemisferio1.horanasc == 'HH:MM'
                          ? '9999'
                          : dateTimeHemisferio1.horanasc,
                      hemisferio: dateTimeHemisferio1.hemisferio,
                      dataPicket2: dateTimeHemisferio2.datanasc,
                      nome2: dateTimeHemisferio2.nome,
                      distanciadb2: _distanciadb2,
                      luadiadb2: _luadiadb2,
                      proximodb2: _proximoDb2,
                      signo2: _signosDb2,
                      timedb2: _timedb2,
                      timenasc2: dateTimeHemisferio2.horanasc == 'HH:MM'
                          ? '9999'
                          : dateTimeHemisferio2.horanasc,
                      hemisferio2: dateTimeHemisferio2.hemisferio,
                      dataPicket3: dateTimeHemisferio3.datanasc,
                      nome3: dateTimeHemisferio3.nome,
                      distanciadb3: _distanciadb3,
                      luadiadb3: _luadiadb3,
                      proximodb3: _proximoDb3,
                      signo3: _signosDb3,
                      timedb3: _timedb3,
                      timenasc3: dateTimeHemisferio3.horanasc == 'HH:MM'
                          ? '9999'
                          : dateTimeHemisferio3.horanasc,
                      hemisferio3: dateTimeHemisferio3.hemisferio,
                      dataPicket4: dateTimeHemisferio4.datanasc,
                      nome4: dateTimeHemisferio4.nome,
                      distanciadb4: _distanciadb4,
                      luadiadb4: _luadiadb4,
                      proximodb4: _proximoDb4,
                      signo4: _signosDb4,
                      timedb4: _timedb4,
                      timenasc4: dateTimeHemisferio4.horanasc == 'HH:MM'
                          ? '9999'
                          : dateTimeHemisferio4.horanasc,
                      hemisferio4: dateTimeHemisferio4.hemisferio,
                      dataPicket5: dateTimeHemisferio5.datanasc,
                      nome5: dateTimeHemisferio5.nome,
                      distanciadb5: _distanciadb5,
                      luadiadb5: _luadiadb5,
                      proximodb5: _proximoDb5,
                      signo5: _signosDb5,
                      timedb5: _timedb5,
                      timenasc5: dateTimeHemisferio5.horanasc == 'HH:MM'
                          ? '9999'
                          : dateTimeHemisferio5.horanasc,
                      hemisferio5: dateTimeHemisferio5.hemisferio,
                      dataPicket6: dateTimeHemisferio6.datanasc,
                      nome6: dateTimeHemisferio6.nome,
                      distanciadb6: _distanciadb6,
                      luadiadb6: _luadiadb6,
                      proximodb6: _proximoDb6,
                      signo6: _signosDb6,
                      timedb6: _timedb6,
                      timenasc6: dateTimeHemisferio6.horanasc == 'HH:MM'
                          ? '9999'
                          : dateTimeHemisferio6.horanasc,
                      hemisferio6: dateTimeHemisferio6.hemisferio,
                    );
                  }));
                });
              });
            });
          });
        });
      });
    }

    _verificaDados() {
      if (containerNomeFamilia.nomeFamilia.isEmpty) {
        showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            backgroundColor: Colors.white,
            title: const Text('NOME FAMÍLIA'),
            content: const Text(
                'Preenchimento do campo NOME FAMÍLIA é obrigatório. '),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, 'OK'),
                child: const Text('OK'),
              ),
            ],
          ),
        );
      } else if (dateTimeHemisferio1.hemisferio.isEmpty) {
        showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            backgroundColor: Colors.white,
            title: const Text('SELECIONAR 1'),
            content: const Text('Selecionar Hemisfério do local de nascimento'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, 'OK'),
                child: const Text('OK'),
              ),
            ],
          ),
        );
      } else if (dateTimeHemisferio1.nome.isEmpty) {
        showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            backgroundColor: Colors.white,
            title: const Text('Nome'),
            content:
                const Text('Preenchimento do campo NOME 1 é obrigatório. '),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, 'OK'),
                child: const Text('OK'),
              ),
            ],
          ),
        );
      } else if (dateTimeHemisferio1.datanasc == "DD/MM/AAAA") {
        showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            backgroundColor: Colors.white,
            title: const Text('DATA de NASCIMENTO 1'),
            content: const Text('Selecione DATA de NASCIMENTO. '),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, 'OK'),
                child: const Text('OK'),
              ),
            ],
          ),
        );
      } else if (dateTimeHemisferio2.hemisferio.isEmpty) {
        showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            backgroundColor: Colors.white,
            title: const Text('SELECIONAR 2'),
            content: const Text('Selecionar Hemisfério do local de nascimento'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, 'OK'),
                child: const Text('OK'),
              ),
            ],
          ),
        );
      } else if (dateTimeHemisferio2.nome.isEmpty) {
        showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            backgroundColor: Colors.white,
            title: const Text('Nome'),
            content:
                const Text('Preenchimento do campo NOME 2 é obrigatório. '),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, 'OK'),
                child: const Text('OK'),
              ),
            ],
          ),
        );
      } else if (dateTimeHemisferio2.datanasc == "DD/MM/AAAA") {
        showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            backgroundColor: Colors.white,
            title: const Text('DATA de NASCIMENTO 2'),
            content: const Text('Selecione DATA de NASCIMENTO. '),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, 'OK'),
                child: const Text('OK'),
              ),
            ],
          ),
        );
      } else if (dateTimeHemisferio3.hemisferio.isEmpty) {
        showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            backgroundColor: Colors.white,
            title: const Text('SELECIONAR 3'),
            content: const Text('Selecionar Hemisfério do local de nascimento'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, 'OK'),
                child: const Text('OK'),
              ),
            ],
          ),
        );
      } else if (dateTimeHemisferio3.nome.isEmpty) {
        showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            backgroundColor: Colors.white,
            title: const Text('Nome'),
            content:
                const Text('Preenchimento do campo NOME 3 é obrigatório. '),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, 'OK'),
                child: const Text('OK'),
              ),
            ],
          ),
        );
      } else if (dateTimeHemisferio3.datanasc == "DD/MM/AAAA") {
        showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            backgroundColor: Colors.white,
            title: const Text('DATA de NASCIMENTO 2'),
            content: const Text('Selecione DATA de NASCIMENTO. '),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, 'OK'),
                child: const Text('OK'),
              ),
            ],
          ),
        );
      } else if (dateTimeHemisferio4.hemisferio.isEmpty) {
        showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            backgroundColor: Colors.white,
            title: const Text('SELECIONAR 4'),
            content: const Text('Selecionar Hemisfério do local de nascimento'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, 'OK'),
                child: const Text('OK'),
              ),
            ],
          ),
        );
      } else if (dateTimeHemisferio4.nome.isEmpty) {
        showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            backgroundColor: Colors.white,
            title: const Text('Nome'),
            content:
                const Text('Preenchimento do campo NOME 4 é obrigatório. '),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, 'OK'),
                child: const Text('OK'),
              ),
            ],
          ),
        );
      } else if (dateTimeHemisferio4.datanasc == "DD/MM/AAAA") {
        showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            backgroundColor: Colors.white,
            title: const Text('DATA de NASCIMENTO 4'),
            content: const Text('Selecione DATA de NASCIMENTO. '),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, 'OK'),
                child: const Text('OK'),
              ),
            ],
          ),
        );
      } else if (dateTimeHemisferio5.hemisferio.isEmpty) {
        showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            backgroundColor: Colors.white,
            title: const Text('SELECIONAR 5'),
            content: const Text('Selecionar Hemisfério do local de nascimento'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, 'OK'),
                child: const Text('OK'),
              ),
            ],
          ),
        );
      } else if (dateTimeHemisferio5.nome.isEmpty) {
        showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            backgroundColor: Colors.white,
            title: const Text('Nome'),
            content:
                const Text('Preenchimento do campo NOME 5 é obrigatório. '),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, 'OK'),
                child: const Text('OK'),
              ),
            ],
          ),
        );
      } else if (dateTimeHemisferio5.datanasc == "DD/MM/AAAA") {
        showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            backgroundColor: Colors.white,
            title: const Text('DATA de NASCIMENTO 5'),
            content: const Text('Selecione DATA de NASCIMENTO. '),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, 'OK'),
                child: const Text('OK'),
              ),
            ],
          ),
        );
      } else if (dateTimeHemisferio6.hemisferio.isEmpty) {
        showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            backgroundColor: Colors.white,
            title: const Text('SELECIONAR 6'),
            content: const Text('Selecionar Hemisfério do local de nascimento'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, 'OK'),
                child: const Text('OK'),
              ),
            ],
          ),
        );
      } else if (dateTimeHemisferio6.nome.isEmpty) {
        showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            backgroundColor: Colors.white,
            title: const Text('Nome'),
            content:
                const Text('Preenchimento do campo NOME 6 é obrigatório. '),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, 'OK'),
                child: const Text('OK'),
              ),
            ],
          ),
        );
      } else if (dateTimeHemisferio6.datanasc == "DD/MM/AAAA") {
        showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            backgroundColor: Colors.white,
            title: const Text('DATA de NASCIMENTO 6'),
            content: const Text('Selecione DATA de NASCIMENTO. '),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, 'OK'),
                child: const Text('OK'),
              ),
            ],
          ),
        );
      } else {
        _gravaDados();
      }
    }

    //
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: RowAppBarr(' ', widthlua, heigthlua, widget.email, 'luas'),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        height: heigthlua,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/fundo_diario.png"),
                fit: BoxFit.cover)),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.family_restroom_outlined,
                      size: 50, color: Colors.white),
                  SizedBox(width: 20),
                  Text(
                    'Nome da Família',
                    style: kTitle2TextStyle,
                  )
                ],
              ),
              containerNomeFamilia,
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.account_box_outlined,
                      size: 50, color: Colors.white),
                  SizedBox(width: 20),
                  Text(
                    'FOTO 1',
                    style: kTitle2TextStyle,
                  )
                ],
              ),
              SizedBox(height: 30),
              dateTimeHemisferio1,
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.account_box_outlined,
                      size: 50, color: Colors.white),
                  SizedBox(width: 20),
                  Text(
                    'FOTO 2',
                    style: kTitle2TextStyle,
                  )
                ],
              ),
              SizedBox(height: 30),
              dateTimeHemisferio2,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.account_box_outlined,
                      size: 50, color: Colors.white),
                  SizedBox(width: 20),
                  Text(
                    'FOTO 3',
                    style: kTitle2TextStyle,
                  )
                ],
              ),
              SizedBox(height: 30),
              dateTimeHemisferio3,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.account_box_outlined,
                      size: 50, color: Colors.white),
                  SizedBox(width: 20),
                  Text(
                    'FOTO 4',
                    style: kTitle2TextStyle,
                  )
                ],
              ),
              SizedBox(height: 30),
              dateTimeHemisferio4,
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.account_box_outlined,
                      size: 50, color: Colors.white),
                  SizedBox(width: 20),
                  Text(
                    'FOTO 5',
                    style: kTitle2TextStyle,
                  )
                ],
              ),
              SizedBox(height: 30),
              dateTimeHemisferio5,
              SizedBox(height: 30),
              Text(
                'FOTO 6',
                style: kTitle2TextStyle,
              ),
              SizedBox(height: 30),
              dateTimeHemisferio6,
              TextButton(
                  onPressed: () {
                    _verificaDados();
                  },
                  child: Container(
                    width: 220,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.deepOrange,
                        borderRadius: BorderRadius.circular(20.0)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(Icons.camera, color: Colors.white, size: 40),
                        Text('GERAR FOTO', style: ktextButtonImage)
                      ],
                    ),
                  )),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined, color: Colors.white),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera, color: Colors.white),
            label: 'Luas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart, color: Colors.white),
            label: 'Loja',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        onTap: _onItemTapped,
      ),
    );
  }
}
