import 'dart:math';

import 'package:flutter/material.dart';

class ColumnDateTime extends StatelessWidget {
  ColumnDateTime(this.icon, this.textoIcone);

  final String icon;
  final String textoIcone;

  @override
  Widget build(BuildContext context) {
    final widthlua = MediaQuery.of(context).size.width;
    final heigthlua = MediaQuery.of(context).size.height;
    bool portrait = (heigthlua > widthlua);
    double fontAdj = portrait
        ? sqrt(heigthlua) / (heigthlua / widthlua)
        : sqrt(heigthlua) / (widthlua / heigthlua);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(icon,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: fontAdj * 0.8, color: Colors.white)),
        SizedBox(height: 15.0),
        Text(textoIcone,
            style: TextStyle(fontSize: fontAdj * 0.9, color: Colors.white)),
      ],
    );
  }
}
