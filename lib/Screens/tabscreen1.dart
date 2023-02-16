import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import '../components/itemcard.dart';
import '../models/item.dart';
import '../models/models.dart';
import 'detailspage.dart';

class Tabv1 extends StatefulWidget {
  const Tabv1({super.key});

  @override
  State<Tabv1> createState() => _Tabv1State();
}

class _Tabv1State extends State<Tabv1> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  List<Tabitem> tItems = [];
  @override
  void initState() {
    // fetchRecords();

    super.initState();
  }

  CollectionReference collectionReference =
      FirebaseFirestore.instance.collection("motherboard");

  navigateToDetailsScreen(DocumentSnapshot prods) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return DetailsPage(prods: prods);
    }));
  }

  // Map? data;

  // fetchRecords() async {
  //   CollectionReference collectionReference =
  //       FirebaseFirestore.instance.collection("motherboard");
  //   collectionReference.snapshots().listen((snapshot) {
  //     List documents;
  //     setState(() {
  //       documents = snapshot.docs;
  //     });
  //   });

  //   // var records =
  //   //     await FirebaseFirestore.instance.collection("motherboard").get();
  // }

  // mapRecords(QuerySnapshot<Map<String, dynamic>> records) {
  //   var _list = records.docs
  //       .map(
  //         (item) => Tabitem(
  //           id: item.id,
  //           name: item['ProductName'],
  //           cost: item['ProductCost'],
  //         ),
  //       )
  //       .toList();
  //   setState(() {
  //     tItems = _list;
  //   });
  // }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection("motherboard")
                .snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return LinearProgressIndicator();
              } else
                return GridView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data!.docs.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 20,
                      childAspectRatio: 0.75,
                    ),
                    itemBuilder: (context, index) {
                      DocumentSnapshot documentSnapshot =
                          snapshot.data!.docs[index];
                      // print(
                      //   documentSnapshot["ProductName"],
                      // );
                      // print("herrrr");
                      return GestureDetector(
                        onTap: () {
                          navigateToDetailsScreen(snapshot.data!.docs[index]);
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Expanded(
                              child: Container(
                                width: 200,

                                // height: 300,
                                padding: EdgeInsets.all(20),
                                // For  demo we use fixed height  and width
                                // Now we dont need them
                                // height: 180,
                                // width: 160,
                                decoration: BoxDecoration(
                                  color: Colors.deepPurple[100],
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Hero(
                                  tag: "",
                                  child:
                                      Image.network(documentSnapshot["image"]),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 20 / 4),
                              child: Text(
                                documentSnapshot["ProductName"], maxLines: 2,
                                // products is out demo list
                                // product.title,
                                style: TextStyle(
                                    color: Color(0xFFACACAC),
                                    overflow: TextOverflow.ellipsis),
                              ),
                            ),
                            Text(
                              " ₹ ${documentSnapshot["ProductValue"].toString()}",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      );
                    });
            }),
      )),
    );
  }
}
