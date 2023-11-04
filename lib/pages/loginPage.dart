import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:trade_hub/pages/productsPage.dart';


PageController pageController = PageController(initialPage: 0);
TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();

Future<User?> signInWithEmailAndPassword(String email, String password) async {
  try {
    FirebaseAuth auth = await FirebaseAuth.instance;
    auth.signInWithEmailAndPassword(email: email, password: password);
    return auth.currentUser;
   
  } catch (error) {
      print('Não foi possivel logar pelos seguintes erros: $error');
      
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TradeHub'),
        backgroundColor: Colors.orangeAccent,
        elevation: 30,
        centerTitle: true,
      ),
      body: PageView(
        controller: pageController,
        children: [
          Container(
            color: Colors.white,
            padding: EdgeInsets.all(40),
            child: Column(
              children: [
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    hintText: 'Digite seu login',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    contentPadding: EdgeInsets.all(15.0),
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    labelText: 'Senha',
                    hintText: 'Digite sua senha',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    contentPadding: EdgeInsets.all(15.0),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10, left: 25, right: 25),
                  width: 100,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.orangeAccent,
                    borderRadius: BorderRadius.all(Radius.circular(32)),
                  ),
                  child: TextButton(
                    child: Center(
                      child: Text(
                        'Entrar',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    onPressed: () async{
                      String email = emailController.text;
                      String password = passwordController.text;
                      pageController.animateToPage(1,
                          duration: Duration(milliseconds: 200),
                          curve: Curves.ease);
                      

                      User ? user = await signInWithEmailAndPassword(email, password);

                      if(user != null) {
                        Navigator.pushReplacement(
                          context, 
                           MaterialPageRoute(
                    builder: (BuildContext context) => Product(),
                  ),
                          
                          );
                      }
                           
                    },
                  ),
                ),
              ],
            ),
          ),
         
        ],
      ),
    );
  }
}
