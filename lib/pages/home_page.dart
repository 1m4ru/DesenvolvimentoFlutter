import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_application_2/components/dialog.dart';

TextEditingController input = TextEditingController();
TextEditingController input2 = TextEditingController();
String nome = '';
String sobreNome = '';
List nomes = [];

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(25),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                suffixIcon: Icon(Icons.search),
                hintText: 'Nome',
                labelText: 'Nome',
              ),
              controller: input,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Sobrenome',
              ),
              controller: input2,
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  nomes.add(input.text + ' ' + input2.text);
                });
              },
              child: Text('Adicionar'),
            ),
            Text(nome + sobreNome),
            Container(
              height: 250,
              child: ListView.builder(
                  itemCount: nomes.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                        title: Text(nomes[index]),
                        trailing: IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return Confirmacao();
                                });
                            //    setState(() {
                            //   nomes.removeAt(index);
                            // });
                            // ScaffoldMessenger.of(context).showSnackBar(
                            //   SnackBar(content: Text('Nome Deletado'),
                            //   duration: Duration(seconds: 5),)
                            // );
                          },
                        )
                        // onLongPress: () {
                        //   setState(() {
                        //     nomes.removeAt(index);
                        //   });
                        //   ScaffoldMessenger.of(context).showSnackBar(
                        //     SnackBar(content: Text('Nome Deletado'),
                        //     duration: Duration(seconds: 5),)
                        //   );
                        // },

                        );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
