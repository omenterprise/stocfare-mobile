import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import 'package:stockfare_mobile/notifiers/add_to_cart.dart';
import 'package:stockfare_mobile/screens/intro_pages/success_sold.dart';
import 'common_intro_widgets/all_products_appbar.dart';

class CheckoutPage extends StatefulWidget {
  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  @override
  Widget build(BuildContext context) {
    AddProductToCart addProductToCart = Provider.of<AddProductToCart>(context);
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0.0,
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(50),
              child: AppBarAllProducts(),
            )),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'TOTAL AMOUNT',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(width: 80),
                  Padding(
                    padding: const EdgeInsets.only(right: 50),
                    child: Text(
                      (addProductToCart.price).toString(),
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.green),
                    ),
                  )
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'DISCOUNT',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(width: 80),
                  SizedBox(
                      width: 150,
                      child: TextFormField(
                          onChanged: (val) {
                            addProductToCart.setDiscount(int.parse(val));
                          },
                          decoration: InputDecoration(
                            filled: true,
                            border: InputBorder.none,
                          ))),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'VAT',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(width: 120),
                  SizedBox(
                      width: 150,
                      child: TextFormField(
                          validator: (val) =>
                              val.length < 11 ? 'Enter a valid Phone no' : null,
                          decoration: InputDecoration(
                            filled: true,
                            border: InputBorder.none,
                          ))),
                ],
              ),
              SizedBox(height: 20),
              Container(
                  width: 300,
                  decoration: BoxDecoration(
                      border: Border(
                          top: BorderSide(width: 3, color: Colors.grey)))),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'GRAND TOTAL',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(width: 80),
                  Padding(
                    padding: const EdgeInsets.only(right: 50),
                    child: Text(
                      'N10,000',
                      style: TextStyle(fontSize: 16, color: Colors.green),
                    ),
                  )
                ],
              ),
              SizedBox(height: 100),
              GestureDetector(
                  child: Center(
                    child: Container(
                      height: 40,
                      width: 200,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.red, width: 3),
                          borderRadius: BorderRadius.circular(20)),
                      child: Center(
                          child: Text(
                        'Checkout',
                        style: TextStyle(color: Colors.red),
                      )),
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.rotate,
                            duration: Duration(seconds: 1),
                            child: SuccessSold()));
                  })
            ],
          ),
        ));
  }
}