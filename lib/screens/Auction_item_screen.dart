import 'package:auction_/providers/Auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuctionItems extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Orders'),
      ),
      body: ListView.builder(
          itemCount: Provider.of<Auth>(context, listen: false).getitemcount(),
          itemBuilder: (context, index) => Container(
                child: Text('a'),
              )
//OrderItem(order: orderData.orders[index]),
          ),
    );
  }
}
