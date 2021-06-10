import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ColumnIcon extends StatelessWidget {
  ColumnIcon(this.iconlua, this.textoIcone, this.fontsize);
  final double fontsize;
  final IconData iconlua;
  final String textoIcone;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
            flex: 1,
            child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                    color: Color(0x44b8b3a5),
                    borderRadius: BorderRadius.circular(10.0)),
                child: Icon(
                  iconlua,
                  size: 60,
                  color: Colors.white,
                ))),
        SizedBox(width: 10.0),
        Expanded(
          flex: 3,
          child: Container(
            padding: const EdgeInsets.all(6.0),
            alignment: Alignment.center,
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
                color: Color(0x44b8b3a5),
                borderRadius: BorderRadius.circular(10.0)),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                textoIcone,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: fontsize,
                    color: Colors.white,
                    fontFamily: 'conforta'),
              ),
            ]),
          ),
        )
      ],
    );
  }
}
