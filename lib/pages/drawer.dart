import 'package:flutter/material.dart';
import '../styles/drawer_styles.dart';

class DrawerPage extends StatelessWidget {
  const DrawerPage({super.key});

  @override
  Widget build (BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Exemplo Drawer"),
        backgroundColor: Colors.blue,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: DrawerStyles.corFundo),
              child: const Text(
                "Menu",
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: Text("Perfil", style: DrawerStyles.item),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon (Icons.settings),
              title: Text("Configurações", style: DrawerStyles.item),
              onTap: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
      body: const Center (child: Text("Deslize a partir da esquerda ou toque no ≡")),
    );
  }
}