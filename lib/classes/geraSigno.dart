class GeraSigno {
  String gerasigno(signo, proximo, timedb, horanasc) {
    int hdb = 0;
    int mdb = 0;

    if ((timedb.substring(1, 2).toString()) == ":") {
      hdb = (int.parse(timedb.substring(0, 1)));
      mdb = (int.parse(timedb.substring(2, 4)));
    } else {
      hdb = (int.parse(timedb.substring(0, 2)));
      mdb = (int.parse(timedb.substring(3, 5)));
    }

    int tdb = ((hdb * 100) + mdb);
    int tnasc = 0;

    tnasc = int.parse(horanasc);

    int tconst = 0;

    if (tnasc == 9999) {
      tconst = 0;
    } else if (tnasc <= tdb) {
      tconst = 1;
    } else {
      tconst = 2;
    }


    //

    // CAPRICORNIO
    if ((signo == "cp") && (proximo == "I")) {
      return ("assets/images/cap.png");
    } else if ((signo == "cp") && (proximo == "D") && (tconst == 1)) {
      return ("assets/images/cap.png");
    } else if ((signo == "cp") && (proximo == "D") &&(tconst == 2)){
      return ("assets/images/aq.png");
    } else if ((signo == "cp") && (proximo == "D") &&(tconst == 0)){
      return ("assets/images/cap-aq.png");
    }
    //AQUARIO
    else if ((signo == "aq") && (proximo == "I")){
      return ("assets/images/aq.png");
    } else if ((signo == "aq") && (proximo == "D") &&(tconst == 1)){
      return ("assets/images/aq.png");
    } else if ((signo == "aq") && (proximo == "D") &&(tconst == 2)){
      return ("assets/images/pe.png");
    } else if ((signo == "aq") && (proximo == "D") &&(tconst == 0)){
      return ("assets/images/aq-pe.png");
    }
    //PEIXES
    else if ((signo == "pi") && (proximo == "I")){
      return ("assets/images/pe.png");
    } else if ((signo == "pi") && (proximo == "D") &&(tconst == 1)){
      return ("assets/images/pe.png");
    } else if ((signo == "pi") && (proximo == "D") &&(tconst == 2)){
      return ("assets/images/ar.png");
    } else if ((signo == "pi") && (proximo == "D") &&(tconst == 0)){
      return ("assets/images/pe-ar.png");
    }
    //ARIES
    else if ((signo == "ar") && (proximo == "I")){
      return ("assets/images/ar.png");
    } else if ((signo == "ar") && (proximo == "D") &&(tconst == 1)){
      return ("assets/images/ar.png");
    } else if ((signo == "ar") && (proximo == "D") &&(tconst == 2)){
      return ("assets/images/to.png");
    } else if ((signo == "ar") && (proximo == "D") &&(tconst == 0)){
      return ("assets/images/ar-to.png");
    }
    //TOURO
    else if ((signo == "ta") && (proximo == "I")){
      return ("assets/images/to.png");
    } else if ((signo == "ta") && (proximo == "D") &&(tconst == 1)){
      return ("assets/images/to.png");
    } else if ((signo == "ta") && (proximo == "D") &&(tconst == 2)){
      return ("assets/images/ge.png");
    } else if ((signo == "ta") && (proximo == "D") &&(tconst == 0)){
      return ("assets/images/to-ge.png");
    }
    //GEMEOS
    else if ((signo == "ge") && (proximo == "I")){
      return ("assets/images/ge.png");
    } else if ((signo == "ge") && (proximo == "D") &&(tconst == 1)){
      return ("assets/images/ge.png");
    } else if ((signo == "ge") && (proximo == "D") &&(tconst == 2)){
      return ("assets/images/ca.png");
    } else if ((signo == "ta") && (proximo == "D") &&(tconst == 0)){
      return ("assets/images/ge-ca.png");
    }
    //CANCER
    else if ((signo == "cn") && (proximo == "I")){
      return ("assets/images/ca.png");
    } else if ((signo == "cn") && (proximo == "D") &&(tconst == 1)){
      return ("assets/images/ca.png");
    } else if ((signo == "cn") && (proximo == "D") &&(tconst == 2)){
      return ("assets/images/le.png");
    } else if ((signo == "cn") && (proximo == "D") &&(tconst == 0)){
      return ("assets/images/ca-le.png");
    }
    //LEÃO
    else if ((signo == "le") && (proximo == "I")){
      return ("assets/images/le.png");
    } else if ((signo == "le") && (proximo == "D") &&(tconst == 1)){
      return ("assets/images/le.png");
    } else if ((signo == "le") && (proximo == "D") &&(tconst == 2)){
      return ("assets/images/vi.png");
    } else if ((signo == "le") && (proximo == "D") &&(tconst == 0)){
      return ("assets/images/le-vi.png");
    }
    //VIRGEM
    else if ((signo == "vi") && (proximo == "I")){
      return ("assets/images/vi.png");
    } else if ((signo == "vi") && (proximo == "D") &&(tconst == 1)){
      return ("assets/images/vi.png");
    } else if ((signo == "vi") && (proximo == "D") &&(tconst == 2)){
      return ("assets/images/li.png");
    } else if ((signo == "vi") && (proximo == "D") &&(tconst == 0)){
      return ("assets/images/vi-li.png");
    }
    //LIBRA
    else if ((signo == "li") && (proximo == "I")){
      return ("assets/images/li.png");
    } else if ((signo == "li") && (proximo == "D") &&(tconst == 1)){
      return ("assets/images/li.png");
    } else if ((signo == "li") && (proximo == "D") &&(tconst == 2)){
      return ("assets/images/es.png");
    } else if ((signo == "li") && (proximo == "D") &&(tconst == 0)){
      return ("assets/images/li-es.png");
    }
    //ESCORPIÃO
    else if ((signo == "sc") && (proximo == "I")){
      return ("assets/images/es.png");
    } else if ((signo == "sc") && (proximo == "D") &&(tconst == 1)){
      return ("assets/images/es.png");
    } else if ((signo == "sc") && (proximo == "D") &&(tconst == 2)){
      return ("assets/images/sa.png");
    } else if ((signo == "sc") && (proximo == "D") &&(tconst == 0)){
      return ("assets/images/es-sa.png");
    }
    //SAGITARIO
    else if ((signo == "sa") && (proximo == "I")){
      return ("assets/images/sa.png");
    } else if ((signo == "sa") && (proximo == "D") &&(tconst == 1)){
      return ("assets/images/sa.png");
    } else if ((signo == "sa") && (proximo == "D") &&(tconst == 2)){
      return ("assets/images/cap.png");
    } else if ((signo == "sa") && (proximo == "D") &&(tconst == 0)){
      return ("assets/images/sa-ca.png");
    } else {
      return ("assets/images/ar.png");
    }
    //
  }
}
