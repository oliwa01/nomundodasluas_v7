import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nomundodasluas_v7/classes/containerNomeFamilia.dart';
import 'package:nomundodasluas_v7/classes/dateTime.dart';
import 'package:nomundodasluas_v7/classes/rowAppBar.dart';
import 'package:nomundodasluas_v7/constantes/constantes.dart';
import 'package:nomundodasluas_v7/pages/pageFoto2.dart';
import 'package:nomundodasluas_v7/pages/principal.dart';
import 'package:url_launcher/url_launcher.dart';

import 'home.dart';
import 'luas.dart';

class Lua2 extends StatefulWidget {
  Lua2(this.email);
  String email;
  @override
  _Lua2State createState() => _Lua2State();
}

class _Lua2State extends State<Lua2> {
  final nameTextController = TextEditingController();
  final nameTextController2 = TextEditingController();
  final nameFamiliaTextController = TextEditingController();

  String _selectedNomeFamilia = '';
  String _selectedDateNasc = "DD/MM/AAAA";
  String _selectedTimeNasc = "HH:MM";
  String _selectedNome = '';
  String _selectedHemisferio = '';
  String _selectedDateNasc2 = "DD/MM/AAAA";
  String _selectedTimeNasc2 = "HH:MM";
  String _selectedNome2 = '';
  String _selectedHemisferio2 = '';
  //

  @override
  DateTimeHemisferio dateTimeHemisferio1 = DateTimeHemisferio();

  DateTimeHemisferio dateTimeHemisferio2 = DateTimeHemisferio();

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

    //
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

          users.doc(_codVenda).set({
            'codVenda': _codVenda,
            'nomefamilia': containerNomeFamilia.nomeFamilia,
            'email': widget.email,
            'numberPicture': 2,
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
                : dateTimeHemisferio1.horanasc
          });

          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return PageFoto2(
              origem: 'luas',
              email: widget.email,
              codVenda: _codVenda,
              nomefamilia: containerNomeFamilia.nomeFamilia,
              numberPicture: 2,
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
            );
          }));
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
            title: const Text('SELECIONAR'),
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
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              color: Colors.white,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return Luas(widget.email);
                  }),
                );
              })),
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
              SizedBox(height: 30),
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
