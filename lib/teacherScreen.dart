import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'loginScreen.dart';

class teacherScreen extends StatefulWidget {
  const teacherScreen({super.key});

  @override
  State<teacherScreen> createState() => _teacherScreenState();
}

class _teacherScreenState extends State<teacherScreen> {
  @override
  String email = '';
  String Age = '';
  String UserType = '';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  loadData() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    email = sp.getString('email') ?? '';
    Age = sp.getString('Age') ?? '';
    UserType = sp.getString('userType') ?? '';
    setState() {}
    ;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber.withOpacity(0.9),
        title: Text(
          'Teacher Screen',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Welcome here',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
          SizedBox(height: 50),
          Row(
              // crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'User Email',
                ),
                Text(email.toString()),
              ]),
          SizedBox(height: 10),
          Row(
              // crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('User Age'),
                Text(Age.toString()),
              ]),
          SizedBox(height: 10),
          Row(
              // crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('User Type'),
                Text(UserType.toString()),
              ]),
          SizedBox(height: 50),
          Center(
            child: InkWell(
              onTap: () async {
                SharedPreferences sp = await SharedPreferences.getInstance();
                sp.clear();
                // print(Age.toString());
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => loginScreen()));
              },
              child: Container(
                height: 40,
                width: 120,
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                    child: Text(
                  'Logout',
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
