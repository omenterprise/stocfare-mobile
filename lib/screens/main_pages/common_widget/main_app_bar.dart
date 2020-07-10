import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:stockfare_mobile/notifiers/signup_notifier.dart';

class MainAppBar {
  static appBarFunction(context, name) {
    SignupNotifier _signupNotifier = Provider.of<SignupNotifier>(context);
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0.0,
      iconTheme: IconThemeData(color: Colors.red),
      flexibleSpace: Container(
          child: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 40),
            child: Column(
              children: <Widget>[
                Text(
                  name.toString(),
                  style: TextStyle(
                      fontSize: 20,
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 18,
                    bottom: 10,
                  ),
                  child: Container(
                    height: 40,
                    width: 250,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.grey[200],
                    ),
                    child: TextField(
                        decoration: InputDecoration(
                      prefixIcon: IconButton(
                        icon: Icon(Icons.search),
                        color: Colors.black,
                        iconSize: 20.0,
                        onPressed: () {},
                      ),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.fromLTRB(25, 8, 0, 5),
                      hintText: 'Search Berry-Buy',
                    )),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 10),
          Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 15, top: 30, left: 50),
                child: Stack(
                  children: [
                    Icon(Icons.notifications,
                        size: 30, color: Hexcolor('#5bbbeb')),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, left: 20),
                      child: Container(
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.white),
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Text(
                            '12',
                            style: TextStyle(color: Hexcolor('#5bbbeb')),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(
                    top: 15,
                    right: 12,
                  ),
                  child: InkWell(
                    child: Container(
                      width: 120,
                      height: 30,
                      decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(20)),
                      child: Center(
                        child: Text('Scan barcode',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                            )),
                      ),
                    ),
                    onTap: () {},
                  )),
            ],
          )
        ],
      )),
    );
  }

  //productlist appbar
  static productListAppBar(context) {
    SignupNotifier _signupNotifier = Provider.of<SignupNotifier>(context);
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0.0,
      iconTheme: IconThemeData(color: Colors.red),
      flexibleSpace: Container(
          child: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 40),
            child: Column(
              children: <Widget>[
                Text(
                  'Product List',
                  style: TextStyle(
                      fontSize: 20,
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(width: 30),
                    Text(
                      'Total Products:',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      '115',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'Total Category:',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      '5',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(width: 10),
        ],
      )),
    );
  }

  //Sales list appbar
  static salesListAppBar(context) {
    SignupNotifier _signupNotifier = Provider.of<SignupNotifier>(context);
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0.0,
      iconTheme: IconThemeData(color: Colors.red),
      flexibleSpace: Container(
          child: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 40),
            child: Column(
              children: <Widget>[
                Text(
                  'Sales List',
                  style: TextStyle(
                      fontSize: 20,
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(width: 15),
                    Text(
                      'Total Sales:',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      '150000',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Total Products Sold:',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      '115',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(width: 10),
        ],
      )),
    );
  }
}
