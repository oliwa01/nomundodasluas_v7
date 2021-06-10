import 'dart:math';

import 'package:flutter/material.dart';

class ColumnHemisferio extends StatelessWidget {
  ColumnHemisferio(this.icon, this.textoIcone);

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
    double scalaimage = (heigthlua > 1000)
        ? heigthlua / (heigthlua / 2)
        : (heigthlua > 900)
            ? heigthlua / (heigthlua / 4.1)
            : (heigthlua > 800)
                ? heigthlua / (heigthlua / 4.2)
                : (heigthlua > 700)
                    ? heigthlua / (heigthlua / 4.3)
                    : (heigthlua > 600)
                        ? heigthlua / (heigthlua / 5)
                        : (heigthlua > 500)
                            ? heigthlua / (heigthlua / 5)
                            : (heigthlua > 400)
                                ? heigthlua / (heigthlua / 6)
                                : (heigthlua > 300)
                                    ? heigthlua / (heigthlua / 6.5)
                                    : (heigthlua > 200)
                                        ? heigthlua / (heigthlua / 7)
                                        : 2;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          icon,
          scale: scalaimage,
        ),
        SizedBox(height: 10.0),
        Text(textoIcone,
            style:
                TextStyle(fontSize: fontAdj * 0.6, color: Color(0xFF8D8E98))),
      ],
    );
  }
}
