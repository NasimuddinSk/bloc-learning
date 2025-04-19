import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/counterAppUsingBloc/bloc/counter/counter_bloc.dart';
import 'package:todo_app/counterAppUsingBloc/bloc/favourite/favourite_app_bloc.dart';
import 'package:todo_app/counterAppUsingBloc/bloc/repository/favourite_repository.dart';
import 'package:todo_app/counterAppUsingBloc/bloc/slider/slider_bloc.dart';
import 'package:todo_app/counterAppUsingBloc/bloc/switch/switch_bloc.dart';
import 'package:todo_app/counterAppUsingBloc/pages/bloc_provider/page/bloc/user_bloc.dart';
import 'package:todo_app/counterAppUsingBloc/pages/bloc_provider/page/provider/user_provider.dart';
import 'package:todo_app/counterAppUsingBloc/pages/bloc_provider/page/repository/user_repository.dart';
import 'package:todo_app/counterAppUsingBloc/pages/home.dart';

void main() {
  runApp(
    RepositoryProvider(
      create: (context) {
        return UserRepository(userProvider: UserProvider());
      },
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => CounterBloc()),
          BlocProvider(create: (context) => SwitchBloc()),
          BlocProvider(create: (context) => SliderBloc()),
          BlocProvider(
            create: (context) => FavouriteAppBloc(FavouriteRepository()),
          ),
          BlocProvider(
            create: (context) => UserBloc(context.read<UserRepository>()),
          ),
        ],
        child: CounterApp(),
      ),
    ),
  );
}

class CounterApp extends StatelessWidget {
  const CounterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: Home());
  }
}
