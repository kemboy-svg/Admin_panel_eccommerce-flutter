import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  static const String routeName = '\DashboardScreen';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        alignment: Alignment.topLeft,
        padding: EdgeInsets.all(10),
        child: Text(
          'Dashboard',
          style: TextStyle(
              fontSize: 36,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}
