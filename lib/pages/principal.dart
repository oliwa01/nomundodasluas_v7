import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nomundodasluas_v7/classes/ColumnIcon.dart';
import 'package:nomundodasluas_v7/classes/ReusableContainer.dart';
import 'package:nomundodasluas_v7/classes/rowAppBar.dart';
import 'package:url_launcher/url_launcher.dart';

import 'home.dart';
import 'luas.dart';

const cor_click = Color(0xFF1D1E33);
const cor_botao = Color(0xFF111328);

class Principal extends StatefulWidget {
  Principal(this.email);
  final String email;
  @override
  _PrincipalState createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
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
    double fontButton = fontAdj * 1.4;
    ColumnIcon c1 = ColumnIcon(FontAwesomeIcons.moon,
        "Descubra a Lua do dia do seu nascimento", fontButton);
    ColumnIcon c2 = ColumnIcon(FontAwesomeIcons.solidMoon,
        "Informações Astrológicas das Constelações Lunares", fontButton);
    ColumnIcon c3 =
        ColumnIcon(FontAwesomeIcons.images, "Galeria de Fotos", fontButton);
    ColumnIcon c4 =
        ColumnIcon(FontAwesomeIcons.fileImage, "Fotos Geradas", fontButton);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: RowAppBarr(' ', widthlua, heightlua, widget.email, 'home'),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/fundodatas.png"),
                fit: BoxFit.cover)),
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 0, horizontal: horizonte),
          child: Center(
            child: Column(
              children: <Widget>[
                Expanded(
                    flex: 1,
                    child: ReusableContainer(
                        Colors.transparent, c1, 1, widget.email)),
                Expanded(
                    flex: 1,
                    child: ReusableContainer(
                        Colors.transparent, c2, 2, widget.email)),
                Expanded(
                    flex: 1,
                    child: ReusableContainer(
                        Colors.transparent, c3, 3, widget.email)),
                Expanded(
                    flex: 1,
                    child: ReusableContainer(
                        Colors.transparent, c4, 4, widget.email)),
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
