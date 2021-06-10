import 'package:flutter/material.dart';

class ColumnImage extends StatelessWidget {
  ColumnImage(this.imageLua);
  final String imageLua;

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
                    color: Color(0x12b8b3a5),
                    borderRadius: BorderRadius.circular(10.0)),
                child: Image.asset(imageLua)))
      ],
    );
  }
}
