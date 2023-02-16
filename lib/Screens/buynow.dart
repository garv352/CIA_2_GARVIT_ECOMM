import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class BuyNow extends StatefulWidget {
  final DocumentSnapshot prods;
  const BuyNow({super.key, required this.prods});

  @override
  State<BuyNow> createState() => _BuyNowState();
}

class _BuyNowState extends State<BuyNow> {
  // final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController namecontroller = TextEditingController();
  TextEditingController mbcontroller = TextEditingController();
  TextEditingController pincodecontroller = TextEditingController();
  TextEditingController addresscontroller = TextEditingController();
  TextEditingController towncontroller = TextEditingController();
  TextEditingController statecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        backgroundColor: Colors.deepPurple[100],
        elevation: 0,
        title: Text(
          "Enter Your Shipping Address",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 15, 8, 8),
                child: Text(
                  "Enter Your Shipping Address",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
              ),
              textbox("FullName", "", namecontroller),
              textbox("Mobile Number", "", mbcontroller),
              textbox("Pincode", "110001", pincodecontroller),
              textbox("Address", "", addresscontroller),
              textbox("Town", "", towncontroller),
              textbox("State", "", statecontroller),
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
                      // navigateTobuynowScreen(widget.prods);
                    },
                    child: Text(
                      "Proceed to Pay".toUpperCase(),
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget textbox(
      String boxname, String hinttextname, TextEditingController controller) {
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
              style: const TextStyle(color: Colors.black),
              controller: controller, // controller
              decoration: InputDecoration(
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
