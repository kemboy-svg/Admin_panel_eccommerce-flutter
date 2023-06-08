import 'package:flutter/material.dart';

class ProductScreen extends StatelessWidget {
  static const String routeName = '\ProductScreen';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        alignment: Alignment.topLeft,
        padding: EdgeInsets.all(10),
        child: Text(
          'Products',
          style: TextStyle(
              fontSize: 36,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}
