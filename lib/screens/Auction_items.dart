import 'package:flutter/material.dart';

class AuctionItems extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(' Auction Items Gallery'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              //   Navigator.of(context).pushNamed(EditProductScreen.routeName);
            },
          )
        ],
      ),
      body: Center(
        child: Text('s'),
      ),
    );
  }
}
