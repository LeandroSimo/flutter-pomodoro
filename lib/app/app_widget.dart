import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:pomodoro/app/controller/pomodoro_store.dart';
import 'package:pomodoro/app/view/pomodoro_page.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<PomodoroStore>(
          create: (_) => PomodoroStore(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Pomodoro',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          '/': (_) => const Pomodoro(),
        },
      ),
    );
  }
}
