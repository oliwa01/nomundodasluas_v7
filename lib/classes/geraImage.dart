class GeraImage {
  geraimage(dia, hemisferio) {
    if (hemisferio == "sul") {
      return ("assets/images/sul/lua-$dia.png");
    } else {
      return ("assets/images/norte/lua-$dia.png");
    }
  }
}
