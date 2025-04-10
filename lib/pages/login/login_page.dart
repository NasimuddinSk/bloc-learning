import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:todo_app/pages/register/register_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(10),
            child: TextField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                label: Text("Enter your email"),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: TextField(
              controller: passwordController,
              // obscureText: true,
              autocorrect: false,
              enableSuggestions: false,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                label: Text("Enter your password"),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              child: Text("Login", style: TextStyle(fontSize: 20)),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Don't have account "),
              InkWell(
                onTap: () {
                  Get.off(RegisterPage());
                },
                child: Text(
                  "Signup",
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
