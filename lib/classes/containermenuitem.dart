import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ContainerMenuItem extends StatelessWidget {
  const ContainerMenuItem(
      {Key? key,
      required this.widthlua,
      required this.heigthlua,
      required this.textButtomMenu})
      : super(key: key);

  final double widthlua;
  final double heigthlua;
  final String textButtomMenu;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
            color: Colors.deepOrange,
            borderRadius: BorderRadius.circular(10.0)),
        width: (widthlua > 1000)
            ? widthlua * 0.10
            : (widthlua > 600)
                ? widthlua * 0.25
                : widthlua * 0.42,
        height: (heigthlua > 900)
            ? heigthlua * 0.03
            : (heigthlua > 700)
                ? heigthlua * 0.06
                : heigthlua * 0.04,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(FontAwesomeIcons.plusCircle, size: 12),
            Text(
              textButtomMenu,
              style: TextStyle(
                  fontSize: (widthlua > 1300)
                      ? 10
                      : (widthlua > 1000)
                          ? 8
                          : (widthlua > 700)
                              ? 10
                              : 12),
            )
          ],
        ));
  }
}
