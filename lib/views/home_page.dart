import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:prova_flutter/services/authentication_service.dart';

class HomePage extends StatefulWidget {
  final User user;

  const HomePage({super.key, required this.user});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'LetterBook: Diário Virtual',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color.fromARGB(255, 69, 42, 16),
      ),
      backgroundColor: Color.fromARGB(199, 242, 214, 196),
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(
                widget.user.displayName != null
                    ? widget.user.displayName!
                    : "Não informado",
              ),
              accountEmail: Text(
                widget.user.email != null ? widget.user.email! : "Não informado",
              ),
            ),
            ListTile(
              title: Text("Sair"),
              leading: Icon(Icons.logout),
              onTap: () async {
                await AuthenticationService().logoutUser();
                Navigator.pushReplacementNamed(context, '/'); 
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Color.fromARGB(199, 78, 48, 19),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: Color.fromARGB(255, 69, 42, 16),
                  width: 1.5,
                ),
              ),
              child: Text(
                "Querido Diário...",
                style: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontSize: 16,
                ),
              ),
            ),
            Spacer(),
            Align(
              alignment: Alignment.bottomRight,
              child: FloatingActionButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/novoDiario'); 
                },
                backgroundColor: Color.fromARGB(255, 69, 42, 16), // Cor do botão
                foregroundColor: Colors.white, // Cor do ícone
                child: Icon(Icons.add),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
