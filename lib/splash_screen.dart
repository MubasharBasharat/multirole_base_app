import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mutlirole_base/adminScreen.dart';
import 'package:mutlirole_base/loginScreen.dart';
import 'package:mutlirole_base/studentScreen.dart';
import 'package:mutlirole_base/teacherScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class splash_screen extends StatefulWidget {
  const splash_screen({super.key});

  @override
  State<splash_screen> createState() => _splash_screenState();
}

class _splash_screenState extends State<splash_screen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isLogin();
  }

  void isLogin() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    bool Login = sp.getBool('isLogin') ?? false;
    String type = sp.getString('userType') ?? '';
    int a = 11;
    print(type);
    print(Login);

    if (Login == true) {
      print(type);
      print(Login);
      if (type == 'Student') {
        Timer(Duration(seconds: 2), () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => studentScreen()));
        });
      } else if (type == 'Teacher') {
        Timer(Duration(seconds: 2), () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => teacherScreen()));
        });
      } else if (type == 'Admin') {
        Timer(Duration(seconds: 2), () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => adminScreen()));
        });
      }
    } else {
      Timer(Duration(seconds: 4), () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => loginScreen()));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image(
          fit: BoxFit.fitHeight,
          height: double.infinity,
          image: NetworkImage(
              'https://images.pexels.com/photos/17267141/pexels-photo-17267141/free-photo-of-woman-posing-in-floral-dress.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1')),
    );
  }
}
