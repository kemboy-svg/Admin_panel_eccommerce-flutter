import 'package:flutter/material.dart';

class VendorScreen extends StatelessWidget {
  static const String routeName = '\VendorScreen';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        alignment: Alignment.topLeft,
        padding: EdgeInsets.all(10),
        child: Text(
          'Vendors',
          style: TextStyle(
              fontSize: 36,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}
