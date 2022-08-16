import 'dart:async';

import 'package:mobx/mobx.dart';
import 'package:pomodoro/app/utils/tipo_intervalo.dart';

part 'pomodoro_store.g.dart';

class PomodoroStore = _PomodoroStoreBase with _$PomodoroStore;

abstract class _PomodoroStoreBase with Store {
  @observable
  bool iniciado = false;

  @observable
  int minutos = 2;
  @observable
  int segundos = 0;

  @observable
  int tempoTrabalho = 5;
  @observable
  int tempoDescanso = 5;

  @observable
  TipoIntervalo tipoIntervalo = TipoIntervalo.TRABALHO;

  Timer? cronometro;

  @action
  void iniciar() {
    iniciado = true;
    cronometro = Timer.periodic(Duration(milliseconds: 30), (timer) {
      if (minutos == 0 && segundos == 0) {
        _trocaTipoDeIntervalo();
      } else if (segundos == 0) {
        segundos = 59;
        minutos--;
      } else {
        segundos--;
      }
    });
  }

  @action
  void parar() {
    iniciado = false;
    cronometro?.cancel();
  }

  @action
  void reiniciar() {
    parar();
  }

  @action
  void incrementarTempoTrabalho() {
    tempoTrabalho += 5;
  }

  @action
  void decrementarTempoTrabalho() {
    tempoTrabalho--;
  }

  @action
  void incrementarTempoDescanso() {
    tempoDescanso++;
  }

  @action
  void decrementarTempoDescanso() {
    tempoDescanso--;
  }

  void _trocaTipoDeIntervalo() {
    if (tipoIntervalo == TipoIntervalo.TRABALHO) {
      tipoIntervalo = TipoIntervalo.DESCANSO;
      minutos = tempoDescanso;
    } else {
      tipoIntervalo = TipoIntervalo.TRABALHO;
      minutos = tempoTrabalho;
    }
    segundos = 0;
  }
}
