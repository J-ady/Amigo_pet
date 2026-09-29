import 'package:flutter/material.dart';
import '../styles/simpledialog_styles.dart';

class SimpleDialogPage extends StatelessWidget {
  const SimpleDialogPage({super.key});

  void _mostrarSimpleDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          title: const Text("Escolha um idioma"),
          children: [
            SimpleDialogOption(
              onPressed: () => Navigator.pop(context, "Português"),
              child: Text("Português", style: SimpleDialogStyles.opcao),
            ),
            SimpleDialogOption(
              onPressed: () => Navigator.pop(context, "Inglês"),
              child: Text("Inglês", style: SimpleDialogStyles.opcao),
            ),
          ],
        );
      },
    );
  }
  @override
  Widget build (BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Exemplo SimpleDialog"),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => _mostrarSimpleDialog(context),
          child: const Text("Escolher idioma"),
        ),
      ),
    );
  }
}