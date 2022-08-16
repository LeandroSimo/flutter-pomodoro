import 'package:flutter/material.dart';
import 'package:pomodoro/app/view_models/entrada_tempo.dart';

class Pomodoro extends StatefulWidget {
  const Pomodoro({Key? key}) : super(key: key);

  @override
  State<Pomodoro> createState() => _PomodoroState();
}

class _PomodoroState extends State<Pomodoro> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Text('Pomodoro'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              EntradaTempo(
                titulo: 'Trabalho',
                valor: 34,
              ),
              EntradaTempo(
                titulo: 'Descanso',
                valor: 5,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
