// ignore_for_file: prefer_const_constructors

import 'package:farmproject/providers/user.dart';
import 'package:farmproject/screens/home/homepage.dart';
import 'package:farmproject/screens/signin/signin_screen.dart';
import 'package:farmproject/screens/signup/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => User(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: SignUpScreen(),
      ),
    );
  }
}
