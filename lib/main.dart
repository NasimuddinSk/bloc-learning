import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/pages/login/login_page.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(debugShowCheckedModeBanner: false, home: LoginPage());
  }
}
