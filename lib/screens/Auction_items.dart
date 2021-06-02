import 'package:auction_/screens/add_auction_item.dart';
import 'package:flutter/material.dart';

class AuctionItems extends StatefulWidget {
  @override
  _AuctionItemsState createState() => _AuctionItemsState();
}

class _AuctionItemsState extends State<AuctionItems> {
  var _pagestate = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(' Auction Items Gallery'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              setState(() {
                _pagestate = !_pagestate;
              });
              //    Navigator.of(context).pushNamed(AddAuctionItem.routeName);
            },
          )
        ],
      ),
      body: Center(
        child: _pagestate ? AddAuctionItem() : null,
      ),
    );
  }
}
