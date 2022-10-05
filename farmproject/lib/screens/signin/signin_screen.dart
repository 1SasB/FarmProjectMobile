// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:farmproject/screens/home/homepage.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool showPass = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
            child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Enter Email and Password to Login',
                  style: Theme.of(context).textTheme.headline4,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Icon(
                Icons.grass,
                color: Colors.green,
                size: 50,
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    label: Text('email'),
                    suffixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Field cannot be empty';
                    } else if (!value.contains('@')) {
                      return 'Enter valid email';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _passwordController,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: showPass,
                  decoration: InputDecoration(
                    label: Text('password'),
                    suffixIcon: InkWell(
                      child: Icon(Icons.remove_red_eye),
                      onTap: () {
                        setState(() {
                          showPass = !showPass;
                        });
                      },
                    ),
                    border: OutlineInputBorder(),
                    // focusedBorder: OutlineInputBorder(),
                    // enabledBorder: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Field cannot be empty';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(
                height: 40,
              ),
              TextButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (ctx) => HomePage()));
                  }
                },
                style: TextButton.styleFrom(
                    fixedSize:
                        Size(MediaQuery.of(context).size.width - 100, 50),
                    backgroundColor: Colors.green),
                child: Text(
                  'Login',
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          ),
        )),
      ),
    );
  }
}
