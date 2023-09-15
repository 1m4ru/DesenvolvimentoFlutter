import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_application_3/components/getapi.dart';

void main() {
  runApp(
    MaterialApp(
      home: homePage(),
    )
  );
}


class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}


class _homePageState extends State<homePage> {
  @override
  Widget build(BuildContext context) {

// flutter run --web-renderer html
    
   
    return  Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(future: getApi(), builder: (context, AsyncSnapshot snapshot) {
        
        if(snapshot.connectionState == ConnectionState.waiting){
          return Center( 
          child: CircularProgressIndicator(),
          );
        } else if(snapshot.hasError){
          Center(child: Text('Tente novamente mais tarde') ,);
        }


        return ListView.builder(itemCount: snapshot.data.length,itemBuilder: (context, index){
          return  GestureDetector(
            // onHorizontalDragStart: ,
            child:Text(snapshot.data[index]['name']) ,); 
        });
      }),

    );
  }
}