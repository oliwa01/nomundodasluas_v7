import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nomundodasluas_v7/classes/repaintBounderyLua.dart';
import 'package:nomundodasluas_v7/classes/rowAppBar.dart';
import 'package:nomundodasluas_v7/constantes/constantes.dart';
import 'package:nomundodasluas_v7/pages/precoFotos1.dart';
import 'package:nomundodasluas_v7/pages/principal.dart';
import 'package:url_launcher/url_launcher.dart';

import 'compraSemCadastro.dart';
import 'fotossalvas.dart';
import 'luas.dart';

class PageFoto5 extends StatefulWidget {
  final String origem;
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

  PageFoto5(
      {this.origem = '',
      this.codVenda = '0',
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
  _PageFoto5State createState() => _PageFoto5State();
}

class _PageFoto5State extends State<PageFoto5> {
  GlobalKey _containerKey = GlobalKey();
  GlobalKey _containerKey2 = GlobalKey();
  GlobalKey _containerKey3 = GlobalKey();
  GlobalKey _containerKey4 = GlobalKey();
  GlobalKey _containerKey5 = GlobalKey();

  int _limite1 = klimite1;
  int _limite2 = klimite2;
  int _limite3 = klimite3;
  int _limite4 = klimite4;
  //
  String _email = '';
  String _nomeFamilia = '';
  int _numberPictures = 0;
  String _dataPicket1 = '';
  String _nome1 = '';
  double _distancia1 = 0.0;
  int _luadiadb1 = 0;
  String _proximodb1 = '';
  String _signosdb1 = '';
  String _timedb1 = '';
  String _timenasc1 = '';
  String _hemisferio = '';
  //
  String _dataPicket2 = '';
  String _nome2 = '';
  double _distancia2 = 0.0;
  int _luadiadb2 = 0;
  String _proximodb2 = '';
  String _signosdb2 = '';
  String _timedb2 = '';
  String _timenasc2 = '';
  String _hemisferio2 = '';
  //
  String _dataPicket3 = '';
  String _nome3 = '';
  double _distancia3 = 0.0;
  int _luadiadb3 = 0;
  String _proximodb3 = '';
  String _signosdb3 = '';
  String _timedb3 = '';
  String _timenasc3 = '';
  String _hemisferio3 = '';
  //
  String _dataPicket4 = '';
  String _nome4 = '';
  double _distancia4 = 0.0;
  int _luadiadb4 = 0;
  String _proximodb4 = '';
  String _signosdb4 = '';
  String _timedb4 = '';
  String _timenasc4 = '';
  String _hemisferio4 = '';
  //
  String _dataPicket5 = '';
  String _nome5 = '';
  double _distancia5 = 0.0;
  int _luadiadb5 = 0;
  String _proximodb5 = '';
  String _signosdb5 = '';
  String _timedb5 = '';
  String _timenasc5 = '';
  String _hemisferio5 = '';
  //
  _gravaDados() {
    _email = widget.email;
    _nomeFamilia = widget.nomefamilia;
    _numberPictures = widget.numberPicture;
    //
    _dataPicket1 = widget.dataPicket1;
    _nome1 = widget.nome1;
    _distancia1 = widget.distanciadb1;
    _luadiadb1 = widget.luadiadb1;
    _proximodb1 = widget.proximodb1;
    _signosdb1 = widget.signo1;
    _timedb1 = widget.timedb1;
    _timenasc1 = widget.timenasc1;
    _hemisferio = widget.hemisferio;
    //
    _dataPicket2 = widget.dataPicket2;
    _nome2 = widget.nome2;
    _distancia2 = widget.distanciadb2;
    _luadiadb2 = widget.luadiadb2;
    _proximodb2 = widget.proximodb2;
    _signosdb2 = widget.signo2;
    _timedb2 = widget.timedb2;
    _timenasc2 = widget.timenasc2;
    _hemisferio2 = widget.hemisferio2;
    //
    //
    _dataPicket3 = widget.dataPicket3;
    _nome3 = widget.nome3;
    _distancia3 = widget.distanciadb3;
    _luadiadb3 = widget.luadiadb3;
    _proximodb3 = widget.proximodb3;
    _signosdb3 = widget.signo3;
    _timedb3 = widget.timedb3;
    _timenasc3 = widget.timenasc3;
    _hemisferio3 = widget.hemisferio3;
    //
    _dataPicket4 = widget.dataPicket4;
    _nome4 = widget.nome4;
    _distancia4 = widget.distanciadb4;
    _luadiadb4 = widget.luadiadb4;
    _proximodb4 = widget.proximodb4;
    _signosdb4 = widget.signo4;
    _timedb4 = widget.timedb4;
    _timenasc4 = widget.timenasc4;
    _hemisferio4 = widget.hemisferio4;
    //
    _dataPicket5 = widget.dataPicket5;
    _nome5 = widget.nome5;
    _distancia5 = widget.distanciadb5;
    _luadiadb5 = widget.luadiadb5;
    _proximodb5 = widget.proximodb5;
    _signosdb5 = widget.signo5;
    _timedb5 = widget.timedb5;
    _timenasc5 = widget.timenasc5;
    _hemisferio5 = widget.hemisferio5;
  }

//
  _zoomin() {
    setState(() {
      _limite1 = _limite1 - 50;
      _limite2 = _limite2 - 50;
      _limite3 = _limite3 - 50;
      _limite4 = _limite4 - 50;
      if ((_limite1 < 0) ||
          (_limite2 < 0) ||
          (_limite3 < 0) ||
          (_limite4 < 0)) {
        _limite1 = 50;
        _limite2 = 50;
        _limite3 = 50;
        _limite4 = 50;
      }
    });
  }

  _zoomout() {
    setState(() {
      _limite1 = _limite1 + 50;
      _limite2 = _limite2 + 50;
      _limite3 = _limite3 + 50;
      _limite4 = _limite4 + 50;
      if ((_limite1 > 1700) ||
          (_limite2 > 1700) ||
          (_limite3 > 1700) ||
          (_limite4 > 1700)) {
        _limite1 = 1700;
        _limite2 = 1700;
        _limite3 = 1700;
        _limite4 = 1700;
      }
    });
  }

  _verPreco() {
    if (widget.email == 'aaaa.anonimo@anonimo.com') {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return CompraSemCadastro(
            nomefamilia: widget.nomefamilia,
            codVenda: widget.codVenda,
            email: widget.email,
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
            hemisferio5: widget.hemisferio5);
      }));
    } else {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return PrecoFoto1(
            nomefamilia: widget.nomefamilia,
            codVenda: widget.codVenda,
            email: widget.email,
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
            hemisferio5: widget.hemisferio5);
      }));
    }
  }

  //
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      (index == 0)
          ? Navigator.pop(context, MaterialPageRoute(builder: (context) {
              return Luas(widget.email);
            }))
          : (index == 1)
              ? _verPreco()
              : (index == 2)
                  ? _zoomout()
                  : (index == 3)
                      ? _zoomin()
                      : (index == 4)
                          ? _zoomin()
                          : Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                              return Principal(widget.email);
                            }));
    });
  }

  @override
  void initState() {
    super.initState();

    _gravaDados();
  }

  @override
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

  Widget build(BuildContext context) {
    final widthlua = MediaQuery.of(context).size.width;
    final heightlua = MediaQuery.of(context).size.height;

    bool portrait = (heightlua > widthlua);
    double fontAdj = portrait
        ? sqrt(heightlua) / (heightlua / widthlua)
        : sqrt(heightlua) / (widthlua / heightlua);

    int luasize = (widthlua > 1200
        ? _limite1
        : widthlua > 1000
            ? _limite2
            : widthlua > 800
                ? _limite3
                : _limite4);

    RepaintBounderyLua repaintBounderyLua1 = RepaintBounderyLua(
        containerKey: _containerKey,
        luasize: luasize,
        luadiadb1: _luadiadb1,
        hemisferio: _hemisferio,
        nome1: _nome1,
        dataPicket1: _dataPicket1,
        distancia1: _distancia1,
        signosdb1: _signosdb1,
        proximodb1: _proximodb1,
        timedb1: _timedb1,
        timenasc1: _timenasc1);
    RepaintBounderyLua repaintBounderyLua2 = RepaintBounderyLua(
        containerKey: _containerKey2,
        luasize: luasize,
        luadiadb1: _luadiadb2,
        hemisferio: _hemisferio2,
        nome1: _nome2,
        dataPicket1: _dataPicket2,
        distancia1: _distancia2,
        signosdb1: _signosdb2,
        proximodb1: _proximodb2,
        timedb1: _timedb2,
        timenasc1: _timenasc2);
    RepaintBounderyLua repaintBounderyLua3 = RepaintBounderyLua(
        containerKey: _containerKey3,
        luasize: luasize,
        luadiadb1: _luadiadb3,
        hemisferio: _hemisferio3,
        nome1: _nome3,
        dataPicket1: _dataPicket3,
        distancia1: _distancia3,
        signosdb1: _signosdb3,
        proximodb1: _proximodb3,
        timedb1: _timedb3,
        timenasc1: _timenasc3);
    RepaintBounderyLua repaintBounderyLua4 = RepaintBounderyLua(
        containerKey: _containerKey4,
        luasize: luasize,
        luadiadb1: _luadiadb4,
        hemisferio: _hemisferio4,
        nome1: _nome4,
        dataPicket1: _dataPicket4,
        distancia1: _distancia4,
        signosdb1: _signosdb4,
        proximodb1: _proximodb4,
        timedb1: _timedb4,
        timenasc1: _timenasc4);
    RepaintBounderyLua repaintBounderyLua5 = RepaintBounderyLua(
        containerKey: _containerKey5,
        luasize: luasize,
        luadiadb1: _luadiadb5,
        hemisferio: _hemisferio5,
        nome1: _nome5,
        dataPicket1: _dataPicket5,
        distancia1: _distancia5,
        signosdb1: _signosdb5,
        proximodb1: _proximodb5,
        timedb1: _timedb5,
        timenasc1: _timenasc5);
    retorna(address) {
      if (address == 'luas') {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return Luas(widget.email);
        }));
      } else {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return FotosSalvas(widget.email);
        }));
      }
    }

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title:
            RowAppBarr(' ', widthlua, heightlua, widget.email, widget.origem),
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            color: Colors.white,
            onPressed: () {
              retorna(widget.origem);
            }),
        centerTitle: true,
      ),
      body: Column(children: <Widget>[
        Container(
            height: heightlua * 0.83,
            child: Align(
                alignment: Alignment.topCenter,
                child: SingleChildScrollView(
                    // horizontal scroll widget
                    scrollDirection: Axis.horizontal,
                    child: SingleChildScrollView(
                        // vertical scroll widget
                        scrollDirection: Axis.vertical,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Row(
                                children: [
                                  repaintBounderyLua1,
                                  SizedBox(width: 20),
                                  repaintBounderyLua2,
                                  SizedBox(width: 20),
                                  repaintBounderyLua3,
                                  SizedBox(width: 20),
                                  repaintBounderyLua4,
                                  SizedBox(width: 20),
                                  repaintBounderyLua5,
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                      'FAMÍLIA ${widget.nomefamilia.toUpperCase()}',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: fontAdj * 2,
                                          fontWeight: FontWeight.bold)),
                                ],
                              )
                            ])))))
      ]),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined, color: Colors.deepOrange),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.moneyBill, color: Colors.deepOrange),
            label: 'Preço da Foto',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.zoom_in, color: Colors.deepOrange),
            label: 'Zoon In',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.zoom_out, color: Colors.deepOrange),
            label: 'Zoon Out',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.store, color: Colors.deepOrange),
            label: 'Loja',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.deepOrange,
        unselectedItemColor: Colors.deepOrange,
        onTap: _onItemTapped,
      ),
    );
  }
}
