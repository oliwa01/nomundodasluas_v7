import 'dart:math';

import 'package:flutter/material.dart';

class RowAppBarr extends StatelessWidget {
  RowAppBarr(
      this.titulo, this.widthLua, this.heightlua, this.email, this.origem);
  final String email;
  final String titulo;
  final double widthLua;
  final double heightlua;
  final String origem;

  @override
  Widget build(BuildContext context) {
    bool portrait = (heightlua > widthLua);
    double fontAdj = portrait
        ? sqrt(heightlua) / (heightlua / widthLua)
        : sqrt(heightlua) / (widthLua / heightlua);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset(
          'assets/images/logo.png',
          scale: 21.2,
        ),
        Text(
          'No Mundo das Luas',
          style: TextStyle(
              fontFamily: 'nightsky',
              color: Colors.white,
              // fontWeight: FontWeight.bold,
              fontSize: fontAdj),
        ),
        Column(
          children: [
            Text(
              'v6 - Apr2021',
              style: TextStyle(
                  fontFamily: 'Monstserrat',
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: fontAdj / 3),
            ),
            Text(
              email,
              style: TextStyle(
                  fontFamily: 'Monstserrat',
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: fontAdj / 3),
            ),
          ],
        ),
      ],
    );
  }
}
