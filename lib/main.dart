
import 'package:flutter/material.dart';
import 'package:prova_flutter/components/getapi.dart';

TextEditingController input = TextEditingController();
TextEditingController input2 = TextEditingController();

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Home(),
  ));
}

PageController pageController = PageController();
int paginalAtual = 0;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ixtempô'),
        backgroundColor: Colors.deepOrange,
        elevation: 30,
        centerTitle: true,
      ),
      body: PageView(
        controller: pageController,
        children: [
          Container(
            color: Colors.white,
            padding: EdgeInsets.all(40),
            child: Column(children: [
              Image(image: AssetImage('assets/ixtempoo.png')),
              TextField(
                decoration:
                    InputDecoration(hintText: 'Login', labelText: 'Login'),
                controller: input,
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Senha'),
              ),
              Container(
                margin: (EdgeInsets.only(top: 10, left: 25, right: 25)),
                width: 100,
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.deepOrange,
                    borderRadius: BorderRadius.all(Radius.circular(32))),
                child: TextButton(
                  child: Center(
                    child: Text(
                      'Entrar',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  onPressed: () {
                    pageController.animateToPage(1,
                        duration: Duration(microseconds: 200),
                        curve: Curves.ease);
                  },
                ),
              )
            ]),
          ),
          Container(
            child: Column(
              children: [
                FutureBuilder(
                    future: getApi(),
                    builder: (context, AsyncSnapshot snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (snapshot.hasError) {
                        Center(
                          child: Text('Tente novamente mais tarde'),
                        );
                      }

                        var cityData = snapshot.data;
                        TextEditingController cityController = TextEditingController(text: cityData['name']);

                          return Column(
                              children: [
                                Text("Cidade:"),
                                TextField(
                                  controller: cityController,
                                  decoration: InputDecoration(
                                    labelText: 'Cidade',
                                  ),
                                ),
                                Text("Temperatura: ${cityData['temp']}"),
                                Text("Temperatura Minima: ${cityData['temp_min']}"),
                                Text("Temperatura Maxima: ${cityData['temp_max']}"),
                              ],
                            );
                          
                        },
                      )
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.facebook), label: 'Email'),
          BottomNavigationBarItem(icon: Icon(Icons.telegram), label: 'Telegram')
        ],
      ),
    );
  }
}
