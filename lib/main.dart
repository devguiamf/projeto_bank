import 'package:bank/contatos.dart';
import 'package:bank/tranferencia.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() => runApp(BancoApp());

class BancoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class CardWidget extends StatelessWidget {
  final String title;
  final Color color;
  final IconData icon;
  final Widget destinationPage;

  CardWidget({
    required this.title,
    required this.color,
    required this.icon,
    required this.destinationPage,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => destinationPage),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            
            children: [
              Container(
                width: 150,
                height: 90,
              ),
              Icon(
                icon,
                size: 64,
                color: Colors.white,
              ),
              SizedBox(height: 16),
              Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Minha Página Inicial'),
        ),
        body: Center(
            child: Column(
          children: [
            CardWidget(
              title: 'Transferências',
              color: Colors.blue,
              icon: Icons.swap_horiz,
              destinationPage: ListaTransferencia(),
            ),
            CardWidget(
              title: 'Contatos',
              color: Colors.green,
              icon: Icons.contacts,
              destinationPage: ListaContato(),
            ),
          ],
        )));
  }
}

Widget _buildCustomCard(String title, IconData icon, Color color) {
  return Card(
    color: color,
    elevation: 4,
    child: Container(
      width: 200, // Largura desejada
      height: 150, // Altura desejada
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            icon,
            size: 40,
            color: Colors.white,
          ),
          SizedBox(height: 8),
          Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ],
      ),
    ),
  );
}

// ...
