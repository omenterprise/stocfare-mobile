import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:page_transition/page_transition.dart';
import 'package:stockfare_mobile/intro_pages/success_product.dart';
import 'package:image_picker/image_picker.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'common_intro_widgets/app_bar.dart';

class AddProductIntro extends StatefulWidget {
  @override
  _AddProductIntroState createState() => _AddProductIntroState();
}

class _AddProductIntroState extends State<AddProductIntro> {
  double _value = 0;
  double _quantity = 0;
  String _error = '';
  File _image;
  final picker = ImagePicker();
  final _formkey = GlobalKey<FormState>();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    setState(() {
      _image = File(pickedFile.path);
    });
  }

  void getBarcode() async {
    var result = await BarcodeScanner.scan();

    print(result.type); // The result type (barcode, cancelled, failed)
    print(result.rawContent); // The barcode content
    print(result.format); // The barcode format (as enum)
    print(result
        .formatNote); // If a unknown format was scanned this field contains a note
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(10.0),
            child: AppBarProducts(),
          )),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(children: [
                  InkWell(
                    child: _image == null
                        ? Container(
                            width: 100,
                            height: 80,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Colors.grey)),
                            child: Center(
                              child: Icon(Icons.add_a_photo,
                                  size: 50, color: Colors.grey),
                            ))
                        : Image.file(
                            _image,
                            fit: BoxFit.cover,
                            width: 100,
                            height: 80,
                          ),
                    onTap: () {
                      getImage();
                    },
                  ),
                  SizedBox(height: 6),
                  Text('Add Image'),
                ]),
                SizedBox(height: 12),
                Column(children: [
                  InkWell(
                    child: Container(
                        width: 100,
                        height: 80,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.grey)),
                        child: Icon(
                          Icons.assessment,
                          color: Colors.grey,
                          size: 50,
                        )),
                    onTap: () {
                      getBarcode();
                    },
                  ),
                  SizedBox(height: 6),
                  Text('Add Barcode'),
                ])
              ],
            ),
            SizedBox(height: 30),
            Form(
                key: _formkey,
                child: Column(
                  children: [
                    Container(
                      width: 320,
                      child: TextFormField(
                          validator: (val) =>
                              val.isEmpty ? 'Enter Product Name' : null,
                          decoration: InputDecoration(
                            hintText: 'Enter product name',
                            filled: true,
                            border: InputBorder.none,
                          )),
                    ),
                    SizedBox(height: 15),
                    Container(
                      width: 320,
                      child: TextFormField(
                          validator: (val) =>
                              val.isEmpty ? 'Enter Product Category' : null,
                          decoration: InputDecoration(
                            hintText: 'Enter product Category. e.g Soft drinks',
                            filled: true,
                            border: InputBorder.none,
                          )),
                    ),
                    SizedBox(height: 15),
                    Container(
                      width: 320,
                      child: TextFormField(
                          validator: (val) =>
                              val.isEmpty ? 'Enter product price' : null,
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            WhitelistingTextInputFormatter.digitsOnly
                          ],
                          decoration: InputDecoration(
                            hintText: 'Product (Unit) Price ',
                            filled: true,
                            border: InputBorder.none,
                          )),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: 300,
                      child: Text(
                        'Quantity in Stock',
                        style: TextStyle(fontSize: 17),
                      ),
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            '       Total Products available in Stock',
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                          Flexible(
                            child: Container(
                              width: 60,
                              height: 30,
                              decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Center(
                                  child: Text(
                                (_value * 100).round().toString(),
                                style: TextStyle(color: Colors.white),
                              )),
                            ),
                          )
                        ]),
                    Padding(
                      padding: const EdgeInsets.only(left: 25, right: 25),
                      child: SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          activeTrackColor: Colors.grey[400],
                          inactiveTrackColor: Colors.grey[400],
                          trackShape: RectangularSliderTrackShape(),
                          trackHeight: 4.0,
                          thumbColor: Colors.redAccent,
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 12.0),
                          overlayColor: Colors.red,
                          overlayShape:
                              RoundSliderOverlayShape(overlayRadius: 28.0),
                        ),
                        child: Slider(
                          value: _value,
                          onChanged: (value) {
                            setState(() {
                              _value = value;
                            });
                          },
                        ),
                      ),
                    ),
                    Text(
                      _error,
                      style: TextStyle(fontSize: 12, color: Colors.red),
                    ),
                  ],
                )),
            SizedBox(
              height: 30,
            ),
            Container(
              width: 300,
              child: Text(
                'Low Stock Alert',
                style: TextStyle(fontSize: 17),
              ),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
              Text(
                '      When to alert on low stock           ',
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
              Flexible(
                child: Container(
                  width: 60,
                  height: 30,
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(
                      child: Text(
                    (_quantity * 100).round().toString(),
                    style: TextStyle(color: Colors.white),
                  )),
                ),
              )
            ]),
            Padding(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  activeTrackColor: Colors.grey[400],
                  inactiveTrackColor: Colors.grey[400],
                  trackShape: RectangularSliderTrackShape(),
                  trackHeight: 4.0,
                  thumbColor: Colors.redAccent,
                  thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12.0),
                  overlayColor: Colors.red,
                  overlayShape: RoundSliderOverlayShape(overlayRadius: 28.0),
                ),
                child: Slider(
                  value: _quantity,
                  onChanged: (value) {
                    setState(() {
                      _quantity = value;
                    });
                  },
                ),
              ),
            ),
            SizedBox(height: 20),
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
                      'Complete',
                      style: TextStyle(color: Colors.red),
                    )),
                  ),
                ),
                onTap: () {
                  if (_formkey.currentState.validate()) {
                    if (_value == 0) {
                      setState(() {
                        _error = 'Your Product quantity cannot be 0';
                      });
                    } else {
                      PageTransition(
                          type: PageTransitionType.leftToRight,
                          child: SuccessProduct());
                    }
                  }
                }),
            SizedBox(height: 25),
          ],
        ),
      ),
    );
  }
}