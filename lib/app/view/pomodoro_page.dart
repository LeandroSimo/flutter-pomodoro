import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import 'package:pomodoro/app/utils/tipo_intervalo.dart';
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
    return Observer(
      builder: (_) => Scaffold(
        backgroundColor: _store.tipoIntervalo == TipoIntervalo.TRABALHO
            ? Colors.red[200]
            : Colors.green[200],
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Expanded(
              child: Cronometro(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  EntradaTempo(
                    dec: _store.iniciado &&
                            _store.tipoIntervalo == TipoIntervalo.TRABALHO
                        ? null
                        : _store.decrementarTempoTrabalho,
                    inc: _store.iniciado &&
                            _store.tipoIntervalo == TipoIntervalo.TRABALHO
                        ? null
                        : _store.incrementarTempoTrabalho,
                    titulo: Text(
                      'Trabalho',
                      style: TextStyle(
                        color: _store.iniciado &&
                                _store.tipoIntervalo == TipoIntervalo.TRABALHO
                            ? Colors.red[900]
                            : Colors.black,
                        fontSize: _store.iniciado &&
                                _store.tipoIntervalo == TipoIntervalo.TRABALHO
                            ? 40
                            : 25,
                        fontWeight: _store.iniciado &&
                                _store.tipoIntervalo == TipoIntervalo.TRABALHO
                            ? FontWeight.bold
                            : FontWeight.normal,
                      ),
                    ),
                    valor: _store.tempoTrabalho,
                  ),
                  EntradaTempo(
                    dec: _store.iniciado &&
                            _store.tipoIntervalo == TipoIntervalo.DESCANSO
                        ? null
                        : _store.decrementarTempoDescanso,
                    inc: _store.iniciado &&
                            _store.tipoIntervalo == TipoIntervalo.DESCANSO
                        ? null
                        : _store.incrementarTempoDescanso,
                    titulo: Text(
                      'Descanso',
                      style: TextStyle(
                        color: _store.iniciado &&
                                _store.tipoIntervalo == TipoIntervalo.DESCANSO
                            ? Colors.green[900]
                            : Colors.black,
                        fontSize: _store.iniciado &&
                                _store.tipoIntervalo == TipoIntervalo.DESCANSO
                            ? 40
                            : 25,
                        fontWeight: _store.iniciado &&
                                _store.tipoIntervalo == TipoIntervalo.DESCANSO
                            ? FontWeight.bold
                            : FontWeight.normal,
                      ),
                    ),
                    valor: _store.tempoDescanso,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
