import 'package:flutter/material.dart';
import 'package:nomundodasluas_v7/classes/ColumImage.dart';
import 'package:nomundodasluas_v7/classes/ReusableContainer.dart';
import 'package:nomundodasluas_v7/classes/rowAppBar.dart';
import 'package:nomundodasluas_v7/pages/principal.dart';

class Luas extends StatefulWidget {
  Luas(this.email);
  String email;
  @override
  _LuasState createState() => _LuasState();
}

class _LuasState extends State<Luas> {
  @override
  Widget build(BuildContext context) {
    final widthlua = MediaQuery.of(context).size.width;
    final heightlua = MediaQuery.of(context).size.height;
    int _selectedIndex = 0;

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
    double fontButton = ((widthlua > 1400)
        ? 40
        : (widthlua > 1200)
            ? 35
            : (widthlua > 1000)
                ? 32
                : (widthlua > 800)
                    ? 30
                    : (widthlua > 600)
                        ? 25
                        : 18);
    ColumnImage c1 = ColumnImage('assets/images/f1.jpg');
    ColumnImage c2 = ColumnImage('assets/images/f2.jpg');
    ColumnImage c3 = ColumnImage('assets/images/f3.jpg');
    ColumnImage c4 = ColumnImage('assets/images/f4.jpg');
    ColumnImage c5 = ColumnImage('assets/images/f5.jpg');
    ColumnImage c6 = ColumnImage('assets/images/f6.jpg');

    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.black,
          title:
              RowAppBarr(' ', widthlua, heightlua, widget.email, 'principal'),
          centerTitle: true,
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              color: Colors.white,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return Principal(widget.email);
                  }),
                );
              })),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/fundodatas.png"),
                fit: BoxFit.cover)),
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 0, horizontal: horizonte),
          child: Center(
            child: Column(
              children: <Widget>[
                Expanded(
                    flex: 1,
                    child: Text(
                      'Escolha a quantidade de Luas Na foto.',
                      style:
                          TextStyle(color: Colors.white, fontSize: fontButton),
                    )),
                Expanded(
                    flex: 3,
                    child: ReusableContainer(
                        Colors.transparent, c1, 5, widget.email)),
                Expanded(
                    flex: 3,
                    child: ReusableContainer(
                        Colors.transparent, c2, 6, widget.email)),
                Expanded(
                    flex: 3,
                    child: ReusableContainer(
                        Colors.transparent, c3, 7, widget.email)),
                Expanded(
                    flex: 3,
                    child: ReusableContainer(
                        Colors.transparent, c4, 8, widget.email)),
                Expanded(
                    flex: 3,
                    child: ReusableContainer(
                        Colors.transparent, c5, 9, widget.email)),
                Expanded(
                    flex: 3,
                    child: ReusableContainer(
                        Colors.transparent, c6, 0, widget.email)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
