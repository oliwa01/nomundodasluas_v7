import 'dart:math';

import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nomundodasluas_v7/classes/containermenuitem.dart';
import 'package:nomundodasluas_v7/classes/rowAppBar.dart';
import 'package:nomundodasluas_v7/pages/cadastro.dart';
import 'package:nomundodasluas_v7/pages/entrada.dart';
import 'package:nomundodasluas_v7/pages/principal.dart';
import 'package:platform_detect2/platform_detect2.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<FabCircularMenuState> fabKey = GlobalKey();
  bool _visible = false;
  void _showSnackBar(BuildContext context, String message) {
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text(message),
      duration: const Duration(milliseconds: 1000),
    ));
  }

  @override
  void initState() {
    if (!browser.isChrome) {
      showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          backgroundColor: Colors.white,
          title: const Text('App. DESENVOLVIDO PARA GOOGLE CHROME'),
          content: const Text('Poderá ocorrer INSTABILIDADE.'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final widthlua = MediaQuery.of(context).size.width;
    final heigthlua = MediaQuery.of(context).size.height;
    bool portrait = (heigthlua > widthlua);
    double fontAdj = portrait
        ? sqrt(heigthlua) / (heigthlua / widthlua)
        : sqrt(heigthlua) / (widthlua / heigthlua);

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: RowAppBarr('Home', widthlua, heigthlua, '', 'home'),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/luas.gif"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[],
        ),
      ),
      floatingActionButton: Visibility(
        visible: !_visible,
        child: Builder(
          builder: (context) => FabCircularMenu(
            key: fabKey,
            // Cannot be `Alignment.center`
            alignment: Alignment.bottomRight,
            ringColor: Colors.white.withAlpha(25),
            ringDiameter: 500.0,
            ringWidth: 150.0,
            fabSize: 64.0,
            fabElevation: 8.0,
            fabIconBorder: CircleBorder(),
            // Also can use specific color based on wether
            // the menu is open or not:
            // fabOpenColor: Colors.white
            // fabCloseColor: Colors.white
            // These properties take precedence over fabColor
            fabColor: Colors.deepOrange,
            fabOpenIcon:
                Icon(FontAwesomeIcons.alignJustify, color: Colors.white),
            fabCloseIcon:
                Icon(FontAwesomeIcons.arrowRight, color: Colors.white),
            fabMargin: const EdgeInsets.all(16.0),
            animationDuration: const Duration(milliseconds: 800),
            animationCurve: Curves.easeInSine,
            onDisplayChange: (isOpen) {
              _showSnackBar(
                  context, "${isOpen ? "Escolha Forma de Entrada" : "closed"}");
            },
            children: <Widget>[
              RawMaterialButton(
                onPressed: () {
                  _showSnackBar(context, "Entrar sem identificação.");
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Principal('aaaa.anonimo@anonimo.com');
                  }));
                },
                shape: CircleBorder(),
                padding: const EdgeInsets.all(24.0),
                child: ContainerMenuItem(
                    widthlua: widthlua,
                    heigthlua: heigthlua,
                    textButtomMenu: "ENTRAR SEM E-MAIL."),
                textStyle: TextStyle(fontSize: fontAdj, color: Colors.white),
              ),
              RawMaterialButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Cadastro();
                  }));
                },
                shape: CircleBorder(),
                padding: const EdgeInsets.all(24.0),
                child: ContainerMenuItem(
                    widthlua: widthlua,
                    heigthlua: heigthlua,
                    textButtomMenu: "CADASTRAR EMAIL"),
                textStyle: TextStyle(fontSize: fontAdj, color: Colors.white),
              ),
              RawMaterialButton(
                onPressed: () {
                  _showSnackBar(context, "Usuario Cadastrado");
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Entrada();
                  }));
                },
                shape: CircleBorder(),
                padding: const EdgeInsets.all(24.0),
                child: ContainerMenuItem(
                    widthlua: widthlua,
                    heigthlua: heigthlua,
                    textButtomMenu: "JÁ TENHO CADASTRO"),
                textStyle: TextStyle(fontSize: fontAdj, color: Colors.white),
              ),
              RawMaterialButton(
                  onPressed: () {
                    _showSnackBar(context, "You pressed 3");
                  },
                  shape: CircleBorder(),
                  padding: const EdgeInsets.all(24.0)),
            ],
          ),
        ),
      ),
    );
  }
}
