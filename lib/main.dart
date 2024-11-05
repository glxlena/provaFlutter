import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:prova_flutter/firebase_options.dart';
import 'package:prova_flutter/views/home_page.dart';
import 'package:prova_flutter/views/inicio.dart';
import 'package:prova_flutter/views/register.dart';
import 'package:prova_flutter/views/form_page.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 69, 42, 16)),
        useMaterial3: true,
      ),
      home: MainPage(),
      routes: {
        '/loginRegister': (context) => LoginRegister(),
        '/home': (context) => HomePage(user: FirebaseAuth.instance.currentUser!),
        '/novoDiario': (context) => FormsDiario(),
      },
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.userChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return HomePage(user: snapshot.data!);
        } else {
          return LoginPage();
        }
      },
    );
  }
}
