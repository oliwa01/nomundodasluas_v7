import 'package:flutter/material.dart';

class Vendas extends StatefulWidget {
  @override
  _VendasState createState() => _VendasState();
}

class _VendasState extends State<Vendas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Vendas'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            TextButton(
              child: Text('VENDAS'),
              onPressed: () {
                Navigator.pushNamed(context, '/vendas');
              },
            ),
            TextButton(
              child: Text('principal'),
              onPressed: () {
                Navigator.pushNamed(context, '/principal');
              },
            ),
            TextButton(
              child: Text('luas'),
              onPressed: () {
                Navigator.pushNamed(context, '/luas');
              },
            ),
            TextButton(
              child: Text('voltar'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
