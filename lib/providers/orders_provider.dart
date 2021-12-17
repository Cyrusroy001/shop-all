import 'package:flutter/material.dart';
import '../providers/product.dart';

class OrderItem {
  final String id;
  final double amount;
  final List<Product> products;
  final DateTime dateTime;

  OrderItem({this.id, this.amount, this.products, this.dateTime});
}

class OrdersProvider with ChangeNotifier {

}