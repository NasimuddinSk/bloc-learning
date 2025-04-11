import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/counterAppUsingBloc/bloc/counter/counter_bloc.dart';
import 'package:todo_app/counterAppUsingBloc/pages/home.dart';

void main() {
  runApp(BlocProvider(create: (context) => CounterBloc(), child: CounterApp()));
}

class CounterApp extends StatelessWidget {
  const CounterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: Home());
  }
}
