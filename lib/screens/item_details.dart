import 'package:auction_/providers/Auth.dart';
import 'package:auction_/screens/Auction_item_screen.dart';
import 'package:auction_/screens/add_auction_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ItemDetails extends StatelessWidget {
  final Map<String, dynamic> item;
  ItemDetails(this.item);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Auction Item Detail'),
          actions: [],
        ),
        body: Center(child: Text(item['name'])));
  }
}
