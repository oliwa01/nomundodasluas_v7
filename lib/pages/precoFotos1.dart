import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nomundodasluas_v7/classes/reusableContainerPreco.dart';
import 'package:nomundodasluas_v7/classes/rowAppBar.dart';
import 'package:nomundodasluas_v7/pages/principal.dart';
import 'package:url_launcher/url_launcher.dart';

import 'home.dart';
import 'luas.dart';

class PrecoFoto1 extends StatefulWidget {
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

  PrecoFoto1(
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
  _PrecoFoto1State createState() => _PrecoFoto1State();
}

class _PrecoFoto1State extends State<PrecoFoto1> {
  @override
  void initState() {
    super.initState();
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
    String _codVenda = widget.codVenda.toString();
    String c1x =
        "Sua foto foi salva Codigo de venda:\n $_codVenda.\n Informe este codigo no site de vendas , para sua foto ser localizada.";
    //

    //
    ReusabelContainerPreco r11 = ReusabelContainerPreco(
        iconeFrame: FontAwesomeIcons.images,
        tamanho: '20x25 cm',
        fontAdj: fontAdj,
        descricao: 'FOTO PAPEL FOTOGRÁFICO - 1 LUA - Tam. 20x25 cm',
        preco: 'R\$ 60,00',
        num: widget.numberPicture,
        codigo: 1);
    //
    ReusabelContainerPreco r12 = ReusabelContainerPreco(
        iconeFrame: FontAwesomeIcons.images,
        tamanho: '30x40 cm',
        fontAdj: fontAdj,
        descricao: 'FOTO PAPEL FOTOGRÁFICO - 1 LUA - Tam. 30x40 cm',
        preco: 'R\$ 90,00',
        num: widget.numberPicture,
        codigo: 2);
    //
    ReusabelContainerPreco r13 = ReusabelContainerPreco(
        iconeFrame: FontAwesomeIcons.images,
        tamanho: '50x60 cm',
        fontAdj: fontAdj,
        descricao: 'FOTO PAPEL FOTOGRÁFICO - 1 LUA - Tam. 50x60 cm',
        preco: 'R\$ 130,00',
        num: widget.numberPicture,
        codigo: 3);
    //
    ReusabelContainerPreco r14 = ReusabelContainerPreco(
        iconeFrame: FontAwesomeIcons.images,
        tamanho: '60x90 cm',
        fontAdj: fontAdj,
        descricao: 'FOTO PAPEL FOTOGRÁFICO - 1 LUA - Tam. 60x90 cm',
        preco: 'R\$ 190,00',
        num: widget.numberPicture,
        codigo: 4);
    //
    ReusabelContainerPreco r15 = ReusabelContainerPreco(
        iconeFrame: FontAwesomeIcons.fileImage,
        tamanho: 'DIGITAL',
        fontAdj: fontAdj,
        descricao: 'FOTO EM ARQUIVO DIGITAL - ALTA DEFINIÇÃO',
        preco: 'R\$ 100,00',
        num: widget.numberPicture,
        codigo: 5);
    //
    //
    ReusabelContainerPreco r21 = ReusabelContainerPreco(
        iconeFrame: FontAwesomeIcons.images,
        tamanho: '20x60 cm',
        fontAdj: fontAdj,
        descricao: 'FOTO PAPEL FOTOGRÁFICO - 2 LUAS Tam. 20x60 cm',
        preco: 'R\$ 135,00',
        num: widget.numberPicture,
        codigo: 1);
    //
    ReusabelContainerPreco r22 = ReusabelContainerPreco(
        iconeFrame: FontAwesomeIcons.images,
        tamanho: '30x90 cm',
        fontAdj: fontAdj,
        descricao: 'FOTO PAPEL FOTOGRÁFICO - 2 LUAS  - Tam. 30x90 cm',
        preco: 'R\$ 160,00',
        num: widget.numberPicture,
        codigo: 2);
    //
    ReusabelContainerPreco r23 = ReusabelContainerPreco(
        iconeFrame: FontAwesomeIcons.images,
        tamanho: '40x120 cm',
        fontAdj: fontAdj,
        descricao: 'FOTO PAPEL FOTOGRÁFICO - 2 LUAS  - Tam. 40x120 cm',
        preco: 'R\$ 240,00',
        num: widget.numberPicture,
        codigo: 3);
    //
    ReusabelContainerPreco r24 = ReusabelContainerPreco(
        iconeFrame: FontAwesomeIcons.images,
        tamanho: '60x180 cm',
        fontAdj: fontAdj,
        descricao: 'FOTO PAPEL FOTOGRÁFICO - 2 LUAS  - Tam. 60X180 cm',
        preco: 'R\$ 350,00',
        num: widget.numberPicture,
        codigo: 4);
    //
    ReusabelContainerPreco r25 = ReusabelContainerPreco(
        iconeFrame: FontAwesomeIcons.fileImage,
        tamanho: 'DIGITAL',
        fontAdj: fontAdj,
        descricao: 'FOTO EM ARQUIVO DIGITAL - ALTA DEFINIÇÃO',
        preco: 'R\$ 120,00',
        num: widget.numberPicture,
        codigo: 5);
    //
    //
    ReusabelContainerPreco r31 = ReusabelContainerPreco(
        iconeFrame: FontAwesomeIcons.images,
        tamanho: '20x60 cm',
        fontAdj: fontAdj,
        descricao: 'FOTO PAPEL FOTOGRÁFICO - 3 LUAS  - Tam. 20x60 cm',
        preco: 'R\$ 145,00',
        num: widget.numberPicture,
        codigo: 1);
    //
    ReusabelContainerPreco r32 = ReusabelContainerPreco(
        iconeFrame: FontAwesomeIcons.images,
        tamanho: '30x90 cm',
        fontAdj: fontAdj,
        descricao: 'FOTO PAPEL FOTOGRÁFICO -3 LUAS  - Tam. 30x90 cm',
        preco: 'R\$ 180,00',
        num: widget.numberPicture,
        codigo: 2);
    //
    ReusabelContainerPreco r33 = ReusabelContainerPreco(
        iconeFrame: FontAwesomeIcons.images,
        tamanho: '40x120 cm',
        fontAdj: fontAdj,
        descricao: 'FOTO PAPEL FOTOGRÁFICO -3 LUAS  - Tam. 40x120 cm',
        preco: 'R\$ 260,00',
        num: widget.numberPicture,
        codigo: 3);
    //
    ReusabelContainerPreco r34 = ReusabelContainerPreco(
        iconeFrame: FontAwesomeIcons.images,
        tamanho: '60x180 cm',
        fontAdj: fontAdj,
        descricao: 'FOTO PAPEL FOTOGRÁFICO -3 LUAS  - Tam. 60x180 cm',
        preco: 'R\$ 370,00',
        num: widget.numberPicture,
        codigo: 4);
    //
    ReusabelContainerPreco r35 = ReusabelContainerPreco(
        iconeFrame: FontAwesomeIcons.fileImage,
        tamanho: 'DIGITAL',
        fontAdj: fontAdj,
        descricao: 'FOTO EM ARQUIVO DIGITAL - ALTA DEFINIÇÃO',
        preco: 'R\$ 120,00',
        num: widget.numberPicture,
        codigo: 5);
    //
    //
    ReusabelContainerPreco r41 = ReusabelContainerPreco(
        iconeFrame: FontAwesomeIcons.images,
        tamanho: '20x60 cm',
        fontAdj: fontAdj,
        descricao: 'FOTO PAPEL FOTOGRÁFICO -4 LUAS  - Tam. 20x60 cm',
        preco: 'R\$ 165,00',
        num: widget.numberPicture,
        codigo: 1);
    //
    ReusabelContainerPreco r42 = ReusabelContainerPreco(
        iconeFrame: FontAwesomeIcons.images,
        tamanho: '30x90 cm',
        fontAdj: fontAdj,
        descricao: 'FOTO PAPEL FOTOGRÁFICO -4 LUAS  - Tam. 30x90 cm',
        preco: 'R\$ 200,00',
        num: widget.numberPicture,
        codigo: 2);
    //
    ReusabelContainerPreco r43 = ReusabelContainerPreco(
        iconeFrame: FontAwesomeIcons.images,
        tamanho: '40x120 cm',
        fontAdj: fontAdj,
        descricao: 'FOTO PAPEL FOTOGRÁFICO -4 LUAS  - Tam. 40x120 cm',
        preco: 'R\$ 280,00',
        num: widget.numberPicture,
        codigo: 3);
    //
    ReusabelContainerPreco r44 = ReusabelContainerPreco(
        iconeFrame: FontAwesomeIcons.images,
        tamanho: '60X180 cm',
        fontAdj: fontAdj,
        descricao: 'FOTO PAPEL FOTOGRÁFICO -4 LUAS  - Tam. 60X180 cm',
        preco: 'R\$ 390,00',
        num: widget.numberPicture,
        codigo: 4);
    //
    ReusabelContainerPreco r45 = ReusabelContainerPreco(
        iconeFrame: FontAwesomeIcons.fileImage,
        tamanho: 'DIGITAL',
        fontAdj: fontAdj,
        descricao: 'FOTO EM ARQUIVO DIGITAL - ALTA DEFINIÇÃO',
        preco: 'R\$ 160,00',
        num: widget.numberPicture,
        codigo: 5);
    //
    //
    ReusabelContainerPreco r51 = ReusabelContainerPreco(
        iconeFrame: FontAwesomeIcons.images,
        tamanho: '20x60 cm',
        fontAdj: fontAdj,
        descricao: 'FOTO PAPEL FOTOGRÁFICO -5 LUAS  - Tam. 20x60 cm',
        preco: 'R\$ 185,00',
        num: widget.numberPicture,
        codigo: 1);
    //
    ReusabelContainerPreco r52 = ReusabelContainerPreco(
        iconeFrame: FontAwesomeIcons.images,
        tamanho: '30x90 cm',
        fontAdj: fontAdj,
        descricao: 'FOTO PAPEL FOTOGRÁFICO -5 LUAS  - Tam. 30x90 cm',
        preco: 'R\$ 220,00',
        num: widget.numberPicture,
        codigo: 2);
    //
    ReusabelContainerPreco r53 = ReusabelContainerPreco(
        iconeFrame: FontAwesomeIcons.images,
        tamanho: '40x120 cm',
        fontAdj: fontAdj,
        descricao: 'FOTO PAPEL FOTOGRÁFICO -5 LUAS  - Tam. 40x120 cm',
        preco: 'R\$ 280,00',
        num: widget.numberPicture,
        codigo: 3);
    //
    ReusabelContainerPreco r54 = ReusabelContainerPreco(
        iconeFrame: FontAwesomeIcons.images,
        tamanho: '60X180 cm',
        fontAdj: fontAdj,
        descricao: 'FOTO PAPEL FOTOGRÁFICO -5 LUAS  - Tam. 60x180 cm',
        preco: 'R\$ 390,00',
        num: widget.numberPicture,
        codigo: 4);
    //
    ReusabelContainerPreco r55 = ReusabelContainerPreco(
        iconeFrame: FontAwesomeIcons.fileImage,
        tamanho: 'DIGITAL',
        fontAdj: fontAdj,
        descricao: 'FOTO EM ARQUIVO DIGITAL - ALTA DEFINIÇÃO',
        preco: 'R\$ 180,00',
        num: widget.numberPicture,
        codigo: 5);
    //
    //
    ReusabelContainerPreco r61 = ReusabelContainerPreco(
        iconeFrame: FontAwesomeIcons.images,
        tamanho: '20x60 cm',
        fontAdj: fontAdj,
        descricao: 'FOTO PAPEL FOTOGRÁFICO -6 LUAS  - Tam. 20x60 cm',
        preco: 'R\$ 205,00',
        num: widget.numberPicture,
        codigo: 1);
    //
    ReusabelContainerPreco r62 = ReusabelContainerPreco(
        iconeFrame: FontAwesomeIcons.images,
        tamanho: '30x90 cm',
        fontAdj: fontAdj,
        descricao: 'FOTO PAPEL FOTOGRÁFICO -6 LUAS  - Tam. 30x90 cm',
        preco: 'R\$ 240,00',
        num: widget.numberPicture,
        codigo: 2);
    //
    ReusabelContainerPreco r63 = ReusabelContainerPreco(
        iconeFrame: FontAwesomeIcons.images,
        tamanho: '40x120 cm',
        fontAdj: fontAdj,
        descricao: 'FOTO PAPEL FOTOGRÁFICO -6 LUAS  - Tam. 40x120 cm',
        preco: 'R\$ 300,00',
        num: widget.numberPicture,
        codigo: 3);
    //
    ReusabelContainerPreco r64 = ReusabelContainerPreco(
        iconeFrame: FontAwesomeIcons.images,
        tamanho: '60X180 cm',
        fontAdj: fontAdj,
        descricao: 'FOTO PAPEL FOTOGRÁFICO -6 LUAS  - Tam. 60X180 cm',
        preco: 'R\$ 410,00',
        num: widget.numberPicture,
        codigo: 4);
    //
    ReusabelContainerPreco r65 = ReusabelContainerPreco(
        iconeFrame: FontAwesomeIcons.fileImage,
        tamanho: 'DIGITAL',
        fontAdj: fontAdj,
        descricao: 'FOTO EM ARQUIVO DIGITAL - ALTA DEFINIÇÃO',
        preco: 'R\$ 200,00',
        num: widget.numberPicture,
        codigo: 5);
    //

    //
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: RowAppBarr(' ', widthlua, heightlua, widget.email, 'luas'),
        centerTitle: true,
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            color: Colors.white,
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return Luas(widget.email);
              }));
            }),
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/fundodatas.png"),
                fit: BoxFit.cover)),
        width: widthlua,
        height: heightlua * 0.9,
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 0, horizontal: horizonte),
          child: Container(
            child: Column(
              children: [
                SizedBox(height: 10),
                Container(
                    alignment: Alignment.center,
                    width: widthlua,
                    height: heightlua * 0.1,
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: Colors.deepOrange,
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Text(c1x,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'conforta',
                            fontSize: fontAdj * 0.6))),
                SizedBox(height: 10),
                widget.numberPicture == 1
                    ? r11
                    : widget.numberPicture == 2
                        ? r21
                        : widget.numberPicture == 3
                            ? r31
                            : widget.numberPicture == 4
                                ? r41
                                : widget.numberPicture == 5
                                    ? r51
                                    : r61,
                SizedBox(height: 10),
                widget.numberPicture == 1
                    ? r12
                    : widget.numberPicture == 2
                        ? r22
                        : widget.numberPicture == 3
                            ? r32
                            : widget.numberPicture == 4
                                ? r42
                                : widget.numberPicture == 5
                                    ? r52
                                    : r62,
                SizedBox(height: 10),
                widget.numberPicture == 1
                    ? r13
                    : widget.numberPicture == 2
                        ? r23
                        : widget.numberPicture == 3
                            ? r33
                            : widget.numberPicture == 4
                                ? r43
                                : widget.numberPicture == 5
                                    ? r53
                                    : r63,
                SizedBox(height: 10),
                widget.numberPicture == 1
                    ? r14
                    : widget.numberPicture == 2
                        ? r24
                        : widget.numberPicture == 3
                            ? r34
                            : widget.numberPicture == 4
                                ? r44
                                : widget.numberPicture == 5
                                    ? r54
                                    : r64,
                SizedBox(height: 10),
                widget.numberPicture == 1
                    ? r15
                    : widget.numberPicture == 2
                        ? r25
                        : widget.numberPicture == 3
                            ? r35
                            : widget.numberPicture == 4
                                ? r45
                                : widget.numberPicture == 5
                                    ? r55
                                    : r65,
                SizedBox(height: 10),
              ],
            ),
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
