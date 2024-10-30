import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:prova_flutter/services/authentication_service.dart';

class HomePage extends StatefulWidget{
  final User user;
  const HomePage({super.key, required this.user});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tela Incial',
        style: TextStyle(color: Colors.white),
          ),
        backgroundColor: Color.fromARGB(255, 69, 42, 16),
      ),
      backgroundColor: Color.fromARGB(199, 242, 214, 196),
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(widget.user.displayName != null
              ? widget.user.displayName!
              : "Não informado"
              ), 
              accountEmail: Text(widget.user.email != null
              ? widget.user.email!
              : "Não informado")),
            ListTile(
              title: Text("Sair"),
              leading: Icon(Icons.logout,
              ),
              
              onTap: (){
                AuthenticationService().logoutUser();
              },
            )
          ],
        ),
      ),
    );
  }
}