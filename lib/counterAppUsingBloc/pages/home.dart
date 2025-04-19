import 'package:flutter/material.dart';
import 'package:todo_app/counterAppUsingBloc/pages/bloc_provider/page/bloc_provider_repo.dart';
import 'package:todo_app/counterAppUsingBloc/pages/counter_example/counter.dart';
import 'package:todo_app/counterAppUsingBloc/pages/favoruite_example/favourite_app_screen.dart';
import 'package:todo_app/counterAppUsingBloc/pages/multi_bloc_example/multi_bloc_example.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(),
          ElevatedButton(
            onPressed: () {
              MaterialPageRoute page = MaterialPageRoute(
                builder: (_) => Counter(),
              );
              Navigator.of(context).push(page);
            },
            child: Text("Counter Example"),
          ),

          ElevatedButton(
            onPressed: () {
              MaterialPageRoute page = MaterialPageRoute(
                builder: (_) => MultiBlocExample(),
              );
              Navigator.of(context).push(page);
            },
            child: Text("Multi Bloc Example"),
          ),
          ElevatedButton(
            onPressed: () {
              MaterialPageRoute page = MaterialPageRoute(
                builder: (_) => FavouriteAppScreen(),
              );
              Navigator.of(context).push(page);
            },
            child: Text("Favourite Bloc Example"),
          ),
          ElevatedButton(
            onPressed: () {
              MaterialPageRoute page = MaterialPageRoute(
                builder: (_) => BlocProviderRepo(),
              );
              Navigator.of(context).push(page);
            },
            child: Text("Bloc with Repository"),
          ),
        ],
      ),
    );
  }
}
