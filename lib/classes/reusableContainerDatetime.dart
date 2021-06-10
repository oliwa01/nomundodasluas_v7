import 'package:flutter/material.dart';
import 'package:nomundodasluas_v7/constantes/constantes.dart';

class ReusableContainerDatetime extends StatelessWidget {
  ReusableContainerDatetime(this.cor, this.cardChild, this.onPress);
  Color cor = kcolorDataUnSelect;
  final Widget cardChild;
  Function onPress;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {onPress()},
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
            color: cor, borderRadius: BorderRadius.circular(10.0)),
      ),
    );
  }
}
