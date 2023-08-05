 import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp( //widget
    debugShowCheckedModeBanner: false,
      home: HomePage(), // atributo

  )
  
  );  
}

// Tem somente dois tipo de widget de estado, um chamado STATELESS e STATEFULL
//STATELESS é quando eu jogo a informação na tela e não vou ter atualização nenhuma da informação
//STATEFULL é como se fosse uma pagina dinamica
PageController pageController = PageController();
int paginaAtual = 0;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nubank'),
        backgroundColor: Colors.purple,
        elevation: 30,
        // centerTitle: true,
      ),

      // body: Column(
      //   mainAxisAlignment: MainAxisAlignment.start,
      //   children: [
      //     Container(
      //   // margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      //   // padding: EdgeInsets.all(20),
      //   width: double.infinity,
      //   height: 200,
      //   decoration: BoxDecoration(
      //     color: Color.fromARGB(225, 197, 51, 255),
      //     borderRadius: BorderRadius.circular(20),
      //     gradient: LinearGradient(colors: [Colors.red, Colors.blue],)
      //   ),
      //   child: Text('Container 1'),
      // ),
      
      // Row(
      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //   children: [
      //     Container(
      //       width: 50,
      //       height: 50,
      //       color: Colors.red,
      //     ),
      //     Container(
      //       width: 50,
      //       height: 50,
      //       color: Colors.red,
      //     ),
      //   ],
      // )

      //   ],
        
      //   ),
    body: PageView(
      controller: pageController ,
      children: [
        Container(color: Colors.green,),
        Container(color: Colors.blue,),
        Container(color: Colors.redAccent,),
      ],
    ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: paginaAtual,
          selectedItemColor: Colors.red,
          onTap: (page){
         pageController.animateToPage(page, duration: Duration(microseconds: 200), curve: Curves.ease);

        setState(() {
           paginaAtual = page;
        });
        
         print(paginaAtual);
          } ,items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favorites'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
        ]),
    );
  }
}