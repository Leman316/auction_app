import 'package:auction_/providers/Auth.dart';
import 'package:auction_/screens/Auction_item_screen.dart';
import 'package:auction_/screens/add_auction_item.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ItemDetails extends StatelessWidget {
  final Map<String, dynamic> item;
  ItemDetails(this.item);

  @override
  Widget build(BuildContext context) {
    //  DateTime end = DateFormat.yMEd().parse(item['enddate']);
    return Scaffold(
        appBar: AppBar(
          title: Text('Auction Item Detail'),
          actions: [],
        ),
        body: Column(
          children: <Widget>[
            Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 250,
                      width: 250,
                      child: Text('Image Placeholder'),
                    )
                  ],
                )),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Text(
                          item['name'],
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          item['description'],
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Column(children: <Widget>[
                      Text('Current Bid is : \$ ${item['price']}'),
                      Text('End date : ${item['enddate']}'),
                    ])
                  ]),
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text(
                  'Change bid amount',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  width: 100,
                  child: TextFormField(),
                )
              ],
            ),
            TextButton(onPressed: () {}, child: Text('Enter'))
          ],
        ));
  }
}
