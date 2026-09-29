import 'package:flutter/material.dart';

class DrawerStyles {
  static const Color azulEscuro = Color(0xFF00428E);
  static const Color azul = Color(0xFF057ED9);
  static const Color ciano = Color(0xFF04CAEF);
  static const Color azulClaro = Color(0xFFB6EDFF);

  static const Color corPrincipal = azulEscuro;
  static const Color corFundo = Colors.white;

  static const TextStyle titulo = TextStyle(
    color: Colors.white,
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle subtitulo = TextStyle(
    color: Colors.white70,
    fontSize: 14,
  );

  static const TextStyle item = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: azulEscuro,
  );
}