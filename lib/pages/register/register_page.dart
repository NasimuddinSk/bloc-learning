import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/pages/login/login_page.dart';
import 'package:todo_app/pages/register/register_controller.dart';
import 'package:todo_app/pages/register/user_model.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    final RegisterController registerController = RegisterController();

    return Scaffold(
      appBar: AppBar(title: Text("Signup")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(10),
            child: TextField(
              controller: nameController,
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                label: Text("Enter your name"),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
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
              onPressed: () {
                final UserModel model = UserModel(
                  name: nameController.text,
                  email: emailController.text,
                  password: passwordController.text,
                );
                registerController.registerUser(model);
              },
              child: Text("Signup", style: TextStyle(fontSize: 20)),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Already have an account "),
              InkWell(
                onTap: () {
                  Get.off(LoginPage());
                },
                child: Text(
                  "Login",
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
