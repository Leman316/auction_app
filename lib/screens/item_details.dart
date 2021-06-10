import 'package:auction_/providers/Auth.dart';
import 'package:auction_/screens/Auction_item_screen.dart';
import 'package:auction_/screens/add_auction_item.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ItemDetails extends StatelessWidget {
  final Map<String, dynamic> item;
  ItemDetails(this.item);

  @override
  Widget build(BuildContext context) {
    //  DateTime end = DateFormat.yMEd().parse(item['enddate']);
    //  print(DateFormat('dd-MM-yyyy').format(DateTime.now()));

    String enddate = DateFormat('dd-MM-yyyy').format(DateFormat.yMd('en_US').parse(
        '${item['enddate'].substring(5, 7)}/${item['enddate'].substring(8, 10)}/${item['enddate'].substring(0, 4)}'));

    bool datefinished = DateTime.now().isAfter(DateTime(
        int.parse(item['enddate'].substring(0, 4)),
        int.parse(item['enddate'].substring(5, 7)),
        int.parse(item['enddate'].substring(8, 10))));

    // print();
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
                      Text('End date : $enddate'),
                    ])
                  ]),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                child: Row(
                  children: <Widget>[
                    Text(
                      'Item created/uploaded by :',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    item['email'] == null
                        ? Text('No email Found')
                        : Text(item['email'],
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ))
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            !datefinished
                ? Row(
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
                  )
                : Text(
                    'Final bid date has expired, Can\'t bid anymore',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
            TextButton(onPressed: () {}, child: Text('Enter'))
          ],
        ));
  }
}
