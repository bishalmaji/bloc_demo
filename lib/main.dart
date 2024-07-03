import 'package:flutter/material.dart';
import 'cubit/counter_cubit.dart';
import 'util/custom_transition_animation.dart';
import 'screens/home_page.dart';
import 'screens/second_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final _counterCubit = CounterCubit();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        pageTransitionsTheme: PageTransitionsTheme(
          builders: {
            TargetPlatform.android: CustomPageTransition(),
            TargetPlatform.iOS: CustomPageTransition(),
          },
        ),
      ),
      home: MyHomePage(
        title: 'Flutter Demo Home Page',
        counterCubit: _counterCubit,
      ),
      routes: {
        '/second': (context) => SecondPage(counterCubit: _counterCubit),
      },
    );
  }
}
