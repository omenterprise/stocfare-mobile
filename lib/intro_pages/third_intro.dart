import 'package:flutter/material.dart';
import 'package:stockfare_mobile/intro_pages/multiple_product.dart';

class ThirdIntro extends StatefulWidget {
  @override
  _ThirdIntroState createState() => _ThirdIntroState();
}

class _ThirdIntroState extends State<ThirdIntro> {
  double _value = 0;
  double _quantity = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 20),
          Container(
            height: 40,
            width: 320,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.red, width: 3)),
            child: Row(
              children: [
                Container(
                  height: 40,
                  width: 150,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        bottomLeft: Radius.circular(15)),
                  ),
                  child: Center(
                      child: Text(
                    'Add Single Product',
                    style: TextStyle(color: Colors.white),
                  )),
                ),
                SizedBox(
                  width: 5,
                ),
                GestureDetector(
                  child: Container(
                    height: 40,
                    width: 150,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(15),
                          bottomRight: Radius.circular(15)),
                    ),
                    child: Center(
                        child: Text(
                      'Add Multiple Product',
                      style: TextStyle(color: Colors.red),
                    )),
                  ),
                  onTap: () {
                    Navigator.of(context).push(_createRoute());
                  },
                ),
              ],
            ),
          ),
          SizedBox(
            height: 35,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(children: [
                Container(
                    width: 100,
                    height: 80,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey)),
                    child: Center(
                      child:
                          Icon(Icons.add_a_photo, size: 50, color: Colors.grey),
                    )),
                SizedBox(height: 6),
                Text('Add Image'),
              ]),
              SizedBox(height: 12),
              Column(children: [
                Container(
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
                SizedBox(height: 6),
                Text('Add Barcode'),
              ])
            ],
          ),
          SizedBox(height: 30),
          Form(
              child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 40, right: 40),
                child: TextFormField(
                    validator: (val) =>
                        val.length < 11 ? 'Enter a valid Phone no' : null,
                    decoration: InputDecoration(
                      hintText: 'Enter product name',
                      filled: true,
                      border: InputBorder.none,
                    )),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 40, right: 40),
                child: TextFormField(
                    validator: (val) =>
                        val.length < 11 ? 'Enter a valid Phone no' : null,
                    decoration: InputDecoration(
                      hintText: 'Enter product Category',
                      filled: true,
                      border: InputBorder.none,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  'Quantity in Stock',
                  style: TextStyle(fontSize: 17),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50),
                child: Row(children: [
                  Text(
                    'Total Products available in Stock',
                    style: TextStyle(fontSize: 12, color: Colors.red),
                  ),
                  SizedBox(width: 70),
                  Container(
                    width: 60,
                    height: 30,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                        child: Text(
                      (_value * 1000).round().toString(),
                      style: TextStyle(color: Colors.white),
                    )),
                  )
                ]),
              ),
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
                    value: _value,
                    onChanged: (value) {
                      setState(() {
                        _value = value;
                      });
                    },
                  ),
                ),
              ),
            ],
          )),
          Padding(
            padding: const EdgeInsets.only(right: 180, top: 10),
            child: Text(
              'Low Stock Alert',
              style: TextStyle(fontSize: 17),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 50),
            child: Row(children: [
              Text(
                'When to alert on low stock',
                style: TextStyle(fontSize: 12, color: Colors.red),
              ),
              SizedBox(width: 100),
              Container(
                width: 60,
                height: 30,
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Center(
                    child: Text(
                  (_quantity * 1000).round().toString(),
                  style: TextStyle(color: Colors.white),
                )),
              )
            ]),
          ),
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
                      border: Border.all(color: Colors.red),
                      borderRadius: BorderRadius.circular(20)),
                  child: Center(
                      child: Text(
                    'Complete',
                    style: TextStyle(color: Colors.red),
                  )),
                ),
              ),
              onTap: () {})
        ],
      ),
    );
  }
}

Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => MultiplePage(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset(0.0, 1.0);
      var end = Offset.zero;
      var tween = Tween(begin: begin, end: end);
      var offsetAnimation = animation.drive(tween);
      return child;
    },
  );
}