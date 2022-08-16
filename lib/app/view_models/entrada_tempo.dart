import 'package:flutter/material.dart';
import 'package:pomodoro/app/view_models/entrada_botao.dart';

class EntradaTempo extends StatelessWidget {
  final String titulo;
  final int valor;
  EntradaTempo({Key? key, required this.titulo, required this.valor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          titulo,
          style: const TextStyle(
            fontSize: 25,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            EntradaBotao(icone: Icons.arrow_downward),
            Text(
              '$valor min',
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
            EntradaBotao(icone: Icons.arrow_upward),
          ],
        ),
      ],
    );
  }
}
