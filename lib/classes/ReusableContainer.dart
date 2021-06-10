import 'package:flutter/material.dart';
import 'package:nomundodasluas_v7/pages/cadastroFotosSalvas.dart';
import 'package:nomundodasluas_v7/pages/constelacoes.dart';
import 'package:nomundodasluas_v7/pages/fotossalvas.dart';
import 'package:nomundodasluas_v7/pages/lua1.dart';
import 'package:nomundodasluas_v7/pages/lua2.dart';
import 'package:nomundodasluas_v7/pages/lua3.dart';
import 'package:nomundodasluas_v7/pages/lua4.dart';
import 'package:nomundodasluas_v7/pages/lua5.dart';
import 'package:nomundodasluas_v7/pages/lua6.dart';
import 'package:nomundodasluas_v7/pages/luas.dart';
import 'package:nomundodasluas_v7/pages/slideFotos.dart';

class ReusableContainer extends StatefulWidget {
  ReusableContainer(this.cor, this.cardChild, this.item, this.email);
  Color cor;
  final Widget cardChild;
  final int item;
  final String email;
  @override
  _ReusableContainerState createState() => _ReusableContainerState();
}

class _ReusableContainerState extends State<ReusableContainer> {
  @override
  Widget build(BuildContext context) {
    navegaFotosSalvas() {
      if (widget.email == 'aaaa.anonimo@anonimo.com') {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return CadastroFotosSalvas();
        }));
      } else {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return FotosSalvas(widget.email);
        }));
      }
    }

    return GestureDetector(
      onTap: () {
        widget.item == 1
            ? Navigator.push(context, MaterialPageRoute(builder: (context) {
                return Luas(widget.email);
              }))
            : widget.item == 2
                ? Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Constelacao(widget.email);
                  }))
                : widget.item == 3
                    ? Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                        return SlideFotos(widget.email);
                      }))
                    : widget.item == 4
                        ? navegaFotosSalvas()
                        : widget.item == 5
                            ? Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                                return Lua1(widget.email);
                              }))
                            : widget.item == 6
                                ? Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                    return Lua2(widget.email);
                                  }))
                                : widget.item == 7
                                    ? Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                        return Lua3(widget.email);
                                      }))
                                    : widget.item == 8
                                        ? Navigator.push(context,
                                            MaterialPageRoute(
                                                builder: (context) {
                                            return Lua4(widget.email);
                                          }))
                                        : widget.item == 9
                                            ? Navigator.push(context,
                                                MaterialPageRoute(
                                                    builder: (context) {
                                                return Lua5(widget.email);
                                              }))
                                            : widget.item == 0
                                                ? Navigator.push(context,
                                                    MaterialPageRoute(
                                                        builder: (context) {
                                                    return Lua6(widget.email);
                                                  }))
                                                : Navigator.push(context,
                                                    MaterialPageRoute(
                                                        builder: (context) {
                                                    return Luas(widget.email);
                                                  }));
      },
      onTapDown: (a) {
        setState(() {
          widget.cor = Colors.black38;
        });
      },
      onTapUp: (a) {
        setState(() {
          widget.cor = Colors.transparent;
        });
      },
      child: Container(
        width: double.infinity,
        child: widget.cardChild,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
            color: widget.cor, borderRadius: BorderRadius.circular(10.0)),
      ),
    );
  }
}
