import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:pomodoro/app/utils/tipo_intervalo.dart';
import 'package:pomodoro/app/controller/pomodoro_store.dart';

class CronometroBotao extends StatelessWidget {
  final String texto;
  final IconData icone;
  final void Function() func;

  const CronometroBotao(
      {Key? key, required this.texto, required this.icone, required this.func})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _store = Provider.of<PomodoroStore>(context);
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          primary: _store.tipoIntervalo == TipoIntervalo.TRABALHO
              ? Colors.red[400]
              : Colors.green[400],
          padding: const EdgeInsets.symmetric(
            horizontal: 30,
            vertical: 20,
          ),
          textStyle: const TextStyle(
            fontSize: 25,
          )),
      onPressed: func,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Icon(icone, size: 35),
          ),
          Text(texto),
        ],
      ),
    );
  }
}
