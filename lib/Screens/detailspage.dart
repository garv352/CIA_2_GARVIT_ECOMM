import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommapp/Screens/buynow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
// import 'package:shop_app/constants.dart';
// import 'package:shop_app/models/Product.dart';

// import 'add_to_cart.dart';
// import 'color_and_size.dart';
// import 'counter_with_fav_btn.dart';
// import 'description.dart';
// import 'product_title_with_image.dart';

class DetailsPage extends StatefulWidget {
  final DocumentSnapshot prods;

  DetailsPage({super.key, required this.prods});
  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  navigateTobuynowScreen(DocumentSnapshot prods) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return BuyNow(prods: prods);
    }));
  }

  // final Product product;
  int numOfItems = 1;
  @override
  Widget build(BuildContext context) {
    // It provide us total height and width
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      // backgroundColor: Colors.deepPurple[100],,
      appBar: buildAppBar(context),
      backgroundColor: Colors.deepPurple[100],
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: size.height,
              child: Stack(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: size.height * 0.3),
                    padding: EdgeInsets.only(
                      top: 80,
                      left: 20,
                      right: 20,
                    ),
                    // height: 500,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24),
                      ),
                    ),
                    child: Column(
                        // mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          // ColorAndSize(product: product),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                      text: "Price\n",
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.black,
                                      )),
                                  TextSpan(
                                      text:
                                          "₹ ${widget.prods["ProductValue"].toString()}",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 23)

                                      // Theme.of(context)
                                      //     .textTheme
                                      //     .headlineMedium!
                                      //     .copyWith(
                                      //         color: Colors.black,
                                      //         fontWeight: FontWeight.bold),
                                      ),
                                ],
                              ),
                            ),
                          ),
                          // SizedBox(height: ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 12),
                            child: Text(widget.prods["description"],
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                  height: 1.5,
                                )),
                          ),
                          // SizedBox(height: 30),
                          // Container(
                          //   padding: EdgeInsets.all(8),
                          //   height: 32,
                          //   width: 32,
                          //   decoration: BoxDecoration(
                          //     color: Color(0xFFFF6464),
                          //     shape: BoxShape.circle,
                          //   ),
                          //   child: SvgPicture.asset("assets/icons/heart.svg"),
                          // ),
                          SizedBox(height: 20),
                          Row(
                            children: <Widget>[
                              buildOutlineButton(
                                icon: Icons.remove,
                                press: () {
                                  if (numOfItems > 1) {
                                    setState(() {
                                      numOfItems--;
                                    });
                                  }
                                },
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20 / 2),
                                child: Text(
                                  // if our item is less  then 10 then  it shows 01 02 like that
                                  numOfItems.toString().padLeft(2, "0"),
                                  style: Theme.of(context).textTheme.headline6,
                                ),
                              ),
                              buildOutlineButton(
                                  icon: Icons.add,
                                  press: () {
                                    setState(() {
                                      numOfItems++;
                                    });
                                  }),
                            ],

                            // AddToCart(product: product)
                          ),
                          SizedBox(height: 50),
                          Row(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(right: 20),
                                height: 50,
                                width: 58,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(18),
                                  border: Border.all(
                                      // color: Colors.deepPurple[100],
                                      ),
                                ),
                                child: IconButton(
                                  icon: SvgPicture.asset(
                                    "assets/icons/add_to_cart.svg",
                                    color: Colors.deepPurple[100],
                                  ),
                                  onPressed: () {},
                                ),
                              ),
                              Expanded(
                                child: SizedBox(
                                  height: 50,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.deepPurple[100],
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(18)),
                                    ),
                                    onPressed: () {
                                      navigateTobuynowScreen(widget.prods);
                                    },
                                    child: Text(
                                      "Buy  Now".toUpperCase(),
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
                        ]),
                  ),
                  // ProductTitleWithImage(product: product)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        // Text(
                        //   "Motherboards",
                        //   style: TextStyle(color: Colors.white),
                        // ),
                        Text(widget.prods["ProductName"],
                            maxLines: 3,
                            style: TextStyle(
                                overflow: TextOverflow.ellipsis,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 35)

                            // Theme.of(context)
                            //     .textTheme

                            //     .copyWith(
                            //         color: Colors.white,
                            //         fontWeight: FontWeight.bold),
                            ),
                        // SizedBox(height: 10),
                        Row(
                          children: <Widget>[
                            RichText(
                              text: TextSpan(
                                children: [
                                  // TextSpan(
                                  //   text: "Price\n",
                                  // ),
                                  TextSpan(
                                    text: "           ",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineMedium!
                                        .copyWith(
                                            color: Colors.deepPurple[100],
                                            fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 20),
                            Expanded(
                              child: Hero(
                                tag: "",
                                child: Image.network(
                                  widget.prods["image"],
                                  // scale: 0.5,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.deepPurple[100],
      elevation: 0,
      leading: IconButton(
        icon: SvgPicture.asset(
          'assets/icons/back.svg',
          color: Colors.white,
        ),
        onPressed: () => Navigator.pop(context),
      ),
      actions: <Widget>[
        IconButton(
          icon: SvgPicture.asset("assets/icons/search.svg"),
          onPressed: () {},
        ),
        IconButton(
          icon: SvgPicture.asset("assets/icons/cart.svg"),
          onPressed: () {},
        ),
        SizedBox(width: 20 / 2)
      ],
    );
  }

  SizedBox buildOutlineButton(
      {required IconData icon, required Function press}) {
    return SizedBox(
      width: 40,
      height: 32,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(13),
          ),
        ),
        onPressed: () {
          setState(() {
            numOfItems++;
          });
        },
        child: Icon(
          icon,
          color: Colors.deepPurple[100],
        ),
      ),
    );
  }
}
