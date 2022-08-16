import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class EntradaBotao extends StatelessWidget {
  final IconData icone;
  const EntradaBotao({Key? key, required this.icone}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          primary: Colors.red[800],
          padding: const EdgeInsets.all(15),
          shape: const CircleBorder()),
      onPressed: () {},
      child: Icon(
        icone,
        color: Colors.white,
      ),
    );
  }
}
