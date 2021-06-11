import 'package:auction_/providers/Auth.dart';
import 'package:auction_/screens/Auction_item_screen.dart';
import 'package:auction_/screens/add_auction_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuctionItems extends StatefulWidget {
  static const routeName = '/aucitem';
  @override
  _AuctionItemsState createState() => _AuctionItemsState();
}

class _AuctionItemsState extends State<AuctionItems> {
  var _pagestate = false;
  var _showData = false;

  void _check() {
    List a = Provider.of<Auth>(context, listen: false).getitemcount();

    setState(() {
      _showData = true;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _showData = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(' Auction Items Gallery'),
        actions: [
          IconButton(
            icon: Icon(Icons.list),
            onPressed: () {
              setState(() {
                _showData = !_showData;
              });
              //    Navigator.of(context).pushNamed(AddAuctionItem.routeName);
            },
          ),
          IconButton(
            icon: !_pagestate ? Icon(Icons.add) : Icon(Icons.minimize),
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
          child: _pagestate
              ? AddAuctionItem()
              : !_showData
                  ? Container()
                  : AuctionItemlist()),
    );
  }
}
