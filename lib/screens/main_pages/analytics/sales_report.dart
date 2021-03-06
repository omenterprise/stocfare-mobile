import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:stockfare_mobile/models/analytics_model.dart';

class AnalyticsDetailsPage extends StatefulWidget {
  final SalesAnalyticsModel analyticsData;
  final String pageTitle;
  AnalyticsDetailsPage(
      {Key key, @required this.analyticsData, @required this.pageTitle})
      : super(key: key);

  @override
  _AnalyticsDetailsPageState createState() => _AnalyticsDetailsPageState();
}

class _AnalyticsDetailsPageState extends State<AnalyticsDetailsPage> {
  List names = [];
  List dateCreated = [];
  List price = [];
  List registeredBy = [];
  List amountSold = [];
  List quantitySold = [];
  List customers = [];
  @override
  void initState() {
    super.initState();

    print(widget.analyticsData.results.map((data) {
      registeredBy.add(data.saleRegisteredBy);
      amountSold.add(data.amount);
      // customers.add(data.customer.name ?? '');
      quantitySold.add(data.productDetail[0].quantityBought);
      dateCreated.add(data.dateCreated);
      return (data.productData.map((name) {
        setState(() {
          names.add(name.name);
          price.add(name.productUnit.price);
        });
      }));
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.pageTitle),
        ),
        body: widget.analyticsData.count == 0
            ? Center(
                child: Text(
                'You have not made any sales yet.',
                style: TextStyle(fontSize: 18),
              ))
            : ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: names.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    child: Card(
                      child: ListTile(
                        leading: Icon(Icons.card_giftcard,
                            color: Theme.of(context).primaryColor),
                        title: Text(
                          names[index],
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        subtitle: Row(
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'Sold By : ${registeredBy[index].toString()}',
                                  style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'Sora'),
                                ),
                                SizedBox(height: 4),
                                // Text(
                                //   'Customer :  ${customer[index].toString()}',
                                //   style: TextStyle(
                                //       color: Colors.black, fontFamily: 'FireSans'),
                                // ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 6),
                                  child: Text(
                                    Jiffy(dateCreated[index])
                                        .format("yyyy-MM-dd HH:mm:ss"),
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        trailing: Icon(Icons.more_vert),
                        isThreeLine: true,
                      ),
                    ),
                    onTap: () {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) =>
                      //             AllProductsList(customerIndex: index)));
                    },
                  );
                }));
  }
}
