import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
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
            child: Observer(
              builder: (_) => Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  EntradaTempo(
                    dec: _store.decrementarTempoTrabalho,
                    inc: _store.incrementarTempoTrabalho,
                    titulo: 'Trabalho',
                    valor: _store.tempoTrabalho,
                  ),
                  EntradaTempo(
                    dec: _store.decrementarTempoDescanso,
                    inc: _store.incrementarTempoDescanso,
                    titulo: 'Descanso',
                    valor: _store.tempoDescanso,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
