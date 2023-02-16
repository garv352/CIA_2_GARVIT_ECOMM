import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'loginscreen.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  bool showPassword = true;

  TextEditingController emailcontroller = TextEditingController();
  TextEditingController namecontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  checkAuthentication() async {
    _auth.authStateChanges().listen((user) async {
      if (user != null) {
        Navigator.pushReplacementNamed(context, "/");
      }
    });
  }

  navigateToLogIn() {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return LoginPage();
    }));
  }

  void signup() async {
    print(emailcontroller);
    print(passwordcontroller);
    print("HEEERRREERERE");

    try {
      UserCredential user = await _auth.createUserWithEmailAndPassword(
          email: emailcontroller.text,
          password: passwordcontroller.text); //.then((signedIn){
      // FirebaseFirestore.collection("users").add({'name':_name});
      //     });

      // then(()signedInuser){

      //             };)

      // User updateUser = FirebaseAuth.instance.currentUser;
      // updateUser.updateProfile(displayName: _name);
      // userSetup(_name);
    } catch (e) {
      showCupertinoDialog(
          context: context,
          builder: (BuildContext context) {
            return CupertinoAlertDialog(
                title: Text('Error'),
                content: Text(e.toString()),
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
                "SignUp",
                style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 70),
                child: textbox("Name", "", namecontroller, false),
              ),
              textbox("Email", "", emailcontroller, false),
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
                      signup();
                    },
                    child: Text(
                      "SignUp".toUpperCase(),
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
                  navigateToLogIn();
                },
                child: Text(
                  "Already have an Account??".toUpperCase(),
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
