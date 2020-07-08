import 'package:flutter/material.dart';

class ProductsAvailable extends StatefulWidget {
  @override
  _ProductsAvailableState createState() => _ProductsAvailableState();
}

class _ProductsAvailableState extends State<ProductsAvailable> {
  String dropdownValue = 'Unit';
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      // Create a grid with 2 columns. If you change the scrollDirection to
      // horizontal, this produces 2 rows.
      crossAxisCount: 2,
      // Generate 100 widgets that display their index in the List.
      children: List.generate(100, (index) {
        return Padding(
          padding: const EdgeInsets.all(5.0),
          child: GestureDetector(
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey[200]),
              ),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 10,
                  ),
                  Image.asset(
                    'assets/images/laptop.png',
                    width: 150,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                  Text(
                    'Shoes',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Container(
                      width: 80,
                      decoration: BoxDecoration(color: Colors.green),
                      child: Center(
                          child: Text(
                        '1900',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ))),
                  Container(
                      child: Text(
                    'Sold 12',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ))
                ],
              ),
            ),
            onTap: () {
              _showMyDialog(context);
            },
          ),
        );
      }),
    );
  }

// Dialog box
  Future<void> _showMyDialog(context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          content: SingleChildScrollView(
              child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text(
                    'Product Type:',
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 40),
                  _dropDown(dropdownValue)
                ],
              ),
              Row(
                children: <Widget>[
                  Text(
                    'Quantity',
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 50),
                  SizedBox(
                      width: 80,
                      child: TextFormField(
                        validator: (val) =>
                            val.isEmpty ? 'Enter quantity' : null,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(12),
                          labelStyle:
                              TextStyle(color: Theme.of(context).primaryColor),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context)
                                      .focusColor
                                      .withOpacity(0.2))),
                          hintStyle: TextStyle(
                              color: Theme.of(context)
                                  .focusColor
                                  .withOpacity(0.7)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context)
                                      .focusColor
                                      .withOpacity(0.2))),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context)
                                      .focusColor
                                      .withOpacity(0.5))),
                        ),
                        style: TextStyle(color: Colors.black),
                      )),
                ],
              )
            ],
          )),
          actions: <Widget>[
            GestureDetector(
                child: Center(
                  child: Container(
                    height: 40,
                    width: 180,
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        border: Border.all(
                            color: Theme.of(context).primaryColor, width: 3),
                        borderRadius: BorderRadius.circular(20)),
                    child: Center(
                        child: Text(
                      'Add Item',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    )),
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                }),
          ],
        );
      },
    );
  }

  //Dropdown list
  Widget _dropDown(String value) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: Icon(Icons.arrow_downward),
      iconSize: 24,
      elevation: 16,
      style: TextStyle(color: Theme.of(context).primaryColor),
      underline: Container(
        height: 2,
        color: Theme.of(context).primaryColor,
      ),
      onChanged: (String newValue) {
        setState(() {
          dropdownValue = newValue;
        });
      },
      items: <String>[
        'Unit',
        'Pack',
      ].map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
