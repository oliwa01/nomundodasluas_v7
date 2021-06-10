import 'package:flutter/material.dart';
import 'package:nomundodasluas_v7/pages/constelacoes.dart';
import 'package:nomundodasluas_v7/pages/entrada.dart';
import 'package:nomundodasluas_v7/pages/home.dart';
import 'package:nomundodasluas_v7/pages/lua1.dart';
import 'package:nomundodasluas_v7/pages/lua2.dart';
import 'package:nomundodasluas_v7/pages/lua3.dart';
import 'package:nomundodasluas_v7/pages/lua4.dart';
import 'package:nomundodasluas_v7/pages/lua5.dart';
import 'package:nomundodasluas_v7/pages/lua6.dart';
import 'package:nomundodasluas_v7/pages/luas.dart';
import 'package:nomundodasluas_v7/pages/precoFotos1.dart';
import 'package:nomundodasluas_v7/pages/principal.dart';
import 'package:nomundodasluas_v7/pages/vendas.dart';

import 'pages/fotossalvas.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        backgroundColor: Colors.black,
        textTheme: TextTheme(
          headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          bodyText1: TextStyle(
              fontSize: 22.0,
              fontFamily: 'Monstserrat',
              fontWeight: FontWeight.bold),
        ),
        accentColor: Colors.orange,
        sliderTheme: SliderTheme.of(context).copyWith(
          activeTrackColor: Colors.white,
          thumbColor: Color(0xFFEB1555),
          overlayColor: Color(0x29EB1555),
          thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
          overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
        ),
        bottomNavigationBarTheme: BottomNavigationBarTheme.of(context).copyWith(
          backgroundColor: Colors.black,
        ),
        primaryColor: Color(0XFF0A0E21),
        scaffoldBackgroundColor: Color(0XFF0A0E21),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => Home(),
        '/principal': (context) => Principal(''),
        '/luas': (context) => Luas(""),
        '/lua1': (context) => Lua1(""),
        '/lua2': (context) => Lua2(""),
        '/lua3': (context) => Lua3(""),
        '/lua4': (context) => Lua4(""),
        '/lua5': (context) => Lua5(""),
        '/lua6': (context) => Lua6(""),
        '/preco': (context) => PrecoFoto1(
            email: 'walter@wop.com.br',
            codVenda: '00000101',
            nomefamilia: 'oliveira',
            numberPicture: 4,
            dataPicket1: '20210524',
            nome1: 'walter',
            distanciadb1: 0.0,
            luadiadb1: 21,
            proximodb1: 'I',
            signo1: 'ca',
            timedb1: '12:12',
            timenasc1: '9999',
            hemisferio: 'sul',
            dataPicket2: '20210524',
            nome2: 'walter',
            distanciadb2: 0.0,
            luadiadb2: 21,
            proximodb2: 'I',
            signo2: 'ca',
            timedb2: '12:12',
            timenasc2: '9999',
            hemisferio2: 'sul',
            dataPicket3: '20210524',
            nome3: 'walter',
            distanciadb3: 0.0,
            luadiadb3: 21,
            proximodb3: 'I',
            signo3: 'ca',
            timedb3: '12:12',
            timenasc3: '9999',
            hemisferio3: 'sul',
            dataPicket4: '20210524',
            nome4: 'walter',
            distanciadb4: 0.0,
            luadiadb4: 21,
            proximodb4: 'I',
            signo4: 'ca',
            timedb4: '12:12',
            timenasc4: '9999',
            hemisferio4: 'sul',
            dataPicket5: '20210524',
            nome5: 'walter',
            distanciadb5: 0.0,
            luadiadb5: 21,
            proximodb5: 'I',
            signo5: 'ca',
            timedb5: '12:12',
            timenasc5: '9999',
            hemisferio5: 'sul',
            dataPicket6: '20210524',
            nome6: 'walter',
            distanciadb6: 0.0,
            luadiadb6: 21,
            proximodb6: 'I',
            signo6: 'ca',
            timedb6: '12:12',
            timenasc6: '9999',
            hemisferio6: 'sul'),
        '/entrada': (context) => Entrada(),
        '/constelacao': (context) => Constelacao("walter@wop.com.br"),
        '/fotossalvas': (context) => FotosSalvas("walter@wop.com.br"),
        '/vendas': (context) => Vendas()
      },
    );
  }
}
