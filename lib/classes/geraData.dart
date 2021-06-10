class GeraData {
  geradatas(data) {
    int dia = int.parse(data.substring(6, 8));
    int mes = int.parse(data.substring(4, 6));
    int ano = int.parse(data.substring(0, 4));

    switch (mes) {
      case 0:
        return ("error");
      case 1:
        return ("$dia de Janeiro de $ano");
      case 2:
        return ("$dia de Fevereiro de $ano");
      case 3:
        return ("$dia de Março de $ano");
      case 4:
        return ("$dia de Abril de $ano");
      case 5:
        return ("$dia de Maio de $ano");
      case 6:
        return ("$dia de Junho de $ano");
      case 7:
        return ("$dia de Julho de $ano");
      case 8:
        return ("$dia de Agosto de $ano");
      case 9:
        return ("$dia de Setembro de $ano");
      case 10:
        return ("$dia de Outubro de $ano");
      case 11:
        return ("$dia de Novembro de $ano");
      case 12:
        return ("$dia de Dezembro de $ano");
    }
  }
}
