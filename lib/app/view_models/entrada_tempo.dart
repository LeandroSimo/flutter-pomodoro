import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:pomodoro/app/controller/pomodoro_store.dart';
import 'package:pomodoro/app/view_models/entrada_botao.dart';

class EntradaTempo extends StatelessWidget {
  final int valor;
  final void Function()? inc;
  final void Function()? dec;
  final Text titulo;

  const EntradaTempo({
    Key? key,
    required this.valor,
    this.inc,
    this.dec,
    required this.titulo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _store = Provider.of<PomodoroStore>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        titulo,
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
