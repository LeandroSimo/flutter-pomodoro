import 'package:flutter/material.dart';
import 'package:pomodoro/app/controller/pomodoro_store.dart';

import 'package:pomodoro/app/view_models/entrada_botao.dart';
import 'package:provider/provider.dart';

class EntradaTempo extends StatelessWidget {
  final String titulo;
  final int valor;
  final void Function()? inc;
  final void Function()? dec;

  const EntradaTempo({
    Key? key,
    required this.titulo,
    required this.valor,
    this.inc,
    this.dec,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<PomodoroStore>(context);
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
            EntradaBotao(
              func: dec,
              icone: Icons.arrow_downward,
            ),
            Text(
              '$valor min',
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
            EntradaBotao(
              func: inc,
              icone: Icons.arrow_upward,
            ),
          ],
        ),
      ],
    );
  }
}
