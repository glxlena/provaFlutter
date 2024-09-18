import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tela Inicial'),backgroundColor: const Color.fromARGB(255, 161, 122, 227)),
      drawer: Drawer(
        child: Column(children: [
          UserAccountsDrawerHeader(accountName: Text('Teste', style: TextStyle(fontSize: 24)),
          accountEmail: Text('teste@teste.com')),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Sair'),
          )
        ],
        ),
      ),
      body: Center(child: 
      Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Bem-vindo a Tela Inicial!',
              style: TextStyle(
                fontSize: 25,
                color: Colors.purple,
              )
              )
              ]
      )
      )
    );
  }
}