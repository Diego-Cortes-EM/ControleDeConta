import 'package:flutter/material.dart';
import 'package:src/contas.dart';

class Mais extends StatelessWidget {
  const Mais({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Mais Opções',
            style: TextStyle(
              fontSize: 16.0, // Diminuir o tamanho da fonte
              fontFamily: 'CustomFont', // Mudar a fonte para a personalizada
            ),
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: <Widget>[
          MenuMais(
            Icons.account_balance_wallet_sharp,
            "Contas",
            () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ContasListScreen()),
              );
            },
          ),
          const Divider(),
          Container(
            height: 50,
            color: Colors.amber[500],
            child: const Center(child: Text('Entry B')),
          ),
          Container(
            height: 50,
            color: Colors.amber[100],
            child: const Center(child: Text('Entry C')),
          ),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class MenuMais extends StatelessWidget {
  IconData star;
  String textoAparecer;
  Function() onPressed;
  MenuMais(this.star, this.textoAparecer, this.onPressed, {super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        backgroundColor: Colors.transparent, // Remove a cor de fundo
        minimumSize: const Size.fromHeight(50), // Altura do botão
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.zero, // Remove a borda arredondada
        ),
      ),
      child: Row(
        mainAxisAlignment:
            MainAxisAlignment.start, // Alinha o conteúdo à esquerda
        children: [
          Icon(
            star, // Substitua pelo ícone desejado
            color: Colors.black, // Define a cor do ícone ou deixe a cor padrão
          ),
          const SizedBox(width: 8), // Espaçamento entre o ícone e o texto
          Text(
            textoAparecer,
            style: const TextStyle(
                color: Colors
                    .black), // Define a cor do texto ou deixe a cor padrão
          ),
        ],
      ),
    );
  }
}
