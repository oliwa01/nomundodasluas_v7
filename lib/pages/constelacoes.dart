import 'dart:math';

import 'package:flutter/material.dart';
import 'package:nomundodasluas_v7/classes/containerSigno.dart';
import 'package:nomundodasluas_v7/classes/rowAppBar.dart';
import 'package:nomundodasluas_v7/pages/detalhesConstelacao.dart';
import 'package:nomundodasluas_v7/pages/principal.dart';
import 'package:url_launcher/url_launcher.dart';

import 'home.dart';
import 'luas.dart';

class Constelacao extends StatefulWidget {
  Constelacao(this.email);
  final String email;
  @override
  _ConstelacaoState createState() => _ConstelacaoState();
}

class _ConstelacaoState extends State<Constelacao> {
  String titulo = 'O signo do Zodíaco sob o qual você nasceu e chamado seu signo do Sol. A maioria das pessoas sabe qual é o seu signo do Sol e provavelmente tem alguma idéia das características abrangidas por esse signo. Quando um astrólogo levanta um mapa natal leva em conta muito mais do que o Sol isoladamente. Por exemplo, ele examina a casa1 em que estão colocados o Sol e a Lua e também examina os dez planetas do nosso sistema solar em termos de casa e de signo. Examina o Ascendente, o Meio-do-Céu, os nodos da Lua e os aspectos (ângulos geométricos) formados por todos esses fatores entre si. Dependendo de sua abordagem ele pode examinar o immum-coeli; o Descendente, os pontos médios, as partes arábicas, as estrelas fixas, as vibrações harmônicas, os vértices e tudo mais em que possa pensar. ' +
      'Tudo isso o fará mergulhar na personalidade do nativo, mas não na passagem do tempo, configurada nos acontecimentos diários, mensais e anuais de sua vida. Para isso ele precisará examinar as progressões um-dia-por-um-ano (também chamadas direções secundárias), os trânsitos e as fases da Lua. Mas, por favor, não deixe que isso tudo o desanime – não é necessário examinar todos esses efeitos; muitas vezes é possível obter informação suficiente com uma astrologia mais simples. De qualquer forma, pense nisso - se eu consigo, você também consegue dominar o assunto.' +
      'Logo Abaixo você podera fazer um estudo em profundidade da Lua e de seus efeitos sobre a natureza de todos nós.' +
      'Fonte: A Influência da Lua na Nossa Vida Diária – Signos Lunares Sasha Fenton\n\n\n\n';
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
    ContainerSigno cs1 =
        ContainerSigno(horizonte: horizonte, images1: 'assets/images/ar.png');
    ContainerSigno cs2 =
        ContainerSigno(horizonte: horizonte, images1: 'assets/images/to.png');
    ContainerSigno cs3 =
        ContainerSigno(horizonte: horizonte, images1: 'assets/images/ge.png');
    ContainerSigno cs4 =
        ContainerSigno(horizonte: horizonte, images1: 'assets/images/ca.png');
    ContainerSigno cs5 =
        ContainerSigno(horizonte: horizonte, images1: 'assets/images/le.png');
    ContainerSigno cs6 =
        ContainerSigno(horizonte: horizonte, images1: 'assets/images/vi.png');
    ContainerSigno cs7 =
        ContainerSigno(horizonte: horizonte, images1: 'assets/images/li.png');
    ContainerSigno cs8 =
        ContainerSigno(horizonte: horizonte, images1: 'assets/images/es.png');
    ContainerSigno cs9 =
        ContainerSigno(horizonte: horizonte, images1: 'assets/images/sa.png');
    ContainerSigno cs10 =
        ContainerSigno(horizonte: horizonte, images1: 'assets/images/cap.png');
    ContainerSigno cs11 =
        ContainerSigno(horizonte: horizonte, images1: 'assets/images/aq.png');
    ContainerSigno cs12 =
        ContainerSigno(horizonte: horizonte, images1: 'assets/images/pe.png');
    detalheConstelacao(signo) {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return DetalhesConstelacao(widget.email, signo);
      }));
    }

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
          backgroundColor: Colors.black,
          title: RowAppBarr(' ', widthlua, heightlua, widget.email, 'luas'),
          centerTitle: true,
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              color: Colors.white,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return Principal(widget.email);
                  }),
                );
              })),
      body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage("assets/images/fundodatas.png"),
            fit: BoxFit.cover,
          )),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                SizedBox(height: 20),
                Align(
                  child: Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.symmetric(
                          vertical: 0, horizontal: horizonte),
                      height: portrait ? 400 : 250,
                      decoration: BoxDecoration(
                          color: Colors.white12,
                          borderRadius: BorderRadius.circular(20)),
                      child: Text(
                        titulo,
                        style: TextStyle(
                            color: Colors.white, fontSize: fontAdj * 0.8),
                        textAlign: TextAlign.center,
                      )),
                ),
                SizedBox(height: 10),
                GestureDetector(
                    onTap: () {
                      detalheConstelacao('ar');
                    },
                    child: cs1),
                SizedBox(height: 10),
                GestureDetector(
                    onTap: () {
                      detalheConstelacao('to');
                    },
                    child: cs2),
                SizedBox(height: 10),
                GestureDetector(
                    onTap: () {
                      detalheConstelacao('ge');
                    },
                    child: cs3),
                SizedBox(height: 10),
                GestureDetector(
                    onTap: () {
                      detalheConstelacao('ca');
                    },
                    child: cs4),
                SizedBox(height: 10),
                GestureDetector(
                    onTap: () {
                      detalheConstelacao('le');
                    },
                    child: cs5),
                SizedBox(height: 10),
                GestureDetector(
                    onTap: () {
                      detalheConstelacao('vi');
                    },
                    child: cs6),
                SizedBox(height: 10),
                GestureDetector(
                    onTap: () {
                      detalheConstelacao('li');
                    },
                    child: cs7),
                SizedBox(height: 10),
                GestureDetector(
                    onTap: () {
                      detalheConstelacao('es');
                    },
                    child: cs8),
                SizedBox(height: 10),
                GestureDetector(
                    onTap: () {
                      detalheConstelacao('sa');
                    },
                    child: cs9),
                SizedBox(height: 10),
                GestureDetector(
                    onTap: () {
                      detalheConstelacao('cap');
                    },
                    child: cs10),
                SizedBox(height: 10),
                GestureDetector(
                    onTap: () {
                      detalheConstelacao('aq');
                    },
                    child: cs11),
                SizedBox(height: 10),
                GestureDetector(
                    onTap: () {
                      detalheConstelacao('pe');
                    },
                    child: cs12),
                SizedBox(height: 10),
              ],
            ),
          )),
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
