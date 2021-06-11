import 'package:auction_/providers/Auth.dart';
import 'package:auction_/screens/Auction_item_screen.dart';
import 'package:auction_/screens/Auction_items.dart';
import 'package:auction_/screens/add_auction_item.dart';
import 'package:auction_/screens/auth_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Auction App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: ChangeNotifierProvider(
            create: (context) => Auth(),
            child: StreamBuilder(
                stream: FirebaseAuth.instance.authStateChanges(),
                builder: (context, snapshot) {
                  //  final provider = Provider.of<Auth>(context);

                  if (snapshot.hasData) {
                    return AuctionItems();
                  } else
                    // return AuctionItems();
                    return AuthScreen();
                })),
        routes: {
          AddAuctionItem.routeName: (ctx) => AddAuctionItem(),
          AuctionItemlist.routeName: (ctx) => AuctionItemlist(),
          AuctionItems.routeName: (ctx) => AuctionItems(),
        });
  }
}
