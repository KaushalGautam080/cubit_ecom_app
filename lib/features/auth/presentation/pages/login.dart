import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Page"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text("Email"),
          TextFormField(
            controller: _emailController,
            decoration: const InputDecoration(
              hintText: "Enter your username",
              // hintText: "hi",
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 3,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 3,
                ),
              ),
            ),
          ),
          const Text("Password"),
          TextFormField(
            controller: _passwordController,
            decoration: const InputDecoration(
              hintText: "Enter your password",
              
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 3,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 3,
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              print(_emailController.text);
              print(_passwordController.text);
            },
            child: Container(
              height: 30,
              width: 50,
              color: Colors.green,
              child: const Center(
                child: Text("Login"),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
