import 'package:flutter/material.dart';

class EntradaBotao extends StatelessWidget {
  final IconData icone;
  final void Function() func;
  const EntradaBotao({
    Key? key,
    required this.icone,
    required this.func,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          primary: Colors.red[800],
          padding: const EdgeInsets.all(15),
          shape: const CircleBorder()),
      onPressed: func,
      child: Icon(
        icone,
        color: Colors.white,
      ),
    );
  }
}
