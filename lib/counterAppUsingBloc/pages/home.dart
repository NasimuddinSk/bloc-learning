import 'package:flutter/material.dart';
import 'package:todo_app/counterAppUsingBloc/pages/counter_example/counter.dart';

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
                builder: (_) => Counter(),
              );
              Navigator.of(context).push(page);
            },
            child: Text("Multi Bloc Example"),
          ),
        ],
      ),
    );
  }
}
