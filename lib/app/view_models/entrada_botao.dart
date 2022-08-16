import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import 'package:pomodoro/app/utils/tipo_intervalo.dart';
import 'package:pomodoro/app/controller/pomodoro_store.dart';

class EntradaBotao extends StatelessWidget {
  final IconData icone;
  final void Function()? func;
  const EntradaBotao({
    Key? key,
    required this.icone,
    this.func,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _store = Provider.of<PomodoroStore>(context);
    return Observer(
      builder: (_) => ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: _store.tipoIntervalo == TipoIntervalo.TRABALHO
                ? Colors.red[800]
                : Colors.green[800],
            padding: const EdgeInsets.all(15),
            shape: const CircleBorder()),
        onPressed: func,
        child: Icon(
          icone,
          color: Colors.white,
        ),
      ),
    );
  }
}
