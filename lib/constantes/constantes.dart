import 'package:flutter/material.dart';

final emailTextController = TextEditingController();
final passwordTextController = TextEditingController();
const Icon kIconNavBarHomeWhite =
    Icon(Icons.home_outlined, color: Colors.white);
const Icon kIconNavBarHomeOrange =
    Icon(Icons.home_outlined, color: Colors.deepOrange);
const Icon kIconNavBarCameraWhite = Icon(Icons.camera, color: Colors.white);
const Icon kIconNavBarCameraOrange =
    Icon(Icons.camera_outlined, color: Colors.deepOrange);
const Icon kIconNavBarShoppingWhite =
    Icon(Icons.shopping_cart, color: Colors.white);
const Icon kIconNavBarShoppingOrange =
    Icon(Icons.shopping_cart, color: Colors.deepOrange);
const int klimite1 = 800;
const int klimite2 = 600;
const int klimite3 = 500;
const int klimite4 = 400;
const colorBottomContainer = Colors.pink;
const kbottomContanerHeight = 80.0;
//
const kcolorDataSelect = Colors.deepOrange;
//const kcolorDataSelect = Color(0x44fc5e03);
const kcolorDataUnSelect = Colors.white10;
//
const kcolorExpanded = Colors.deepOrange;
//const kcolorExpanded = Color(0x44fc5e03);
//const kcolorExpanded = Color(0xFF1D1E33);
const kinactiveColorExpanded = Colors.transparent;
//const kinactiveColorExpanded = Color(0xFF111328);
const klabelTextStyle = TextStyle(fontSize: 12.0, color: Color(0xFF8D8E98));
//
const kmsgText = TextStyle(fontSize: 14.0, color: Colors.deepOrange);
const klabelTextStyleW900 =
    TextStyle(fontSize: 50.0, fontWeight: FontWeight.w900);
const kNumbweLabelTextStyleW900 =
    TextStyle(fontSize: 50.0, fontWeight: FontWeight.w900);
const kResultsW900 = TextStyle(fontSize: 100.0, fontWeight: FontWeight.w900);
const ktextButtonImage =
    TextStyle(fontSize: 22.0, color: Colors.white, fontWeight: FontWeight.bold);
const kLageButtonTextStyle =
    TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold);
const kTitleTextStyle = TextStyle(fontSize: 50.0, fontWeight: FontWeight.bold);
const kTitle2TextStyle =
    TextStyle(fontSize: 25.0, color: Colors.white, fontWeight: FontWeight.bold);
const String kTextc11 = "\n\n PREÇOS:" +
    "\nSomente a Foto:" +
    "\n\nTam 20x25cm R\u002460,00 + frete" +
    "\nTam 30x40cm R\u002480,00 + frete" +
    "\nTam 50x60cm R\u0024100,00 + frete" +
    "\n\nFoto na moldura preta com Borda de 3x3cm" +
    "\nTam 20x25cm R\u0024160,00 + frete" +
    "\nTam 30x40cm R\u0024220,00 + frete" +
    "\nTam 50x60cm R\u0024400,00 + frete" +
    "\n\n " +
    "\nArquivo Digital - Alta Definição - R\u002470,00 + frete";
//
const String kTextc12 = "\n\n PREÇOS:" +
    "\nSomente a Foto:" +
    "\n\nTam 20x60cm R\u0024135,00 + frete" +
    "\nTam 30x90cm R\u0024160,00 + frete" +
    "\nTam 40x120cm R\u0024240,00 + frete" +
    "\n\nNa moldura preta com Borda de 3x3cm" +
    "\nTam 20x60cm R\u0024220,00 + frete" +
    "\nTam 30x90cm R\u0024360,00 + frete" +
    "\nTam 40x120cm R\u0024450,00 + frete" +
    "\n\n " +
    "\nArquivo Digital - Alta Definição - R\u002480,00 + frete";
//
const kTextc13 = "\n\n PREÇOS:" +
    "\nSomente a Foto:" +
    "\n\nTam 20x60cm R\u0024170,00 + frete" +
    "\nTam 30x90cm R\u0024190,00 + frete" +
    "\nTam 40x120cm R\u0024230,00 + frete" +
    "\n\nNa moldura preta com Borda de 3x3cm" +
    "\nTam 20x60cm R\u0024260,00 + frete" +
    "\nTam 30x90cm R\u0024400,00 + frete" +
    "\nTam 40x120cm R\u0024550,00 + frete" +
    "\n\n " +
    "\nArquivo Digital - Alta Definição - R\u002490,00 + frete";
//
const kTextc14 = "\n\n PREÇOS:" +
    "\nSomente a Foto:" +
    "\n\nTam 20x60cm R\u0024180,00 + frete" +
    "\nTam 30x90cm R\u0024220,00 + frete" +
    "\nTam 40x120cm R\u0024250,00 + frete" +
    "\n\nNa moldura preta com Borda de 3x3cm" +
    "\nTam 20x60cm R\u0024260,00 + frete" +
    "\nTam 30x90cm R\u0024400,00 + frete" +
    "\nTam 40x120cm R\u0024550,00 + frete" +
    "\n\n " +
    "\nArquivo Digital - Alta Definição - R\u0024100,00 + frete";
//
const kTextc15 = "\n\n PREÇOS:" +
    "\n\nSomente a Foto:" +
    "\nTam 20x60cm R\u0024190,00 + frete" +
    "\nTam 30x90cm R\u0024230,00 + frete" +
    "\nTam 40x120cm R\u0024260,00 + frete" +
    "\n\nNa moldura preta com Borda de 3x3cm" +
    "\nTam 20x60cm R\u0024260,00 + frete" +
    "\nTam 30x90cm R\u0024400,00 + frete" +
    "\nTam 40x120cm R\u0024550,00 + frete" +
    "\n\n " +
    "\nArquivo Digital - Alta Definição - R\u0024120,00 + frete";
//
const kTextc16 = "\n\n PREÇOS:" +
    "\nSomente a Foto:" +
    "\n\nTam 20x60cm R\u0024200,00 + frete" +
    "\nTam 30x90cm R\u0024240,00 + frete" +
    "\nTam 40x120cm R\u0024270,00 + frete" +
    "\n\nNa moldura preta com Borda de 3x3cm" +
    "\nTam 20x60cm R\u0024270,00 + frete" +
    "\nTam 30x90cm R\u0024420,00 + frete" +
    "\nTam 40x120cm R\u0024570,00 + frete" +
    "\n\n " +
    "\nArquivo Digital - Alta Definição - R\u0024150,00 + frete";
//
