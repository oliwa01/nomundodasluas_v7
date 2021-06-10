import 'package:flutter/material.dart';
import 'package:nomundodasluas_v7/classes/geraData.dart';
import 'package:nomundodasluas_v7/classes/geraImage.dart';
import 'package:nomundodasluas_v7/classes/geraSigno.dart';
import 'package:nomundodasluas_v7/classes/geraTipoLua.dart';
import 'package:nomundodasluas_v7/classes/geraTipoLuz.dart';

class RepaintBounderyLua extends StatelessWidget {
  const RepaintBounderyLua({
    Key? key,
    required GlobalKey<State<StatefulWidget>> containerKey,
    required this.luasize,
    required int luadiadb1,
    required String hemisferio,
    required String nome1,
    required String dataPicket1,
    required double distancia1,
    required String signosdb1,
    required String proximodb1,
    required String timedb1,
    required String timenasc1,
  })  : _containerKey = containerKey,
        _luadiadb1 = luadiadb1,
        _hemisferio = hemisferio,
        _nome1 = nome1,
        _dataPicket1 = dataPicket1,
        _distancia1 = distancia1,
        _signosdb1 = signosdb1,
        _proximodb1 = proximodb1,
        _timedb1 = timedb1,
        _timenasc1 = timenasc1,
        super(key: key);

  final GlobalKey<State<StatefulWidget>> _containerKey;
  final int luasize;
  final int _luadiadb1;
  final String _hemisferio;
  final String _nome1;
  final String _dataPicket1;
  final double _distancia1;
  final String _signosdb1;
  final String _proximodb1;
  final String _timedb1;
  final String _timenasc1;

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
        key: _containerKey,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 30),
              //
              //tela pronta
              //
              Container(
                  alignment: Alignment.topCenter,
                  child: LimitedBox(
                      maxWidth: luasize.toDouble(),
                      maxHeight: luasize.toDouble(),
                      child: Container(
                        width: luasize.toDouble(),
                        height: luasize.toDouble(),
                        alignment: Alignment.topCenter,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.black,
                            image: DecorationImage(
                                image: new AssetImage(_luadiadb1.isNaN
                                    ? GeraImage().geraimage(00, 'sul')
                                    : GeraImage()
                                        .geraimage(_luadiadb1, _hemisferio)),
                                fit: BoxFit.cover)),
                      ))),
              Container(
                  height: 150,
                  child: Column(
                    children: <Widget>[
                      //
                      // NOME
                      //

                      Text(
                        _nome1,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(height: 6),
                      //
                      // DATA
                      //
                      Text(
                        GeraData().geradatas(_dataPicket1),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
                      //
                      // DISTANCIA
                      //

                      Text(
                        "Distancia :  " + _distancia1.toString() + " Kms",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                        ),
                      ),
                      SizedBox(height: 5),
                      //
                      // SIGNO
                      //
                      SizedBox(
                          width: 150,
                          height: 25,
                          child: Image(
                              image: AssetImage(GeraSigno().gerasigno(
                            _signosdb1,
                            _proximodb1,
                            _timedb1,
                            _timenasc1,
                          )))),
                      //
                      // TIPO DE LUA
                      //
                      Text(
                        GeraTipoLua().geraTipoLua(_luadiadb1),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                      //
                      // TIPO DE iluminação
                      //
                      Text(
                        GeraTipoLuz().geraTipoLuz(_luadiadb1),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 8,
                        ),
                      )
                    ],
                    //
                  ))
            ]));
  }
}
