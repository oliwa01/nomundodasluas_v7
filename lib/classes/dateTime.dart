import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:nomundodasluas_v7/classes/columnDateTime.dart';
import 'package:nomundodasluas_v7/classes/reusableContainerDatetime.dart';
import 'package:nomundodasluas_v7/classes/reusablecontainerlua.dart';
import 'package:nomundodasluas_v7/constantes/constantes.dart';

import 'columnHemisferio.dart';

enum Hemisferio { norte, sul, nulo }

class DateTimeHemisferio extends StatefulWidget {
  String datanasc = 'DD/MM/AAAA';
  String horanasc = 'HH:MM';
  String nome = '';
  String hemisferio = '';
//

  @override
  _DateTimeHemisferioState createState() => _DateTimeHemisferioState();
}

class _DateTimeHemisferioState extends State<DateTimeHemisferio> {
  String _datanasc = '';
  String _horanasc = '';
  String _nome = '';
  String _hemisferio = '';

  Hemisferio selectedHemisferio = Hemisferio.nulo;
  //
  TextEditingController _controllerNome = TextEditingController(text: "");
  //
  bool selectedData = false;
  bool selectedTime = false;
  //
  //
  String _selecteDateNasc = "DD/MM/AAAA";
  String _selecteTimeNasc = "HH:MM";
  //
  nomeDigitado(value) {
    setState(() {
      widget.nome = value;
    });

    return widget.nome;
  }

  void dataPicketNasc() {
    var yearnow = DateTime.now();
    DatePicker.showDatePicker(context,
        showTitleActions: true,
        minTime: DateTime(1900, 3, 5),
        maxTime: DateTime(yearnow.year, 12, 31),
        theme: DatePickerTheme(
            headerColor: Colors.deepOrange,
            backgroundColor: Colors.black38,
            itemStyle: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
            doneStyle: TextStyle(color: Colors.white, fontSize: 25)),
        onChanged: (date) {}, onConfirm: (date) {
      selectedData = true;
      var decDate = date.toString();
      setState(() {
        _selecteDateNasc =
            ('${decDate.substring(8, 10)}/${decDate.substring(5, 7)}/${decDate.substring(0, 4)}');
        widget.datanasc =
            ('${decDate.substring(0, 4)}${decDate.substring(5, 7)}${decDate.substring(8, 10)}');
      });

      return widget.datanasc;
    }, currentTime: DateTime.now(), locale: LocaleType.pt);
  }

  void timePicketNasc() {
    DatePicker.showTime12hPicker(context,
        showTitleActions: true,
        theme: DatePickerTheme(
            headerColor: Colors.deepOrange,
            backgroundColor: Colors.black38,
            itemStyle: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
            doneStyle: TextStyle(color: Colors.white, fontSize: 20)),
        onConfirm: (date) {
      selectedTime = true;
      var decDate = date.toString();
      setState(() {
        _selecteTimeNasc =
            ('${decDate.substring(11, 13)}:${decDate.substring(14, 16)}');
        widget.horanasc =
            ('${decDate.substring(11, 13)}${decDate.substring(14, 16)}');
      });

      return widget.horanasc;
    }, currentTime: DateTime.now(), locale: LocaleType.pt);
  }

  @override
  Widget build(BuildContext context) {
    final widthlua = MediaQuery.of(context).size.width;
    final heightlua = MediaQuery.of(context).size.height;
    double heightDateTime = heightlua * 0.45;
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
    //
    bool portrait = (heightlua > widthlua);
    double fontAdj = portrait
        ? sqrt(heightlua) / (heightlua / widthlua)
        : sqrt(heightlua) / (widthlua / heightlua);

    return Container(
      height: heightDateTime,
      margin: EdgeInsets.symmetric(vertical: 0, horizontal: horizonte),
      decoration: BoxDecoration(
          color: Colors.black38, borderRadius: BorderRadius.circular(20.0)),
      child: Container(
        child: Column(
          children: <Widget>[
            Expanded(
                flex: 3,
                child: Row(
                  children: [
                    Expanded(
                        child: ReusableContainerLua(
                            (selectedHemisferio == Hemisferio.norte)
                                ? kcolorExpanded
                                : kinactiveColorExpanded,
                            ColumnHemisferio(
                                'assets/images/hn.png', 'HEMISFÉRIO NORTE'),
                            () {
                      setState(() => selectedHemisferio = Hemisferio.norte);
                      widget.hemisferio = 'norte';
                      return widget.hemisferio;
                    })),
                    Expanded(
                        child: ReusableContainerLua(
                            (selectedHemisferio == Hemisferio.sul)
                                ? kcolorExpanded
                                : kinactiveColorExpanded,
                            ColumnHemisferio(
                                'assets/images/hs.png', 'HEMISFÉRIO SUL'), () {
                      setState(() => selectedHemisferio = Hemisferio.sul);
                      widget.hemisferio = 'sul';
                      return widget.hemisferio;
                    })),
                  ],
                )),
            Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                        selectedHemisferio == Hemisferio.nulo
                            ? 'Selecione o hemisfério do local de nascimento.'
                            : '',
                        style: TextStyle(
                            fontSize: fontAdj, color: Colors.deepOrange))
                  ],
                )),
            Expanded(
                flex: 3,
                child: Container(
                  alignment: Alignment.center,
                  child: TextField(
                      controller: _controllerNome,
                      keyboardType: TextInputType.emailAddress,
                      style: TextStyle(color: Colors.black, fontSize: fontAdj),
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(32, 16, 32, 16),
                          hintText: "Nome",
                          hintStyle: TextStyle(color: Colors.grey),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(32))),
                      onChanged: (value) => {nomeDigitado(value)}),
                )),
            Expanded(
                flex: 3,
                child: Row(
                  children: [
                    Expanded(
                        child: ReusableContainerDatetime(
                            selectedData
                                ? kcolorDataSelect
                                : kcolorDataUnSelect,
                            ColumnDateTime(
                                'Data Nascimento.', _selecteDateNasc),
                            dataPicketNasc)),
                    Expanded(
                        child: ReusableContainerLua(
                            selectedTime
                                ? kcolorDataSelect
                                : kcolorDataUnSelect,
                            ColumnDateTime('Hora do Nascimento(Opcional).',
                                _selecteTimeNasc),
                            timePicketNasc)),
                  ],
                )),
            // Expanded(flex: 4, child: Container()),
          ],
        ),
      ),
    );
  }
}
