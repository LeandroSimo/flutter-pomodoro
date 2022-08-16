import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:pomodoro/app/controller/pomodoro_store.dart';
import 'package:pomodoro/app/view_models/cronometro.dart';
import 'package:pomodoro/app/view_models/entrada_tempo.dart';

class Pomodoro extends StatefulWidget {
  const Pomodoro({Key? key}) : super(key: key);

  @override
  State<Pomodoro> createState() => _PomodoroState();
}

class _PomodoroState extends State<Pomodoro> {
  @override
  Widget build(BuildContext context) {
    final _store = Provider.of<PomodoroStore>(context);
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(child: Cronometro()),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                EntradaTempo(
                  titulo: 'Trabalho',
                  valor: _store.tempoTrabalho,
                ),
                EntradaTempo(
                  titulo: 'Descanso',
                  valor: _store.tempoDescanso,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
