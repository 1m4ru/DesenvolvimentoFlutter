import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:trade_hub/pages/loginPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  FirebaseFirestore db = FirebaseFirestore.instance;
  db.collection('Anuncios').doc('001').set({
    'nome': 'gol quadrado',
    'preco': 2000,
    'descricao': 'lorem lorem lore'
  });

// FirebaseAuth auth = FirebaseAuth.instance;
// auth.signInWithEmailAndPassword(email: 'maruanibrahim22@gmail.com', password: '02101994').then((value)  {
//   print('Usuário logado com sucesso $value');
// }).catchError((error) {
//   print('Ocorreram os seguints erros $error');
// });


// auth.createUserWithEmailAndPassword(email: 'teste@gmail.com', password: 'teste123');


  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: LoginPage(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
