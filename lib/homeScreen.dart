import 'package:flutter/material.dart';
import 'package:mutlirole_base/loginScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({super.key});

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  String email = '';
  String Age = '';
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
    setState() {}
    ;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Welcome here'),
          Row(
              // crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('User Email'),
                Text(email.toString()),
                Text('User Age'),
                Text(Age.toString()),
              ]),
          SizedBox(height: 10),
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
