import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:pomodoro/app/controller/pomodoro_store.dart';
import 'package:pomodoro/app/view_models/cronometro_botao.dart';

class Cronometro extends StatelessWidget {
  const Cronometro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _store = Provider.of<PomodoroStore>(context);

    return Container(
      color: Colors.red[800],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Hora de Trabalhar',
            style: TextStyle(
              fontSize: 40,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            '25:00',
            style: TextStyle(
              fontSize: 120,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CronometroBotao(texto: 'Iniciar', icone: Icons.play_arrow),
              // CronometroBotao(texto: 'Stop', icone: Icons.stop),
              CronometroBotao(texto: 'Reiniciar', icone: Icons.refresh),
            ],
          )
        ],
      ),
    );
  }
}
