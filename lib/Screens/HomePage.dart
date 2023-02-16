import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ecommapp/Screens/tabscreen1.dart';

import '../models/models.dart';
import 'loginscreen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: false,
          title: Text(
            "IoT Seller",
            style: Theme.of(context)
                .textTheme
                .headlineSmall
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          actions: <Widget>[
            IconButton(
              icon: SvgPicture.asset(
                "assets/icons/search.svg",
                color: Color(0xFF535353),
              ),
              onPressed: () {
                _auth.signOut();
              },
            ),
            IconButton(
              icon: SvgPicture.asset(
                "assets/icons/cart.svg",
                color: Color(0xFF535353),
              ),
              onPressed: () {},
            ),
            SizedBox(width: 20 / 2)
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(8, 20, 8, 20),
          child: const SafeArea(child: Tabv1()),
        ),
      ),
    );
  }
}
