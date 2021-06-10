import 'package:auction_/providers/Auth.dart';
import 'package:auction_/providers/auction_items.dart';
import 'package:auction_/screens/Auction_items.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class AddAuctionItem extends StatefulWidget {
  static const routeName = '/additem';

  @override
  _AddAuctionItemState createState() => _AddAuctionItemState();
}

class _AddAuctionItemState extends State<AddAuctionItem> {
  final _form = GlobalKey<FormState>();

  var _isInit = true;
  var _isloading = false;

  String _productName;
  String _productDescription;
  String _minBidPrice;
  DateTime _created;
  DateTime _endTime;
  Image _productImage;

  final nameController = TextEditingController();
  final detailsController = TextEditingController();
  final priceController = TextEditingController();

  cleartext() {
    nameController.clear();
    detailsController.clear();
    priceController.clear();
  }

  var _initvalue = {
    'name': '',
    'description': '',
    'minBidPrice': '',
    'created': '',
    'end': '',
  };

  void _saveForm() async {
    final isvalid = _form.currentState.validate();
    if (!isvalid) {
      return;
    }

    _form.currentState.save();

    _initvalue = {
      'name': _productName,
      'description': _productDescription,
      'minBidPrice': _minBidPrice.toString(),
      'created': DateTime.now().toString(),
      'end': _endTime.toString(),
    };

    //   print(_initvalue);

    Provider.of<Auth>(context, listen: false).addItems(_initvalue);
    cleartext();

    //Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Added Products'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: _saveForm,
          )
        ],
      ),
      body: _isloading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _form,
                child: ListView(
                  children: <Widget>[
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Name'),
                      maxLength: 10,
                      controller: nameController,
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Name is Required';
                        }

                        return null;
                      },
                      onSaved: (String value) {
                        _productName = value;
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Details'),
                      maxLength: 30,
                      controller: detailsController,
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'enter description';
                        }

                        return null;
                      },
                      onSaved: (String value) {
                        _productDescription = value;
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Price',
                      ),
                      keyboardType: TextInputType.number,
                      controller: priceController,
                      //textInputAction: TextInputAction.next,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Enter a Price';
                        }
                        if (double.tryParse(value) == null)
                          return 'Enter a valid number';
                        if (double.parse(value) <= 0)
                          return 'Enter a number >0';
                        return null;
                      },
                      onSaved: (value) {
                        _minBidPrice = value.toString();
                      },
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    ElevatedButton(
                        child: Text('Choose End date'),
                        onPressed: () {
                          showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime.now(),
                                  lastDate: DateTime(2022))
                              .then((value) {
                            setState(() {
                              _endTime = value;
                            });
                            //  print(DateTime.now());
                            //  print(_endTime);
                          });
                        }),
                    SizedBox(
                      height: 30,
                    ),
                    //  ElevatedButton(onPressed: , child: Text('Select Image from Gallery'))
                  ],
                ),
              ),
            ),
    );
  }
}
