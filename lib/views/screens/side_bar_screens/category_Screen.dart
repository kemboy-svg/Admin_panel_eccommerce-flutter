import 'package:flutter/material.dart';

class CategoryScreen extends StatelessWidget {
    static const String routeName = '\CategoryScreen';


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        alignment: Alignment.topLeft,
        padding: EdgeInsets.all(10),
        child: Text(
          'Categories',
          style: TextStyle(
              fontSize: 36,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}