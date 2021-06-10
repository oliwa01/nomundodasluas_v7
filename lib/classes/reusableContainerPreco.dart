import 'package:flutter/material.dart';
import 'package:hovering/hovering.dart';
import 'package:url_launcher/url_launcher.dart';

class ReusabelContainerPreco extends StatelessWidget {
  const ReusabelContainerPreco({
    required this.iconeFrame,
    required this.tamanho,
    required this.fontAdj,
    required this.descricao,
    required this.preco,
    required this.num,
    required this.codigo,
  });

  final IconData iconeFrame;
  final String tamanho;
  final double fontAdj;
  final String descricao;
  final String preco;
  final int num;
  final int codigo;

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

  controlab1() {
    if ((codigo == 1) ||
        (codigo == 2) ||
        (codigo == 3) ||
        (codigo == 4) ||
        (codigo == 5)) {
      if (num == 1) {
        _launchInBrowser(
            "https://loja.nomundodasluas.com.br/mapa-lunar-1-lua-papel-fotografico-");
      } else if (num == 2) {
        _launchInBrowser(
            "https://loja.nomundodasluas.com.br/3b4hksotm-mapa-lunar-1-lua-papel-fotografico-2020-06-30-12-45-06");
      } else if (num == 3) {
        _launchInBrowser(
            "https://loja.nomundodasluas.com.br/mapa-lunar-3-luas-papel-fotografico");
      } else if (num == 4) {
        _launchInBrowser(
            "https://loja.nomundodasluas.com.br/mapa-lunar-4-luas-papel-fotografico");
      } else if (num == 5) {
        _launchInBrowser(
            "https://loja.nomundodasluas.com.br/mapa-lunar-5-luas-papel-fotografico");
      } else if (num == 6) {
        _launchInBrowser(
            "https://loja.nomundodasluas.com.br/mapa-lunar-6-luas-papel-fotografico");
      } else {
        _launchInBrowser("https://loja.nomundodasluas.com.br/");
      }
    }

    if (codigo == 5) {
      if (num == 1) {
        _launchInBrowser(
            "https://loja.nomundodasluas.com.br/mapa-lunar-individual-aquivo-digital");
      } else if (num == 2) {
        _launchInBrowser(
            "https://loja.nomundodasluas.com.br/o9c29y2rk-mapa-lunar-individual-aquivo-digital");
      } else if (num == 3) {
        _launchInBrowser(
            "https://loja.nomundodasluas.com.br/hdlgje02v-mapa-lunar-2-luas-aquivo-digital");
      } else if (num == 4) {
        _launchInBrowser(
            "https://loja.nomundodasluas.com.br/qq0zhlhdl-mapa-lunar-3-luas-aquivo-digital");
      } else if (num == 5) {
        _launchInBrowser(
            "https://loja.nomundodasluas.com.br/abri5rvt3-mapa-lunar-4-luas-aquivo-digital");
      } else if (num == 6) {
        _launchInBrowser(
            "https://loja.nomundodasluas.com.br/eoor9wmiu-mapa-lunar-5-luas-aquivo-digital");
      } else {
        _launchInBrowser("https://loja.nomundodasluas.com.br/");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 1,
        child: GestureDetector(
          onTap: () {
            controlab1();
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                  flex: 1,
                  child: HoverContainer(
                    hoverDecoration: BoxDecoration(
                        color: Colors.deepOrange[300],
                        borderRadius: BorderRadius.circular(10.0)),
                    decoration: BoxDecoration(
                        color: Colors.white12,
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(iconeFrame, size: 60),
                        Text(tamanho,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: fontAdj * 0.8,
                                fontWeight: FontWeight.bold,
                                color: Colors.white))
                      ],
                    ),
                  )),
              SizedBox(width: 15),
              Expanded(
                  flex: 3,
                  child: Align(
                    child: HoverContainer(
                        hoverDecoration: BoxDecoration(
                            color: Colors.deepOrange[300],
                            borderRadius: BorderRadius.circular(10.0)),
                        alignment: Alignment.center,
                        width: double.infinity,
                        height: double.infinity,
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            color: Colors.white12,
                            borderRadius: BorderRadius.circular(10.0)),
                        child: Text(descricao,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'conforta',
                                fontSize: fontAdj * 0.8))),
                  )),
              SizedBox(width: 15),
              Expanded(
                  flex: 1,
                  child: Align(
                    child: HoverContainer(
                        hoverDecoration: BoxDecoration(
                            color: Colors.deepOrange[300],
                            borderRadius: BorderRadius.circular(10.0)),
                        alignment: Alignment.center,
                        width: double.infinity,
                        height: double.infinity,
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            color: Colors.white12,
                            borderRadius: BorderRadius.circular(10.0)),
                        child: Text(preco,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'conforta',
                                fontSize: fontAdj * 0.8))),
                  ))
            ],
          ),
        ));
  }
}
