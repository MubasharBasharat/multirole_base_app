import 'package:flutter/material.dart';
import 'package:mutlirole_base/adminScreen.dart';
import 'package:mutlirole_base/homeScreen.dart';
import 'package:mutlirole_base/studentScreen.dart';
import 'package:mutlirole_base/teacherScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class loginScreen extends StatefulWidget {
  const loginScreen({super.key});

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
// String name = name();
  String selectedOption = 'Teacher';
  final emailController = TextEditingController();
  final ageController = TextEditingController();
  final passController = TextEditingController();
  String dropvalue = 'Student';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.amber.withOpacity(0.9),
        title: Text(
          'Login',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 40,
            ),
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.email_outlined),
                hintText: 'Email',
                filled: true,
                fillColor: Colors.white.withOpacity(1),
                enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.black.withOpacity(0.3)),
                    borderRadius: BorderRadius.circular(10)),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black.withOpacity(0.3)),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              keyboardType: TextInputType.emailAddress,
              cursorColor: Colors.black.withOpacity(0.1),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: passController,
              obscureText: true,
              obscuringCharacter: "*",
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.password),
                suffixIcon: Icon(Icons.remove_red_eye),
                hintText: 'Password',
                filled: true,
                fillColor: Colors.white.withOpacity(1),
                enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.black.withOpacity(0.3)),
                    borderRadius: BorderRadius.circular(10)),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black.withOpacity(0.3)),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              cursorColor: Colors.black.withOpacity(0.1),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: ageController,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.person),
                hintText: 'Age',
                filled: true,
                fillColor: Colors.white.withOpacity(1),
                enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.black.withOpacity(0.3)),
                    borderRadius: BorderRadius.circular(10)),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black.withOpacity(0.3)),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              keyboardType: TextInputType.phone,
              cursorColor: Colors.black.withOpacity(0.1),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 100,
              child: Drawer(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: <Widget>[
                    DrawerHeader(
                      decoration: BoxDecoration(
                        color: Colors.blue,
                      ),
                      child: Text(
                        'Select Option',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    ListTile(
                      title: Text('Teacher'),
                      onTap: () {
                        setState(() {
                          selectedOption = 'Teacher';
                        });
                        // Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      title: Text('Student'),
                      onTap: () {
                        setState(() {
                          selectedOption = 'Student';
                        });
                        // Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      title: Text('Admin'),
                      onTap: () {
                        setState(() {
                          selectedOption = 'Admin';
                        });
                        // Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: InkWell(
                onTap: () async {
                  SharedPreferences sp = await SharedPreferences.getInstance();
                  sp.setString('email', emailController.text.toString());
                  sp.setString('Age', ageController.text.toString());

                  sp.setString('userType', selectedOption);

                  if (sp.getString('userType') == 'Student') {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => studentScreen()));
                  } else if (sp.getString('userType') == 'Teacher') {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => teacherScreen()));
                  } else if (sp.getString('userType') == 'Admin') {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => adminScreen()));
                  } else {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => homeScreen()));
                  }

                  sp.setBool('isLogin', true);
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
                    'Login',
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
      ),
    );
  }
}
