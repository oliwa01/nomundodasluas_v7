import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nomundodasluas_v7/classes/rowAppBar.dart';
import 'package:nomundodasluas_v7/pages/pageFoto1.dart';
import 'package:nomundodasluas_v7/pages/pageFoto2.dart';
import 'package:nomundodasluas_v7/pages/pageFoto3.dart';
import 'package:nomundodasluas_v7/pages/pageFoto4.dart';
import 'package:nomundodasluas_v7/pages/pageFoto5.dart';
import 'package:nomundodasluas_v7/pages/pageFoto6.dart';
import 'package:nomundodasluas_v7/pages/principal.dart';
import 'package:url_launcher/url_launcher.dart';

import 'home.dart';
import 'luas.dart';

class FotosSalvas extends StatefulWidget {
  String email = "";
  FotosSalvas(this.email);
  @override
  _FotosSalvasState createState() => _FotosSalvasState();
}

class _FotosSalvasState extends State<FotosSalvas> {
  @override
  _launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: true,
        forceWebView: true,
        headers: <String, String>{'my_header_key': 'my_header_value'},
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      (index == 0)
          ? Navigator.push(context, MaterialPageRoute(builder: (context) {
              return Principal(widget.email);
            }))
          : (index == 1)
              ? Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Luas(widget.email);
                }))
              : (index == 2)
                  ? _launchInBrowser("https://loja.nomundodasluas.com.br/")
                  : Navigator.push(context,
                      MaterialPageRoute(builder: (context) {
                      return Home();
                    }));
    });
  }

  @override
  Widget build(BuildContext context) {
    final widthlua = MediaQuery.of(context).size.width;
    final heightlua = MediaQuery.of(context).size.height;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
            title:
                RowAppBarr(' ', widthlua, heightlua, widget.email, 'principal'),
            leading: IconButton(
                icon: Icon(Icons.arrow_back),
                color: Colors.white,
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Principal(widget.email);
                  }));
                }),
            centerTitle: true,
          ),
          body: Container(
            height: heightlua,
            color: Colors.black,
            child: ListPage(widget.email),
          ),
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.black,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined, color: Colors.white),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.camera, color: Colors.white),
                label: 'Luas',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart, color: Colors.white),
                label: 'Loja',
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white,
            onTap: _onItemTapped,
          )),
    );

    //
    //
  }
}

class ListPage extends StatefulWidget {
  String email = "";
  ListPage(this.email);
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  @override
  Widget build(BuildContext context) {
    debugShowCheckedModeBanner:
    false;

    CollectionReference users = FirebaseFirestore.instance
        .collection('usuarios')
        .doc(widget.email)
        .collection('fotos');
    return StreamBuilder<QuerySnapshot>(
      stream: users.snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }

        return Container(
            color: Colors.black,
            child: ListView(
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
                return new ListTile(
                    leading: (document["numberPicture"] == 1)
                        ? Image.asset("assets/images/icone1.png",
                            width: 60, height: 20)
                        : (document["numberPicture"] == 2)
                            ? Image.asset("assets/images/icone2.png",
                                width: 60, height: 20)
                            : (document["numberPicture"] == 3)
                                ? Image.asset("assets/images/icone3.png",
                                    width: 60, height: 20)
                                : (document["numberPicture"] == 4)
                                    ? Image.asset("assets/images/icone4.png",
                                        width: 60, height: 20)
                                    : (document["numberPicture"] == 5)
                                        ? Image.asset("assets/images/icone5.png",
                                            width: 60, height: 20)
                                        : (document["numberPicture"] == 6)
                                            ? Image.asset("assets/images/icone6.png",
                                                width: 60, height: 20)
                                            : Icon(Icons.dashboard,
                                                color: Colors.deepOrange),
                    trailing: Icon(
                      Icons.keyboard_arrow_right,
                      color: Colors.white,
                    ),
                    contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                    title: (document["numberPicture"] == 1)
                        ? Text(" Codigo : " + (document['codVenda']) + " -  Nome Foto : " + (document['nome1']),
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold))
                        : (document["numberPicture"] == 2)
                            ? Text(" Codigo : " + (document['codVenda']) + " -  Nome Família : " + (document['nomefamilia']) + " -  Nome Foto-1 : " + (document['nome1']) + " -  Nome Foto-2 : " + (document['nome2']),
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold))
                            : (document["numberPicture"] == 3)
                                ? Text(" Codigo : " + (document['codVenda']) + " -  Nome Família : " + (document['nomefamilia']) + " -  Nome Foto-1 : " + (document['nome1']) + " -  Nome Foto-2 : " + (document['nome2']) + " -  Nome Foto-3 : " + (document['nome3']),
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold))
                                : (document["numberPicture"] == 4)
                                    ? Text(
                                        " Codigo : " +
                                            (document['codVenda']) +
                                            " -  Nome Família : " +
                                            (document['nomefamilia']) +
                                            " -  Nome Foto-1 : " +
                                            (document['nome1']) +
                                            " -  Nome Foto-2 : " +
                                            (document['nome2']) +
                                            " -  Nome Foto-3 : " +
                                            (document['nome3']) +
                                            "\n" +
                                            "                                                       Nome Foto-4 : " +
                                            (document['nome4']),
                                        style: TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.bold))
                                    : (document["numberPicture"] == 5)
                                        ? Text(" Codigo : " + (document['codVenda']) + " -  Nome Família : " + (document['nomefamilia']) + " -  Nome Foto-1 : " + (document['nome1']) + " -  Nome Foto-2 : " + (document['nome2']) + " -  Nome Foto-3 : " + (document['nome3']) + "\n" + "                                                       Nome Foto-4 : " + (document['nome4']) + " Nome Foto-5 : " + (document['nome5']), style: TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.bold))
                                        : Text(" Codigo : " + (document['codVenda']) + " -  Nome Família : " + (document['nomefamilia']) + " -  Nome Foto-1 : " + (document['nome1']) + " -  Nome Foto-2 : " + (document['nome2']) + " -  Nome Foto-3 : " + (document['nome3']) + " Nome Foto-4 : " + (document['nome4']) + " Nome Foto-5 : " + (document['nome5']) + " Nome Foto-6 : " + (document['nome6']), style: TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.bold)),
                    subtitle: Text(document["codVenda"]),
                    onTap: () {
//

                      if (document["numberPicture"] == 1) {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return PageFoto1(
                              numberPicture: 1,
                              origem: "salvas",
                              codVenda: document["codVenda"],
                              email: widget.email,
                              dataPicket1: document["dataPicket1"],
                              nome1: document["nome1"],
                              hemisferio: document["hemisferio"],
                              distanciadb1: document["distanciadb1"],
                              luadiadb1: document["luadiadb1"],
                              proximodb: document["proximodb"],
                              signo1: document["signo1"],
                              timenasc1: document["timenasc1"],
                              timedb1: document["timedb1"]);
                        }));
                      } else if (document["numberPicture"] == 2) {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return PageFoto2(
                            nomefamilia: document["nomefamilia"],
                            numberPicture: 2,
                            origem: "salvas",
                            codVenda: document["codVenda"],
                            email: widget.email,
                            dataPicket1: document["dataPicket1"],
                            nome1: document["nome1"],
                            hemisferio: document["hemisferio"],
                            distanciadb1: document["distanciadb1"],
                            luadiadb1: document["luadiadb1"],
                            proximodb1: document["proximodb"],
                            signo1: document["signo1"],
                            timenasc1: document["timenasc1"],
                            timedb1: document["timedb1"],
                            dataPicket2: document["dataPicket2"],
                            nome2: document["nome2"],
                            hemisferio2: document["hemisferio2"],
                            distanciadb2: document["distanciadb2"],
                            luadiadb2: document["luadiadb2"],
                            proximodb2: document["proximodb2"],
                            signo2: document["signo2"],
                            timenasc2: document["timenasc2"],
                            timedb2: document["timedb2"],
                          );
                        }));
                      } else if (document["numberPicture"] == 3) {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return PageFoto3(
                            nomefamilia: document["nomefamilia"],
                            numberPicture: 3,
                            origem: "salvas",
                            codVenda: document["codVenda"],
                            email: widget.email,
                            dataPicket1: document["dataPicket1"],
                            nome1: document["nome1"],
                            hemisferio: document["hemisferio"],
                            distanciadb1: document["distanciadb1"],
                            luadiadb1: document["luadiadb1"],
                            proximodb1: document["proximodb"],
                            signo1: document["signo1"],
                            timenasc1: document["timenasc1"],
                            timedb1: document["timedb1"],
                            dataPicket2: document["dataPicket2"],
                            nome2: document["nome2"],
                            hemisferio2: document["hemisferio2"],
                            distanciadb2: document["distanciadb2"],
                            luadiadb2: document["luadiadb2"],
                            proximodb2: document["proximodb2"],
                            signo2: document["signo2"],
                            timenasc2: document["timenasc2"],
                            timedb2: document["timedb2"],
                            dataPicket3: document["dataPicket3"],
                            nome3: document["nome3"],
                            hemisferio3: document["hemisferio3"],
                            distanciadb3: document["distanciadb3"],
                            luadiadb3: document["luadiadb3"],
                            proximodb3: document["proximodb3"],
                            signo3: document["signo3"],
                            timenasc3: document["timenasc3"],
                            timedb3: document["timedb3"],
                          );
                        }));
                      } else if (document["numberPicture"] == 4) {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return PageFoto4(
                            nomefamilia: document["nomefamilia"],
                            numberPicture: 4,
                            origem: "salvas",
                            codVenda: document["codVenda"],
                            email: widget.email,
                            dataPicket1: document["dataPicket1"],
                            nome1: document["nome1"],
                            hemisferio: document["hemisferio"],
                            distanciadb1: document["distanciadb1"],
                            luadiadb1: document["luadiadb1"],
                            proximodb1: document["proximodb"],
                            signo1: document["signo1"],
                            timenasc1: document["timenasc1"],
                            timedb1: document["timedb1"],
                            dataPicket2: document["dataPicket2"],
                            nome2: document["nome2"],
                            hemisferio2: document["hemisferio2"],
                            distanciadb2: document["distanciadb2"],
                            luadiadb2: document["luadiadb2"],
                            proximodb2: document["proximodb2"],
                            signo2: document["signo2"],
                            timenasc2: document["timenasc2"],
                            timedb2: document["timedb2"],
                            dataPicket3: document["dataPicket3"],
                            nome3: document["nome3"],
                            hemisferio3: document["hemisferio3"],
                            distanciadb3: document["distanciadb3"],
                            luadiadb3: document["luadiadb3"],
                            proximodb3: document["proximodb3"],
                            signo3: document["signo3"],
                            timenasc3: document["timenasc3"],
                            timedb3: document["timedb3"],
                            dataPicket4: document["dataPicket4"],
                            nome4: document["nome4"],
                            hemisferio4: document["hemisferio4"],
                            distanciadb4: document["distanciadb4"],
                            luadiadb4: document["luadiadb4"],
                            proximodb4: document["proximodb4"],
                            signo4: document["signo4"],
                            timenasc4: document["timenasc4"],
                            timedb4: document["timedb4"],
                          );
                        }));
                      } else if (document["numberPicture"] == 5) {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return PageFoto5(
                            nomefamilia: document["nomefamilia"],
                            numberPicture: 5,
                            origem: "salvas",
                            codVenda: document["codVenda"],
                            email: widget.email,
                            dataPicket1: document["dataPicket1"],
                            nome1: document["nome1"],
                            hemisferio: document["hemisferio"],
                            distanciadb1: document["distanciadb1"],
                            luadiadb1: document["luadiadb1"],
                            proximodb1: document["proximodb"],
                            signo1: document["signo1"],
                            timenasc1: document["timenasc1"],
                            timedb1: document["timedb1"],
                            dataPicket2: document["dataPicket2"],
                            nome2: document["nome2"],
                            hemisferio2: document["hemisferio2"],
                            distanciadb2: document["distanciadb2"],
                            luadiadb2: document["luadiadb2"],
                            proximodb2: document["proximodb2"],
                            signo2: document["signo2"],
                            timenasc2: document["timenasc2"],
                            timedb2: document["timedb2"],
                            dataPicket3: document["dataPicket3"],
                            nome3: document["nome3"],
                            hemisferio3: document["hemisferio3"],
                            distanciadb3: document["distanciadb3"],
                            luadiadb3: document["luadiadb3"],
                            proximodb3: document["proximodb3"],
                            signo3: document["signo3"],
                            timenasc3: document["timenasc3"],
                            timedb3: document["timedb3"],
                            dataPicket4: document["dataPicket4"],
                            nome4: document["nome4"],
                            hemisferio4: document["hemisferio4"],
                            distanciadb4: document["distanciadb4"],
                            luadiadb4: document["luadiadb4"],
                            proximodb4: document["proximodb4"],
                            signo4: document["signo4"],
                            timenasc4: document["timenasc4"],
                            timedb4: document["timedb4"],
                            dataPicket5: document["dataPicket5"],
                            nome5: document["nome5"],
                            hemisferio5: document["hemisferio5"],
                            distanciadb5: document["distanciadb5"],
                            luadiadb5: document["luadiadb5"],
                            proximodb5: document["proximodb5"],
                            signo5: document["signo5"],
                            timenasc5: document["timenasc5"],
                            timedb5: document["timedb5"],
                          );
                        }));
                      } else if (document["numberPicture"] == 6) {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return PageFoto6(
                            nomefamilia: document["nomefamilia"],
                            numberPicture: 6,
                            origem: "salvas",
                            codVenda: document["codVenda"],
                            email: widget.email,
                            dataPicket1: document["dataPicket1"],
                            nome1: document["nome1"],
                            hemisferio: document["hemisferio"],
                            distanciadb1: document["distanciadb1"],
                            luadiadb1: document["luadiadb1"],
                            proximodb1: document["proximodb"],
                            signo1: document["signo1"],
                            timenasc1: document["timenasc1"],
                            timedb1: document["timedb1"],
                            dataPicket2: document["dataPicket2"],
                            nome2: document["nome2"],
                            hemisferio2: document["hemisferio2"],
                            distanciadb2: document["distanciadb2"],
                            luadiadb2: document["luadiadb2"],
                            proximodb2: document["proximodb2"],
                            signo2: document["signo2"],
                            timenasc2: document["timenasc2"],
                            timedb2: document["timedb2"],
                            dataPicket3: document["dataPicket3"],
                            nome3: document["nome3"],
                            hemisferio3: document["hemisferio3"],
                            distanciadb3: document["distanciadb3"],
                            luadiadb3: document["luadiadb3"],
                            proximodb3: document["proximodb3"],
                            signo3: document["signo3"],
                            timenasc3: document["timenasc3"],
                            timedb3: document["timedb3"],
                            dataPicket4: document["dataPicket4"],
                            nome4: document["nome4"],
                            hemisferio4: document["hemisferio4"],
                            distanciadb4: document["distanciadb4"],
                            luadiadb4: document["luadiadb4"],
                            proximodb4: document["proximodb4"],
                            signo4: document["signo4"],
                            timenasc4: document["timenasc4"],
                            timedb4: document["timedb4"],
                            dataPicket5: document["dataPicket5"],
                            nome5: document["nome5"],
                            hemisferio5: document["hemisferio5"],
                            distanciadb5: document["distanciadb5"],
                            luadiadb5: document["luadiadb5"],
                            proximodb5: document["proximodb5"],
                            signo5: document["signo5"],
                            timenasc5: document["timenasc5"],
                            timedb5: document["timedb5"],
                            dataPicket6: document["dataPicket6"],
                            nome6: document["nome6"],
                            hemisferio6: document["hemisferio6"],
                            distanciadb6: document["distanciadb6"],
                            luadiadb6: document["luadiadb6"],
                            proximodb6: document["proximodb6"],
                            signo6: document["signo6"],
                            timenasc6: document["timenasc6"],
                            timedb6: document["timedb6"],
                          );
                        }));
                      }
                    });
              }).toList(),
            ));
      },
    );
  }
}

//
