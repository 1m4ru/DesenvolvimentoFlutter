import 'package:flutter/material.dart';

class Confirmacao extends StatefulWidget {
  const Confirmacao({super.key});

  @override
  State<Confirmacao> createState() => _ConfirmacaoState();
}

class _ConfirmacaoState extends State<Confirmacao> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Exclusão'),
      content: Text('Deseja excluir o nome selecionado?'),
      actions: [
        ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Cancelar')),
        ElevatedButton(
            onPressed: () {
              setState(() {
                // nomes.removeAt(index);
              });
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text('Nome Deletado'),
                duration: Duration(seconds: 5),
              ));
            },
            child: Text('Deletar'))
      ],
    );
  }
}
