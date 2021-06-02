import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class AuctionIt {
  addItems(Map<String, String> item) {
    print(item['name']);
  }
}
