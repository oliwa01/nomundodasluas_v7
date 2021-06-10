import 'dart:math';

import 'package:flutter/material.dart';

class ContainerNomeFamilia extends StatefulWidget {
  String nomeFamilia = '';

  @override
  _ContainerNomeFamiliaState createState() => _ContainerNomeFamiliaState();
}

class _ContainerNomeFamiliaState extends State<ContainerNomeFamilia> {
  TextEditingController _controllerNomeFamilia =
      TextEditingController(text: "");
  nomeDigitado(value) {
    setState(() {
      widget.nomeFamilia = value;
    });
    return widget.nomeFamilia;
  }

  @override
  Widget build(BuildContext context) {
    final widthlua = MediaQuery.of(context).size.width;
    final heightlua = MediaQuery.of(context).size.height;
    double heightNomeFamilia = heightlua * 0.12;
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
    bool portrait = (heightlua > widthlua);
    double fontAdj = portrait
        ? sqrt(heightlua) / (heightlua / widthlua)
        : sqrt(heightlua) / (widthlua / heightlua);

    return Container(
      height: heightNomeFamilia,
      margin: EdgeInsets.symmetric(vertical: 0, horizontal: horizonte),
      decoration: BoxDecoration(
          color: Colors.black38, borderRadius: BorderRadius.circular(20.0)),
      child: Container(
        child: Column(
          children: <Widget>[
            Expanded(
                flex: 1,
                child: Container(
                  alignment: Alignment.center,
                  child: TextField(
                      controller: _controllerNomeFamilia,
                      keyboardType: TextInputType.emailAddress,
                      style: TextStyle(color: Colors.black, fontSize: fontAdj),
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                          hintText: "Nome Familia",
                          hintStyle: TextStyle(color: Colors.grey),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(32))),
                      onChanged: (value) => {nomeDigitado(value)}),
                )),

            // Expanded(flex: 4, child: Container()),
          ],
        ),
      ),
    );
  }
}
