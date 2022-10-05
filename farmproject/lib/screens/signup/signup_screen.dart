// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:farmproject/screens/home/homepage.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

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
                  'Signup to start trading',
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
                  controller: _nameController,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    label: Text('name'),
                    suffixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Field cannot be empty';
                    }
                    return null;
                  },
                ),
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
                  controller: _phoneController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    label: Text('phone number'),
                    suffixIcon: Icon(Icons.phone),
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Field cannot be empty';
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
                  'Regiser',
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
