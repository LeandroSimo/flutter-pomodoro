import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
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
      child: Observer(
        builder: (_) => Column(
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
              '${_store.minutos.toString().padLeft(2, '0')}:${_store.segundos.toString().padLeft(2, '0')}',
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
                !_store.iniciado
                    ? CronometroBotao(
                        func: _store.iniciar,
                        texto: 'Iniciar',
                        icone: Icons.play_arrow,
                      )
                    : CronometroBotao(
                        func: _store.parar,
                        texto: 'Stop',
                        icone: Icons.stop,
                      ),
                CronometroBotao(
                  func: _store.reiniciar,
                  texto: 'Reiniciar',
                  icone: Icons.refresh,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
