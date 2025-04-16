import 'package:flutter/material.dart';

class FavouriteAppScreen extends StatefulWidget {
  const FavouriteAppScreen({super.key});

  @override
  State<FavouriteAppScreen> createState() {
    return _FavouriteAppScreenState();
  }
}

class _FavouriteAppScreenState extends State<FavouriteAppScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black26,
      body: Center(child: Text("data")),
    );
  }
}
