import 'package:auction_/providers/Auth.dart';
import 'package:auction_/screens/item_details.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuctionItemlist extends StatelessWidget {
  static const routeName = '/showdata';

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<Auth>(context, listen: false).datas;
    // print('a $prov');
    //  print(prov.length);
    return Scaffold(

        // body: ListView.builder(itemCount: prov., itemBuilder: itemBuilder);
        body: ListView.builder(
      itemCount: prov.length,
      itemBuilder: (context, index) {
        return ListViewItem(prov[index]);
      },
    ));
  }
}

class ListViewItem extends StatelessWidget {
  final Map<String, dynamic> item;
  ListViewItem(this.item);

  void _send(BuildContext context, Map<String, dynamic> item) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ItemDetails(item),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text(
            item['name'],
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            '\$ ${item['price']}',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextButton(
              onPressed: () {
                _send(context, item);
              },
              child: Text('Details',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  )))
        ],
      ),
    );
  }
}
