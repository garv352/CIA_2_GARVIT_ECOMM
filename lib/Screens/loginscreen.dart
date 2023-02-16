import 'package:ecommapp/Screens/SignUp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'HomePage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool showPassword = true;
  navigateTobuynowScreen() {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return SignUpPage();
    }));
  }

  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  checkAuthentication() async {
    _auth.authStateChanges().listen((user) async {
      if (user != null) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => HomePage()),
        );
      }
    });
  }

  void login() async {
    try {
      // _auth.signInWithEmailAndPassword(
      //     email: emailcontroller.text, password: passwordcontroller.text);
      //User is FirebaseUser                                   // string _email
      User user = (await _auth.signInWithEmailAndPassword(
          email: emailcontroller.text,
          password: passwordcontroller.text)) as User;
    } catch (e) {
      showCupertinoDialog(
          context: context,
          builder: (BuildContext context) {
            return CupertinoAlertDialog(
                title: Text('Error'),
                // content: Text(errorMessage),
                actions: <Widget>[
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple[100],
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18)),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                      // navigateTobuynowScreen(widget.prods);
                    },
                    child: Text(
                      "ok".toUpperCase(),
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ]);
          });
    }
  }

  @override
  void initState() {
    super.initState();
    this.checkAuthentication();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        backgroundColor: Colors.deepPurple[100],
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.fromLTRB(8, 100, 8, 70),
          child: Column(
            children: [
              Text(
                "IoT Seller",
                style: TextStyle(fontSize: 38, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                "Login",
                style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 70),
                child: textbox("Email", "", emailcontroller, false),
              ),
              textbox("Password", "", passwordcontroller, true),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 35, 15, 15),
                child: SizedBox(
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple[100],
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18)),
                    ),
                    onPressed: () {
                      login();
                    },
                    child: Text(
                      "Login".toUpperCase(),
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  navigateTobuynowScreen();
                },
                child: Text(
                  "New Here??".toUpperCase(),
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }

  Widget textbox(String boxname, String hinttextname,
      TextEditingController controller, bool isPassword) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
          child: Text(
            boxname,
          ),
        ),
        const SizedBox(height: 15),
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: Container(
            height: 45,
            child: TextField(
              obscureText: isPassword ? showPassword : false,
              style: const TextStyle(color: Colors.black),
              controller: controller, // controller
              decoration: InputDecoration(
                suffixIcon: isPassword
                    ? IconButton(
                        onPressed: () {
                          setState(() {
                            showPassword = !showPassword;
                          });
                        },
                        icon: showPassword
                            ? const Icon(
                                Icons.visibility_off_outlined,
                                color: Colors.grey,
                              )
                            : const Icon(
                                Icons.visibility_outlined,
                                color: Colors.grey,
                              ),
                      )
                    : null,
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                hintText: hinttextname, //hinttextname
                hintStyle: const TextStyle(
                  color: Colors.black,
                ),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 0.841028,
                    color: Colors.black,
                  ),
                ),
                focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                  width: 0.841028,
                  color: Colors.black,
                )),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
